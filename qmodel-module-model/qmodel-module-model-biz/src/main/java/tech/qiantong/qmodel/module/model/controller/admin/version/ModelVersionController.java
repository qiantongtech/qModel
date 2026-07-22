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

package tech.qiantong.qmodel.module.model.controller.admin.version;

import com.alibaba.fastjson.JSONObject;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import tech.qiantong.qmodel.common.annotation.Log;
import tech.qiantong.qmodel.common.core.controller.BaseController;
import tech.qiantong.qmodel.common.core.domain.AjaxResult;
import tech.qiantong.qmodel.common.core.domain.CommonResult;
import tech.qiantong.qmodel.common.core.page.PageParam;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.enums.BusinessType;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.common.utils.poi.ExcelUtil;
import tech.qiantong.qmodel.module.model.controller.admin.version.vo.ModelVersionPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.version.vo.ModelVersionRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.version.vo.ModelVersionSaveReqVO;
import tech.qiantong.qmodel.module.model.convert.version.ModelVersionConvert;
import tech.qiantong.qmodel.module.model.dal.dataobject.version.ModelVersionDO;
import tech.qiantong.qmodel.module.model.service.history.IModelHistoryService;
import tech.qiantong.qmodel.module.model.service.modelReconstitution.IModelReconstitutionService;
import tech.qiantong.qmodel.module.model.service.operate.IModelOperateService;
import tech.qiantong.qmodel.module.model.service.version.IModelVersionService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;


/**
 * 版本管理Controller
 *
 * @author qModel
 * @date 2026-01-09
 */
@Tag(name = "版本管理")
@RestController
@RequestMapping("/model/version")
@Validated
public class ModelVersionController extends BaseController {
    @Resource
    private IModelVersionService modelVersionService;

    @Resource
    private IModelReconstitutionService modelReconstitutionService;

    @Resource
    private IModelHistoryService modelHistoryService;

    @Resource
    private IModelOperateService modelOperateService;

    @Operation(summary = "查询版本管理列表")
    @PreAuthorize("@ss.hasPermi('model:version:version:list')")
    @GetMapping("/list")
    public CommonResult<PageResult<ModelVersionRespVO>> list(ModelVersionPageReqVO modelVersion) {
        PageResult<ModelVersionDO> page = modelVersionService.getModelVersionPage(modelVersion);
        return CommonResult.success(BeanUtils.toBean(page, ModelVersionRespVO.class));
    }

    /**
     * 查询版本管理列表
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:version:list')")
    @GetMapping("/versionList")
    public CommonResult<List<ModelVersionRespVO>> getList(ModelVersionDO modelVersion) {
        modelVersion.setCompanyId(null);
        List<ModelVersionDO> list = modelVersionService.selectModelVersionList(modelVersion);
        return CommonResult.success(BeanUtils.toBean(list, ModelVersionRespVO.class));
    }

    @Operation(summary = "导出版本管理列表")
    @PreAuthorize("@ss.hasPermi('model:version:version:export')")
    @Log(title = "版本管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelVersionPageReqVO exportReqVO) {
        exportReqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<ModelVersionDO> list = (List<ModelVersionDO>) modelVersionService.getModelVersionPage(exportReqVO).getRows();
        ExcelUtil<ModelVersionRespVO> util = new ExcelUtil<>(ModelVersionRespVO.class);
        util.exportExcel(response, ModelVersionConvert.INSTANCE.convertToRespVOList(list), "应用管理数据");
    }

    @Operation(summary = "导入版本管理列表")
    @PreAuthorize("@ss.hasPermi('model:version:version:import')")
    @Log(title = "版本管理", businessType = BusinessType.IMPORT)
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<ModelVersionRespVO> util = new ExcelUtil<>(ModelVersionRespVO.class);
        List<ModelVersionRespVO> importExcelList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = modelVersionService.importModelVersion(importExcelList, updateSupport, operName);
        return success(message);
    }

    @Operation(summary = "获取版本管理详细信息")
    @PreAuthorize("@ss.hasPermi('model:version:version:query')")
    @GetMapping(value = "/{id}")
    public CommonResult<ModelVersionRespVO> getInfo(@PathVariable("id") Long id) {
        ModelVersionDO modelVersionDO = modelVersionService.getModelVersionById(id);
        return CommonResult.success(BeanUtils.toBean(modelVersionDO, ModelVersionRespVO.class));
    }

    @Operation(summary = "新增版本管理")
    @PreAuthorize("@ss.hasPermi('model:version:version:add')")
    @Log(title = "版本管理", businessType = BusinessType.INSERT)
    @PostMapping
    public CommonResult<Long> add(@Valid @RequestBody ModelVersionSaveReqVO modelVersion) {
        modelVersion.setStatus(0);
        modelHistoryService.createModelHistory(modelVersion.getModelId(), modelVersion.getModelName(), "新增了" + modelVersion.getModelName() + "一个版本", modelVersion.getVersion(), getUserId(), getNickName());
        return CommonResult.toAjax(modelVersionService.createModelVersion(modelVersion));
    }

    /**
     * 确保启动版本唯一
     */
    @GetMapping(value = "/mVList/{modelId}")
    public AjaxResult getMVList(@PathVariable("modelId") Long modelId) {
        ModelVersionDO modelVersion = new ModelVersionDO();
        modelVersion.setModelId(modelId);
        modelVersion.setCompanyId(null);
        modelVersion.setDelFlag( false);
        List<ModelVersionDO> list = modelVersionService.selectModelVersionList(modelVersion);
        for (ModelVersionDO mv : list) {
            if (mv.getStatus() == 1) {
                return AjaxResult.success(modelVersion);
            }
        }
        return null;
    }


    /**
     * 版本的切换
     */
    @PutMapping(value = "/handoff")
    @Transactional
    public AjaxResult handoffVersion(@RequestBody ModelVersionRespVO modelVersionRespVO) {
        return modelVersionService.handoffVersion(modelVersionRespVO, getUserId(), getNickName());
    }


    @Operation(summary = "修改版本管理")
    @PreAuthorize("@ss.hasPermi('model:version:version:edit')")
    @Log(title = "版本管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public CommonResult<Integer> edit(@Valid @RequestBody ModelVersionSaveReqVO modelVersion) {
        return CommonResult.toAjax(modelVersionService.updateModelVersionWithBusinessLogic(modelVersion, getUserId(), getNickName()));
    }

    @Operation(summary = "删除版本管理")
    @PreAuthorize("@ss.hasPermi('model:version:version:remove')")
    @Log(title = "版本管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public CommonResult<Integer> remove(@PathVariable("ids") Long[] ids) {
        if (ids != null) {
            for (Long id : ids) {
                ModelVersionDO modelVersion = modelVersionService.getModelVersionById(id);
                //历史操作记录插入
                modelHistoryService.createModelHistory(modelVersion.getModelId(), modelVersion.getModelName(), "删除了" + modelVersion.getModelName() + "【" + modelVersion.getVersion() + "】版本的内容", modelVersion.getVersion(), getUserId(), getNickName());
            }
        }
        return CommonResult.toAjax(modelVersionService.removeModelVersion(Arrays.asList(ids)));
    }

}
