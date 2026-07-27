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

package tech.qiantong.qmodel.module.model.dal.mapper.version;

import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.version.vo.ModelVersionPageReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.version.ModelVersionDO;
import tech.qiantong.qmodel.mybatis.core.mapper.BaseMapperX;
import tech.qiantong.qmodel.mybatis.core.query.LambdaQueryWrapperX;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 版本管理Mapper接口
 *
 * @author qModel
 * @date 2026-01-09
 */
public interface ModelVersionMapper extends BaseMapperX<ModelVersionDO> {

    default PageResult<ModelVersionDO> selectPage(ModelVersionPageReqVO reqVO) {
        // 定义排序的字段（防止 SQL 注入，与数据库字段名称一致）
        Set<String> allowedColumns = new HashSet<>(Arrays.asList("id", "create_time", "update_time"));

        // 构造动态查询条件
        return selectPage(reqVO, new LambdaQueryWrapperX<ModelVersionDO>()
                .eqIfPresent(ModelVersionDO::getCompanyId, reqVO.getCompanyId())
                .eqIfPresent(ModelVersionDO::getModelId, reqVO.getModelId())
                .likeIfPresent(ModelVersionDO::getModelName, reqVO.getModelName())
                .eqIfPresent(ModelVersionDO::getVersion, reqVO.getVersion())
                .eqIfPresent(ModelVersionDO::getFileAddress, reqVO.getFileAddress())
                .eqIfPresent(ModelVersionDO::getInterfaceAddress, reqVO.getInterfaceAddress())
                .eqIfPresent(ModelVersionDO::getStatus, reqVO.getStatus())
                .eqIfPresent(ModelVersionDO::getDescription, reqVO.getDescription())
                .eqIfPresent(ModelVersionDO::getCreateTime, reqVO.getCreateTime())
                .likeIfPresent(ModelVersionDO::getFileName, reqVO.getFileName())
                .eqIfPresent(ModelVersionDO::getRunnableFileAddress, reqVO.getRunnableFileAddress())
                // 如果 reqVO.getName() 不为空，则添加 name 的精确匹配条件（name = '<name>'）
                // .likeIfPresent(ModelVersionDO::getName, reqVO.getName())
                // 按照 createTime 字段降序排序
                .orderBy(reqVO.getOrderByColumn(), reqVO.getIsAsc(), allowedColumns));
    }

    public List<ModelVersionDO> selectModelVersionList(ModelVersionDO reqVO);

}
