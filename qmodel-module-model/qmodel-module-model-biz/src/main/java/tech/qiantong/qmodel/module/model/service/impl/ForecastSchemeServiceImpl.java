package tech.qiantong.qmodel.module.model.service.impl;

import com.alibaba.fastjson.*;
import com.alibaba.fastjson.serializer.*;
import com.baomidou.mybatisplus.extension.service.impl.*;
import com.google.common.collect.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import tech.qiantong.qmodel.common.exception.base.*;
import tech.qiantong.qmodel.module.model.entity.*;
import tech.qiantong.qmodel.module.model.enums.*;
import tech.qiantong.qmodel.module.model.mapper.*;
import tech.qiantong.qmodel.module.model.service.*;

import java.util.*;

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
