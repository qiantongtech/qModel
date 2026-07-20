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
