/*
 * Copyright © 2026-present Jiangsu Qiantong Technology Co., Ltd.
 *
 * This file is part of qModel Module Platform (Open Source Edition).
 *
 * qModel is licensed under Apache License 2.0 with additional qModel terms.
 * You may use qModel Module for commercial purposes, but you may not remove, hide,
 * modify, or replace the qModel logo, copyright notices, license notices,
 * or attribution information without a separate commercial license.
 *
 * White-label use, OEM distribution, rebranding, or presenting qModel Module as
 * another product requires separate commercial authorization from
 * Jiangsu Qiantong Technology Co., Ltd.
 *
 * Business License: `https://qmodel.tech/`
 * See the LICENSE file in the project root for full license information.
 */

package tech.qiantong.qmodel.module.model.service.calc.engine.impl;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import tech.qiantong.qmodel.common.exception.ServiceException;
import tech.qiantong.qmodel.common.utils.StringUtils;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigTestReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigTestRespVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.config.ModelConfigDO;
import tech.qiantong.qmodel.module.model.service.calc.dto.CalcExecuteContext;
import tech.qiantong.qmodel.module.model.service.calc.dto.ExecutionResult;
import tech.qiantong.qmodel.module.model.service.calc.engine.IExecutionEngine;
import tech.qiantong.qmodel.module.model.service.config.IModelConfigService;

import javax.annotation.Resource;
import java.util.*;

/**
 * API接口类型执行引擎
 *
 * @author qModel
 * @date 2026-07-31
 */
@Slf4j
@Component
public class ApiExecutionEngine implements IExecutionEngine {

    @Resource
    private IModelConfigService modelConfigService;

    @Override
    public void doExecute(CalcExecuteContext ctx, List<String> logBuffer, ExecutionResult result) throws Exception {
        log.info("API执行引擎开始执行: calcId={}, modelId={}, executionNo={}",
                ctx.getCalcId(), ctx.getModelId(), ctx.getExecutionNo());

        // 1. 查模型配置（取到 URL / 鉴权 / 超时 / 请求方法 等）
        ModelConfigDO modelConfig = modelConfigService.getByModelId(ctx.getModelId());
        if (modelConfig == null) {
            throw new ServiceException("模型配置不存在，modelId: " + ctx.getModelId());
        }
        logBuffer.add("已加载模型配置，modelId: " + ctx.getModelId() + ", URL: " + modelConfig.getApiUrl());

        // 2. 解析 ctx.inputParamsJson → Map{paramCode: value} → JSON 字符串做请求体
        Map<String, Object> inputParam = parseInputParamsToMap(ctx.getInputParamsJson());
        String testBody = JSON.toJSONString(inputParam);
        logBuffer.add("请求参数：" + testBody);

        // 3. 构造测试请求 VO（字段和原来调用 testModelConfig 的参数完全对齐）
        ModelConfigTestReqVO testReqVO = BeanUtils.toBean(modelConfig, ModelConfigTestReqVO.class);
        testReqVO.setModelId(ctx.getModelId());
        testReqVO.setTimeoutSeconds(firstNonNull(
                ctx.getTimeoutSeconds(),
                modelConfig.getTimeoutSeconds()));
        testReqVO.setTestBody(testBody);

        // 4. 复用已有 Service 方法：鉴权/Header/Body/调用历史/超时控制 全都包含在里面了
        ModelConfigTestRespVO resp = modelConfigService.testModelConfig(testReqVO);
        List<String> respLogs = resp.getLogs();
        if (respLogs != null && !respLogs.isEmpty()) {
            logBuffer.addAll(respLogs);
        }

        if (Boolean.TRUE.equals(resp.getSuccess())) {
            result.setSuccess(true);
            result.setOutput(resp.getResponseBody());
            logBuffer.add("API 调用成功，HTTP 状态码：" + resp.getStatusCode());
            log.info("API执行引擎执行成功: calcId={}, executionNo={}, statusCode={}",
                    ctx.getCalcId(), ctx.getExecutionNo(), resp.getStatusCode());
        } else {
            result.setSuccess(false);
            StringBuilder sb = new StringBuilder();
            if (resp.getErrorMsg() != null) {
                sb.append(resp.getErrorMsg());
            }
            if (resp.getResponseBody() != null) {
                if (sb.length() > 0) {
                    sb.append(" | ");
                }
                sb.append("响应体: ").append(resp.getResponseBody());
            }
            result.setErrorMessage(sb.length() > 0 ? sb.toString() : "API 调用失败");
            logBuffer.add("API 调用失败：" + result.getErrorMessage());
            log.warn("API执行引擎执行失败: calcId={}, executionNo={}, error={}",
                    ctx.getCalcId(), ctx.getExecutionNo(), result.getErrorMessage());
        }
    }

