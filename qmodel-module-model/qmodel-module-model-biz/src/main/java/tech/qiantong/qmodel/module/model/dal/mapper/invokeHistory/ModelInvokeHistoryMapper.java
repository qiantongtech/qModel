/*
 * Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
 *  *
 * This file is part of qModel Module Platform (Open Source Edition).
 *  *
 * qModel is licensed under Apache License 2.0 with additional qModel terms.
 * You may use qModel for commercial purposes, but you may not remove, hide,
 * modify, or replace the qModel logo, copyright notices, license notices,
 * or attribution information without a separate commercial license.
 *  *
 * White-label use, OEM distribution, rebranding, or presenting qModel as
 * another product requires separate commercial authorization from
 * Jiangsu Qiantong Technology Co., Ltd.
 *  *
 * Business License: `https://qmodel.tech/`
 * See the LICENSE file in the project root for full license information.
 */

package tech.qiantong.qmodel.module.model.dal.mapper.invokeHistory;

import tech.qiantong.qmodel.module.model.dal.dataobject.invokeHistory.ModelInvokeHistoryDO;
import java.util.Arrays;
import com.github.yulichang.base.MPJBaseMapper;
import tech.qiantong.qmodel.common.core.page.PageResult;
import java.util.HashSet;
import java.util.Set;
import tech.qiantong.qmodel.module.model.controller.admin.invokeHistory.vo.ModelInvokeHistoryPageReqVO;
import tech.qiantong.qmodel.mybatis.core.mapper.BaseMapperX;
import tech.qiantong.qmodel.mybatis.core.query.LambdaQueryWrapperX;

/**
 * 模型调用历史记录Mapper接口
 *
 * @author qmodel
 * @date 2026-07-14
 */
public interface ModelInvokeHistoryMapper extends BaseMapperX<ModelInvokeHistoryDO> {

    default PageResult<ModelInvokeHistoryDO> selectPage(ModelInvokeHistoryPageReqVO reqVO) {
        // 定义排序的字段（防止 SQL 注入，与数据库字段名称一致）
        Set<String> allowedColumns = new HashSet<>(Arrays.asList("id", "create_time", "update_time"));

        // 构造动态查询条件
        return selectPage(reqVO, new LambdaQueryWrapperX<ModelInvokeHistoryDO>()
                .eqIfPresent(ModelInvokeHistoryDO::getModelId, reqVO.getModelId())
                .likeIfPresent(ModelInvokeHistoryDO::getModelName, reqVO.getModelName())
                .eqIfPresent(ModelInvokeHistoryDO::getResourceId, reqVO.getResourceId())
                .eqIfPresent(ModelInvokeHistoryDO::getVersionId, reqVO.getVersionId())
                .eqIfPresent(ModelInvokeHistoryDO::getRequestMethod, reqVO.getRequestMethod())
                .eqIfPresent(ModelInvokeHistoryDO::getInvokeType, reqVO.getInvokeType())
                .eqIfPresent(ModelInvokeHistoryDO::getInputParams, reqVO.getInputParams())
                .eqIfPresent(ModelInvokeHistoryDO::getOutputResult, reqVO.getOutputResult())
                .gtIfPresent(ModelInvokeHistoryDO::getStartTime, reqVO.getStartTime())
                .ltIfPresent(ModelInvokeHistoryDO::getEndTime, reqVO.getEndTime())
                .eqIfPresent(ModelInvokeHistoryDO::getDuration, reqVO.getDuration())
                .eqIfPresent(ModelInvokeHistoryDO::getErrorMessage, reqVO.getErrorMessage())
                .eqIfPresent(ModelInvokeHistoryDO::getStatus, reqVO.getStatus())
                .likeIfPresent(ModelInvokeHistoryDO::getClientIp, reqVO.getClientIp())
                .eqIfPresent(ModelInvokeHistoryDO::getCreateTime, reqVO.getCreateTime())
                // 如果 reqVO.getName() 不为空，则添加 name 的精确匹配条件（name = '<name>'）
                // .likeIfPresent(ModelInvokeHistoryDO::getName, reqVO.getName())
                // 按照 createTime 字段降序排序
                .orderBy(reqVO.getOrderByColumn(), reqVO.getIsAsc(), allowedColumns));
    }

    int insertInvokeHistoryWithoutFill(ModelInvokeHistoryDO record);
}
