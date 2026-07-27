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

package tech.qiantong.qmodel.module.model.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.collect.Lists;
import org.springframework.stereotype.Service;
import tech.qiantong.qmodel.common.exception.base.BaseException;
import tech.qiantong.qmodel.module.model.entity.ForecastScheme;
import tech.qiantong.qmodel.module.model.enums.ForecastSchemeTypeEnums;
import tech.qiantong.qmodel.module.model.enums.ForecastStatusEnums;
import tech.qiantong.qmodel.module.model.mapper.ForecastSchemeMapper;
import tech.qiantong.qmodel.module.model.service.IForecastSchemeService;

import java.util.List;
import java.util.Objects;

@Service
public class ForecastSchemeServiceImpl extends ServiceImpl<ForecastSchemeMapper, ForecastScheme> implements IForecastSchemeService {


    public Boolean startForecast(Long id) {
        List<?> list = Lists.newArrayList();
        ForecastScheme forecastScheme = this.getById(id);
        forecastScheme.setStatus(ForecastStatusEnums.YCZ.code);
        this.updateById(forecastScheme);
        switch (Objects.requireNonNull(ForecastSchemeTypeEnums.get(forecastScheme.getSchemeType()))) {
            case RV:
//                list = ylStRiverRService.stRiverRWeka(forecastScheme);
                break;
            case UW:
//                list = ylStRiverRService.underWaterWeka(forecastScheme);
                break;
            case XX:
//                list = ylStRiverRService.xxWaterWeka(forecastScheme);
                break;
            default:
                throw new BaseException("数据异常");
        }
        if (!list.isEmpty()) {
            forecastScheme.setStatus(ForecastStatusEnums.WC.code);
            String jsonString = JSON.toJSONString(list, SerializerFeature.WriteMapNullValue);
            forecastScheme.setOutputContent(jsonString);
            return this.updateById(forecastScheme);
        }
        return false;
    }
}
