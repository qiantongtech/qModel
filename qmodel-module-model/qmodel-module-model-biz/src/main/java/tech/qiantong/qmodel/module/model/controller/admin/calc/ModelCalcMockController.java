/*
 * Copyright © 2026-present Jiangsu Qiantong Technology Co., Ltd.
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

package tech.qiantong.qmodel.module.model.controller.admin.calc;

import com.alibaba.fastjson2.JSONObject;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import tech.qiantong.qmodel.common.annotation.Anonymous;

import java.awt.*;
import java.util.Arrays;
import java.util.List;

/**
 * 模型计算任务模拟数据接口
 *
 * @author anivia
 * @date 2026-08-04
 */
@Slf4j
@Tag(name = "模型计算任务模拟数据")
@RestController
@RequestMapping("/model/mock")
@Validated
public class ModelCalcMockController {

    private static String TEST_IMAGE_BASE64;

    static {
        try {
            TEST_IMAGE_BASE64 = org.springframework.util.StreamUtils.copyToString(
                new org.springframework.core.io.ClassPathResource("mock/water-predict-image.txt").getInputStream(),
                java.nio.charset.StandardCharsets.UTF_8);
        } catch (java.io.IOException e) {
            throw new RuntimeException("加载模拟图片数据失败", e);
        }
    }

    @Anonymous
    @Operation(summary = "水量预测测试数据")
    @GetMapping("/waterPredict")
    public JSONObject waterPredictMockData() {
        List<String> dates = Arrays.asList(
                "2026-07-01", "2026-07-02", "2026-07-03", "2026-07-04", "2026-07-05",
                "2026-07-06", "2026-07-07", "2026-07-08", "2026-07-09", "2026-07-10"
        );
        List<Double> predictFlow = Arrays.asList(
                1150.2, 1310.5, 1260.3, 1350.9, 1280.7,
                1490.6, 1310.2, 1520.8, 1340.5, 1550.3
        );

        List<Double> actualFlow = Arrays.asList(
                1380.5, 1520.8, 1490.2, 1580.6, 1510.4,
                1750.3, 1540.7, 1780.5, 1590.2, 1820.9
        );

        JSONObject chartData = new JSONObject();
        chartData.put("dates", dates);
        chartData.put("predict_flow", predictFlow);
        chartData.put("actual_flow", actualFlow);

        JSONObject fitInfo = new JSONObject();
        fitInfo.put("a", 7.02);
        fitInfo.put("H0", 0.0145);
        fitInfo.put("b", 1.8815);
        fitInfo.put("r2", 1.0);

        JSONObject result = new JSONObject();
        result.put("input_water_level", 8.5);
        result.put("predict_flow", 1250.0);
        result.put("fit_info", Arrays.asList(fitInfo));
        result.put("formula", "Q = 7.02 * (H - 0.0145)^1.8815");
        result.put("image_base64", Arrays.asList(TEST_IMAGE_BASE64));
        result.put("chart_data", chartData);

        return result;
    }

    // ================== 以下为 API管理（数据接入）演示数据接口 ==================
    // 说明：演示站 qModel 的「API管理」会调用以下接口，按返回 JSON 的字段名
    //       自动匹配并覆盖模型在线调试 / 模型计算的入参。每个接口返回的字段名
    //       即为可被模型使用的参数名，对应 model_data_api.output_schema。

    @Anonymous
    @Operation(summary = "水文站实时水位监测")
    @GetMapping("/waterLevel")
    public JSONObject waterLevelMockData() {
        JSONObject data = new JSONObject();
        data.put("station_code", "HT-6201");
        data.put("water_level", 8.52);
        data.put("flow", 1265.4);
        data.put("warn_level", 9.20);
        data.put("rainfall", 12.6);
        data.put("monitor_time", "2026-10-20 08:00:00");
        return data;
    }

    @Anonymous
    @Operation(summary = "气象观测数据获取")
    @GetMapping("/weather")
    public JSONObject weatherMockData() {
        JSONObject data = new JSONObject();
        data.put("city", "南京");
        data.put("temperature", 26.4);
        data.put("humidity", 68.5);
        data.put("rainfall", 8.2);
        data.put("wind_speed", 3.6);
        data.put("pressure", 1008.7);
        return data;
    }

