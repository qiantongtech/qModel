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

package tech.qiantong.qmodel.module.model.api.calcWidget.dto;

import lombok.*;

/**
 * 模型计算任务可视化组件配置 DTO 对象 model_calc_widget
 *
 * @author anivia
 * @date 2026-08-04
 */
@Data
public class ModelCalcWidgetRespDTO {

    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 租户/公司ID */
    private Long companyId;

    /** 计算任务ID，关联 model_calc.id */
    private Long calcId;

    /** 关联模型ID，冗余字段 */
    private Long modelId;

    /** 组件类型：base64、line、bar、pie 等 */
    private String type;

    /** 组件显示标题 */
    private String title;

    /** 展示排序 */
    private Long sort;

    /** 组件配置JSON */
    private String config;

    /** 是否有效 */
    private Boolean validFlag;

    /** 删除标志 */
    private Boolean delFlag;


}
