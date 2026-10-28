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

package tech.qiantong.qmodel.module.model.dal.mapper.modelData;

import tech.qiantong.qmodel.module.model.dal.dataobject.modelData.ModelDataApiDO;
import java.util.Arrays;
import tech.qiantong.qmodel.common.core.page.PageResult;
import java.util.HashSet;
import java.util.Set;
import tech.qiantong.qmodel.module.model.controller.admin.modelData.vo.ModelDataApiPageReqVO;
import tech.qiantong.qmodel.mybatis.core.mapper.BaseMapperX;
import tech.qiantong.qmodel.mybatis.core.query.LambdaQueryWrapperX;

/**
 * 模型数据API接入Mapper接口
 *
 * @author qModel
 * @date 2026-08-19
 */
public interface ModelDataApiMapper extends BaseMapperX<ModelDataApiDO> {

    default PageResult<ModelDataApiDO> selectPage(ModelDataApiPageReqVO reqVO) {
        // 定义排序的字段（防止 SQL 注入，与数据库字段名称一致）
        Set<String> allowedColumns = new HashSet<>(Arrays.asList("id", "create_time", "update_time"));

        // 构造动态查询条件
        return selectPage(reqVO, new LambdaQueryWrapperX<ModelDataApiDO>()
                .likeIfPresent(ModelDataApiDO::getName, reqVO.getName())
                .eqIfPresent(ModelDataApiDO::getModelId, reqVO.getModelId())
                .eqIfPresent(ModelDataApiDO::getApiType, reqVO.getApiType())
                .eqIfPresent(ModelDataApiDO::getApiUrl, reqVO.getApiUrl())
                .eqIfPresent(ModelDataApiDO::getRequestMethod, reqVO.getRequestMethod())
                .eqIfPresent(ModelDataApiDO::getContentType, reqVO.getContentType())
                .eqIfPresent(ModelDataApiDO::getTimeoutSeconds, reqVO.getTimeoutSeconds())
                .eqIfPresent(ModelDataApiDO::getAuthType, reqVO.getAuthType())
                .eqIfPresent(ModelDataApiDO::getAuthMethod, reqVO.getAuthMethod())
                .eqIfPresent(ModelDataApiDO::getAuthInjectPos, reqVO.getAuthInjectPos())
                .likeIfPresent(ModelDataApiDO::getAuthKeyName, reqVO.getAuthKeyName())
                .eqIfPresent(ModelDataApiDO::getAuthTokenPrefix, reqVO.getAuthTokenPrefix())
                .eqIfPresent(ModelDataApiDO::getAuthTokenValue, reqVO.getAuthTokenValue())
                .eqIfPresent(ModelDataApiDO::getAuthDynMethod, reqVO.getAuthDynMethod())
                .eqIfPresent(ModelDataApiDO::getAuthDynUrl, reqVO.getAuthDynUrl())
                .eqIfPresent(ModelDataApiDO::getAuthDynHeaders, reqVO.getAuthDynHeaders())
                .eqIfPresent(ModelDataApiDO::getAuthDynParams, reqVO.getAuthDynParams())
                .eqIfPresent(ModelDataApiDO::getAuthDynBody, reqVO.getAuthDynBody())
                .eqIfPresent(ModelDataApiDO::getAuthExtractPath, reqVO.getAuthExtractPath())
                .eqIfPresent(ModelDataApiDO::getRequestTemplate, reqVO.getRequestTemplate())
                .eqIfPresent(ModelDataApiDO::getBatchParams, reqVO.getBatchParams())
                .eqIfPresent(ModelDataApiDO::getInputSchema, reqVO.getInputSchema())
                .eqIfPresent(ModelDataApiDO::getOutputSchema, reqVO.getOutputSchema())
                .eqIfPresent(ModelDataApiDO::getDescription, reqVO.getDescription())
                .eqIfPresent(ModelDataApiDO::getCreateTime, reqVO.getCreateTime())
                .eqIfPresent(ModelDataApiDO::getUpdaterId, reqVO.getUpdaterId())
                // 如果 reqVO.getName() 不为空，则添加 name 的精确匹配条件（name = '<name>'）
                // .likeIfPresent(ModelDataApiDO::getName, reqVO.getName())
                // 按照 createTime 字段降序排序
                .orderBy(reqVO.getOrderByColumn(), reqVO.getIsAsc(), allowedColumns));
    }
}
