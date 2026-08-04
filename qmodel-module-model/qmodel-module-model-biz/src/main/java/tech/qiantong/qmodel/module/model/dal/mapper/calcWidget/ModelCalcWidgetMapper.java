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

package tech.qiantong.qmodel.module.model.dal.mapper.calcWidget;

import tech.qiantong.qmodel.module.model.dal.dataobject.calcWidget.ModelCalcWidgetDO;
import java.util.Arrays;
import com.github.yulichang.base.MPJBaseMapper;
import tech.qiantong.qmodel.common.core.page.PageResult;
import java.util.HashSet;
import java.util.Set;
import tech.qiantong.qmodel.module.model.controller.admin.calcWidget.vo.ModelCalcWidgetPageReqVO;
import tech.qiantong.qmodel.mybatis.core.mapper.BaseMapperX;
import tech.qiantong.qmodel.mybatis.core.query.LambdaQueryWrapperX;

/**
 * 模型计算任务可视化组件配置Mapper接口
 *
 * @author anivia
 * @date 2026-08-04
 */
public interface ModelCalcWidgetMapper extends BaseMapperX<ModelCalcWidgetDO> {

    default PageResult<ModelCalcWidgetDO> selectPage(ModelCalcWidgetPageReqVO reqVO) {
        // 定义排序的字段（防止 SQL 注入，与数据库字段名称一致）
        Set<String> allowedColumns = new HashSet<>(Arrays.asList("id", "create_time", "update_time"));

        // 构造动态查询条件
        return selectPage(reqVO, new LambdaQueryWrapperX<ModelCalcWidgetDO>()
                .eqIfPresent(ModelCalcWidgetDO::getCompanyId, reqVO.getCompanyId())
                .eqIfPresent(ModelCalcWidgetDO::getCalcId, reqVO.getCalcId())
                .eqIfPresent(ModelCalcWidgetDO::getModelId, reqVO.getModelId())
                .eqIfPresent(ModelCalcWidgetDO::getType, reqVO.getType())
                .eqIfPresent(ModelCalcWidgetDO::getTitle, reqVO.getTitle())
                .eqIfPresent(ModelCalcWidgetDO::getSort, reqVO.getSort())
                .eqIfPresent(ModelCalcWidgetDO::getConfig, reqVO.getConfig())
                .eqIfPresent(ModelCalcWidgetDO::getCreateTime, reqVO.getCreateTime())
                // 如果 reqVO.getName() 不为空，则添加 name 的精确匹配条件（name = '<name>'）
                // .likeIfPresent(ModelCalcWidgetDO::getName, reqVO.getName())
                // 按照 createTime 字段降序排序
                .orderBy(reqVO.getOrderByColumn(), reqVO.getIsAsc(), allowedColumns));
    }
}
