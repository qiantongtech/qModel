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

package tech.qiantong.qmodel.module.model.dal.mapper.input;

import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.input.vo.ModelInputPageReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.input.ModelInputDO;
import tech.qiantong.qmodel.mybatis.core.mapper.BaseMapperX;
import tech.qiantong.qmodel.mybatis.core.query.LambdaQueryWrapperX;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 模型输入管理Mapper接口
 *
 * @author qModel
 * @date 2026-01-09
 */
public interface ModelInputMapper extends BaseMapperX<ModelInputDO> {

    default PageResult<ModelInputDO> selectPage(ModelInputPageReqVO reqVO) {
        // 定义排序的字段（防止 SQL 注入，与数据库字段名称一致）
        Set<String> allowedColumns = new HashSet<>(Arrays.asList("id", "create_time", "update_time"));

        // 构造动态查询条件
        return selectPage(reqVO, new LambdaQueryWrapperX<ModelInputDO>()
                .eqIfPresent(ModelInputDO::getCompanyId, reqVO.getCompanyId())
                .likeIfPresent(ModelInputDO::getName, reqVO.getName())
                .likeIfPresent(ModelInputDO::getEngName, reqVO.getEngName())
                .eqIfPresent(ModelInputDO::getType, reqVO.getType())
                .eqIfPresent(ModelInputDO::getModelId, reqVO.getModelId())
                .likeIfPresent(ModelInputDO::getModelName, reqVO.getModelName())
                .eqIfPresent(ModelInputDO::getModelVersion, reqVO.getModelVersion())
                .eqIfPresent(ModelInputDO::getDescription, reqVO.getDescription())
                .eqIfPresent(ModelInputDO::getExample, reqVO.getExample())
                .eqIfPresent(ModelInputDO::getParamFile, reqVO.getParamFile())
                .eqIfPresent(ModelInputDO::getSingleContent, reqVO.getSingleContent())
                .eqIfPresent(ModelInputDO::getMultipleContent, reqVO.getMultipleContent())
                .eqIfPresent(ModelInputDO::getCreateTime, reqVO.getCreateTime())
                .eqIfPresent(ModelInputDO::getChangeFlag, reqVO.getChangeFlag())
                // 如果 reqVO.getName() 不为空，则添加 name 的精确匹配条件（name = '<name>'）
                // .likeIfPresent(ModelInputDO::getName, reqVO.getName())
                // 按照 createTime 字段降序排序
                .orderBy(reqVO.getOrderByColumn(), reqVO.getIsAsc(), allowedColumns));
    }

    public List<ModelInputDO> selectModelInputList(ModelInputDO query);
}
