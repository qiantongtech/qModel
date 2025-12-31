package tech.qiantong.qmodel.module.modelReconstitution.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import tech.qiantong.qmodel.common.utils.*;
import tech.qiantong.qmodel.module.modelReconstitution.domain.*;
import tech.qiantong.qmodel.module.modelReconstitution.mapper.*;
import tech.qiantong.qmodel.module.modelReconstitution.service.*;

import java.util.*;
import java.util.stream.Collectors;

/**
 * 模型分类Service业务层处理
 *
 * @author surge
 * @date 2023-09-15
 */
@Service
public class ModelClassifyReconstitutionServiceImpl implements IModelClassifyReconstitutionService {
    @Autowired
    private ModelClassifyReconstitutionMapper modelClassifyReconstitutionMapper;

    /**
     * 查询模型分类
     *
     * @param id 模型分类主键
     * @return 模型分类
     */
    @Override
    public ModelClassifyReconstitution selectModelClassifyById(Long id) {
        return modelClassifyReconstitutionMapper.selectModelClassifyById(id);
    }

    /**
     * 查询模型分类列表
     *
     * @param modelClassify 模型分类
     * @return 模型分类
     */
    @Override
    public List<ModelClassifyReconstitution> selectModelClassifyList(ModelClassifyReconstitution modelClassify) {
        modelClassify.setDelFlag(false);
        return modelClassifyReconstitutionMapper.selectModelClassifyList(modelClassify);
    }

    /**
     * 新增模型分类
     *
     * @param modelClassify 模型分类
     * @return 结果
     */
    @Override
    public int insertModelClassify(ModelClassifyReconstitution modelClassify) {
        modelClassify.setCreateTime(DateUtils.getNowDate());
        ModelClassifyReconstitution modelClassifyReconstitution = this.selectModelClassifyById(modelClassify.getParentId());
        if(ObjectUtil.isNotNull(modelClassifyReconstitution)){
            modelClassify.setAncestors(modelClassifyReconstitution.getAncestors() + "," + modelClassify.getParentId());
        }else{
            modelClassify.setAncestors(modelClassify.getParentId().toString());
        }
        return modelClassifyReconstitutionMapper.insertModelClassify(modelClassify);
    }

    /**
     * 修改模型分类
     *
     * @param modelClassify 模型分类
     * @return 结果
     */
    @Override
    public int updateModelClassify(ModelClassifyReconstitution modelClassify) {
        ModelClassifyReconstitution newParentClassify = modelClassifyReconstitutionMapper.selectModelClassifyById(modelClassify.getParentId());
        ModelClassifyReconstitution oldClassify = modelClassifyReconstitutionMapper.selectModelClassifyById(modelClassify.getId());
        if (StringUtils.isNotNull(newParentClassify) && StringUtils.isNotNull(oldClassify)) {
            String newAncestors = newParentClassify.getAncestors() + "," + newParentClassify.getId();
            String oldAncestors = oldClassify.getAncestors();
            modelClassify.setAncestors(newAncestors);
            updateModelClassifyChildren(modelClassify.getId(), newAncestors, oldAncestors);
        }
        modelClassify.setUpdateTime(DateUtils.getNowDate());
        return modelClassifyReconstitutionMapper.updateModelClassify(modelClassify);
    }

    /**
     * 修改子元素关系
     *
     * @param classifyId 被修改的分类ID
     * @param newAncestors 新的父ID集合
     * @param oldAncestors 旧的父ID集合
     */
    public void updateModelClassifyChildren(Long classifyId, String newAncestors, String oldAncestors) {
        List<ModelClassifyReconstitution> children = modelClassifyReconstitutionMapper.selectChildrenClassifyById(classifyId);
        for (ModelClassifyReconstitution child : children) {
            child.setAncestors(child.getAncestors().replaceFirst(oldAncestors, newAncestors));
        }
        if (children.size() > 0) {
            modelClassifyReconstitutionMapper.updateModelClassifyChildren(children);
        }
    }

    /**
     * 批量删除模型分类
     *
     * @param ids 需要删除的模型分类主键
     * @return 结果
     */
    @Override
    public int deleteModelClassifyByIds(Long[] ids) {
        return modelClassifyReconstitutionMapper.deleteModelClassifyByIds(ids);
    }

    /**
     * 删除模型分类信息
     *
     * @param id 模型分类主键
     * @return 结果
     */
    @Override
    public int deleteModelClassifyById(Long id) {
        return modelClassifyReconstitutionMapper.deleteModelClassifyById(id);
    }

    /**
     * 查询模型分类总数
     *
     * @return 模型分类总数
     */
    @Override
    public int count() {
        ModelClassifyReconstitution modelClassify = new ModelClassifyReconstitution();
        modelClassify.setDelFlag(false);
        return modelClassifyReconstitutionMapper.selectModelClassifyList(modelClassify).size();
    }

    /**
     * 查询上周新增的模型分类数量
     *
     * @return 上周新增的模型分类数量
     */
    @Override
    public int countLastWeek() {
        LambdaQueryWrapper<ModelClassifyReconstitution> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.gt(ModelClassifyReconstitution::getCreateTime, DateUtils.getLastWeekStartTime());
        queryWrapper.lt(ModelClassifyReconstitution::getCreateTime, DateUtils.getLastWeekEndTime());
        queryWrapper.eq(ModelClassifyReconstitution::getDelFlag, false);
        return modelClassifyReconstitutionMapper.selectModelClassifyList(new ModelClassifyReconstitution()).stream()
                .filter(classify -> classify.getCreateTime().after(DateUtils.getLastWeekStartTime())
                        && classify.getCreateTime().before(DateUtils.getLastWeekEndTime()))
                .collect(Collectors.toList()).size();
    }

}
