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

package tech.qiantong.qmodel.module.model.controller.admin.fileResource;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
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
import tech.qiantong.qmodel.module.model.controller.admin.fileResource.vo.ModelFileResourcePageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.fileResource.vo.ModelFileResourceRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.fileResource.vo.ModelFileResourceSaveReqVO;
import tech.qiantong.qmodel.module.model.convert.fileResource.ModelFileResourceConvert;
import tech.qiantong.qmodel.module.model.dal.dataobject.fileResource.ModelFileResourceDO;
import tech.qiantong.qmodel.module.model.service.fileResource.IModelFileResourceService;

/**
 * 模型文件部署Controller
 *
 * @author anivia
 * @date 2026-07-07
 */
@Tag(name = "模型文件部署")
@RestController
@RequestMapping("/model/modelFileResource")
@Validated
public class ModelFileResourceController extends BaseController {
    @Resource
    private IModelFileResourceService modelFileResourceService;

    @Operation(summary = "查询模型文件部署列表")
    @PreAuthorize("@ss.hasPermi('model:fileResource:fileresource:list')")
    @GetMapping("/list")
    public CommonResult<PageResult<ModelFileResourceRespVO>> list(ModelFileResourcePageReqVO modelFileResource) {
        PageResult<ModelFileResourceDO> page = modelFileResourceService.getModelFileResourcePage(modelFileResource);
        return CommonResult.success(BeanUtils.toBean(page, ModelFileResourceRespVO.class));
    }

    @Operation(summary = "导出模型文件部署列表")
    @PreAuthorize("@ss.hasPermi('model:fileResource:fileresource:export')")
    @Log(title = "模型文件部署", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelFileResourcePageReqVO exportReqVO) {
        exportReqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<ModelFileResourceDO> list = (List<ModelFileResourceDO>) modelFileResourceService.getModelFileResourcePage(exportReqVO).getRows();
        ExcelUtil<ModelFileResourceRespVO> util = new ExcelUtil<>(ModelFileResourceRespVO.class);
        util.exportExcel(response, ModelFileResourceConvert.INSTANCE.convertToRespVOList(list), "应用管理数据");
    }

    @Operation(summary = "导入模型文件部署列表")
    @PreAuthorize("@ss.hasPermi('model:fileResource:fileresource:import')")
    @Log(title = "模型文件部署", businessType = BusinessType.IMPORT)
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<ModelFileResourceRespVO> util = new ExcelUtil<>(ModelFileResourceRespVO.class);
        List<ModelFileResourceRespVO> importExcelList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = modelFileResourceService.importModelFileResource(importExcelList, updateSupport, operName);
        return success(message);
    }

    @Operation(summary = "获取模型文件部署详细信息")
    @PreAuthorize("@ss.hasPermi('model:fileResource:fileresource:query')")
    @GetMapping(value = "/{id}")
    public CommonResult<ModelFileResourceRespVO> getInfo(@PathVariable("id") Long id) {
        ModelFileResourceDO modelFileResourceDO = modelFileResourceService.getModelFileResourceById(id);
        return CommonResult.success(BeanUtils.toBean(modelFileResourceDO, ModelFileResourceRespVO.class));
    }

    @Operation(summary = "新增模型文件部署")
    @PreAuthorize("@ss.hasPermi('model:fileResource:fileresource:add')")
    @Log(title = "模型文件部署", businessType = BusinessType.INSERT)
    @PostMapping
    public CommonResult<Long> add(@Valid @RequestBody ModelFileResourceSaveReqVO modelFileResource) {
        return CommonResult.toAjax(modelFileResourceService.createModelFileResource(modelFileResource));
    }

    @Operation(summary = "修改模型文件部署")
    @PreAuthorize("@ss.hasPermi('model:fileResource:fileresource:edit')")
    @Log(title = "模型文件部署", businessType = BusinessType.UPDATE)
    @PutMapping
    public CommonResult<Integer> edit(@Valid @RequestBody ModelFileResourceSaveReqVO modelFileResource) {
        return CommonResult.toAjax(modelFileResourceService.updateModelFileResource(modelFileResource));
    }

    @Operation(summary = "删除模型文件部署")
    @PreAuthorize("@ss.hasPermi('model:fileResource:fileresource:remove')")
    @Log(title = "模型文件部署", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public CommonResult<Integer> remove(@PathVariable Long[] ids) {
        return CommonResult.toAjax(modelFileResourceService.removeModelFileResource(Arrays.asList(ids)));
    }

    @Operation(summary = "检测上传文件")
    @PreAuthorize("@ss.hasPermi('model:fileResource:fileresource:add')")
    @PostMapping("/checkUploadFile")
    public CommonResult<Map<String, Object>> checkUploadFile(@RequestParam("file") MultipartFile file) {
        return CommonResult.success(modelFileResourceService.checkZipFile(file));
    }

    @Operation(summary = "获取构建环境信息")
    @PreAuthorize("@ss.hasPermi('model:fileResource:fileresource:query')")
    @GetMapping("/getBuildEnvInfo")
    public CommonResult<Map<String, Object>> getBuildEnvInfo(@RequestParam("filePath") String filePath) {
        return CommonResult.success(modelFileResourceService.getBuildEnvInfo(filePath));
    }

    @Operation(summary = "执行模型脚本")
    @PreAuthorize("@ss.hasPermi('model:fileResource:fileresource:query')")
    @PostMapping("/runScript/{modelId}")
    public CommonResult<Object> runScript(@PathVariable("modelId") Long modelId, @RequestBody(required = false) Map<String, Object> inputParam) {
        return CommonResult.success(modelFileResourceService.runModelScript(modelId, inputParam));
    }

    @Operation(summary = "调用模型参数文件上传")
    @PreAuthorize("@ss.hasPermi('model:fileResource:fileresource:add')")
    @PostMapping("/uploadParamFile")
    public CommonResult<Map<String, Object>> uploadParamFile(
            @RequestParam("file") MultipartFile file,
            @RequestParam("modelId") Long modelId) {
        return CommonResult.success(modelFileResourceService.uploadParamFile(file, modelId));
    }


}
