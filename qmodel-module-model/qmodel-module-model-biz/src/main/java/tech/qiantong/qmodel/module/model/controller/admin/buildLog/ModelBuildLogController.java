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

package tech.qiantong.qmodel.module.model.controller.admin.buildLog;

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
import tech.qiantong.qmodel.module.model.controller.admin.buildLog.vo.ModelBuildLogPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.buildLog.vo.ModelBuildLogRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.buildLog.vo.ModelBuildLogSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.invokeHistory.vo.ModelInvokeHistoryRespVO;
import tech.qiantong.qmodel.module.model.convert.buildLog.ModelBuildLogConvert;
import tech.qiantong.qmodel.module.model.dal.dataobject.buildLog.ModelBuildLogDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.model.ModelDO;
import tech.qiantong.qmodel.module.model.service.buildLog.IModelBuildLogService;
import tech.qiantong.qmodel.module.model.service.model.IModelService;

/**
 * 构建日志Controller
 *
 * @author qModel
 * @date 2026-07-14
 */
@Tag(name = "构建日志")
@RestController
@RequestMapping("/model/modelBuildLog")
@Validated
public class ModelBuildLogController extends BaseController {
    @Resource
    private IModelBuildLogService modelBuildLogService;
    @Resource
    private IModelService modelService;

    @Operation(summary = "查询构建日志列表")
    @PreAuthorize("@ss.hasPermi('model:buildLog:buildlog:list')")
    @GetMapping("/list")
    public CommonResult<PageResult<ModelBuildLogRespVO>> list(ModelBuildLogPageReqVO modelBuildLog) {
        PageResult<ModelBuildLogDO> page = modelBuildLogService.getModelBuildLogPage(modelBuildLog);
        Map<Long, ModelDO> modelMap = modelService.getModelMap();
        PageResult<ModelBuildLogRespVO> result = BeanUtils.toBean(page, ModelBuildLogRespVO.class, vo -> {
            ModelDO modelDO = modelMap.get(vo.getModelId());
            if (Objects.isNull(modelDO)) {
                return;
            }
            vo.setCode(modelDO.getCode());
            vo.setVersion(modelDO.getVersion());
        });
        return CommonResult.success(result);
    }

    @Operation(summary = "导出构建日志列表")
    @PreAuthorize("@ss.hasPermi('model:buildLog:buildlog:export')")
    @Log(title = "构建日志", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelBuildLogPageReqVO exportReqVO) {
        exportReqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<ModelBuildLogDO> list = (List<ModelBuildLogDO>) modelBuildLogService.getModelBuildLogPage(exportReqVO).getRows();
        ExcelUtil<ModelBuildLogRespVO> util = new ExcelUtil<>(ModelBuildLogRespVO.class);
        util.exportExcel(response, ModelBuildLogConvert.INSTANCE.convertToRespVOList(list), "应用管理数据");
    }

    @Operation(summary = "导入构建日志列表")
    @PreAuthorize("@ss.hasPermi('model:buildLog:buildlog:import')")
    @Log(title = "构建日志", businessType = BusinessType.IMPORT)
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<ModelBuildLogRespVO> util = new ExcelUtil<>(ModelBuildLogRespVO.class);
        List<ModelBuildLogRespVO> importExcelList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = modelBuildLogService.importModelBuildLog(importExcelList, updateSupport, operName);
        return success(message);
    }

    @Operation(summary = "获取构建日志详细信息")
    @PreAuthorize("@ss.hasPermi('model:buildLog:buildlog:query')")
    @GetMapping(value = "/{id}")
    public CommonResult<ModelBuildLogRespVO> getInfo(@PathVariable("id") Long id) {
        ModelBuildLogDO modelBuildLogDO = modelBuildLogService.getModelBuildLogById(id);
        return CommonResult.success(BeanUtils.toBean(modelBuildLogDO, ModelBuildLogRespVO.class));
    }

    @Operation(summary = "新增构建日志")
    @PreAuthorize("@ss.hasPermi('model:buildLog:buildlog:add')")
    @Log(title = "构建日志", businessType = BusinessType.INSERT)
    @PostMapping
    public CommonResult<Long> add(@Valid @RequestBody ModelBuildLogSaveReqVO modelBuildLog) {
        return CommonResult.toAjax(modelBuildLogService.createModelBuildLog(modelBuildLog));
    }

    @Operation(summary = "修改构建日志")
    @PreAuthorize("@ss.hasPermi('model:buildLog:buildlog:edit')")
    @Log(title = "构建日志", businessType = BusinessType.UPDATE)
    @PutMapping
    public CommonResult<Integer> edit(@Valid @RequestBody ModelBuildLogSaveReqVO modelBuildLog) {
        return CommonResult.toAjax(modelBuildLogService.updateModelBuildLog(modelBuildLog));
    }

    @Operation(summary = "删除构建日志")
    @PreAuthorize("@ss.hasPermi('model:buildLog:buildlog:remove')")
    @Log(title = "构建日志", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public CommonResult<Integer> remove(@PathVariable Long[] ids) {
        return CommonResult.toAjax(modelBuildLogService.removeModelBuildLog(Arrays.asList(ids)));
    }

}
