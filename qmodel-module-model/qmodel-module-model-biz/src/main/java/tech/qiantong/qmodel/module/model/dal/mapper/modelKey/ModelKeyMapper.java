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

package tech.qiantong.qmodel.module.model.dal.mapper.modelKey;

import org.apache.ibatis.annotations.Param;
import tech.qiantong.qmodel.common.core.domain.entity.SysUser;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.example.dal.dataobject.user.UserTypeDO;
import tech.qiantong.qmodel.module.model.controller.admin.modelKey.vo.ModelKeyPageVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.modelKey.ModelKeyDO;
import tech.qiantong.qmodel.mybatis.core.mapper.BaseMapperX;
import tech.qiantong.qmodel.mybatis.core.query.LambdaQueryWrapperX;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 模型访问 keyMapper接口
 *
 * @author anivia
 * @date 2026-07-30
 */
public interface ModelKeyMapper extends BaseMapperX<ModelKeyDO> {
    default PageResult<ModelKeyDO> selectPage(ModelKeyPageVO reqVO) {
        // 定义排序的字段（防止 SQL 注入，与数据库字段名称一致）
        Set<String> allowedColumns = new HashSet<>(Arrays.asList("id", "create_time", "update_time"));

        // 构造动态查询条件
        return selectPage(reqVO, new LambdaQueryWrapperX<ModelKeyDO>()
                .likeIfPresent(ModelKeyDO::getName, reqVO.getName())
                .eqIfPresent(ModelKeyDO::getCreatorId, reqVO.getCreatorId())
                // 如果 reqVO.getName() 不为空，则添加 name 的精确匹配条件（name = '<name>'）
                // .likeIfPresent(ModelInvokeHistoryDO::getName, reqVO.getName())
                // 按照 createTime 字段降序排序
                .orderBy(reqVO.getOrderByColumn(), reqVO.getIsAsc(), allowedColumns));
    }

    /**
     * 根据 apiKey 查询用户列表
     *
     * @param apiKey apiKey
     * @return 用户列表
     */
    List<SysUser> selectUserList(@Param("apiKey") String apiKey);

}
