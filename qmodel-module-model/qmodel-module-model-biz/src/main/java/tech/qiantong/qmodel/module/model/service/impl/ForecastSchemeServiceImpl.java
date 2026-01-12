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
