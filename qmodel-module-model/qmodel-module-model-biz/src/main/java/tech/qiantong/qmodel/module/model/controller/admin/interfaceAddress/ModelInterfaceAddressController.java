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

package tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.*;

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
import tech.qiantong.qmodel.module.model.controller.admin.history.vo.ModelHistorySaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.vo.ModelInterfaceAddressPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.vo.ModelInterfaceAddressRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.vo.ModelInterfaceAddressSaveReqVO;
import tech.qiantong.qmodel.module.model.convert.interfaceAddress.ModelInterfaceAddressConvert;
import tech.qiantong.qmodel.module.model.dal.dataobject.interfaceAddress.ModelInterfaceAddressDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.version.ModelVersionDO;
import tech.qiantong.qmodel.module.model.service.history.IModelHistoryService;
import tech.qiantong.qmodel.module.model.service.interfaceAddress.IModelInterfaceAddressService;
import tech.qiantong.qmodel.module.model.service.version.IModelVersionService;
import tech.qiantong.qmodel.module.modelReconstitution.domain.ModelVersionReconstitution;


/**
 * 接口地址Controller
 *
 * @author qModel
 * @date 2026-01-09
 */
@Tag(name = "接口地址")
@RestController
@RequestMapping("/model/interfaceAddress")
@Validated
public class ModelInterfaceAddressController extends BaseController {
    @Resource
    private IModelInterfaceAddressService modelInterfaceAddressService;

    @Resource
    private IModelVersionService modelVersionService;

    @Resource
    private IModelHistoryService modelHistoryService;

    @Operation(summary = "查询接口地址列表")
    @PreAuthorize("@ss.hasPermi('model:interfaceAddress:interfaceaddress:list')")
    @GetMapping("/list")
    public CommonResult<PageResult<ModelInterfaceAddressRespVO>> list(ModelInterfaceAddressPageReqVO modelInterfaceAddress) {
        PageResult<ModelInterfaceAddressDO> page = modelInterfaceAddressService.getModelInterfaceAddressPage(modelInterfaceAddress);

        List<ModelInterfaceAddressDO> list = page.getList();

        ModelVersionDO modelVersionReconstitution = new ModelVersionDO();
        List<Long> ids = new ArrayList<>();
        for (ModelInterfaceAddressDO interfaceAddress : list) {
            ids.add(interfaceAddress.getVersionId());
        }
        Map<String, Object> params = new HashMap<>();
        params.put("ids", ids);
        modelVersionReconstitution.setParams(params);
        List<ModelVersionDO> modelVersionReconstitutions = modelVersionService.selectModelVersionList(modelVersionReconstitution);
        for (ModelInterfaceAddressDO interfaceAddress : list) {
            for (ModelVersionDO versionReconstitution : modelVersionReconstitutions) {
                if (interfaceAddress.getVersionId().equals(versionReconstitution.getId())) {
                    interfaceAddress.setVersion(versionReconstitution.getVersion());
                    interfaceAddress.setDescription(versionReconstitution.getDescription());
                }
            }
        }

        return CommonResult.success(BeanUtils.toBean(page, ModelInterfaceAddressRespVO.class));
    }

    @Operation(summary = "导出接口地址列表")
    @PreAuthorize("@ss.hasPermi('model:interfaceAddress:interfaceaddress:export')")
    @Log(title = "接口地址", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelInterfaceAddressPageReqVO exportReqVO) {
        exportReqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<ModelInterfaceAddressDO> list = (List<ModelInterfaceAddressDO>) modelInterfaceAddressService.getModelInterfaceAddressPage(exportReqVO).getRows();
        ExcelUtil<ModelInterfaceAddressRespVO> util = new ExcelUtil<>(ModelInterfaceAddressRespVO.class);
        util.exportExcel(response, ModelInterfaceAddressConvert.INSTANCE.convertToRespVOList(list), "应用管理数据");
    }

