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

package tech.qiantong.qmodel.module.model.dal.mapper.output;

import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.output.vo.ModelOutputPageReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.output.ModelOutputDO;
import tech.qiantong.qmodel.mybatis.core.mapper.BaseMapperX;
import tech.qiantong.qmodel.mybatis.core.query.LambdaQueryWrapperX;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * 模型输出管理Mapper接口
 *
 * @author qModel
 * @date 2026-01-09
 */
public interface ModelOutputMapper extends BaseMapperX<ModelOutputDO> {

    default PageResult<ModelOutputDO> selectPage(ModelOutputPageReqVO reqVO) {
        // 定义排序的字段（防止 SQL 注入，与数据库字段名称一致）
        Set<String> allowedColumns = new HashSet<>(Arrays.asList("id", "create_time", "update_time"));

        // 构造动态查询条件
        return selectPage(reqVO, new LambdaQueryWrapperX<ModelOutputDO>()
                .eqIfPresent(ModelOutputDO::getCompanyId, reqVO.getCompanyId())
                .likeIfPresent(ModelOutputDO::getName, reqVO.getName())
                .likeIfPresent(ModelOutputDO::getEngName, reqVO.getEngName())
                .eqIfPresent(ModelOutputDO::getType, reqVO.getType())
                .eqIfPresent(ModelOutputDO::getModelId, reqVO.getModelId())
                .likeIfPresent(ModelOutputDO::getModelName, reqVO.getModelName())
                .eqIfPresent(ModelOutputDO::getModelVersion, reqVO.getModelVersion())
                .eqIfPresent(ModelOutputDO::getDescription, reqVO.getDescription())
                .eqIfPresent(ModelOutputDO::getSingleContent, reqVO.getSingleContent())
                .eqIfPresent(ModelOutputDO::getMultipleContent, reqVO.getMultipleContent())
                .eqIfPresent(ModelOutputDO::getCreateTime, reqVO.getCreateTime())
                // 如果 reqVO.getName() 不为空，则添加 name 的精确匹配条件（name = '<name>'）
                // .likeIfPresent(ModelOutputDO::getName, reqVO.getName())
                // 按照 createTime 字段降序排序
                .orderBy(reqVO.getOrderByColumn(), reqVO.getIsAsc(), allowedColumns));
    }
}
