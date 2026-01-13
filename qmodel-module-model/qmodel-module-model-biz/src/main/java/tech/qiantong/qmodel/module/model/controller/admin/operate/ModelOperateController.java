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

package tech.qiantong.qmodel.module.model.controller.admin.operate;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.security.access.prepost.PreAuthorize;
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
import tech.qiantong.qmodel.module.model.controller.admin.operate.vo.ModelOperatePageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.operate.vo.ModelOperateRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.operate.vo.ModelOperateSaveReqVO;
import tech.qiantong.qmodel.module.model.convert.operate.ModelOperateConvert;
import tech.qiantong.qmodel.module.model.dal.dataobject.operate.ModelOperateDO;
import tech.qiantong.qmodel.module.model.service.operate.IModelOperateService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;

/**
 * 模型历史管理Controller
 *
 * @author qModel
 * @date 2026-01-09
 */
@Tag(name = "模型历史管理")
@RestController
@RequestMapping("/model/operate")
@Validated
public class ModelOperateController extends BaseController {
    @Resource
    private IModelOperateService modelOperateService;

    @Operation(summary = "查询模型历史管理列表")
    @PreAuthorize("@ss.hasPermi('model:operate:operate:list')")
    @GetMapping("/list")
    public CommonResult<PageResult<ModelOperateRespVO>> list(ModelOperatePageReqVO modelOperate) {
        PageResult<ModelOperateDO> page = modelOperateService.getModelOperatePage(modelOperate);
        return CommonResult.success(BeanUtils.toBean(page, ModelOperateRespVO.class));
    }

    @Operation(summary = "导出模型历史管理列表")
    @PreAuthorize("@ss.hasPermi('model:operate:operate:export')")
    @Log(title = "模型历史管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelOperatePageReqVO exportReqVO) {
        exportReqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<ModelOperateDO> list = (List<ModelOperateDO>) modelOperateService.getModelOperatePage(exportReqVO).getRows();
        ExcelUtil<ModelOperateRespVO> util = new ExcelUtil<>(ModelOperateRespVO.class);
        util.exportExcel(response, ModelOperateConvert.INSTANCE.convertToRespVOList(list), "应用管理数据");
    }

    @Operation(summary = "导入模型历史管理列表")
    @PreAuthorize("@ss.hasPermi('model:operate:operate:import')")
    @Log(title = "模型历史管理", businessType = BusinessType.IMPORT)
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<ModelOperateRespVO> util = new ExcelUtil<>(ModelOperateRespVO.class);
        List<ModelOperateRespVO> importExcelList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = modelOperateService.importModelOperate(importExcelList, updateSupport, operName);
        return success(message);
    }

    @Operation(summary = "获取模型历史管理详细信息")
    @PreAuthorize("@ss.hasPermi('model:operate:operate:query')")
    @GetMapping(value = "/{id}")
    public CommonResult<ModelOperateRespVO> getInfo(@PathVariable("id") Long id) {
        ModelOperateDO modelOperateDO = modelOperateService.getModelOperateById(id);
        return CommonResult.success(BeanUtils.toBean(modelOperateDO, ModelOperateRespVO.class));
    }

    @Operation(summary = "新增模型历史管理")
    @PreAuthorize("@ss.hasPermi('model:operate:operate:add')")
    @Log(title = "模型历史管理", businessType = BusinessType.INSERT)
    @PostMapping
    public CommonResult<Long> add(@Valid @RequestBody ModelOperateSaveReqVO modelOperate) {
        return CommonResult.toAjax(modelOperateService.createModelOperate(modelOperate));
    }

    @Operation(summary = "修改模型历史管理")
    @PreAuthorize("@ss.hasPermi('model:operate:operate:edit')")
    @Log(title = "模型历史管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public CommonResult<Integer> edit(@Valid @RequestBody ModelOperateSaveReqVO modelOperate) {
        return CommonResult.toAjax(modelOperateService.updateModelOperate(modelOperate));
    }

    @Operation(summary = "删除模型历史管理")
    @PreAuthorize("@ss.hasPermi('model:operate:operate:remove')")
    @Log(title = "模型历史管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public CommonResult<Integer> remove(@PathVariable Long[] ids) {
        return CommonResult.toAjax(modelOperateService.removeModelOperate(Arrays.asList(ids)));
    }

}
