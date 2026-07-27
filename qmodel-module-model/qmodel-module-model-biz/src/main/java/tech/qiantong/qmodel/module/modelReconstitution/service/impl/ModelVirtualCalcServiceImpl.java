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

package tech.qiantong.qmodel.module.modelReconstitution.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import tech.qiantong.qmodel.module.modelReconstitution.service.IModelVirtualCalcService;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.security.SecureRandom;
import java.util.List;

/**
 * 模型分类Service业务层处理
 *
 * @author surge
 * @date 2023-09-15
 */
@Service
public class ModelVirtualCalcServiceImpl implements IModelVirtualCalcService {
    // 使用静态 SecureRandom 实例
    private static final SecureRandom SECURE_RANDOM = new SecureRandom();

    private final List<List<Double>> py1 = Lists.newArrayList(
            Lists.newArrayList(0.0, 0.0, 0.0, 0.0, 0.9515114853359278, 4.452283400724062, 12.465059234574433, 29.598336357049046, 54.20792864383895, 83.11054539482939, 105.8401033642792, 115.94050671500605, 108.98425201292059, 93.5090254786197, 77.54883858151973, 65.15184422640452, 54.767392634542254, 45.142648983201234, 35.51790533186022, 26.368917423187156, 18.73243760087418, 12.680946552968475, 8.396187762834195, 5.575735305237742, 0.01067390645303433, 0.7597079405212199),
            Lists.newArrayList(0.0, 0.0, 0.0, 1.6435904514047646, 3.1832376471207566, 7.67986732084271, 12.780781130227984, 16.832830280612647, 17.8812977077895, 16.80182986427854, 21.409660673041774, 26.20428407314121, 31.44613645225914, 34.04960088549925, 35.99052665079654, 42.201547279533926, 49.70821333446261, 55.66517878179373, 53.325318842029645, 51.07912737369267, 53.591997341943106, 59.33334597042272, 77.032080545218, 91.31072556035798, 0.43447144133506005, 121.70914947798202),
            Lists.newArrayList(0.0, 0.0, 0.0, 1.2427905114591766, 3.1020725448322852, 6.870074077654037, 13.636834180457212, 18.874605990705735, 23.476188883749202, 27.79405342829416, 37.33358287235341, 52.63983773350419, 74.70931780382192, 95.46579058109516, 110.19415112364784, 112.22872668974202, 109.69065142162646, 113.17366569389996, 118.20369823427129, 124.59372597530198, 129.56332489658763, 131.89507127732998, 132.0682737750803, 129.45668925476187, 0.490526010180646, 118.80979541832136),
            Lists.newArrayList(0.0, 0.0, 0.0, 1.7896183365012293, 4.881730112581919, 13.309470021708247, 27.363329874743116, 47.551035619051845, 69.03592950927042, 92.18955995352411, 114.64923166808008, 135.19112863231445, 152.18402819292393, 165.63543693627156, 174.3614981837112, 177.37183551204234, 174.74958832372707, 168.11966460151064, 158.58955786888805, 147.34461529630767, 133.16486540923444, 117.85668836305527, 102.04978590439788, 87.36545136553886, 0.28488598199563236, 62.53135686605835)
    );
    @Autowired
    private ResourceLoader resourceLoader;

    @Override
    public JSONObject getOneResult() {
        JSONObject jsonObject = new JSONObject();
        // 使用 SecureRandom 生成随机索引
        int randomIndex = SECURE_RANDOM.nextInt(py1.size());  // 假设 py1 有4个元素
        List<Double> doubles = py1.get(randomIndex);
        jsonObject.put("data", doubles);
        return jsonObject;
    }

    @Override
    public JSONObject getTwoResult() {
        StringBuilder json = new StringBuilder();
        try {
            Resource resource = resourceLoader.getResource("classpath:" + "pythonResult/two.json");
            try (InputStream inputStream = resource.getInputStream();
                 BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream))) {

                String line;
                while ((line = reader.readLine()) != null) {
                    json.append(line);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return JSON.parseObject(json.toString()).getJSONObject("1");
    }

}
