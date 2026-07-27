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

package tech.qiantong.qmodel.module.model.dal.mapper.model;

import tech.qiantong.qmodel.module.model.dal.dataobject.model.ModelDO;
import java.util.Arrays;
import com.github.yulichang.base.MPJBaseMapper;
import tech.qiantong.qmodel.common.core.page.PageResult;
import java.util.HashSet;
import java.util.Set;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelPageReqVO;
import tech.qiantong.qmodel.mybatis.core.mapper.BaseMapperX;
import tech.qiantong.qmodel.mybatis.core.query.LambdaQueryWrapperX;

/**
 * 模型基础信息Mapper接口
 *
 * @author anivia
 * @date 2026-07-07
 */
public interface ModelMapper extends BaseMapperX<ModelDO> {

    default PageResult<ModelDO> selectPage(ModelPageReqVO reqVO) {
        // 定义排序的字段（防止 SQL 注入，与数据库字段名称一致）
        Set<String> allowedColumns = new HashSet<>(Arrays.asList("id", "create_time", "update_time"));

        // 构造动态查询条件
        return selectPage(reqVO, new LambdaQueryWrapperX<ModelDO>()
                .eqIfPresent(ModelDO::getCompanyId, reqVO.getCompanyId())
                .eqIfPresent(ModelDO::getClassifyId, reqVO.getClassifyId())
                .inIfPresent(ModelDO::getClassifyId, reqVO.getClassifyIdList())
                .likeIfPresent(ModelDO::getName, reqVO.getName())
                .eqIfPresent(ModelDO::getCode, reqVO.getCode())
                .eqIfPresent(ModelDO::getAccessType, reqVO.getAccessType())
                .eqIfPresent(ModelDO::getVersion, reqVO.getVersion())
                .eqIfPresent(ModelDO::getAuthor, reqVO.getAuthor())
                .eqIfPresent(ModelDO::getStatus, reqVO.getStatus())
                .eqIfPresent(ModelDO::getTags, reqVO.getTags())
                .eqIfPresent(ModelDO::getDescription, reqVO.getDescription())
                .eqIfPresent(ModelDO::getCreateTime, reqVO.getCreateTime())
                // 如果 reqVO.getName() 不为空，则添加 name 的精确匹配条件（name = '<name>'）
                // .likeIfPresent(ModelDO::getName, reqVO.getName())
                // 按照 createTime 字段降序排序
                .orderBy(reqVO.getOrderByColumn(), reqVO.getIsAsc(), allowedColumns));
    }
}
