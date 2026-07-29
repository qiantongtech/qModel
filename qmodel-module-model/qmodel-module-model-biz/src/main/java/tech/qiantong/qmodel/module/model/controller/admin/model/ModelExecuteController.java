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

package tech.qiantong.qmodel.module.model.controller.admin.model;

import com.alibaba.fastjson2.JSON;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import tech.qiantong.qmodel.common.core.domain.CommonResult;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigTestReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigTestRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelRespVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.config.ModelConfigDO;
import tech.qiantong.qmodel.module.model.enums.AccessTypeEnum;
import tech.qiantong.qmodel.module.model.service.config.IModelConfigService;
import tech.qiantong.qmodel.module.model.service.fileResource.IModelFileResourceService;
import tech.qiantong.qmodel.module.model.service.model.IModelService;

import javax.annotation.Resource;
import java.util.Map;

@RestController
@RequestMapping("/v1/models")
public class ModelExecuteController {

    @Resource
    private IModelFileResourceService modelFileResourceService;
    @Resource
    private IModelConfigService modelConfigService;
    @Resource
    private IModelService modelService;

    @Operation(summary = "执行模型脚本")
    @PostMapping("/predict")
    public CommonResult<Object> predict(@RequestBody(required = false) Map<String, Object> inputParam) {
        Long modelId = 9L;
        ModelRespVO modelRespVO = modelService.getModelById(modelId);
        ModelConfigDO modelConfig = modelRespVO.getModelConfig();
        if (AccessTypeEnum.API.getType().equals(modelRespVO.getAccessType())){
            ModelConfigTestReqVO testReqVO = new ModelConfigTestReqVO();
            testReqVO.setModelId(modelId);
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
            testReqVO.setTestBody(JSON.toJSONString(inputParam));
            return CommonResult.success(modelConfigService.testModelConfig(testReqVO));
        }else {
            return CommonResult.success(modelFileResourceService.runModelScript(modelId, inputParam));
        }
    }
}
