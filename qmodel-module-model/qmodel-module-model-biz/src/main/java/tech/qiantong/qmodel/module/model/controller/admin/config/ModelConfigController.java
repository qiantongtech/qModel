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

package tech.qiantong.qmodel.module.model.controller.admin.config;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import tech.qiantong.qmodel.common.core.page.PageParam;
import tech.qiantong.qmodel.common.core.domain.AjaxResult;
import tech.qiantong.qmodel.common.annotation.Log;
import tech.qiantong.qmodel.common.core.controller.BaseController;
import tech.qiantong.qmodel.common.core.domain.CommonResult;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.enums.BusinessType;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.common.utils.poi.ExcelUtil;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigTestReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigTestRespVO;
import tech.qiantong.qmodel.module.model.convert.config.ModelConfigConvert;
import tech.qiantong.qmodel.module.model.dal.dataobject.config.ModelConfigDO;
import tech.qiantong.qmodel.module.model.service.config.IModelConfigService;

/**
 * 模型配置详情Controller
 *
 * @author anivia
 * @date 2026-07-07
 */
@Tag(name = "模型配置详情")
@RestController
@RequestMapping("/model/config")
@Validated
public class ModelConfigController extends BaseController {
    @Resource
    private IModelConfigService modelConfigService;

    @Operation(summary = "查询模型配置详情列表")
    @PreAuthorize("@ss.hasPermi('model:config:config:list')")
    @GetMapping("/list")
    public CommonResult<PageResult<ModelConfigRespVO>> list(ModelConfigPageReqVO modelConfig) {
        PageResult<ModelConfigDO> page = modelConfigService.getModelConfigPage(modelConfig);
        return CommonResult.success(BeanUtils.toBean(page, ModelConfigRespVO.class));
    }

    @Operation(summary = "导出模型配置详情列表")
    @PreAuthorize("@ss.hasPermi('model:config:config:export')")
    @Log(title = "模型配置详情", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelConfigPageReqVO exportReqVO) {
        exportReqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<ModelConfigDO> list = (List<ModelConfigDO>) modelConfigService.getModelConfigPage(exportReqVO).getRows();
        ExcelUtil<ModelConfigRespVO> util = new ExcelUtil<>(ModelConfigRespVO.class);
        util.exportExcel(response, ModelConfigConvert.INSTANCE.convertToRespVOList(list), "应用管理数据");
    }

    @Operation(summary = "导入模型配置详情列表")
    @PreAuthorize("@ss.hasPermi('model:config:config:import')")
    @Log(title = "模型配置详情", businessType = BusinessType.IMPORT)
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<ModelConfigRespVO> util = new ExcelUtil<>(ModelConfigRespVO.class);
        List<ModelConfigRespVO> importExcelList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = modelConfigService.importModelConfig(importExcelList, updateSupport, operName);
        return success(message);
    }

    @Operation(summary = "获取模型配置详情详细信息")
    @PreAuthorize("@ss.hasPermi('model:config:config:query')")
    @GetMapping(value = "/{id}")
    public CommonResult<ModelConfigRespVO> getInfo(@PathVariable("id") Long id) {
        ModelConfigDO modelConfigDO = modelConfigService.getModelConfigById(id);
        return CommonResult.success(BeanUtils.toBean(modelConfigDO, ModelConfigRespVO.class));
    }

    @Operation(summary = "测试模型配置接口调用")
    @PreAuthorize("@ss.hasPermi('model:config:config:query')")
    @PostMapping("/test")
    public CommonResult<ModelConfigTestRespVO> test(@Valid @RequestBody ModelConfigTestReqVO testReqVO) {
        return CommonResult.success(modelConfigService.testModelConfig(testReqVO));
    }

    @Operation(summary = "新增模型配置详情")
    @PreAuthorize("@ss.hasPermi('model:config:config:add')")
    @Log(title = "模型配置详情", businessType = BusinessType.INSERT)
    @PostMapping
    public CommonResult<Long> add(@Valid @RequestBody ModelConfigSaveReqVO modelConfig) {
        return CommonResult.toAjax(modelConfigService.createModelConfig(modelConfig));
    }

    @Operation(summary = "修改模型配置详情")
    @PreAuthorize("@ss.hasPermi('model:config:config:edit')")
    @Log(title = "模型配置详情", businessType = BusinessType.UPDATE)
    @PutMapping
    public CommonResult<Integer> edit(@Valid @RequestBody ModelConfigSaveReqVO modelConfig) {
        return CommonResult.toAjax(modelConfigService.updateModelConfig(modelConfig));
    }

    @Operation(summary = "删除模型配置详情")
    @PreAuthorize("@ss.hasPermi('model:config:config:remove')")
    @Log(title = "模型配置详情", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public CommonResult<Integer> remove(@PathVariable Long[] ids) {
        return CommonResult.toAjax(modelConfigService.removeModelConfig(Arrays.asList(ids)));
    }

}
