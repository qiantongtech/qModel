package tech.qiantong.qmodel.module.model.service;

import com.baomidou.mybatisplus.extension.service.*;
import tech.qiantong.qmodel.module.model.entity.*;

/**
 * 预测方案 Service接口
 *
 * @author JW
 * @date 2024-10-21
 */
public interface IForecastSchemeService extends IService<ForecastScheme> {

    public Boolean startForecast(Long id);
}
