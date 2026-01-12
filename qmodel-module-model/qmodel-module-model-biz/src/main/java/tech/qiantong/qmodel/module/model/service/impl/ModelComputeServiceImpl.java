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

package tech.qiantong.qmodel.module.model.service.impl;

import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.springframework.stereotype.Service;
import tech.qiantong.qmodel.common.exception.base.BaseException;
import tech.qiantong.qmodel.module.model.domain.ModelCompute;
import tech.qiantong.qmodel.module.model.entity.InboundFlow;
import tech.qiantong.qmodel.module.model.enums.InboundFLowEnums;
import tech.qiantong.qmodel.module.model.mapper.ModelComputeMapper;
import tech.qiantong.qmodel.module.model.service.IModelComputeService;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 模型管理 Service业务层处理
 *
 * @author YWG
 * @date 2023-09-14
 */
@Service
public class ModelComputeServiceImpl extends ServiceImpl<ModelComputeMapper, ModelCompute> implements IModelComputeService {

    // 加格斯台水库监测站编码常量
    private static final List<String> STCD_List =
            Lists.newArrayList("MS0016540220100027", "MS0016540220100031", "MS0016540220100046");
    // 降雨分段时间 1小时~120小时
    private static final List<Integer> RAINFALL_TIME = Lists.newArrayList(1, 3, 6, 12, 24, 48, 120);



    @Override
    public JSONObject getInboundFlow(InboundFlow inboundFlow) {
        JSONObject map;
        if (InboundFLowEnums.MN.eq(inboundFlow.getType())) {
            map = this.simulateCompute(inboundFlow);
        } else if (InboundFLowEnums.SS.eq(inboundFlow.getType())) {
            map = new JSONObject(this.realTimeCompute(inboundFlow));
        } else {
            throw new BaseException("数据异常");
        }
        return map;
    }

    // 模拟计算
    public JSONObject simulateCompute(InboundFlow inboundFlow) {
        Map<String, Map<String, JSONObject>> mapTime = Maps.newLinkedHashMap();
        JSONObject jsonObject = new JSONObject();
        jsonObject = computeWaterLevel(jsonObject, inboundFlow);
        return jsonObject;
    }

    // 实时计算
    public Map<String, Map<String, JSONObject>> realTimeCompute(InboundFlow inboundFlow) {
        Map<String, Map<String, JSONObject>> mapTime = Maps.newLinkedHashMap();
        return mapTime;
    }

    /**
     * 入库流量
     * @param map
     * @param inboundFlow
     * @return
     */
    public Map<String, JSONObject> formulas(Map<String, JSONObject> map, InboundFlow inboundFlow) {
        BigDecimal[] rainfalls = {
                inboundFlow.getRainfall1(), inboundFlow.getRainfall3(), inboundFlow.getRainfall6(),
                inboundFlow.getRainfall12(), inboundFlow.getRainfall24(), inboundFlow.getRainfall48(),
                inboundFlow.getRainfall120()
        };
        JSONObject sumFlow = new JSONObject();
        sumFlow.put("flow", BigDecimal.ZERO);
        STCD_List.forEach(item -> { // 测站
            JSONObject jsonObject = map.get(item);
            // 入库流量=输入1*参数1+输入2*参数2+输入3*参数3+输入4*参数4+输入5*参数5+输入6*参数6+输入7*参数7+参数8
            BigDecimal[] multipliers = {
                    jsonObject.getBigDecimal("1"), jsonObject.getBigDecimal("3"),
                    jsonObject.getBigDecimal("6"), jsonObject.getBigDecimal("12"),
                    jsonObject.getBigDecimal("24"), jsonObject.getBigDecimal("48"),
                    jsonObject.getBigDecimal("120")
            };

            BigDecimal sum = BigDecimal.ZERO;
            for (int i = 0; i < rainfalls.length; i++) {
                sum = sum.add(rainfalls[i].multiply(multipliers[i]));
            }
            BigDecimal flow = sum.add(inboundFlow.getRainfallOther());
            jsonObject.put("flow", flow.setScale(10, RoundingMode.HALF_UP)); // 测站流量
            sumFlow.put("flow", sumFlow.getBigDecimal("flow").add(flow)); // 累计流量
//            map.put(item, jsonObject);
        });
        // 三个测站平均流量
        BigDecimal flow = sumFlow.getBigDecimal("flow");
        if (BigDecimal.ZERO.compareTo(flow) != 0) {
            sumFlow.put("flow", flow.divide(new BigDecimal(STCD_List.size()), 10, RoundingMode.HALF_UP));
        }
        HashMap<String, JSONObject> result = Maps.newHashMap();
        result.put("sum", sumFlow);
        return result;
    }

    public JSONObject computeWaterLevel(JSONObject target, InboundFlow inboundFlow) {
        JSONObject result = new JSONObject();
        return result;
    }
}
