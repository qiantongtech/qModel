/*
 * Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
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

package tech.qiantong.qmodel.module.model.dal.mapper.history;

import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.history.vo.ModelHistoryPageReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.history.ModelHistoryDO;
import tech.qiantong.qmodel.mybatis.core.mapper.BaseMapperX;
import tech.qiantong.qmodel.mybatis.core.query.LambdaQueryWrapperX;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * 模型历史Mapper接口
 *
 * @author qModel
 * @date 2026-01-09
 */
public interface ModelHistoryMapper extends BaseMapperX<ModelHistoryDO> {

    default PageResult<ModelHistoryDO> selectPage(ModelHistoryPageReqVO reqVO) {
        // 定义排序的字段（防止 SQL 注入，与数据库字段名称一致）
        Set<String> allowedColumns = new HashSet<>(Arrays.asList("id", "create_time", "update_time"));

        // 构造动态查询条件
        return selectPage(reqVO, new LambdaQueryWrapperX<ModelHistoryDO>()
                .eqIfPresent(ModelHistoryDO::getCompanyId, reqVO.getCompanyId())
                .eqIfPresent(ModelHistoryDO::getModelId, reqVO.getModelId())
                .likeIfPresent(ModelHistoryDO::getModelName, reqVO.getModelName())
                .eqIfPresent(ModelHistoryDO::getContext, reqVO.getContext())
                .eqIfPresent(ModelHistoryDO::getStartTime, reqVO.getStartTime())
                .eqIfPresent(ModelHistoryDO::getModelVersion, reqVO.getModelVersion())
                .eqIfPresent(ModelHistoryDO::getCreateTime, reqVO.getCreateTime())
                .orderBy(reqVO.getOrderByColumn(), reqVO.getIsAsc(), allowedColumns));
    }
}
