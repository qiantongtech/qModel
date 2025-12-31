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
