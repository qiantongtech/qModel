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

package tech.qiantong.qmodel.module.model.dal.mapper.model;

import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelPageReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.model.ModelDO;
import tech.qiantong.qmodel.mybatis.core.mapper.BaseMapperX;
import tech.qiantong.qmodel.mybatis.core.query.LambdaQueryWrapperX;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * 模型管理Mapper接口
 *
 * @author qModel
 * @date 2026-01-07
 */
public interface ModelMapper extends BaseMapperX<ModelDO> {

    default PageResult<ModelDO> selectPage(ModelPageReqVO reqVO) {
        // 定义排序的字段（防止 SQL 注入，与数据库字段名称一致）
        Set<String> allowedColumns = new HashSet<>(Arrays.asList("id", "create_time", "update_time"));

        // 构造动态查询条件
        return selectPage(reqVO, new LambdaQueryWrapperX<ModelDO>()
                .eqIfPresent(ModelDO::getCompanyId, reqVO.getCompanyId())
                .eqIfPresent(ModelDO::getClassifyId, reqVO.getClassifyId())
                .eqIfPresent(ModelDO::getAncestors, reqVO.getAncestors())
                .likeIfPresent(ModelDO::getName, reqVO.getName())
                .eqIfPresent(ModelDO::getDescription, reqVO.getDescription())
                .eqIfPresent(ModelDO::getType, reqVO.getType())
                .eqIfPresent(ModelDO::getDimensions, reqVO.getDimensions())
                .eqIfPresent(ModelDO::getVersion, reqVO.getVersion())
                .eqIfPresent(ModelDO::getInterfaceAddress, reqVO.getInterfaceAddress())
                .eqIfPresent(ModelDO::getBuiltin, reqVO.getBuiltin())
                .eqIfPresent(ModelDO::getFormat, reqVO.getFormat())
                .eqIfPresent(ModelDO::getSize, reqVO.getSize())
                .eqIfPresent(ModelDO::getSource, reqVO.getSource())
                .eqIfPresent(ModelDO::getUploadStatus, reqVO.getUploadStatus())
                .eqIfPresent(ModelDO::getUploadTime, reqVO.getUploadTime())
                .eqIfPresent(ModelDO::getUploadInterface, reqVO.getUploadInterface())
                .eqIfPresent(ModelDO::getUploadFile, reqVO.getUploadFile())
                .eqIfPresent(ModelDO::getUploadLocation, reqVO.getUploadLocation())
                .eqIfPresent(ModelDO::getCreateTime, reqVO.getCreateTime())
                .inIfPresent(ModelDO::getClassifyId, reqVO.getClassifyIds())
                // 如果 reqVO.getName() 不为空，则添加 name 的精确匹配条件（name = '<name>'）
                // .likeIfPresent(ModelDO::getName, reqVO.getName())
                // 按照 createTime 字段降序排序
                .orderBy(reqVO.getOrderByColumn(), reqVO.getIsAsc(), allowedColumns));
    }
}
