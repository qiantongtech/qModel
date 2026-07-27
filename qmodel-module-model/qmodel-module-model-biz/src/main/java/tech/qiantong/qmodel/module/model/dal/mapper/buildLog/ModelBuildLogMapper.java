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

package tech.qiantong.qmodel.module.model.dal.mapper.buildLog;

import tech.qiantong.qmodel.module.model.dal.dataobject.buildLog.ModelBuildLogDO;
import java.util.Arrays;
import com.github.yulichang.base.MPJBaseMapper;
import tech.qiantong.qmodel.common.core.page.PageResult;
import java.util.HashSet;
import java.util.Set;
import tech.qiantong.qmodel.module.model.controller.admin.buildLog.vo.ModelBuildLogPageReqVO;
import tech.qiantong.qmodel.mybatis.core.mapper.BaseMapperX;
import tech.qiantong.qmodel.mybatis.core.query.LambdaQueryWrapperX;

/**
 * 构建日志Mapper接口
 *
 * @author qModel
 * @date 2026-07-14
 */
public interface ModelBuildLogMapper extends BaseMapperX<ModelBuildLogDO> {

    int insertBuildLogWithoutFill(ModelBuildLogDO buildLog);

    default PageResult<ModelBuildLogDO> selectPage(ModelBuildLogPageReqVO reqVO) {
        // 定义排序的字段（防止 SQL 注入，与数据库字段名称一致）
        Set<String> allowedColumns = new HashSet<>(Arrays.asList("id", "create_time", "update_time"));

        // 构造动态查询条件
        return selectPage(reqVO, new LambdaQueryWrapperX<ModelBuildLogDO>()
                .eqIfPresent(ModelBuildLogDO::getResourceId, reqVO.getResourceId())
                .eqIfPresent(ModelBuildLogDO::getModelId, reqVO.getModelId())
                .likeIfPresent(ModelBuildLogDO::getModelName, reqVO.getModelName())
                .eqIfPresent(ModelBuildLogDO::getVersionId, reqVO.getVersionId())
                .eqIfPresent(ModelBuildLogDO::getBuildType, reqVO.getBuildType())
                .eqIfPresent(ModelBuildLogDO::getStatus, reqVO.getStatus())
                .eqIfPresent(ModelBuildLogDO::getStartTime, reqVO.getStartTime())
                .eqIfPresent(ModelBuildLogDO::getEndTime, reqVO.getEndTime())
                .eqIfPresent(ModelBuildLogDO::getDuration, reqVO.getDuration())
                .eqIfPresent(ModelBuildLogDO::getInstalledPackages, reqVO.getInstalledPackages())
                .eqIfPresent(ModelBuildLogDO::getMissingPackages, reqVO.getMissingPackages())
                .eqIfPresent(ModelBuildLogDO::getFailedPackages, reqVO.getFailedPackages())
                .eqIfPresent(ModelBuildLogDO::getDockerfileContent, reqVO.getDockerfileContent())
                .eqIfPresent(ModelBuildLogDO::getBuildLog, reqVO.getBuildLog())
                .eqIfPresent(ModelBuildLogDO::getErrorMessage, reqVO.getErrorMessage())
                .eqIfPresent(ModelBuildLogDO::getRequirements, reqVO.getRequirements())
                .eqIfPresent(ModelBuildLogDO::getCreateTime, reqVO.getCreateTime())
                // 如果 reqVO.getName() 不为空，则添加 name 的精确匹配条件（name = '<name>'）
                // .likeIfPresent(ModelBuildLogDO::getName, reqVO.getName())
                // 按照 createTime 字段降序排序
                .orderBy(reqVO.getOrderByColumn(), reqVO.getIsAsc(), allowedColumns));
    }
}
