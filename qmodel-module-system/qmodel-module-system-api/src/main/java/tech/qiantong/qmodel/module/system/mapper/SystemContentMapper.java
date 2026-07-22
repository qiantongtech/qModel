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

package tech.qiantong.qmodel.module.system.mapper;

import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.system.domain.SystemContentDO;
import tech.qiantong.qmodel.module.system.domain.vo.SystemContentPageReqVO;
import tech.qiantong.qmodel.mybatis.core.mapper.BaseMapperX;
import tech.qiantong.qmodel.mybatis.core.query.LambdaQueryWrapperX;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * 系统配置Mapper接口
 *
 * @author anivia
 * @date 2024-12-31
 */
public interface SystemContentMapper extends BaseMapperX<SystemContentDO> {

    default PageResult<SystemContentDO> selectPage(SystemContentPageReqVO reqVO) {
        // 定义排序的字段（防止 SQL 注入，与数据库字段名称一致）
        Set<String> allowedColumns = new HashSet<>(Arrays.asList("id", "create_time", "update_time"));

        // 构造动态查询条件
        return selectPage(reqVO, new LambdaQueryWrapperX<SystemContentDO>()
                .likeIfPresent(SystemContentDO::getSysName, reqVO.getSysName())
                .eqIfPresent(SystemContentDO::getLogo, reqVO.getLogo())
                .eqIfPresent(SystemContentDO::getCarouselImage, reqVO.getCarouselImage())
                .eqIfPresent(SystemContentDO::getContactNumber, reqVO.getContactNumber())
                .eqIfPresent(SystemContentDO::getEmail, reqVO.getEmail())
                .eqIfPresent(SystemContentDO::getCopyright, reqVO.getCopyright())
                .eqIfPresent(SystemContentDO::getRecordNumber, reqVO.getRecordNumber())
                .eqIfPresent(SystemContentDO::getStatus, reqVO.getStatus())
                .eqIfPresent(SystemContentDO::getCreateTime, reqVO.getCreateTime())
                .eqIfPresent(SystemContentDO::getRemark, reqVO.getRemark())
                // 如果 reqVO.getName() 不为空，则添加 name 的精确匹配条件（name = '<name>'）
                // .likeIfPresent(SystemContentDO::getName, reqVO.getName())
                // 按照 createTime 字段降序排序
                .orderBy(reqVO.getOrderByColumn(), reqVO.getIsAsc(), allowedColumns));
    }
}
