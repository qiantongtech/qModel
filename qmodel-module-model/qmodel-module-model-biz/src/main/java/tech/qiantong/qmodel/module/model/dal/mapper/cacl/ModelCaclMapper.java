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

package tech.qiantong.qmodel.module.model.dal.mapper.cacl;

import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.modelCacl.vo.ModelCaclPageReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.cacl.ModelCaclDO;
import tech.qiantong.qmodel.mybatis.core.mapper.BaseMapperX;
import tech.qiantong.qmodel.mybatis.core.query.LambdaQueryWrapperX;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * 模型计算重构Mapper接口
 *
 * @author qModel
 * @date 2026-01-12
 */
public interface ModelCaclMapper extends BaseMapperX<ModelCaclDO> {

    default PageResult<ModelCaclDO> selectPage(ModelCaclPageReqVO reqVO) {
        // 定义排序的字段（防止 SQL 注入，与数据库字段名称一致）
        Set<String> allowedColumns = new HashSet<>(Arrays.asList("id", "create_time", "update_time", "start_time", "end_time"));

        // 构造动态查询条件
        return selectPage(reqVO, new LambdaQueryWrapperX<ModelCaclDO>()
                .eqIfPresent(ModelCaclDO::getCompanyId, reqVO.getCompanyId())
                .eqIfPresent(ModelCaclDO::getCode, reqVO.getCode())
                .likeIfPresent(ModelCaclDO::getName, reqVO.getName())
                .eqIfPresent(ModelCaclDO::getModelId, reqVO.getModelId())
                .likeIfPresent(ModelCaclDO::getModelName, reqVO.getModelName())
                .eqIfPresent(ModelCaclDO::getModelVersion, reqVO.getModelVersion())
                .geIfPresent(ModelCaclDO::getStartTime, reqVO.getStartTime())
                .leIfPresent(ModelCaclDO::getEndTime, reqVO.getEndTime())
                .eqIfPresent(ModelCaclDO::getStatus, reqVO.getStatus())
                .eqIfPresent(ModelCaclDO::getInputContent, reqVO.getInputContent())
                .eqIfPresent(ModelCaclDO::getOutputContent, reqVO.getOutputContent())
                .eqIfPresent(ModelCaclDO::getCreateTime, reqVO.getCreateTime())
                .eqIfPresent(ModelCaclDO::getAddressId, reqVO.getAddressId())
                .eqIfPresent(ModelCaclDO::getAddressType, reqVO.getAddressType())
                .eqIfPresent(ModelCaclDO::getMpProgrammeId, reqVO.getMpProgrammeId())
                // 如果 reqVO.getName() 不为空，则添加 name 的精确匹配条件（name = '<name>'）
                // .likeIfPresent(ModelCaclDO::getName, reqVO.getName())
                // 按照 createTime 字段降序排序
                .orderBy(reqVO.getOrderByColumn(), reqVO.getIsAsc(), allowedColumns));
    }
}
