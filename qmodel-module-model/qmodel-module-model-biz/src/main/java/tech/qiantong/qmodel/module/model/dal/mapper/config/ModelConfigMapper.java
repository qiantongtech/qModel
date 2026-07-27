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

package tech.qiantong.qmodel.module.model.dal.mapper.config;

import tech.qiantong.qmodel.module.model.dal.dataobject.config.ModelConfigDO;
import java.util.Arrays;
import com.github.yulichang.base.MPJBaseMapper;
import tech.qiantong.qmodel.common.core.page.PageResult;
import java.util.HashSet;
import java.util.Set;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigPageReqVO;
import tech.qiantong.qmodel.mybatis.core.mapper.BaseMapperX;
import tech.qiantong.qmodel.mybatis.core.query.LambdaQueryWrapperX;

/**
 * 模型配置详情Mapper接口
 *
 * @author anivia
 * @date 2026-07-07
 */
public interface ModelConfigMapper extends BaseMapperX<ModelConfigDO> {

    default PageResult<ModelConfigDO> selectPage(ModelConfigPageReqVO reqVO) {
        // 定义排序的字段（防止 SQL 注入，与数据库字段名称一致）
        Set<String> allowedColumns = new HashSet<>(Arrays.asList("id", "create_time", "update_time"));

        // 构造动态查询条件
        return selectPage(reqVO, new LambdaQueryWrapperX<ModelConfigDO>()
                .eqIfPresent(ModelConfigDO::getCompanyId, reqVO.getCompanyId())
                .eqIfPresent(ModelConfigDO::getModelId, reqVO.getModelId())
                .eqIfPresent(ModelConfigDO::getApiUrl, reqVO.getApiUrl())
                .eqIfPresent(ModelConfigDO::getRequestMethod, reqVO.getRequestMethod())
                .eqIfPresent(ModelConfigDO::getContentType, reqVO.getContentType())
                .eqIfPresent(ModelConfigDO::getTimeoutSeconds, reqVO.getTimeoutSeconds())
                .eqIfPresent(ModelConfigDO::getAuthType, reqVO.getAuthType())
                .eqIfPresent(ModelConfigDO::getAuthInjectPosition, reqVO.getAuthInjectPosition())
                .likeIfPresent(ModelConfigDO::getAuthKeyName, reqVO.getAuthKeyName())
                .eqIfPresent(ModelConfigDO::getAuthTokenPrefix, reqVO.getAuthTokenPrefix())
                .eqIfPresent(ModelConfigDO::getAuthTokenValue, reqVO.getAuthTokenValue())
                .eqIfPresent(ModelConfigDO::getAuthDynamicMethod, reqVO.getAuthDynamicMethod())
                .eqIfPresent(ModelConfigDO::getAuthDynamicUrl, reqVO.getAuthDynamicUrl())
                .eqIfPresent(ModelConfigDO::getAuthDynamicHeaders, reqVO.getAuthDynamicHeaders())
                .eqIfPresent(ModelConfigDO::getAuthDynamicBody, reqVO.getAuthDynamicBody())
                .eqIfPresent(ModelConfigDO::getAuthExtractPath, reqVO.getAuthExtractPath())
                .eqIfPresent(ModelConfigDO::getInputSchema, reqVO.getInputSchema())
                .eqIfPresent(ModelConfigDO::getOutputSchema, reqVO.getOutputSchema())
                .eqIfPresent(ModelConfigDO::getCreateTime, reqVO.getCreateTime())
                // 如果 reqVO.getName() 不为空，则添加 name 的精确匹配条件（name = '<name>'）
                // .likeIfPresent(ModelConfigDO::getName, reqVO.getName())
                // 按照 createTime 字段降序排序
                .orderBy(reqVO.getOrderByColumn(), reqVO.getIsAsc(), allowedColumns));
    }
}
