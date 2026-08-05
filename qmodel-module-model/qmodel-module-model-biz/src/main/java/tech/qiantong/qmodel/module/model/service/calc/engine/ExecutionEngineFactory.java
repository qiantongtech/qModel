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

package tech.qiantong.qmodel.module.model.service.calc.engine;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import tech.qiantong.qmodel.common.exception.ServiceException;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 执行引擎工厂
 *
 * @author qModel
 * @date 2026-07-28
 */
@Slf4j
@Component
public class ExecutionEngineFactory {

    @Resource
    private List<IExecutionEngine> executionEngines;

    private final Map<String, IExecutionEngine> engineMap = new HashMap<>();

    @PostConstruct
    public void init() {
        for (IExecutionEngine engine : executionEngines) {
            engineMap.put(engine.getCalcType(), engine);
            log.info("注册执行引擎: type={}, impl={}", engine.getCalcType(), engine.getClass().getSimpleName());
        }
    }

    /**
     * 根据计算类型获取执行引擎
     *
     * @param calcType 计算类型
     * @return 执行引擎
     */
    public IExecutionEngine getEngine(Integer calcType) {
        if (calcType == null) {
            throw new ServiceException("计算类型不能为空");
        }
        String typeKey = String.valueOf(calcType);
        IExecutionEngine engine = engineMap.get(typeKey);
        if (engine == null) {
            throw new ServiceException("不支持的计算类型: " + calcType);
        }
        return engine;
    }

}
