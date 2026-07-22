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

package tech.qiantong.qmodel.module.model.service;

import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.module.model.domain.ModelCompute;
import tech.qiantong.qmodel.module.model.entity.InboundFlow;

/**
 * 模型计算管理 Service接口
 *
 * @author JW
 * @date 2024-10-18
 */
public interface IModelComputeService extends IService<ModelCompute> {

    public JSONObject getInboundFlow(InboundFlow inboundFlow);
}
