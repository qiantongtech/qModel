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

package tech.qiantong.qmodel.module.model.controller.admin.modelKey;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import tech.qiantong.qmodel.common.annotation.Log;
import tech.qiantong.qmodel.common.core.controller.BaseController;
import tech.qiantong.qmodel.common.core.domain.CommonResult;
import tech.qiantong.qmodel.common.enums.BusinessType;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.module.model.controller.admin.modelKey.vo.ModelKeyPageVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.modelKey.ModelKeyDO;
import tech.qiantong.qmodel.module.model.service.modelKey.IModelKeyService;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;

/**
 * 模型访问 keyController
 *
 * @author anivia
 * @date 2026-07-30
 */
@Tag(name = "模型访问 key")
@RestController
@RequestMapping("/model/modelKey")
@Validated
public class ModelKeyController extends BaseController {
    @Resource
    private IModelKeyService modelKeyService;

    @Operation(summary = "查询模型访问 key列表")
//    @PreAuthorize("@ss.hasPermi('model:modelKey:key:list')")
    @GetMapping("/list")
    public CommonResult<List<ModelKeyPageVO>> list(ModelKeyPageVO modelKey) {
        List<ModelKeyDO> page = modelKeyService.listByModel(modelKey);
        return CommonResult.success(BeanUtils.toBean(page, ModelKeyPageVO.class));
    }

    @Operation(summary = "新增模型访问 key")
//    @PreAuthorize("@ss.hasPermi('model:modelKey:key:add')")
    @Log(title = "模型访问 key", businessType = BusinessType.INSERT)
    @PostMapping
    public CommonResult<Long> add(@RequestBody ModelKeyPageVO modelKey) {
        return CommonResult.toAjax(modelKeyService.createModelKey(modelKey.getModelId()));
    }

    @Operation(summary = "删除模型访问 key")
//    @PreAuthorize("@ss.hasPermi('model:modelKey:key:remove')")
    @Log(title = "模型访问 key", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public CommonResult<Integer> remove(@PathVariable Long[] ids) {
        return CommonResult.toAjax(modelKeyService.removeModelKey(Arrays.asList(ids)));
    }

}
