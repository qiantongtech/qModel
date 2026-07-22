/*
 * Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
 *  *
 * This file is part of qModel Module Platform (Open Source Edition).
 *  *
 * qModel is licensed under Apache License 2.0 with additional qModel terms.
 * You may use qModel for commercial purposes, but you may not remove, hide,
 * modify, or replace the qModel logo, copyright notices, license notices,
 * or attribution information without a separate commercial license.
 *  *
 * White-label use, OEM distribution, rebranding, or presenting qModel as
 * another product requires separate commercial authorization from
 * Jiangsu Qiantong Technology Co., Ltd.
 *  *
 * Business License: `https://qmodel.tech/`
 * See the LICENSE file in the project root for full license information.
 */

package tech.qiantong.qmodel.module.model.controller.admin.invokeHistory;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Objects;

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
import tech.qiantong.qmodel.common.exception.enums.GlobalErrorCodeConstants;
import tech.qiantong.qmodel.module.model.controller.admin.invokeHistory.vo.ModelInvokeHistoryPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.invokeHistory.vo.ModelInvokeHistoryRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.invokeHistory.vo.ModelInvokeHistorySaveReqVO;
import tech.qiantong.qmodel.module.model.convert.invokeHistory.ModelInvokeHistoryConvert;
import tech.qiantong.qmodel.module.model.dal.dataobject.invokeHistory.ModelInvokeHistoryDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.model.ModelDO;
import tech.qiantong.qmodel.module.model.service.invokeHistory.IModelInvokeHistoryService;
import tech.qiantong.qmodel.module.model.service.model.IModelService;

/**
 * 模型调用历史记录Controller
 *
 * @author qmodel
 * @date 2026-07-14
 */
@Tag(name = "模型调用历史记录")
@RestController
@RequestMapping("/model/modelInvokeHistory")
@Validated
public class ModelInvokeHistoryController extends BaseController {
    @Resource
    private IModelInvokeHistoryService modelInvokeHistoryService;
    @Resource
    private IModelService modelService;

    @Operation(summary = "查询模型调用历史记录列表")
    @PreAuthorize("@ss.hasPermi('model:invokeHistory:invokehistory:list')")
    @GetMapping("/list")
    public CommonResult<PageResult<ModelInvokeHistoryRespVO>> list(ModelInvokeHistoryPageReqVO modelInvokeHistory) {
        PageResult<ModelInvokeHistoryDO> page = modelInvokeHistoryService.getModelInvokeHistoryPage(modelInvokeHistory);
        Map<Long, ModelDO> modelMap = modelService.getModelMap();
        PageResult<ModelInvokeHistoryRespVO> result = BeanUtils.toBean(page, ModelInvokeHistoryRespVO.class, vo -> {
            ModelDO modelDO = modelMap.get(vo.getModelId());
            if (Objects.isNull(modelDO)) {
                return;
            }
            vo.setCode(modelDO.getCode());
            vo.setVersion(modelDO.getVersion());
        });
        return CommonResult.success(result);
    }

    @Operation(summary = "导出模型调用历史记录列表")
    @PreAuthorize("@ss.hasPermi('model:invokeHistory:invokehistory:export')")
    @Log(title = "模型调用历史记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelInvokeHistoryPageReqVO exportReqVO) {
        exportReqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<ModelInvokeHistoryDO> list = (List<ModelInvokeHistoryDO>) modelInvokeHistoryService.getModelInvokeHistoryPage(exportReqVO).getRows();
        ExcelUtil<ModelInvokeHistoryRespVO> util = new ExcelUtil<>(ModelInvokeHistoryRespVO.class);
        util.exportExcel(response, ModelInvokeHistoryConvert.INSTANCE.convertToRespVOList(list), "应用管理数据");
    }

    @Operation(summary = "导入模型调用历史记录列表")
    @PreAuthorize("@ss.hasPermi('model:invokeHistory:invokehistory:import')")
    @Log(title = "模型调用历史记录", businessType = BusinessType.IMPORT)
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<ModelInvokeHistoryRespVO> util = new ExcelUtil<>(ModelInvokeHistoryRespVO.class);
        List<ModelInvokeHistoryRespVO> importExcelList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = modelInvokeHistoryService.importModelInvokeHistory(importExcelList, updateSupport, operName);
        return success(message);
    }

    @Operation(summary = "获取模型调用历史记录详细信息")
    @PreAuthorize("@ss.hasPermi('model:invokeHistory:invokehistory:query')")
    @GetMapping(value = "/{id}")
    public CommonResult<ModelInvokeHistoryRespVO> getInfo(@PathVariable("id") Long id) {
        ModelInvokeHistoryDO modelInvokeHistoryDO = modelInvokeHistoryService.getModelInvokeHistoryById(id);
        return CommonResult.success(BeanUtils.toBean(modelInvokeHistoryDO, ModelInvokeHistoryRespVO.class));
    }

    @Operation(summary = "新增模型调用历史记录")
    @PreAuthorize("@ss.hasPermi('model:invokeHistory:invokehistory:add')")
    @Log(title = "模型调用历史记录", businessType = BusinessType.INSERT)
    @PostMapping
    public CommonResult<Long> add(@Valid @RequestBody ModelInvokeHistorySaveReqVO modelInvokeHistory) {
        return CommonResult.toAjax(modelInvokeHistoryService.createModelInvokeHistory(modelInvokeHistory));
    }

    @Operation(summary = "修改模型调用历史记录")
    @PreAuthorize("@ss.hasPermi('model:invokeHistory:invokehistory:edit')")
    @Log(title = "模型调用历史记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public CommonResult<Integer> edit(@Valid @RequestBody ModelInvokeHistorySaveReqVO modelInvokeHistory) {
        return CommonResult.toAjax(modelInvokeHistoryService.updateModelInvokeHistory(modelInvokeHistory));
    }

    @Operation(summary = "删除模型调用历史记录")
    @PreAuthorize("@ss.hasPermi('model:invokeHistory:invokehistory:remove')")
    @Log(title = "模型调用历史记录", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public CommonResult<Integer> remove(@PathVariable Long[] ids) {
        return CommonResult.toAjax(modelInvokeHistoryService.removeModelInvokeHistory(Arrays.asList(ids)));
    }

}
