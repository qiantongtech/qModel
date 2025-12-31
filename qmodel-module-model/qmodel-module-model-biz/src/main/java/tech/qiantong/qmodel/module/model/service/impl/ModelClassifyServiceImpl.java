package tech.qiantong.qmodel.module.model.service.impl;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import tech.qiantong.qmodel.common.utils.*;
import tech.qiantong.qmodel.module.model.domain.*;
import tech.qiantong.qmodel.module.model.mapper.*;
import tech.qiantong.qmodel.module.model.service.*;

import java.util.*;

/**
 * 模型分类Service业务层处理
 *
 * @author surge
 * @date 2023-09-15
 */
@Service
public class ModelClassifyServiceImpl implements IModelClassifyService {
    @Autowired
    private ModelClassifyMapper modelClassifyMapper;

    /**
     * 查询模型分类
     *
     * @param id 模型分类主键
     * @return 模型分类
     */
    @Override
    public ModelClassify selectModelClassifyById(Long id) {
        return modelClassifyMapper.selectModelClassifyById(id);
    }

    /**
     * 查询模型分类列表
     *
     * @param modelClassify 模型分类
     * @return 模型分类
     */
    @Override
    public List<ModelClassify> selectModelClassifyList(ModelClassify modelClassify) {
        modelClassify.setDelFlag(false);
        return modelClassifyMapper.selectModelClassifyList(modelClassify);
    }

    /**
     * 新增模型分类
     *
     * @param modelClassify 模型分类
     * @return 结果
     */
    @Override
    public int insertModelClassify(ModelClassify modelClassify) {
        modelClassify.setCreateTime(DateUtils.getNowDate());
        return modelClassifyMapper.insertModelClassify(modelClassify);
    }

    /**
     * 修改模型分类
     *
     * @param modelClassify 模型分类
     * @return 结果
     */
    @Override
    public int updateModelClassify(ModelClassify modelClassify) {
        modelClassify.setUpdateTime(DateUtils.getNowDate());
        return modelClassifyMapper.updateModelClassify(modelClassify);
    }

    /**
     * 批量删除模型分类
     *
     * @param ids 需要删除的模型分类主键
     * @return 结果
     */
    @Override
    public int deleteModelClassifyByIds(Long[] ids) {
        return modelClassifyMapper.deleteModelClassifyByIds(ids);
    }

    /**
     * 删除模型分类信息
     *
     * @param id 模型分类主键
     * @return 结果
     */
    @Override
    public int deleteModelClassifyById(Long id) {
        return modelClassifyMapper.deleteModelClassifyById(id);
    }
}
