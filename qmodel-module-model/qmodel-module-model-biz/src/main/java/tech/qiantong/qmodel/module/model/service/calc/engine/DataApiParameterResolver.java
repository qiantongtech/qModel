package tech.qiantong.qmodel.module.model.service.calc.engine;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import tech.qiantong.qmodel.common.exception.ServiceException;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigTestReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigTestRespVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.modelData.ModelDataApiDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.calc.ModelCalcDO;
import tech.qiantong.qmodel.module.model.service.config.IModelConfigService;
import tech.qiantong.qmodel.module.model.service.modelData.IModelDataApiService;
import org.springframework.stereotype.Component;

import java.util.Collection;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** Resolves task input parameters from an optional bound data API. */
@Component
public class DataApiParameterResolver {

    private final IModelConfigService modelConfigService;
    private final IModelDataApiService modelDataApiService;

    public DataApiParameterResolver(IModelConfigService modelConfigService,
                                    IModelDataApiService modelDataApiService) {
        this.modelConfigService = modelConfigService;
        this.modelDataApiService = modelDataApiService;
    }

    public Map<String, Object> resolve(ModelCalcDO calc, Map<String, Object> inputParams,
                                       List<String> logBuffer) {
        Map<String, Object> resolved = new LinkedHashMap<>();
        if (inputParams != null) {
            resolved.putAll(inputParams);
        }
        if (calc == null || calc.getResourceId() == null) {
            return resolved;
        }

        ModelDataApiDO dataApi = modelDataApiService.getModelDataApiById(calc.getResourceId());
        if (dataApi == null || Boolean.FALSE.equals(dataApi.getValidFlag())
                || Boolean.TRUE.equals(dataApi.getDelFlag())) {
            throw new ServiceException("绑定的数据 API 不存在或已停用");
        }

        ModelConfigTestReqVO request = new ModelConfigTestReqVO();
        request.setApiUrl(dataApi.getApiUrl());
        request.setRequestMethod(dataApi.getRequestMethod());
        request.setContentType(dataApi.getContentType());
        request.setTimeoutSeconds(dataApi.getTimeoutSeconds());
        request.setAuthType(dataApi.getAuthType());
        request.setAuthMethod(dataApi.getAuthMethod());
        request.setAuthInjectPosition(dataApi.getAuthInjectPos());
        request.setAuthKeyName(dataApi.getAuthKeyName());
        request.setAuthTokenPrefix(dataApi.getAuthTokenPrefix());
        request.setAuthTokenValue(dataApi.getAuthTokenValue());
        request.setAuthDynamicMethod(dataApi.getAuthDynMethod());
        request.setAuthDynamicUrl(dataApi.getAuthDynUrl());
        request.setAuthDynamicHeaders(dataApi.getAuthDynHeaders());
        request.setAuthDynamicParams(dataApi.getAuthDynParams());
        request.setAuthDynamicBody(dataApi.getAuthDynBody());
        request.setAuthExtractPath(dataApi.getAuthExtractPath());
        request.setTestBody(JSON.toJSONString(resolved));

        ModelConfigTestRespVO response = modelConfigService.testModelConfig(request);
        if (response == null || !Boolean.TRUE.equals(response.getSuccess())) {
            throw new ServiceException("绑定数据 API 调用失败："
                    + (response == null ? "无响应" : response.getErrorMsg()));
        }
        Map<String, Object> returned = parseResponseObject(response.getResponseBody());
        if (returned.isEmpty()) {
            throw new ServiceException("绑定数据 API 返回结果为空或不是 JSON 对象");
        }
        // API 返回字段只覆盖任务中已有的同名参数，避免把无关字段传给目标服务。
        resolved.replaceAll((key, value) -> returned.containsKey(key) ? returned.get(key) : value);
        if (logBuffer != null) {
            logBuffer.add("绑定数据 API 调用成功，匹配并注入 " + countMatched(resolved, returned) + " 个参数");
        }
        return resolved;
    }

    private static int countMatched(Map<String, Object> input, Map<String, Object> returned) {
        int count = 0;
        for (String key : input.keySet()) {
            if (returned.containsKey(key)) {
                count++;
            }
        }
        return count;
    }

    private static Map<String, Object> parseResponseObject(String responseBody) {
        if (responseBody == null || responseBody.trim().isEmpty()) {
            return Collections.emptyMap();
        }
        Object parsed;
        try {
            parsed = JSON.parse(responseBody);
        } catch (Exception e) {
            throw new ServiceException("绑定数据 API 返回结果不是合法 JSON");
        }
        if (!(parsed instanceof JSONObject)) {
            return Collections.emptyMap();
        }
        JSONObject object = (JSONObject) parsed;
        Object data = object.get("data");
        if (data instanceof JSONObject) {
            return new LinkedHashMap<>((JSONObject) data);
        }
        return new LinkedHashMap<>(object);
    }
}
