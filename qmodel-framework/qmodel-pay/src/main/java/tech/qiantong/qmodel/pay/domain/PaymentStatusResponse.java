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

package tech.qiantong.qmodel.pay.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * 类表示支付状态查询的响应数据。
 * 该类包含支付网关返回的订单支付状态信息。
 *
 * @author qModel
 */
@Data
@AllArgsConstructor
public class PaymentStatusResponse {

    /**
     * 支付状态，表示订单的当前支付状态。
     * 例如，可以使用“SUCCESS”、“PENDING”、“FAILED”等状态来表示。
     */
    private String status;

    /**
     * 商户系统中的订单唯一标识符。
     * 用于标识该支付状态响应针对的订单。
     */
    private String orderId;
}
