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
