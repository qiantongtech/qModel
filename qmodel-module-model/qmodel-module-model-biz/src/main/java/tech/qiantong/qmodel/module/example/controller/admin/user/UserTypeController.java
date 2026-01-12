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

package tech.qiantong.qmodel.module.example.controller.admin.user;

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
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.enums.BusinessType;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.common.utils.poi.ExcelUtil;
import tech.qiantong.qmodel.module.example.controller.admin.user.vo.UserTypePageReqVO;
import tech.qiantong.qmodel.module.example.controller.admin.user.vo.UserTypeRespVO;
import tech.qiantong.qmodel.module.example.controller.admin.user.vo.UserTypeSaveReqVO;
import tech.qiantong.qmodel.module.example.convert.user.UserTypeConvert;
import tech.qiantong.qmodel.module.example.dal.dataobject.user.UserTypeDO;
import tech.qiantong.qmodel.module.example.service.user.IUserTypeService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;

/**
 * 用户类型Controller
 *
 * @author anivia
 * @date 2024-11-27
 */
@Tag(name = "用户类型")
@RestController
@RequestMapping("/example/userType")
@Validated
public class UserTypeController extends BaseController {
    @Resource
    private IUserTypeService userTypeService;

    @Operation(summary = "查询用户类型列表")
    @PreAuthorize("@ss.hasPermi('example:user:list')")
    @GetMapping("/list")
    public CommonResult<PageResult<UserTypeRespVO>> list(UserTypePageReqVO userType) {
        PageResult<UserTypeDO> page = userTypeService.getUserTypePage(userType);
        return CommonResult.success(BeanUtils.toBean(page, UserTypeRespVO.class));
    }

    @Operation(summary = "导出用户类型列表")
    @PreAuthorize("@ss.hasPermi('example:user:export')")
    @Log(title = "用户类型", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, UserTypePageReqVO exportReqVO) {
        exportReqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<UserTypeDO> list = (List<UserTypeDO>) userTypeService.getUserTypePage(exportReqVO).getRows();
        ExcelUtil<UserTypeRespVO> util = new ExcelUtil<>(UserTypeRespVO.class);
        util.exportExcel(response, UserTypeConvert.INSTANCE.convertToRespVOList(list), "应用管理数据");
    }

    @Operation(summary = "获取用户类型详细信息")
    @PreAuthorize("@ss.hasPermi('example:user:query')")
    @GetMapping(value = "/{id}")
    public CommonResult<UserTypeRespVO> getInfo(@PathVariable("id") Long id) {
        UserTypeDO userTypeDO = userTypeService.getUserTypeById(id);
        return CommonResult.success(BeanUtils.toBean(userTypeDO, UserTypeRespVO.class));
    }

    @Operation(summary = "新增用户类型")
    @PreAuthorize("@ss.hasPermi('example:user:add')")
    @Log(title = "用户类型", businessType = BusinessType.INSERT)
    @PostMapping
    public CommonResult<Long> add(@Valid @RequestBody UserTypeSaveReqVO userType) {
        userType.setCreatorId(getUserId());
        userType.setCreateBy(getNickName());
        userType.setCreateTime(DateUtil.date());
        return CommonResult.toAjax(userTypeService.createUserType(userType));
    }

    @Operation(summary = "修改用户类型")
    @PreAuthorize("@ss.hasPermi('example:user:edit')")
    @Log(title = "用户类型", businessType = BusinessType.UPDATE)
    @PutMapping
    public CommonResult<Integer> edit(@Valid @RequestBody UserTypeSaveReqVO userType) {
        userType.setUpdatorId(getUserId());
        userType.setUpdateBy(getNickName());
        userType.setUpdateTime(DateUtil.date());
        return CommonResult.toAjax(userTypeService.updateUserType(userType));
    }

    @Operation(summary = "删除用户类型")
    @PreAuthorize("@ss.hasPermi('example:user:remove')")
    @Log(title = "用户类型", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public CommonResult<Integer> remove(@PathVariable Long[] ids) {
        return CommonResult.toAjax(userTypeService.removeUserType(Arrays.asList(ids)));
    }
}
