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

package tech.qiantong.qmodel.module.model.dal.mapper.fileResource;

import tech.qiantong.qmodel.module.model.dal.dataobject.fileResource.ModelFileResourceDO;
import java.util.Arrays;
import com.github.yulichang.base.MPJBaseMapper;
import tech.qiantong.qmodel.common.core.page.PageResult;
import java.util.HashSet;
import java.util.Set;
import tech.qiantong.qmodel.module.model.controller.admin.fileResource.vo.ModelFileResourcePageReqVO;
import tech.qiantong.qmodel.mybatis.core.mapper.BaseMapperX;
import tech.qiantong.qmodel.mybatis.core.query.LambdaQueryWrapperX;

/**
 * 模型文件部署Mapper接口
 *
 * @author anivia
 * @date 2026-07-07
 */
public interface ModelFileResourceMapper extends BaseMapperX<ModelFileResourceDO> {

    default PageResult<ModelFileResourceDO> selectPage(ModelFileResourcePageReqVO reqVO) {
        // 定义排序的字段（防止 SQL 注入，与数据库字段名称一致）
        Set<String> allowedColumns = new HashSet<>(Arrays.asList("id", "create_time", "update_time"));

        // 构造动态查询条件
        return selectPage(reqVO, new LambdaQueryWrapperX<ModelFileResourceDO>()
                .likeIfPresent(ModelFileResourceDO::getFileName, reqVO.getFileName())
                .likeIfPresent(ModelFileResourceDO::getScriptName, reqVO.getScriptName())
                .eqIfPresent(ModelFileResourceDO::getFilePath, reqVO.getFilePath())
                .eqIfPresent(ModelFileResourceDO::getModelId, reqVO.getModelId())
                .eqIfPresent(ModelFileResourceDO::getDepsFilePath, reqVO.getDepsFilePath())
                .eqIfPresent(ModelFileResourceDO::getModelVersion, reqVO.getModelVersion())
                .eqIfPresent(ModelFileResourceDO::getResourceType, reqVO.getResourceType())
                .eqIfPresent(ModelFileResourceDO::getFileSize, reqVO.getFileSize())
                .eqIfPresent(ModelFileResourceDO::getLogFilePath, reqVO.getLogFilePath())
                .eqIfPresent(ModelFileResourceDO::getExecTimeout, reqVO.getExecTimeout())
                .eqIfPresent(ModelFileResourceDO::getDockerFilePath, reqVO.getDockerFilePath())
                .eqIfPresent(ModelFileResourceDO::getImageTag, reqVO.getImageTag())
                .eqIfPresent(ModelFileResourceDO::getImageVersion, reqVO.getImageVersion())
                .eqIfPresent(ModelFileResourceDO::getImageBuildStatus, reqVO.getImageBuildStatus())
                .eqIfPresent(ModelFileResourceDO::getImageBuildTime, reqVO.getImageBuildTime())
                .eqIfPresent(ModelFileResourceDO::getImageBuildLog, reqVO.getImageBuildLog())
                .eqIfPresent(ModelFileResourceDO::getResourceLimit, reqVO.getResourceLimit())
                .eqIfPresent(ModelFileResourceDO::getContainerEnv, reqVO.getContainerEnv())
                .eqIfPresent(ModelFileResourceDO::getContainerMounts, reqVO.getContainerMounts())
                .eqIfPresent(ModelFileResourceDO::getContainerPorts, reqVO.getContainerPorts())
                .eqIfPresent(ModelFileResourceDO::getMappedHostPort, reqVO.getMappedHostPort())
                .eqIfPresent(ModelFileResourceDO::getContainerStatus, reqVO.getContainerStatus())
                .eqIfPresent(ModelFileResourceDO::getContainerId, reqVO.getContainerId())
                .eqIfPresent(ModelFileResourceDO::getCreateTime, reqVO.getCreateTime())
                // 如果 reqVO.getName() 不为空，则添加 name 的精确匹配条件（name = '<name>'）
                // .likeIfPresent(ModelFileResourceDO::getName, reqVO.getName())
                // 按照 createTime 字段降序排序
                .orderBy(reqVO.getOrderByColumn(), reqVO.getIsAsc(), allowedColumns));
    }
}
