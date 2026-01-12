/*
 * Copyright © 2026 Qiantong Technology Co., Ltd.
 * qModel Model Platform(Open Source Edition)
 *  *
 * License:
 * Released under the Apache License, Version 2.0.
 * You may use, modify, and distribute this software for commercial purposes
 * under the terms of the License.
 *  *
 * Special Notice:
 * All derivative versions are strictly prohibited from modifying or removing
 * the default system logo and copyright information.
 * For brand customization, please apply for brand customization authorization via official channels.
 *  *
 * More information: https://qmodel.qiantong.tech/business.html
 *  *
 * ============================================================================
 *  *
 * 版权所有 © 2026 江苏千桐科技有限公司
 * qModel 模型平台（开源版）
 *  *
 * 许可协议：
 * 本项目基于 Apache License 2.0 开源协议发布，
 * 允许在遵守协议的前提下进行商用、修改和分发。
 *  *
 * 特别说明：
 * 所有衍生版本不得修改或移除系统默认的 LOGO 和版权信息；
 * 如需定制品牌，请通过官方渠道申请品牌定制授权。
 *  *
 * 更多信息请访问：https://qmodel.qiantong.tech/business.html
 */

package tech.qiantong.qmodel.module.modelReconstitution.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tech.qiantong.qmodel.common.utils.DateUtils;
import tech.qiantong.qmodel.module.modelReconstitution.domain.ModelReconstitution;
import tech.qiantong.qmodel.module.modelReconstitution.mapper.ModelReconstitutionMapper;
import tech.qiantong.qmodel.module.modelReconstitution.service.IModelReconstitutionService;

import java.util.List;
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
