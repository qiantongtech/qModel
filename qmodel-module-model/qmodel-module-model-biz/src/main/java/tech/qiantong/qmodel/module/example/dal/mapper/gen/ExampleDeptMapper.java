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

package tech.qiantong.qmodel.module.example.dal.mapper.gen;

import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.example.controller.admin.gen.vo.ExampleDeptPageReqVO;
import tech.qiantong.qmodel.module.example.dal.dataobject.gen.ExampleDeptDO;
import tech.qiantong.qmodel.mybatis.core.mapper.BaseMapperX;
import tech.qiantong.qmodel.mybatis.core.query.LambdaQueryWrapperX;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * 示例部门Mapper接口
 *
 * @author anivia
 * @date 2024-12-09
 */
public interface ExampleDeptMapper extends BaseMapperX<ExampleDeptDO> {

    default PageResult<ExampleDeptDO> selectPage(ExampleDeptPageReqVO reqVO) {
        // 定义排序的字段（防止 SQL 注入，与数据库字段名称一致）
        Set<String> allowedColumns = new HashSet<>(Arrays.asList("id", "create_time", "update_time"));

        // 构造动态查询条件
        return selectPage(reqVO, new LambdaQueryWrapperX<ExampleDeptDO>()
                .eqIfPresent(ExampleDeptDO::getId, reqVO.getId())
                .likeIfPresent(ExampleDeptDO::getName, reqVO.getName())
                .eqIfPresent(ExampleDeptDO::getLeader, reqVO.getLeader())
                .eqIfPresent(ExampleDeptDO::getPhone, reqVO.getPhone())
                .eqIfPresent(ExampleDeptDO::getEmail, reqVO.getEmail())
                .eqIfPresent(ExampleDeptDO::getStatus, reqVO.getStatus())
                .betweenIfPresent(ExampleDeptDO::getCreateTime, reqVO.getParamByKey("beginCreateTime"), reqVO.getParamByKey("endCreateTime"))
                .betweenIfPresent(ExampleDeptDO::getUpdateTime, reqVO.getParamByKey("beginUpdateTime"), reqVO.getParamByKey("endUpdateTime"))
                // 如果 reqVO.getName() 不为空，则添加 name 的精确匹配条件（name = '<name>'）
                // .likeIfPresent(ExampleDeptDO::getName, reqVO.getName())
                // 按照 createTime 字段降序排序
                .orderBy(reqVO.getOrderByColumn(), reqVO.getIsAsc(), allowedColumns));
    }
}