    @Anonymous
    @Operation(summary = "设备健康度评估")
    @GetMapping("/deviceHealth")
    public JSONObject deviceHealthMockData() {
        JSONObject data = new JSONObject();
        data.put("device_id", "PUMP-03");
        data.put("health_score", 87.5);
        data.put("vibration", 2.13);
        data.put("bearing_temp", 62.8);
        data.put("runtime_hours", 15230);
        data.put("fault_prob", 0.08);
        return data;
    }

    @Anonymous
    @Operation(summary = "电力负荷预测")
    @GetMapping("/powerLoad")
    public JSONObject powerLoadMockData() {
        JSONObject data = new JSONObject();
        data.put("region", "工业园区-A");
        data.put("load_value", 4820.5);
        data.put("peak_load", 5310.0);
        data.put("voltage", 220.4);
        data.put("current", 386.2);
        data.put("power_factor", 0.95);
        return data;
    }

    @Anonymous
    @Operation(summary = "交通流量监测")
    @GetMapping("/trafficFlow")
    public JSONObject trafficFlowMockData() {
        JSONObject data = new JSONObject();
        data.put("road_id", "G42-108");
        data.put("vehicle_count", 3860);
        data.put("avg_speed", 52.7);
        data.put("congestion_index", 1.85);
        data.put("lane_occupancy", 0.42);
        return data;
    }

    @Anonymous
    @Operation(summary = "空气质量监测")
    @GetMapping("/airQuality")
    public JSONObject airQualityMockData() {
        JSONObject data = new JSONObject();
        data.put("station_name", "城南监测点");
        data.put("aqi", 62);
        data.put("pm25", 28.5);
        data.put("pm10", 46.3);
        data.put("so2", 9.2);
        data.put("no2", 32.7);
        data.put("o3", 88.4);
        return data;
    }

    @Anonymous
    @Operation(summary = "信贷风险评估")
    @GetMapping("/creditRisk")
    public JSONObject creditRiskMockData() {
        JSONObject data = new JSONObject();
        data.put("applicant_id", "USR-20886");
        data.put("credit_score", 712);
        data.put("risk_level", "LOW");
        data.put("debt_ratio", 0.28);
        data.put("overdue_count", 0);
        return data;
    }

    @Anonymous
    @Operation(summary = "零售销量预测")
    @GetMapping("/salesForecast")
    public JSONObject salesForecastMockData() {
        JSONObject data = new JSONObject();
        data.put("sku_code", "RM-30821");
        data.put("sales_volume", 1860);
        data.put("growth_rate", 0.14);
        data.put("stock_qty", 4320);
        data.put("unit_price", 39.9);
        return data;
    }

    @Anonymous
    @Operation(summary = "作物长势监测")
    @GetMapping("/cropGrowth")
    public JSONObject cropGrowthMockData() {
        JSONObject data = new JSONObject();
        data.put("field_id", "FARM-N07");
        data.put("ndvi", 0.72);
        data.put("soil_moisture", 41.6);
        data.put("growth_stage", "抽穗期");
        data.put("yield_est", 618.5);
        return data;
    }

    @Anonymous
    @Operation(summary = "物流时效预测")
    @GetMapping("/logisticsEta")
    public JSONObject logisticsEtaMockData() {
        JSONObject data = new JSONObject();
        data.put("order_id", "SO-771205");
        data.put("eta_hours", 18.5);
        data.put("distance", 428.0);
        data.put("traffic_factor", 1.12);
        data.put("weather_factor", 1.05);
        return data;
    }

    @Anonymous
    @Operation(summary = "水质监测")
    @GetMapping("/waterQuality")
    public JSONObject waterQualityMockData() {
        JSONObject data = new JSONObject();
        data.put("section_code", "WQ-1180");
        data.put("ph", 7.25);
        data.put("dissolved_oxygen", 8.6);
        data.put("turbidity", 12.3);
        data.put("ammonia_nitrogen", 0.38);
        return data;
    }
}
