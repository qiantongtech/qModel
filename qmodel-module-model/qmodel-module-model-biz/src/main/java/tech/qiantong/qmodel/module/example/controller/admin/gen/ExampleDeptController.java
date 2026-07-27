/*
 * Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
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

package tech.qiantong.qmodel.module.example.controller.admin.gen;

import cn.hutool.core.date.DateUtil;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import tech.qiantong.qmodel.common.annotation.Log;
import tech.qiantong.qmodel.common.core.controller.BaseController;
import tech.qiantong.qmodel.common.core.domain.CommonResult;
import tech.qiantong.qmodel.common.core.page.PageParam;
import tech.qiantong.qmodel.common.enums.BusinessType;
import tech.qiantong.qmodel.common.exception.enums.GlobalErrorCodeConstants;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.common.utils.poi.ExcelUtil;
import tech.qiantong.qmodel.module.example.controller.admin.gen.vo.ExampleDeptPageReqVO;
import tech.qiantong.qmodel.module.example.controller.admin.gen.vo.ExampleDeptRespVO;
import tech.qiantong.qmodel.module.example.controller.admin.gen.vo.ExampleDeptSaveReqVO;
import tech.qiantong.qmodel.module.example.convert.gen.ExampleDeptConvert;
import tech.qiantong.qmodel.module.example.dal.dataobject.gen.ExampleDeptDO;
import tech.qiantong.qmodel.module.example.service.gen.IExampleDeptService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.List;

/**
 * 示例部门Controller
 *
 * @author anivia
 * @date 2024-12-09
 */
@Tag(name = "示例部门")
@RestController
@RequestMapping("/example/dept")
@Validated
public class ExampleDeptController extends BaseController {
    @Resource
    private IExampleDeptService exampleDeptService;

    @Operation(summary = "查询示例部门列表")
    @PreAuthorize("@ss.hasPermi('example:gen:dept:list')")
    @GetMapping("/list")
    public CommonResult<List<ExampleDeptRespVO>> list(ExampleDeptPageReqVO exampleDept) {
        exampleDept.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<ExampleDeptDO> list = (List<ExampleDeptDO>) exampleDeptService.getExampleDeptPage(exampleDept).getRows();
        return CommonResult.success(BeanUtils.toBean(list, ExampleDeptRespVO.class));
    }

    @Operation(summary = "导出示例部门列表")
    @PreAuthorize("@ss.hasPermi('example:gen:dept:export')")
    @Log(title = "示例部门", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ExampleDeptPageReqVO exportReqVO) {
        exportReqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<ExampleDeptDO> list = (List<ExampleDeptDO>) exampleDeptService.getExampleDeptPage(exportReqVO).getRows();
        ExcelUtil<ExampleDeptRespVO> util = new ExcelUtil<>(ExampleDeptRespVO.class);
        util.exportExcel(response, ExampleDeptConvert.INSTANCE.convertToRespVOList(list), "应用管理数据");
    }

    @Operation(summary = "获取示例部门详细信息")
    @PreAuthorize("@ss.hasPermi('example:gen:dept:query')")
    @GetMapping(value = "/{id}")
    public CommonResult<ExampleDeptRespVO> getInfo(@PathVariable("id") Long id) {
        ExampleDeptDO exampleDeptDO = exampleDeptService.getExampleDeptById(id);
        return CommonResult.success(BeanUtils.toBean(exampleDeptDO, ExampleDeptRespVO.class));
    }

    @Operation(summary = "新增示例部门")
    @PreAuthorize("@ss.hasPermi('example:gen:dept:add')")
    @Log(title = "示例部门", businessType = BusinessType.INSERT)
    @PostMapping
    public CommonResult<Long> add(@Valid @RequestBody ExampleDeptSaveReqVO exampleDept) {
        exampleDept.setCreatorId(getUserId());
        exampleDept.setCreateBy(getNickName());
        exampleDept.setCreateTime(DateUtil.date());
        return CommonResult.toAjax(exampleDeptService.createExampleDept(exampleDept));
    }

    @Operation(summary = "修改示例部门")
    @PreAuthorize("@ss.hasPermi('example:gen:dept:edit')")
    @Log(title = "示例部门", businessType = BusinessType.UPDATE)
    @PutMapping
    public CommonResult<Integer> edit(@Valid @RequestBody ExampleDeptSaveReqVO exampleDept) {
        exampleDept.setUpdatorId(getUserId());
        exampleDept.setUpdateBy(getNickName());
        exampleDept.setUpdateTime(DateUtil.date());
        return CommonResult.toAjax(exampleDeptService.updateExampleDept(exampleDept));
    }

    @Operation(summary = "删除示例部门")
    @PreAuthorize("@ss.hasPermi('example:gen:dept:remove')")
    @Log(title = "示例部门", businessType = BusinessType.DELETE)
    @DeleteMapping("/{id}")
    public CommonResult<Integer> remove(@PathVariable Long id) {
        if (exampleDeptService.hasChildByExampleDeptId(id)) {
            return CommonResult.error(GlobalErrorCodeConstants.ERROR.getCode(),"存在子示例部门，无法删除。");
        }
        return CommonResult.toAjax(exampleDeptService.removeExampleDept(id));
    }

}
