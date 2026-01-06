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

package tech.qiantong.qmodel.module.model.domain;

import org.apache.commons.lang3.builder.*;
import tech.qiantong.qmodel.common.core.domain.*;

import java.util.*;

/**
 * 数据结果 对象 model
 *
 * @author YWG
 * @date 2023-09-14
 */
public class OutData extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 时间 */
    private Date date;

    /** 水位 */
    private String waterLevel;
    /** 流量 */
    private String flow;
    /** 水深 */
    private String depth;
    /** 水面宽 */
    private String waterWidth;
    /** 水面与提顶距离 */
    private String distance;

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getWaterLevel() {
        return waterLevel;
    }

    public void setWaterLevel(String waterLevel) {
        this.waterLevel = waterLevel;
    }

    public String getFlow() {
        return flow;
    }

    public void setFlow(String flow) {
        this.flow = flow;
    }

    public String getDepth() {
        return depth;
    }

    public void setDepth(String depth) {
        this.depth = depth;
    }

    public String getWaterWidth() {
        return waterWidth;
    }

    public void setWaterWidth(String waterWidth) {
        this.waterWidth = waterWidth;
    }

    public String getDistance() {
        return distance;
    }

    public void setDistance(String distance) {
        this.distance = distance;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("date", getDate())
                .append("waterLevel", getWaterLevel())
                .append("flow", getFlow())
                .append("depth", getDepth())
                .append("waterWidth", getWaterWidth())
                .append("distance", getDistance())
                .toString();
    }
}
