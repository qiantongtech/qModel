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

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import tech.qiantong.qmodel.common.utils.*;
import tech.qiantong.qmodel.module.modelReconstitution.domain.*;
import tech.qiantong.qmodel.module.modelReconstitution.mapper.*;
import tech.qiantong.qmodel.module.modelReconstitution.service.*;

import java.util.*;

/**
 * 操作历史Service业务层处理
 *
 * @author surge
 * @date 2023-09-15
 */
@Service
public class ModelHistoryReconstitutionServiceImpl implements IModelHistoryReconstitutionService {
    @Autowired
    private ModelHistoryReconstitutionMapper modelHistoryReconstitutionMapper;

    /**
     * 查询操作历史
     *
     * @param id 操作历史主键
     * @return 操作历史
     */
    @Override
    public ModelHistoryReconstitution selectModelHistoryById(Long id) {
        return modelHistoryReconstitutionMapper.selectModelHistoryById(id);
    }

    /**
     * 查询操作历史列表
     *
     * @param modelHistory 操作历史
     * @return 操作历史
     */
    @Override
    public List<ModelHistoryReconstitution> selectModelHistoryList(ModelHistoryReconstitution modelHistory) {
        modelHistory.setDelFlag(false);
        return modelHistoryReconstitutionMapper.selectModelHistoryList(modelHistory);
    }

    /**
     * 查询某个操作历史列表
     *
     * @param modelId 操作历史
     * @return 操作历史集合
     */
    public List<ModelHistoryReconstitution> selectModelHistoryByModelId(Long modelId){
        return modelHistoryReconstitutionMapper.selectModelHistoryByModelId(modelId);
    }

    /**
     * 新增操作历史
     *
     * @param modelHistory 操作历史
     * @return 结果
     */
    @Override
    public int insertModelHistory(ModelHistoryReconstitution modelHistory) {
//                modelHistory.setCreateTime(DateUtils.getNowDate());
            return modelHistoryReconstitutionMapper.insertModelHistory(modelHistory);
    }

    /**
     * 修改操作历史
     *
     * @param modelHistory 操作历史
     * @return 结果
     */
    @Override
    public int updateModelHistory(ModelHistoryReconstitution modelHistory) {
                modelHistory.setUpdateTime(DateUtils.getNowDate());
        return modelHistoryReconstitutionMapper.updateModelHistory(modelHistory);
    }

    /**
     * 批量删除操作历史
     *
     * @param ids 需要删除的操作历史主键
     * @return 结果
     */
    @Override
    public int deleteModelHistoryByIds(Long[] ids) {
        return modelHistoryReconstitutionMapper.deleteModelHistoryByIds(ids);
    }

    /**
     * 删除操作历史信息
     *
     * @param id 操作历史主键
     * @return 结果
     */
    @Override
    public int deleteModelHistoryById(Long id) {
        return modelHistoryReconstitutionMapper.deleteModelHistoryById(id);
    }
}