    @Override
    public String getCalcType() {
        return "0";
    }


    /**
     * 解析 calc.inputParams（多种格式兼容）：
     * 1. Map{params:[{paramCode,value},...]}    前端保存的标准格式
     * 2. [{paramCode,value},...]                   纯数组
     * 3. Map{key:value} 或 JSON Object            已经是键值对
     * 4. null / 空                                 返回空 Map
     */
    public static Map<String, Object> parseInputParamsToMap(String raw) {
        if (StringUtils.isBlank(raw)) return new HashMap<>();
        String trimmed = raw.trim();
        try {
            Object obj = JSON.parse(trimmed);
            return convertInputParamsObject(obj);
        } catch (Exception e) {
            log.warn("inputParams JSON 解析失败，原样作为错误返回体的一部分，raw: {}", trimmed, e);
            return new HashMap<>();
        }
    }

    public static Map<String, Object> convertInputParamsObject(Object obj) {
        Map<String, Object> result = new LinkedHashMap<>();
        if (obj == null) return result;

        // 1. Map{params:[...]}
        if (obj instanceof JSONObject) {
            JSONObject jo = (JSONObject) obj;
            Object params = jo.get("params");
            if (params instanceof Collection) {
                fillFromParamList(result, params instanceof JSONArray ? (JSONArray) params : new JSONArray((Collection<?>) params));
                if (!result.isEmpty()) {
                    return result;
                }
            }
            // 2. 纯 Map{key:value}
            for (Map.Entry<String, Object> e : jo.entrySet()) {
                if ("params".equals(e.getKey())) {
                    continue;
                }
                result.put(e.getKey(), unwrapValue(e.getValue()));
            }
            return result;
        }
        // 3. 纯数组：[{paramCode,value},...]
        if (obj instanceof JSONArray) {
            fillFromParamList(result, (JSONArray) obj);
            return result;
        }
        // 4. Collection
        if (obj instanceof Collection) {
            fillFromParamList(result, new JSONArray((Collection<?>) obj));
            return result;
        }
        return result;
    }

    private static void fillFromParamList(Map<String, Object> result, JSONArray arr) {
        if (arr == null || arr.isEmpty()) {
            return;
        }
        for (Object item : arr) {
            if (!(item instanceof JSONObject)) {
                continue;
            }
            JSONObject row = (JSONObject) item;
            Object codeObj = row.get("paramCode") != null ? row.get("paramCode") : row.get("code");
            Object valObj = row.get("value") != null ? row.get("value")
                    : (row.get("defaultValue") != null ? row.get("defaultValue") : row.get("default"));
            if (codeObj == null) {
                continue;
            }
            String code = String.valueOf(codeObj);
            if (code.isEmpty()) {
                continue;
            }
            result.put(code, unwrapValue(valObj));
        }
    }

    private static Object unwrapValue(Object v) {
        if (v == null) return null;
        return v;
    }

    @SafeVarargs
    private static <T> T firstNonNull(T... values) {
        if (values == null) {
            return null;
        }
        for (T v : values) {
            if (v != null) {
                return v;
            }
        }
        return null;
    }
}
