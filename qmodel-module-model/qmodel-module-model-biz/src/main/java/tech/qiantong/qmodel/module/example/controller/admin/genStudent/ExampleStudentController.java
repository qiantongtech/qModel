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

package tech.qiantong.qmodel.module.example.controller.admin.genStudent;

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
import tech.qiantong.qmodel.module.example.controller.admin.genStudent.vo.ExampleStudentPageReqVO;
import tech.qiantong.qmodel.module.example.controller.admin.genStudent.vo.ExampleStudentRespVO;
import tech.qiantong.qmodel.module.example.controller.admin.genStudent.vo.ExampleStudentSaveReqVO;
import tech.qiantong.qmodel.module.example.convert.genStudent.ExampleStudentConvert;
import tech.qiantong.qmodel.module.example.dal.dataobject.genStudent.ExampleStudentDO;
import tech.qiantong.qmodel.module.example.service.genStudent.IExampleStudentService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;

/**
 * 学生Controller
 *
 * @author anivia
 * @date 2025-02-18
 */
@Tag(name = "学生")
@RestController
@RequestMapping("/example/genStudent")
@Validated
public class ExampleStudentController extends BaseController {
    @Resource
    private IExampleStudentService exampleStudentService;

    @Operation(summary = "查询学生列表")
    @PreAuthorize("@ss.hasPermi('example:genStudent:genstudent:list')")
    @GetMapping("/list")
    public CommonResult<PageResult<ExampleStudentRespVO>> list(ExampleStudentPageReqVO exampleStudent) {
        PageResult<ExampleStudentDO> page = exampleStudentService.getExampleStudentPage(exampleStudent);
        return CommonResult.success(BeanUtils.toBean(page, ExampleStudentRespVO.class));
    }

    @Operation(summary = "导出学生列表")
    @PreAuthorize("@ss.hasPermi('example:genStudent:genstudent:export')")
    @Log(title = "学生", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ExampleStudentPageReqVO exportReqVO) {
        exportReqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<ExampleStudentDO> list = (List<ExampleStudentDO>) exampleStudentService.getExampleStudentPage(exportReqVO).getRows();
        ExcelUtil<ExampleStudentRespVO> util = new ExcelUtil<>(ExampleStudentRespVO.class);
        util.exportExcel(response, ExampleStudentConvert.INSTANCE.convertToRespVOList(list), "应用管理数据");
    }

    @Operation(summary = "导入学生列表")
    @PreAuthorize("@ss.hasPermi('example:genStudent:genstudent:import')")
    @Log(title = "学生", businessType = BusinessType.IMPORT)
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<ExampleStudentRespVO> util = new ExcelUtil<>(ExampleStudentRespVO.class);
        List<ExampleStudentRespVO> importExcelList = util.importExcel(file.getInputStream());
        String operName = getNickName();
        String message = exampleStudentService.importExampleStudent(importExcelList, updateSupport, operName);
        return success(message);
    }

    @Operation(summary = "获取学生详细信息")
    @PreAuthorize("@ss.hasPermi('example:genStudent:genstudent:query')")
    @GetMapping(value = "/{id}")
    public CommonResult<ExampleStudentRespVO> getInfo(@PathVariable("id") Long id) {
        ExampleStudentDO exampleStudentDO = exampleStudentService.getExampleStudentById(id);
        return CommonResult.success(BeanUtils.toBean(exampleStudentDO, ExampleStudentRespVO.class));
    }

    @Operation(summary = "新增学生")
    @PreAuthorize("@ss.hasPermi('example:genStudent:genstudent:add')")
    @Log(title = "学生", businessType = BusinessType.INSERT)
    @PostMapping
    public CommonResult<Long> add(@Valid @RequestBody ExampleStudentSaveReqVO exampleStudent) {
        return CommonResult.toAjax(exampleStudentService.createExampleStudent(exampleStudent));
    }

    @Operation(summary = "修改学生")
    @PreAuthorize("@ss.hasPermi('example:genStudent:genstudent:edit')")
    @Log(title = "学生", businessType = BusinessType.UPDATE)
    @PutMapping
    public CommonResult<Integer> edit(@Valid @RequestBody ExampleStudentSaveReqVO exampleStudent) {
        return CommonResult.toAjax(exampleStudentService.updateExampleStudent(exampleStudent));
    }

    @Operation(summary = "删除学生")
    @PreAuthorize("@ss.hasPermi('example:genStudent:genstudent:remove')")
    @Log(title = "学生", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public CommonResult<Integer> remove(@PathVariable Long[] ids) {
        return CommonResult.toAjax(exampleStudentService.removeExampleStudent(Arrays.asList(ids)));
    }

}
