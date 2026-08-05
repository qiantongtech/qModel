/*
 * Copyright © 2026-present Jiangsu Qiantong Technology Co., Ltd.
 *
 * This file is part of qModel Module Platform (Open Source Edition).
 *
 * qModel is licensed under Apache License 2.0 with additional qModel terms.
 * You may use qModel for commercial purposes, but you may not remove, hide,
 * modify, or replace the qModel logo, copyright notices, license notices,
 * or attribution information without a separate commercial license.
 *
 * White-label use, OEM distribution, rebranding, or presenting qModel as
 * another product requires separate commercial authorization from
 * Jiangsu Qiantong Technology Co., Ltd.
 *
 * Business License: `https://qmodel.tech/`
 * See the LICENSE file in the project root for full license information.
 */

package tech.qiantong.qmodel.module.model.dal.mapper.calc;

import tech.qiantong.qmodel.module.model.dal.dataobject.calc.ModelCalcDO;
import java.util.Arrays;
import com.github.yulichang.base.MPJBaseMapper;
import tech.qiantong.qmodel.common.core.page.PageResult;
import java.util.HashSet;
import java.util.Set;
import tech.qiantong.qmodel.module.model.controller.admin.calc.vo.ModelCalcPageReqVO;
import tech.qiantong.qmodel.mybatis.core.mapper.BaseMapperX;
import tech.qiantong.qmodel.mybatis.core.query.LambdaQueryWrapperX;

/**
 * 模型计算任务Mapper接口
 *
 * @author qModel
 * @date 2026-07-27
 */
public interface ModelCalcMapper extends BaseMapperX<ModelCalcDO> {

    default PageResult<ModelCalcDO> selectPage(ModelCalcPageReqVO reqVO) {
        // 定义排序的字段（防止 SQL 注入，与数据库字段名称一致）
        Set<String> allowedColumns = new HashSet<>(Arrays.asList("id", "create_time", "update_time"));

        // 构造动态查询条件
        return selectPage(reqVO, new LambdaQueryWrapperX<ModelCalcDO>()
                .eqIfPresent(ModelCalcDO::getCompanyId, reqVO.getCompanyId())
                .eqIfPresent(ModelCalcDO::getCode, reqVO.getCode())
                .likeIfPresent(ModelCalcDO::getName, reqVO.getName())
                .eqIfPresent(ModelCalcDO::getClassifyId, reqVO.getClassifyId())
                .likeIfPresent(ModelCalcDO::getClassifyName, reqVO.getClassifyName())
                .eqIfPresent(ModelCalcDO::getModelId, reqVO.getModelId())
                .likeIfPresent(ModelCalcDO::getModelName, reqVO.getModelName())
                .eqIfPresent(ModelCalcDO::getModelVersion, reqVO.getModelVersion())
                .eqIfPresent(ModelCalcDO::getModelVersionId, reqVO.getModelVersionId())
                .eqIfPresent(ModelCalcDO::getDescription, reqVO.getDescription())
                .eqIfPresent(ModelCalcDO::getInputParams, reqVO.getInputParams())
                .eqIfPresent(ModelCalcDO::getOutputResult, reqVO.getOutputResult())
                .eqIfPresent(ModelCalcDO::getStartTime, reqVO.getStartTime())
                .eqIfPresent(ModelCalcDO::getEndTime, reqVO.getEndTime())
                .eqIfPresent(ModelCalcDO::getDuration, reqVO.getDuration())
                .eqIfPresent(ModelCalcDO::getStatus, reqVO.getStatus())
                .eqIfPresent(ModelCalcDO::getTimeoutSeconds, reqVO.getTimeoutSeconds())
                .eqIfPresent(ModelCalcDO::getRetryCount, reqVO.getRetryCount())
                .eqIfPresent(ModelCalcDO::getMaxRetryCount, reqVO.getMaxRetryCount())
                .eqIfPresent(ModelCalcDO::getPriority, reqVO.getPriority())
                .eqIfPresent(ModelCalcDO::getErrorMessage, reqVO.getErrorMessage())
                .eqIfPresent(ModelCalcDO::getResourceId, reqVO.getResourceId())
                .eqIfPresent(ModelCalcDO::getCalcType, reqVO.getCalcType())
                .eqIfPresent(ModelCalcDO::getCreateTime, reqVO.getCreateTime())
                // 如果 reqVO.getName() 不为空，则添加 name 的精确匹配条件（name = '<name>'）
                // .likeIfPresent(ModelCalcDO::getName, reqVO.getName())
                // 按照 createTime 字段降序排序
                .orderBy(reqVO.getOrderByColumn(), reqVO.getIsAsc(), allowedColumns));
    }
}
