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
}
