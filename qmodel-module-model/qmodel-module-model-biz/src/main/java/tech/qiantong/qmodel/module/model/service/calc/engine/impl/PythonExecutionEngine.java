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

package tech.qiantong.qmodel.module.model.service.calc.engine.impl;

import com.alibaba.fastjson2.JSON;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import tech.qiantong.qmodel.common.exception.ServiceException;
import tech.qiantong.qmodel.common.utils.StringUtils;
import tech.qiantong.qmodel.module.model.service.calc.dto.CalcExecuteContext;
import tech.qiantong.qmodel.module.model.service.calc.dto.ExecutionResult;
import tech.qiantong.qmodel.module.model.service.calc.engine.IExecutionEngine;
import tech.qiantong.qmodel.module.model.service.fileResource.IModelFileResourceService;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Python本地类型执行引擎
 *
 * @author qModel
 * @date 2026-07-31
 */
@Slf4j
@Component
public class PythonExecutionEngine implements IExecutionEngine {

    @Resource
    private IModelFileResourceService modelFileResourceService;

    @Override
    public void doExecute(CalcExecuteContext ctx, List<String> logBuffer, ExecutionResult result) throws Exception {
        log.info("Python执行引擎开始执行: calcId={}, modelId={}, executionNo={}",
                ctx.getCalcId(), ctx.getModelId(), ctx.getExecutionNo());

        // 1. 解析 ctx.inputParamsJson → Map{paramCode: value}（复用 ApiExecutionEngine 里的兼容解析逻辑）
        Map<String, Object> inputParam = ApiExecutionEngine.parseInputParamsToMap(ctx.getInputParamsJson());
        logBuffer.add("输入参数解析完成，共 " + inputParam.size() + " 个字段：" + JSON.toJSONString(inputParam));

        // 2. 调用 runModelScript —— 内部已包含：脚本路径检查、构建状态校验、
        //    文件参数路径 resolve、超时控制、子进程执行、stdout 读取、调用历史记录落库
        Object scriptResult = modelFileResourceService.runModelScript(ctx.getModelId(), inputParam);

        // 3. 结果规整：null→"", String→原样, 其他→JSON 序列化
        String outputStr;
        if (scriptResult == null) {
            outputStr = "";
        } else if (scriptResult instanceof String) {
            outputStr = (String) scriptResult;
        } else {
            outputStr = JSON.toJSONString(scriptResult);
        }

        result.setSuccess(true);
        result.setOutput(outputStr);
        logBuffer.add("Python 脚本执行成功，结果长度：" + (outputStr == null ? 0 : outputStr.length()));
        if (StringUtils.isNotBlank(outputStr)) {
            int previewLen = Math.min(512, outputStr.length());
            logBuffer.add("结果预览：" + outputStr.substring(0, previewLen)
                    + (previewLen < outputStr.length() ? "..." : ""));
        }
        log.info("Python执行引擎执行成功: calcId={}, executionNo={}", ctx.getCalcId(), ctx.getExecutionNo());
    }

    @Override
    public String getCalcType() {
        return "1";
    }
}
