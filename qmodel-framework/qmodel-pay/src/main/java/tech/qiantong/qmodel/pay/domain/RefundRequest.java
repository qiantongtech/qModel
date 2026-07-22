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

package tech.qiantong.qmodel.pay.domain;

import lombok.Data;

/**
 * 类表示退款请求的数据。
 * 该类包含发起退款操作所需的所有信息。
 *
 * @author anivia
 */
@Data
public class RefundRequest {

    /**
     * 商户系统中的订单唯一标识符。
     * 用于标识需要退款的订单。
     */
    private String orderId;

    /**
     * 退款金额，以货币的最小单位表示（例如人民币的分）。
     * 通常退款金额不应超过原支付金额。
     */
    private long amount;

    /**
     * 支付方式，例如支付宝（ALIPAY）或微信支付（WECHAT）。
     * 用于指定通过哪个支付网关处理退款。
     */
    private PaymentType paymentType;
}
