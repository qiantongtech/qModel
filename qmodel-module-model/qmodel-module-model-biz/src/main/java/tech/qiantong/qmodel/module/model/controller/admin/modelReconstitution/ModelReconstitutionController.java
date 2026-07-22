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

package tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.core.util.ZipUtil;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import tech.qiantong.qmodel.common.annotation.Log;
import tech.qiantong.qmodel.common.config.AniviaConfig;
import tech.qiantong.qmodel.common.constant.Constants;
import tech.qiantong.qmodel.common.core.controller.BaseController;
import tech.qiantong.qmodel.common.core.domain.AjaxResult;
import tech.qiantong.qmodel.common.core.domain.CommonResult;
import tech.qiantong.qmodel.common.core.page.PageParam;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.enums.BusinessType;
import tech.qiantong.qmodel.common.utils.DateUtils;
import tech.qiantong.qmodel.common.utils.StringUtils;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.common.utils.poi.ExcelUtil;
import tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.vo.ModelReconstitutionPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.vo.ModelReconstitutionRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.vo.ModelReconstitutionSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.version.vo.ModelVersionSaveReqVO;
import tech.qiantong.qmodel.module.model.convert.modelReconstitution.ModelReconstitutionConvert;
import tech.qiantong.qmodel.module.model.dal.dataobject.classify.ModelClassifyDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.modelReconstitution.ModelReconstitutionDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.version.ModelVersionDO;
import tech.qiantong.qmodel.module.model.service.classify.IModelClassifyService;
import tech.qiantong.qmodel.module.model.service.history.IModelHistoryService;
import tech.qiantong.qmodel.module.model.service.modelReconstitution.IModelReconstitutionService;
import tech.qiantong.qmodel.module.model.service.version.IModelVersionService;
import tech.qiantong.qmodel.module.model.dal.dataobject.modelReconstitution.FileItemDO;
import tech.qiantong.qmodel.module.modelReconstitution.domain.ModelReconstitution;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.File;
import java.util.*;

/**
 * 模型库重构Controller
 *
 * @author qModel
 * @date 2026-01-12
 */
@Tag(name = "模型库重构")
@RestController
@RequestMapping("/model/modelReconstitution")
@Validated
public class ModelReconstitutionController extends BaseController {
    @Resource
    private IModelReconstitutionService modelReconstitutionService;

    @Resource
    private IModelClassifyService modelClassifyService;

    @Resource
    private IModelVersionService modelVersionService;

    @Resource
    private IModelHistoryService modelHistoryService;

    @Operation(summary = "查询模型库重构列表")
    @PreAuthorize("@ss.hasPermi('model:modelReconstitution:reconstitution:list')")
    @GetMapping("/list")
    public CommonResult<PageResult<ModelReconstitutionRespVO>> list(ModelReconstitutionPageReqVO modelReconstitution) {
        PageResult<ModelReconstitutionDO> page = modelReconstitutionService.getModelReconstitutionPage(modelReconstitution);
        return CommonResult.success(BeanUtils.toBean(page, ModelReconstitutionRespVO.class));
    }

    @Operation(summary = "导出模型库重构列表")
    @PreAuthorize("@ss.hasPermi('model:modelReconstitution:reconstitution:export')")
    @Log(title = "模型库重构", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelReconstitutionPageReqVO exportReqVO) {
        exportReqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<ModelReconstitutionDO> list = (List<ModelReconstitutionDO>) modelReconstitutionService.getModelReconstitutionPage(exportReqVO).getRows();
        ExcelUtil<ModelReconstitutionRespVO> util = new ExcelUtil<>(ModelReconstitutionRespVO.class);
        util.exportExcel(response, ModelReconstitutionConvert.INSTANCE.convertToRespVOList(list), "应用管理数据");
    }

