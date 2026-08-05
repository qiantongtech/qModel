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

package tech.qiantong.qmodel.module.model.dal.mapper.calcExecution;

import tech.qiantong.qmodel.module.model.dal.dataobject.calcExecution.ModelCalcExecutionDO;
import java.util.Arrays;
import com.github.yulichang.base.MPJBaseMapper;
import tech.qiantong.qmodel.common.core.page.PageResult;
import java.util.HashSet;
import java.util.Set;
import tech.qiantong.qmodel.module.model.controller.admin.calcExecution.vo.ModelCalcExecutionPageReqVO;
import tech.qiantong.qmodel.mybatis.core.mapper.BaseMapperX;
import tech.qiantong.qmodel.mybatis.core.query.LambdaQueryWrapperX;

/**
 * 模型计算执行记录Mapper接口
 *
 * @author qModel
 * @date 2026-07-28
 */
public interface ModelCalcExecutionMapper extends BaseMapperX<ModelCalcExecutionDO> {

    default PageResult<ModelCalcExecutionDO> selectPage(ModelCalcExecutionPageReqVO reqVO) {
        // 定义排序的字段（防止 SQL 注入，与数据库字段名称一致）
        Set<String> allowedColumns = new HashSet<>(Arrays.asList("id", "create_time", "update_time"));

        // 构造动态查询条件
        return selectPage(reqVO, new LambdaQueryWrapperX<ModelCalcExecutionDO>()
                .eqIfPresent(ModelCalcExecutionDO::getCalcId, reqVO.getCalcId())
                .eqIfPresent(ModelCalcExecutionDO::getModelId, reqVO.getModelId())
                .eqIfPresent(ModelCalcExecutionDO::getExecutionNo, reqVO.getExecutionNo())
                .eqIfPresent(ModelCalcExecutionDO::getExecutionMode, reqVO.getExecutionMode())
                .eqIfPresent(ModelCalcExecutionDO::getStatus, reqVO.getStatus())
                .eqIfPresent(ModelCalcExecutionDO::getStartTime, reqVO.getStartTime())
                .eqIfPresent(ModelCalcExecutionDO::getEndTime, reqVO.getEndTime())
                .eqIfPresent(ModelCalcExecutionDO::getDuration, reqVO.getDuration())
                .eqIfPresent(ModelCalcExecutionDO::getInputParams, reqVO.getInputParams())
                .eqIfPresent(ModelCalcExecutionDO::getOutputResult, reqVO.getOutputResult())
                .eqIfPresent(ModelCalcExecutionDO::getExecutionLog, reqVO.getExecutionLog())
                .eqIfPresent(ModelCalcExecutionDO::getErrorMessage, reqVO.getErrorMessage())
                .eqIfPresent(ModelCalcExecutionDO::getRetryCount, reqVO.getRetryCount())
                .eqIfPresent(ModelCalcExecutionDO::getResourceUsage, reqVO.getResourceUsage())
                .eqIfPresent(ModelCalcExecutionDO::getCreateTime, reqVO.getCreateTime())
                // 如果 reqVO.getName() 不为空，则添加 name 的精确匹配条件（name = '<name>'）
                // .likeIfPresent(ModelCalcExecutionDO::getName, reqVO.getName())
                // 按照 createTime 字段降序排序
                .orderBy(reqVO.getOrderByColumn(), reqVO.getIsAsc(), allowedColumns));
    }
}