    @Operation(summary = "导入接口地址列表")
    @PreAuthorize("@ss.hasPermi('model:interfaceAddress:interfaceaddress:import')")
    @Log(title = "接口地址", businessType = BusinessType.IMPORT)
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<ModelInterfaceAddressRespVO> util = new ExcelUtil<>(ModelInterfaceAddressRespVO.class);
        List<ModelInterfaceAddressRespVO> importExcelList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = modelInterfaceAddressService.importModelInterfaceAddress(importExcelList, updateSupport, operName);
        return success(message);
    }

    @Operation(summary = "获取接口地址详细信息")
    @PreAuthorize("@ss.hasPermi('model:interfaceAddress:interfaceaddress:query')")
    @GetMapping(value = "/{id}")
    public CommonResult<ModelInterfaceAddressRespVO> getInfo(@PathVariable("id") Long id) {
        ModelInterfaceAddressDO modelInterfaceAddressDO = modelInterfaceAddressService.getModelInterfaceAddressById(id);
        ModelVersionDO modelVersionReconstitution = modelVersionService.getModelVersionById(modelInterfaceAddressDO.getVersionId());
        modelInterfaceAddressDO.setVersion(modelVersionReconstitution.getVersion());
        modelInterfaceAddressDO.setDescription(modelVersionReconstitution.getDescription());
        return CommonResult.success(BeanUtils.toBean(modelInterfaceAddressDO, ModelInterfaceAddressRespVO.class));
    }

    @Operation(summary = "新增接口地址")
    @PreAuthorize("@ss.hasPermi('model:interfaceAddress:interfaceaddress:add')")
    @Log(title = "接口地址", businessType = BusinessType.INSERT)
    @PostMapping
    public CommonResult<Long> add(@Valid @RequestBody ModelInterfaceAddressSaveReqVO modelInterfaceAddress) {
        // 添加操作历史
        if (modelInterfaceAddress !=null) {
            ModelHistorySaveReqVO modelHistory = new ModelHistorySaveReqVO();
            modelHistory.setModelId(modelInterfaceAddress.getModelId());
            modelHistory.setModelName(modelInterfaceAddress.getModelName());
            modelHistory.setContext("新增了【"+modelInterfaceAddress.getInterfaceAddress()+"】接口地址");
            modelHistory.setModelVersion(modelInterfaceAddress.getVersion());
            modelHistory.setUpdatorId(getUserId());
            modelHistory.setUpdateBy(getNickName());
            modelHistory.setUpdateTime(modelInterfaceAddress.getCreateTime());
            modelHistoryService.createModelHistory(modelHistory);
        }
        return CommonResult.toAjax(modelInterfaceAddressService.createModelInterfaceAddress(modelInterfaceAddress));
    }

    @Operation(summary = "修改接口地址")
    @PreAuthorize("@ss.hasPermi('model:interfaceAddress:interfaceaddress:edit')")
    @Log(title = "接口地址", businessType = BusinessType.UPDATE)
    @PutMapping
    public CommonResult<Integer> edit(@Valid @RequestBody ModelInterfaceAddressSaveReqVO modelInterfaceAddress) {

        if (modelInterfaceAddress !=null) {
            ModelHistorySaveReqVO modelHistory = new ModelHistorySaveReqVO();
            modelHistory.setModelId(modelInterfaceAddress.getModelId());
            modelHistory.setModelName(modelInterfaceAddress.getModelName());
            modelHistory.setContext("修改了【"+modelInterfaceAddress.getInterfaceAddress()+"】接口基本信息");
            modelHistory.setModelVersion(modelInterfaceAddress.getVersion());
            modelHistory.setUpdatorId(getUserId());
            modelHistory.setUpdateBy(getNickName());
            modelHistory.setUpdateTime(modelInterfaceAddress.getCreateTime());
            modelHistoryService.createModelHistory(modelHistory);
        }
        return CommonResult.toAjax(modelInterfaceAddressService.updateModelInterfaceAddress(modelInterfaceAddress));
    }

    @Operation(summary = "删除接口地址")
    @PreAuthorize("@ss.hasPermi('model:interfaceAddress:interfaceaddress:remove')")
    @Log(title = "接口地址", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public CommonResult<Integer> remove(@PathVariable Long[] ids) {
        return CommonResult.toAjax(modelInterfaceAddressService.removeModelInterfaceAddress(Arrays.asList(ids)));
    }

}
