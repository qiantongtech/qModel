package tech.qiantong.qmodel.module.modelReconstitution.service.impl;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import tech.qiantong.qmodel.common.utils.*;
import tech.qiantong.qmodel.module.modelReconstitution.domain.*;
import tech.qiantong.qmodel.module.modelReconstitution.mapper.*;
import tech.qiantong.qmodel.module.modelReconstitution.service.*;

import java.util.*;
import java.util.stream.Collectors;

/**
 * 模型库的重构表Service业务层处理
 *
 * @author model
 * @date 2024-01-02
 */
@Service
public class ModelReconstitutionServiceImpl implements IModelReconstitutionService {
    @Autowired
    private ModelReconstitutionMapper modelReconstitutionMapper;

    /**
     * 查询模型库的重构表
     *
     * @param id 模型库的重构表主键
     * @return 模型库的重构表
     */
    @Override
    public ModelReconstitution selectModelReconstitutionById(Long id) {
        return modelReconstitutionMapper.selectModelReconstitutionById(id);
    }

    /**
     * 查询模型库的重构表列表
     *
     * @param modelReconstitution 模型库的重构表
     * @return 模型库的重构表
     */
    @Override
    public List<ModelReconstitution> selectModelReconstitutionList(ModelReconstitution modelReconstitution) {
        modelReconstitution.setDelFlag(false);
        return modelReconstitutionMapper.selectModelReconstitutionList(modelReconstitution);
    }

    /**
     * 新增模型库的重构表
     *
     * @param modelReconstitution 模型库的重构表
     * @return 结果
     */
    @Override
    public int insertModelReconstitution(ModelReconstitution modelReconstitution) {
        modelReconstitution.setCreateTime(DateUtils.getNowDate());
        return modelReconstitutionMapper.insertModelReconstitution(modelReconstitution);
    }

    /**
     * 修改模型库的重构表
     *
     * @param modelReconstitution 模型库的重构表
     * @return 结果
     */
    @Override
    public int updateModelReconstitution(ModelReconstitution modelReconstitution) {
        modelReconstitution.setUpdateTime(DateUtils.getNowDate());
        return modelReconstitutionMapper.updateModelReconstitution(modelReconstitution);
    }

    /**
     * 批量删除模型库的重构表
     *
     * @param ids 需要删除的模型库的重构表主键
     * @return 结果
     */
    @Override
    public int deleteModelReconstitutionByIds(Long[] ids) {
        return modelReconstitutionMapper.deleteModelReconstitutionByIds(ids);
    }

    /**
     * 删除模型库的重构表信息
     *
     * @param id 模型库的重构表主键
     * @return 结果
     */
    @Override
    public int deleteModelReconstitutionById(Long id) {
        return modelReconstitutionMapper.deleteModelReconstitutionById(id);
    }

    /**
     * 查询模型总数
     *
     * @return 模型总数
     */
    @Override
    public int count() {
        ModelReconstitution modelReconstitution = new ModelReconstitution();
        modelReconstitution.setDelFlag(false);
        return modelReconstitutionMapper.selectModelReconstitutionList(modelReconstitution).size();
    }

    /**
     * 查询上周新增的模型数量
     *
     * @return 上周新增的模型数量
     */
    @Override
    public int countLastWeek() {
        ModelReconstitution modelReconstitution = new ModelReconstitution();
        modelReconstitution.setDelFlag(false);
        return modelReconstitutionMapper.selectModelReconstitutionList(modelReconstitution).stream()
                .filter(model -> model.getCreateTime().after(DateUtils.getLastWeekStartTime())
                        && model.getCreateTime().before(DateUtils.getLastWeekEndTime()))
                .collect(Collectors.toList()).size();
    }
}
