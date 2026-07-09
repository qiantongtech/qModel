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
import org.springframework.http.MediaType;
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
    @PreAuthorize("@ss.hasPermi('model:fileResource:fileresource:add')")
    @GetMapping("/getBuildEnvInfo")
    public CommonResult<Map<String, Object>> getBuildEnvInfo(@RequestParam("filePath") String filePath) {
        return CommonResult.success(modelFileResourceService.getBuildEnvInfo(filePath));
    }

    @Operation(summary = "执行模型脚本")
    @PreAuthorize("@ss.hasPermi('model:fileResource:fileresource:add')")
    @PostMapping(value = "/runScript/{modelId}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public CommonResult<String> runScript(
            @PathVariable("modelId") Long modelId,
            @RequestParam(value = "params", required = false) String paramsJson,
            @RequestParam(value = "fileKeys", required = false) String fileKeys,
            @RequestParam(value = "files", required = false) List<MultipartFile> files) {
        return CommonResult.success(modelFileResourceService.runModelScript(modelId, paramsJson, fileKeys, files));
    }

}
