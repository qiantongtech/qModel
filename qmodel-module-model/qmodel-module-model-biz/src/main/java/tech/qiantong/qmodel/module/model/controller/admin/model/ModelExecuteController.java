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

package tech.qiantong.qmodel.module.model.controller.admin.model;

import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson2.JSON;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import tech.qiantong.qmodel.common.core.domain.CommonResult;
import tech.qiantong.qmodel.common.core.domain.entity.SysUser;
import tech.qiantong.qmodel.common.exception.ServiceException;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigTestReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelExecuteVO;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelRespVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.config.ModelConfigDO;
import tech.qiantong.qmodel.module.model.enums.AccessTypeEnum;
import tech.qiantong.qmodel.module.model.enums.ModelStatusEnum;
import tech.qiantong.qmodel.module.model.service.config.IModelConfigService;
import tech.qiantong.qmodel.module.model.service.fileResource.IModelFileResourceService;
import tech.qiantong.qmodel.module.model.service.model.IModelService;
import tech.qiantong.qmodel.module.model.service.modelKey.IModelKeyService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Objects;

@RestController
@RequestMapping("/v1/models")
public class ModelExecuteController {

    @Resource
    private IModelFileResourceService modelFileResourceService;
    @Resource
    private IModelConfigService modelConfigService;
    @Resource
    private IModelService modelService;
    @Resource
    private IModelKeyService modelKeyService;

    @Operation(summary = "执行模型脚本")
    @PostMapping("/execute")
    public CommonResult<Object> predict(HttpServletRequest request,
                                        @Validated @RequestBody ModelExecuteVO modelExecuteVO) {
        String apiKey = getApiKey(request);
        checkApiKey(apiKey);
        modelKeyService.updateUseTime(apiKey);

        ModelRespVO modelRespVO = getModelByCode(modelExecuteVO.getModelCode());
        ModelConfigDO modelConfig = modelRespVO.getModelConfig();
        if (AccessTypeEnum.API.getType().equals(modelRespVO.getAccessType())) {
            ModelConfigTestReqVO testReqVO = new ModelConfigTestReqVO();
            testReqVO.setModelId(modelRespVO.getId());
            testReqVO.setModelName(modelRespVO.getName());
            testReqVO.setApiUrl(modelConfig.getApiUrl());
            testReqVO.setRequestMethod(modelConfig.getRequestMethod());
            testReqVO.setContentType(modelConfig.getContentType());
            testReqVO.setTimeoutSeconds(modelConfig.getTimeoutSeconds());
            testReqVO.setAuthType(modelConfig.getAuthType());
            testReqVO.setAuthMethod(modelConfig.getAuthMethod());
            testReqVO.setAuthInjectPosition(modelConfig.getAuthInjectPosition());
            testReqVO.setAuthKeyName(modelConfig.getAuthKeyName());
            testReqVO.setAuthTokenPrefix(modelConfig.getAuthTokenPrefix());
            testReqVO.setAuthTokenValue(modelConfig.getAuthTokenValue());
            testReqVO.setAuthDynamicMethod(modelConfig.getAuthDynamicMethod());
            testReqVO.setAuthDynamicUrl(modelConfig.getAuthDynamicUrl());
            testReqVO.setAuthDynamicHeaders(modelConfig.getAuthDynamicHeaders());
            testReqVO.setAuthDynamicParams(modelConfig.getAuthDynamicParams());
            testReqVO.setAuthDynamicBody(modelConfig.getAuthDynamicBody());
            testReqVO.setAuthExtractPath(modelConfig.getAuthExtractPath());
            testReqVO.setTestBody(JSON.toJSONString(modelExecuteVO.getParam()));
            return CommonResult.success(modelConfigService.testModelConfig(testReqVO));
        } else {
            return CommonResult.success(modelFileResourceService.runModelScript(modelRespVO.getId(), modelExecuteVO.getParam()));
        }
    }

    /**
     * 获取模型信息
     *
     * @param modelCode 模型编码
     * @return 模型信息
     */
    private ModelRespVO getModelByCode(String modelCode) {
        ModelRespVO modelRespVO = modelService.getModelByCode(modelCode);
        if (Objects.isNull(modelRespVO)) {
            throw new ServiceException("模型不存在");
        }
        if (!Objects.equals(ModelStatusEnum.PUBLISHED.getStatus(), modelRespVO.getStatus())) {
            throw new ServiceException("模型未发布，拒绝访问");
        }
        return modelRespVO;
    }

    /**
     * 获取 apiKey
     *
     * @param request 请求
     * @return apiKey
     */
    private String getApiKey(HttpServletRequest request) {
        String authorization = request.getHeader("Authorization");
        if (StrUtil.isBlank(authorization) || authorization.length() <= 7) {
            throw new ServiceException("apiKey 异常");
        }
        return authorization.substring(7);
    }

    /**
     * 校验 apiKey
     *
     * @param apiKey apiKey
     */
    private void checkApiKey(String apiKey) {
        SysUser userByApiKey = modelKeyService.getUserByApiKey(apiKey);
        if (Objects.isNull(userByApiKey)) {
            throw new ServiceException("apiKey 异常");
        }
        if (!Objects.equals(userByApiKey.getStatus(), "0")) {
            throw new ServiceException("用户状态异常");
        }
    }
}