    @Operation(summary = "导入模型库重构列表")
    @PreAuthorize("@ss.hasPermi('model:modelReconstitution:reconstitution:import')")
    @Log(title = "模型库重构", businessType = BusinessType.IMPORT)
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<ModelReconstitutionRespVO> util = new ExcelUtil<>(ModelReconstitutionRespVO.class);
        List<ModelReconstitutionRespVO> importExcelList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = modelReconstitutionService.importModelReconstitution(importExcelList, updateSupport, operName);
        return success(message);
    }

    @Operation(summary = "获取模型库重构详细信息")
    @PreAuthorize("@ss.hasPermi('model:modelReconstitution:reconstitution:query')")
    @GetMapping(value = "/{id}")
    public CommonResult<ModelReconstitutionRespVO> getInfo(@PathVariable("id") Long id) {
        ModelReconstitutionDO modelReconstitutionDO = modelReconstitutionService.getModelReconstitutionById(id);
        if (modelReconstitutionDO.getVersionId() != null) {
            ModelVersionDO version = modelVersionService.getModelVersionById(modelReconstitutionDO.getVersionId());
            modelReconstitutionDO.setVersion(version.getVersion());
            modelReconstitutionDO.setDescription(version.getDescription());
            modelReconstitutionDO.setRunnableFileAddress(version.getRunnableFileAddress());
        }
        ModelClassifyDO modelClassify = modelClassifyService.getModelClassifyById(modelReconstitutionDO.getClassifyId());
        modelReconstitutionDO.setClassifyName(modelClassify.getName());
        return CommonResult.success(BeanUtils.toBean(modelReconstitutionDO, ModelReconstitutionRespVO.class));
    }

    @Operation(summary = "新增模型库")
    @PreAuthorize("@ss.hasPermi('model:modelReconstitution:reconstitution:add')")
    @Log(title = "模型库重构", businessType = BusinessType.INSERT)
    @PostMapping
    public CommonResult<Long> add(@Valid @RequestBody ModelReconstitutionSaveReqVO model) {
        // 创建模型版本并设置属性
        Long versionId = modelVersionService.createModelVersionWithAttributes(model, getUserId(), getNickName());
        model.setVersionId(versionId);
        Long modelReconstitution = modelReconstitutionService.createModelReconstitution(model);
        // 添加操作历史
        modelHistoryService.createModelHistory(model.getId(), model.getName(), "新增了"+model.getName(), model.getVersion(), getUserId(), getNickName());
        return CommonResult.toAjax(modelReconstitution);
    }

    @Operation(summary = "修改模型库重构")
    @PreAuthorize("@ss.hasPermi('model:modelReconstitution:reconstitution:edit')")
    @Log(title = "模型库重构", businessType = BusinessType.UPDATE)
    @PutMapping
    public CommonResult<Integer> edit(@Valid @RequestBody ModelReconstitutionSaveReqVO modelReconstitution) {
        ModelReconstitution modelReconstitutionInfo = modelReconstitutionService.selectModelReconstitutionById(modelReconstitution.getId());
        if (modelReconstitutionInfo != null) {
            modelHistoryService.createModelHistory(modelReconstitution.getId(), modelReconstitution.getName(), "修改了" + modelReconstitution.getName() + "基本信息", modelReconstitution.getVersion(), getUserId(), getNickName());
        }
        if (modelReconstitution.getWhetherPublish() != null) {
            modelReconstitution.setPublishTime(DateUtils.getNowDate());
        }

        return CommonResult.toAjax(modelReconstitutionService.updateModelReconstitution(modelReconstitution));
    }

    @Operation(summary = "删除模型库重构")
    @PreAuthorize("@ss.hasPermi('model:modelReconstitution:reconstitution:remove')")
    @Log(title = "模型库重构", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public CommonResult<Integer> remove(@PathVariable Long[] ids) {
        return CommonResult.toAjax(modelReconstitutionService.removeModelReconstitution(Arrays.asList(ids)));
    }

    @PostMapping("/getFileList")
    public AjaxResult getFileList(@RequestBody String filePath) {
        return AjaxResult.success(modelReconstitutionService.getFileList(filePath));
    }

}
