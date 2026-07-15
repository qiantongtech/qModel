/*
 * Copyright © 2026 Qiantong Technology Co., Ltd.
 * qModel Model Platform(Open Source Edition)
 *  *
 * License:
 * Released under the Apache License, Version 2.0.
 * You may use, modify, and distribute this software for commercial purposes
 * under the terms of the License.
 *  *
 * Special Notice:
 * All derivative versions are strictly prohibited from modifying or removing
 * the default system logo and copyright information.
 * For brand customization, please apply for brand customization authorization via official channels.
 *  *
 * More information: https://qmodel.qiantong.tech/business.html
 *  *
 * ============================================================================
 *  *
 * 版权所有 © 2026 江苏千桐科技有限公司
 * qModel 模型平台（开源版）
 *  *
 * 许可协议：
 * 本项目基于 Apache License 2.0 开源协议发布，
 * 允许在遵守协议的前提下进行商用、修改和分发。
 *  *
 * 特别说明：
 * 所有衍生版本不得修改或移除系统默认的 LOGO 和版权信息；
 * 如需定制品牌，请通过官方渠道申请品牌定制授权。
 *  *
 * 更多信息请访问：https://qmodel.qiantong.tech/business.html
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
