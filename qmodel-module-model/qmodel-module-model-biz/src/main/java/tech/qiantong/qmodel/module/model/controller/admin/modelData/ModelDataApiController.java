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

package tech.qiantong.qmodel.module.model.controller.admin.modelData;

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
import tech.qiantong.qmodel.module.model.controller.admin.modelData.vo.ModelDataApiPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelData.vo.ModelDataApiRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelData.vo.ModelDataApiSaveReqVO;
import tech.qiantong.qmodel.module.model.convert.modelData.ModelDataApiConvert;
import tech.qiantong.qmodel.module.model.dal.dataobject.modelData.ModelDataApiDO;
import tech.qiantong.qmodel.module.model.service.modelData.IModelDataApiService;

/**
 * 模型数据API接入Controller
 *
 * @author qModel
 * @date 2026-08-19
 */
@Tag(name = "模型数据API接入")
@RestController
@RequestMapping("/model/modelDataApi")
@Validated
public class ModelDataApiController extends BaseController {
    @Resource
    private IModelDataApiService modelDataApiService;

    @Operation(summary = "查询模型数据API接入列表")
    @PreAuthorize("@ss.hasPermi('model:modelData:dataapi:list')")
    @GetMapping("/list")
    public CommonResult<PageResult<ModelDataApiRespVO>> list(ModelDataApiPageReqVO modelDataApi) {
        PageResult<ModelDataApiDO> page = modelDataApiService.getModelDataApiPage(modelDataApi);
        return CommonResult.success(BeanUtils.toBean(page, ModelDataApiRespVO.class));
    }

    @Operation(summary = "导出模型数据API接入列表")
    @PreAuthorize("@ss.hasPermi('model:modelData:dataapi:export')")
    @Log(title = "模型数据API接入", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelDataApiPageReqVO exportReqVO) {
        exportReqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<ModelDataApiDO> list = modelDataApiService.getModelDataApiPage(exportReqVO).getList();
        ExcelUtil<ModelDataApiRespVO> util = new ExcelUtil<>(ModelDataApiRespVO.class);
        util.exportExcel(response, ModelDataApiConvert.INSTANCE.convertToRespVOList(list), "应用管理数据");
    }

    @Operation(summary = "导入模型数据API接入列表")
    @PreAuthorize("@ss.hasPermi('model:modelData:dataapi:import')")
    @Log(title = "模型数据API接入", businessType = BusinessType.IMPORT)
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<ModelDataApiRespVO> util = new ExcelUtil<>(ModelDataApiRespVO.class);
        List<ModelDataApiRespVO> importExcelList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = modelDataApiService.importModelDataApi(importExcelList, updateSupport, operName);
        return AjaxResult.success(message);
    }

    @Operation(summary = "获取模型数据API接入详细信息")
    @PreAuthorize("@ss.hasPermi('model:modelData:dataapi:query')")
    @GetMapping(value = "/{id}")
    public CommonResult<ModelDataApiRespVO> getInfo(@PathVariable("id") Long id) {
        ModelDataApiDO modelDataApiDO = modelDataApiService.getModelDataApiById(id);
        return CommonResult.success(BeanUtils.toBean(modelDataApiDO, ModelDataApiRespVO.class));
    }

    @Operation(summary = "新增模型数据API接入")
    @PreAuthorize("@ss.hasPermi('model:modelData:dataapi:add')")
    @Log(title = "模型数据API接入", businessType = BusinessType.INSERT)
    @PostMapping
    public CommonResult<Long> add(@Valid @RequestBody ModelDataApiSaveReqVO modelDataApi) {
        return CommonResult.success(modelDataApiService.createModelDataApi(modelDataApi));
    }

    @Operation(summary = "修改模型数据API接入")
    @PreAuthorize("@ss.hasPermi('model:modelData:dataapi:edit')")
    @Log(title = "模型数据API接入", businessType = BusinessType.UPDATE)
    @PutMapping
    public CommonResult<Integer> edit(@Valid @RequestBody ModelDataApiSaveReqVO modelDataApi) {
        return CommonResult.success(modelDataApiService.updateModelDataApi(modelDataApi));
    }

    @Operation(summary = "删除模型数据API接入")
    @PreAuthorize("@ss.hasPermi('model:modelData:dataapi:remove')")
    @Log(title = "模型数据API接入", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public CommonResult<Integer> remove(@PathVariable Long[] ids) {
        return CommonResult.success(modelDataApiService.removeModelDataApi(Arrays.asList(ids)));
    }

}
