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

package tech.qiantong.qmodel.module.model.controller.admin.calc;

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
import tech.qiantong.qmodel.common.core.domain.model.LoginUser;
import tech.qiantong.qmodel.common.core.page.PageParam;
import tech.qiantong.qmodel.common.core.domain.AjaxResult;
import tech.qiantong.qmodel.common.annotation.Log;
import tech.qiantong.qmodel.common.core.controller.BaseController;
import tech.qiantong.qmodel.common.core.domain.CommonResult;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.enums.BusinessType;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.common.utils.poi.ExcelUtil;
import tech.qiantong.qmodel.module.model.controller.admin.calc.vo.ModelCalcPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.calc.vo.ModelCalcRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.calc.vo.ModelCalcSaveReqVO;
import tech.qiantong.qmodel.module.model.convert.calc.ModelCalcConvert;
import tech.qiantong.qmodel.module.model.dal.dataobject.calc.ModelCalcDO;
import tech.qiantong.qmodel.module.model.service.calc.IModelCalcService;
import tech.qiantong.qmodel.module.model.service.calc.dto.CalcExecuteResultDTO;
import tech.qiantong.qmodel.module.model.service.calc.dto.CalcQueueStatusDTO;
import tech.qiantong.qmodel.module.model.service.calc.dto.QueueTask;
import tech.qiantong.qmodel.module.model.service.model.IModelService;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelRespVO;
import tech.qiantong.qmodel.common.exception.ServiceException;

/**
 * 模型计算任务Controller
 *
 * @author qModel
 * @date 2026-07-27
 */
@Tag(name = "模型计算任务")
@RestController
@RequestMapping("/model/calc")
@Validated
public class ModelCalcController extends BaseController {
    @Resource
    private IModelCalcService modelCalcService;

    @Resource
    private IModelService modelService;

    @Operation(summary = "查询模型计算任务列表")
    @PreAuthorize("@ss.hasPermi('model:calc:calc:list')")
    @GetMapping("/list")
    public CommonResult<PageResult<ModelCalcRespVO>> list(ModelCalcPageReqVO modelCalc) {
        PageResult<ModelCalcDO> page = modelCalcService.getModelCalcPage(modelCalc);
        return CommonResult.success(BeanUtils.toBean(page, ModelCalcRespVO.class));
    }

    @Operation(summary = "导出模型计算任务列表")
    @PreAuthorize("@ss.hasPermi('model:calc:calc:export')")
    @Log(title = "模型计算任务", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelCalcPageReqVO exportReqVO) {
        exportReqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<ModelCalcDO> list = (List<ModelCalcDO>) modelCalcService.getModelCalcPage(exportReqVO).getRows();
        ExcelUtil<ModelCalcRespVO> util = new ExcelUtil<>(ModelCalcRespVO.class);
        util.exportExcel(response, ModelCalcConvert.INSTANCE.convertToRespVOList(list), "应用管理数据");
    }

    @Operation(summary = "导入模型计算任务列表")
    @PreAuthorize("@ss.hasPermi('model:calc:calc:import')")
    @Log(title = "模型计算任务", businessType = BusinessType.IMPORT)
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<ModelCalcRespVO> util = new ExcelUtil<>(ModelCalcRespVO.class);
        List<ModelCalcRespVO> importExcelList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = modelCalcService.importModelCalc(importExcelList, updateSupport, operName);
        return success(message);
    }

    @Operation(summary = "获取模型计算任务详细信息")
    @PreAuthorize("@ss.hasPermi('model:calc:calc:query')")
    @GetMapping(value = "/{id}")
    public CommonResult<ModelCalcRespVO> getInfo(@PathVariable("id") Long id) {
        ModelCalcDO modelCalcDO = modelCalcService.getModelCalcById(id);
        return CommonResult.success(BeanUtils.toBean(modelCalcDO, ModelCalcRespVO.class));
    }

    @Operation(summary = "新增模型计算任务")
    @PreAuthorize("@ss.hasPermi('model:calc:calc:add')")
    @Log(title = "模型计算任务", businessType = BusinessType.INSERT)
    @PostMapping
    public CommonResult<Long> add(@Valid @RequestBody ModelCalcSaveReqVO modelCalc) {
        return CommonResult.toAjax(modelCalcService.createModelCalc(modelCalc,getLoginUser()));
    }

    @Operation(summary = "修改模型计算任务")
    @PreAuthorize("@ss.hasPermi('model:calc:calc:edit')")
    @Log(title = "模型计算任务", businessType = BusinessType.UPDATE)
    @PutMapping
    public CommonResult<Integer> edit(@Valid @RequestBody ModelCalcSaveReqVO modelCalc) {
        return CommonResult.toAjax(modelCalcService.updateModelCalc(modelCalc,getLoginUser()));
    }

    @Operation(summary = "删除模型计算任务")
    @PreAuthorize("@ss.hasPermi('model:calc:calc:remove')")
    @Log(title = "模型计算任务", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public CommonResult<Integer> remove(@PathVariable Long[] ids) {
        return CommonResult.toAjax(modelCalcService.removeModelCalc(Arrays.asList(ids)));
    }

    @Operation(summary = "提交计算任务", description = "将计算任务加入优先级队列，异步执行")
    @PreAuthorize("@ss.hasPermi('model:calc:calc:edit')")
    @Log(title = "提交计算任务", businessType = BusinessType.OTHER)
    @PostMapping("/execute")
    public CommonResult<CalcExecuteResultDTO> execute(@RequestParam Long id) {
        ModelCalcDO calcDO = modelCalcService.getModelCalcById(id);
        if (calcDO == null) {
            throw new ServiceException("计算任务不存在");
        }
        ModelRespVO modelInfo = modelService.getModelById(calcDO.getModelId());
        if (modelInfo == null || !"5".equals(String.valueOf(modelInfo.getStatus()))) {
            throw new ServiceException("模型已下线");
        }
        return CommonResult.success(modelCalcService.executeCalc(id));
    }

    @Operation(summary = "终止计算任务", description = "按任务ID终止当前排队中或运行中的任务")
    @PreAuthorize("@ss.hasPermi('model:calc:calc:edit')")
    @Log(title = "终止计算任务", businessType = BusinessType.OTHER)
    @PostMapping("/cancel")
    public CommonResult<Boolean> cancel(@RequestParam Long id) {
        return CommonResult.success(modelCalcService.cancelCalcByCalcId(id));
    }

    @Operation(summary = "取消排队任务", description = "取消排队中的任务（按执行批次号）")
    @PreAuthorize("@ss.hasPermi('model:calc:calc:edit')")
    @Log(title = "取消计算任务", businessType = BusinessType.OTHER)
    @PostMapping("/queue/cancel")
    public CommonResult<Boolean> cancelQueueTask(@RequestParam String executionNo) {
        return CommonResult.success(modelCalcService.cancelCalc(executionNo));
    }

    @Operation(summary = "获取队列大小", description = "获取等待中、运行中、死信队列的任务数量")
    @PreAuthorize("@ss.hasPermi('model:calc:calc:query')")
    @GetMapping("/queue/size")
    public CommonResult<CalcQueueStatusDTO> getQueueSize() {
        return CommonResult.success(modelCalcService.getQueueStatus());
    }

    @Operation(summary = "获取队列任务列表", description = "获取等待执行的任务列表")
    @PreAuthorize("@ss.hasPermi('model:calc:calc:query')")
    @GetMapping("/queue/list")
    public CommonResult<List<QueueTask>> listQueueTasks() {
        return CommonResult.success(modelCalcService.listWaitingTasks());
    }

}
