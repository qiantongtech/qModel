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

package tech.qiantong.qmodel.module.model.service.config.impl;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.io.File;
import java.util.Map;
import java.util.stream.Collectors;
import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestClientResponseException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.exception.ServiceException;
import tech.qiantong.qmodel.common.utils.StringUtils;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigTestReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigTestRespVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.config.ModelConfigDO;
import tech.qiantong.qmodel.module.model.dal.mapper.config.ModelConfigMapper;
import tech.qiantong.qmodel.module.model.service.config.IModelConfigService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
/**
 * 模型配置详情Service业务层处理
 *
 * @author anivia
 * @date 2026-07-07
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class ModelConfigServiceImpl  extends ServiceImpl<ModelConfigMapper,ModelConfigDO> implements IModelConfigService {
    @Resource
    private ModelConfigMapper modelConfigMapper;

    @Resource
    private tech.qiantong.qmodel.config.ServerConfig serverConfig;

    @Value("${dromara.x-file-storage.local-plus[0].storage-path:${user.dir}/upload/}")
    private String storagePath;

    @Override
    public PageResult<ModelConfigDO> getModelConfigPage(ModelConfigPageReqVO pageReqVO) {
        return modelConfigMapper.selectPage(pageReqVO);
    }

    @Override
    public Long createModelConfig(ModelConfigSaveReqVO createReqVO) {
        ModelConfigDO dictType = BeanUtils.toBean(createReqVO, ModelConfigDO.class);
        clearAuthFieldsIfNone(dictType);
        modelConfigMapper.insert(dictType);
        return dictType.getId();
    }

    @Override
    public int updateModelConfig(ModelConfigSaveReqVO updateReqVO) {
        ModelConfigDO updateObj = BeanUtils.toBean(updateReqVO, ModelConfigDO.class);
        if ("NONE".equals(updateObj.getAuthType())) {
            LambdaUpdateWrapper<ModelConfigDO> wrapper = new LambdaUpdateWrapper<>();
            wrapper.eq(ModelConfigDO::getId, updateObj.getId())
                    .set(ModelConfigDO::getAuthMethod, null)
                    .set(ModelConfigDO::getAuthTokenValue, null)
                    .set(ModelConfigDO::getAuthInjectPosition, null)
                    .set(ModelConfigDO::getAuthKeyName, null)
                    .set(ModelConfigDO::getAuthTokenPrefix, null)
                    .set(ModelConfigDO::getAuthDynamicMethod, null)
                    .set(ModelConfigDO::getAuthDynamicUrl, null)
                    .set(ModelConfigDO::getAuthDynamicHeaders, null)
                    .set(ModelConfigDO::getAuthDynamicParams, null)
                    .set(ModelConfigDO::getAuthDynamicBody, null)
                    .set(ModelConfigDO::getAuthExtractPath, null);
            modelConfigMapper.updateById(updateObj);
            modelConfigMapper.update(null, wrapper);
            return 1;
        }

        return modelConfigMapper.updateById(updateObj);
    }

    private void clearAuthFieldsIfNone(ModelConfigDO config) {
        if (config == null || !"NONE".equals(config.getAuthType())) {
            return;
        }
        config.setAuthMethod(null);
        config.setAuthTokenValue(null);
        config.setAuthInjectPosition(null);
        config.setAuthKeyName(null);
        config.setAuthTokenPrefix(null);
        config.setAuthDynamicMethod(null);
        config.setAuthDynamicUrl(null);
        config.setAuthDynamicHeaders(null);
        config.setAuthDynamicParams(null);
        config.setAuthDynamicBody(null);
        config.setAuthExtractPath(null);
    }

    @Override
    public int removeModelConfig(Collection<Long> idList) {
        // 批量删除模型配置详情
        return modelConfigMapper.deleteBatchIds(idList);
    }

    @Override
    public ModelConfigDO getModelConfigById(Long id) {
        return modelConfigMapper.selectById(id);
    }

    @Override
    public List<ModelConfigDO> getModelConfigList() {
        return modelConfigMapper.selectList();
    }

    @Override
    public Map<Long, ModelConfigDO> getModelConfigMap() {
        List<ModelConfigDO> modelConfigList = modelConfigMapper.selectList();
        return modelConfigList.stream()
                .collect(Collectors.toMap(
                        ModelConfigDO::getId,
                        modelConfigDO -> modelConfigDO,
                        // 保留已存在的值
                        (existing, replacement) -> existing
                ));
    }


    @Override
    public ModelConfigTestRespVO testModelConfig(ModelConfigTestReqVO testReqVO) {
        ModelConfigTestRespVO result = new ModelConfigTestRespVO();
        List<String> logs = new ArrayList<>();
        result.setLogs(logs);
        result.setSuccess(false);

        Long timeout = testReqVO.getTimeoutSeconds();
        if (timeout == null || timeout <= 0) {
            timeout = 30L;
        }
        SimpleClientHttpRequestFactory factory = new SimpleClientHttpRequestFactory();
        factory.setConnectTimeout(5000);
        factory.setReadTimeout(timeout.intValue() * 1000);
        RestTemplate restTemplate = new RestTemplate(factory);

        try {
            // 1. 处理鉴权
            String authToken = null;
            String authKeyName = testReqVO.getAuthKeyName();
            if ("FIXED".equals(testReqVO.getAuthType())) {
                if ("bearer".equalsIgnoreCase(testReqVO.getAuthMethod()) && StringUtils.isBlank(authKeyName)) {
                    authKeyName = "Blade-Auth";
                }
                authToken = testReqVO.getAuthTokenValue();
                logs.add("使用固定 Token 鉴权");
            } else if ("DYNAMIC".equals(testReqVO.getAuthType())) {
                logs.add("开始动态获取 Token...");
                authToken = fetchDynamicToken(testReqVO, restTemplate, logs);
                logs.add("动态 Token 获取成功");
            } else {
                logs.add("无鉴权配置");
            }

            // 2. 组装目标请求
            HttpHeaders headers = new HttpHeaders();
            if (StringUtils.isNotBlank(testReqVO.getContentType())) {
                headers.setContentType(org.springframework.http.MediaType.parseMediaType(testReqVO.getContentType()));
            } else {
                headers.setContentType(org.springframework.http.MediaType.APPLICATION_JSON);
            }

            String targetUrl = testReqVO.getApiUrl();
            if (StringUtils.isNotBlank(authToken) && StringUtils.isNotBlank(authKeyName)) {
                if ("Query".equalsIgnoreCase(testReqVO.getAuthInjectPosition())) {
                    String connector = targetUrl.contains("?") ? "&" : "?";
                    targetUrl = targetUrl + connector + authKeyName + "=" + authToken;
                    logs.add("Token 已注入 Query 参数：" + authKeyName);
                } else {
                    headers.set(authKeyName, authToken);
                    logs.add("Token 已注入 Header：" + authKeyName);
                }
            }

            HttpMethod method = HttpMethod.valueOf(testReqVO.getRequestMethod().toUpperCase());
            HttpEntity<?> entity;

            String contentType = testReqVO.getContentType() != null ? testReqVO.getContentType().toLowerCase() : "";
            if (contentType.contains("multipart/form-data") || contentType.contains("application/x-www-form-urlencoded")) {
                String testBody = testReqVO.getTestBody();
                if (StringUtils.isNotBlank(testBody)) {
                    try {
                        JSONObject bodyJson = JSON.parseObject(testBody);
                        LinkedMultiValueMap<String, Object> formData = new LinkedMultiValueMap<>();
                        bodyJson.forEach((k, v) -> {
                            if (v != null) {
                                String value = String.valueOf(v);
                                File file = resolveLocalFile(value);
                                if (file != null && file.exists()) {
                                    formData.add(k, new FileSystemResource(file));
                                    logs.add("文件字段 " + k + " 已加载本地文件：" + file.getAbsolutePath());
                                } else {
                                    formData.add(k, value);
                                }
                            }
                        });
                        headers.setContentType(MediaType.MULTIPART_FORM_DATA);
                        entity = new HttpEntity<>(formData, headers);
                        logs.add("请求体已转换为 multipart/form-data 格式");
                    } catch (Exception e) {
                        entity = new HttpEntity<>(testBody, headers);
                        logs.add("请求体 JSON 解析失败，保留原样发送");
                    }
                } else {
                    entity = new HttpEntity<>(headers);
                }
            }  else {
                entity = new HttpEntity<>(testReqVO.getTestBody(), headers);
            }

            logs.add("发送 " + method.name() + " 请求：" + targetUrl);
            ResponseEntity<String> response = restTemplate.exchange(targetUrl, method, entity, String.class);

            result.setSuccess(true);
            result.setStatusCode(response.getStatusCodeValue());
            result.setResponseBody(response.getBody());
            result.setResponseHeaders(response.getHeaders());
            logs.add("请求成功，HTTP 状态码：" + response.getStatusCodeValue());
        } catch (RestClientResponseException e) {
            result.setStatusCode(e.getRawStatusCode());
            result.setResponseBody(e.getResponseBodyAsString());
            result.setErrorMsg("请求返回非 2xx 状态：" + e.getStatusText());
            logs.add("请求返回异常状态：" + e.getRawStatusCode() + " " + e.getStatusText());
        } catch (Exception e) {
            result.setErrorMsg(e.getMessage());
            logs.add("请求异常：" + e.getMessage());
            log.error("模型配置测试调用异常", e);
        }
        return result;
    }

    private String fetchDynamicToken(ModelConfigTestReqVO testReqVO, RestTemplate restTemplate, List<String> logs) {
        HttpHeaders headers = new HttpHeaders();
        // 默认按 application/x-www-form-urlencoded，可被 authDynamicHeaders 覆盖
        headers.setContentType(org.springframework.http.MediaType.APPLICATION_FORM_URLENCODED);
        if (StringUtils.isNotBlank(testReqVO.getAuthDynamicHeaders())) {
            JSONObject headerObj = JSON.parseObject(testReqVO.getAuthDynamicHeaders());
            headerObj.forEach((k, v) -> headers.set(k, String.valueOf(v)));
        }

        HttpMethod method = HttpMethod.valueOf(testReqVO.getAuthDynamicMethod().toUpperCase());

        // 处理 Query 参数
        String tokenUrl = testReqVO.getAuthDynamicUrl();
        if (StringUtils.isNotBlank(testReqVO.getAuthDynamicParams())) {
            UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(tokenUrl);
            JSONObject paramObj = JSON.parseObject(testReqVO.getAuthDynamicParams());
            paramObj.forEach((k, v) -> uriBuilder.queryParam(k, String.valueOf(v)));
            tokenUrl = uriBuilder.toUriString();
            logs.add("Token 接口 Query 参数：" + testReqVO.getAuthDynamicParams());
        }

        HttpEntity<String> entity = new HttpEntity<>(testReqVO.getAuthDynamicBody(), headers);

        logs.add("请求 Token 接口：" + tokenUrl);
        ResponseEntity<String> response = restTemplate.exchange(tokenUrl, method, entity, String.class);
        String body = response.getBody();
        if (StringUtils.isBlank(body)) {
            throw new ServiceException("动态 Token 接口返回为空");
        }

        JSONObject json = JSON.parseObject(body);
        String token = extractByPath(json, testReqVO.getAuthExtractPath());
        if (StringUtils.isBlank(token)) {
            throw new ServiceException("未从 Token 接口响应中提取到 Token，路径：" + testReqVO.getAuthExtractPath());
        }

        return buildAuthToken(testReqVO.getAuthTokenPrefix(), token);
    }

    private String buildAuthToken(String prefix, String token) {
        if (StringUtils.isBlank(prefix)) {
            return token;
        }
        String normalizedPrefix = prefix.trim();
        if (!normalizedPrefix.endsWith(" ")) {
            normalizedPrefix = normalizedPrefix + " ";
        }
        return normalizedPrefix + (token == null ? "" : token.trim());
    }

    private String extractByPath(JSONObject json, String path) {
        if (StringUtils.isBlank(path)) {
            return json.toJSONString();
        }
        Object current = json;
        List<String> keys = Arrays.asList(path.split("\\."));
        for (String key : keys) {
            if (current instanceof JSONObject) {
                current = ((JSONObject) current).get(key);
            } else {
                return null;
            }
        }
        return current == null ? null : String.valueOf(current);
    }

    private File resolveLocalFile(String filePath) {
        if (StringUtils.isBlank(filePath)) {
            return null;
        }
        filePath = filePath.trim();
        String currentServerUrl = serverConfig.getUrl();
        if (StringUtils.isNotBlank(currentServerUrl) && filePath.startsWith(currentServerUrl)) {
            String relativePath = filePath.substring(currentServerUrl.length());
            if (relativePath.startsWith("/profile/")) {
                relativePath = relativePath.substring("/profile/".length());
            } else if (relativePath.startsWith("/")) {
                relativePath = relativePath.substring(1);
            }
            String localPath = storagePath + relativePath;
            File file = new File(localPath);
            if (file.exists()) {
                return file;
            }
        }
        File file = new File(filePath);
        if (file.exists()) {
            return file;
        }
        return null;
    }

    /**
     * 导入模型配置详情数据
     *
     * @param importExcelList 模型配置详情数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    @Override
    public String importModelConfig(List<ModelConfigRespVO> importExcelList, boolean isUpdateSupport, String operName) {
        if (StringUtils.isNull(importExcelList) || importExcelList.size() == 0) {
            throw new ServiceException("导入数据不能为空！");
        }

        int successNum = 0;
        int failureNum = 0;
        List<String> successMessages = new ArrayList<>();
        List<String> failureMessages = new ArrayList<>();

        for (ModelConfigRespVO respVO : importExcelList) {
            try {
                ModelConfigDO modelConfigDO = BeanUtils.toBean(respVO, ModelConfigDO.class);
                Long modelConfigId = respVO.getId();
                if (isUpdateSupport) {
                    if (modelConfigId != null) {
                        ModelConfigDO existingModelConfig = modelConfigMapper.selectById(modelConfigId);
                        if (existingModelConfig != null) {
                            modelConfigMapper.updateById(modelConfigDO);
                            successNum++;
                            successMessages.add("数据更新成功，ID为 " + modelConfigId + " 的模型配置详情记录。");
                        } else {
                            failureNum++;
                            failureMessages.add("数据更新失败，ID为 " + modelConfigId + " 的模型配置详情记录不存在。");
                        }
                    } else {
                        failureNum++;
                        failureMessages.add("数据更新失败，某条记录的ID不存在。");
                    }
                } else {
                    QueryWrapper<ModelConfigDO> queryWrapper = new QueryWrapper<>();
                    queryWrapper.eq("id", modelConfigId);
                    ModelConfigDO existingModelConfig = modelConfigMapper.selectOne(queryWrapper);
                    if (existingModelConfig == null) {
                        modelConfigMapper.insert(modelConfigDO);
                        successNum++;
                        successMessages.add("数据插入成功，ID为 " + modelConfigId + " 的模型配置详情记录。");
                    } else {
                        failureNum++;
                        failureMessages.add("数据插入失败，ID为 " + modelConfigId + " 的模型配置详情记录已存在。");
                    }
                }
            } catch (Exception e) {
                failureNum++;
                String errorMsg = "数据导入失败，错误信息：" + e.getMessage();
                failureMessages.add(errorMsg);
                log.error(errorMsg, e);
            }
        }
        StringBuilder resultMsg = new StringBuilder();
        if (failureNum > 0) {
            resultMsg.append("很抱歉，导入失败！共 ").append(failureNum).append(" 条数据格式不正确，错误如下：");
            resultMsg.append("<br/>").append(String.join("<br/>", failureMessages));
            throw new ServiceException(resultMsg.toString());
        } else {
            resultMsg.append("恭喜您，数据已全部导入成功！共 ").append(successNum).append(" 条。");
        }
        return resultMsg.toString();
    }
}
