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

package tech.qiantong.qmodel.module.model.controller.admin.version;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;

import cn.hutool.json.JSONObject;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import tech.qiantong.qmodel.common.core.page.PageParam;
import tech.qiantong.qmodel.common.core.domain.AjaxResult;
import tech.qiantong.qmodel.common.annotation.Log;
import tech.qiantong.qmodel.common.core.controller.BaseController;
import tech.qiantong.qmodel.common.core.domain.CommonResult;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.core.page.TableDataInfo;
import tech.qiantong.qmodel.common.enums.BusinessType;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.common.utils.poi.ExcelUtil;
import tech.qiantong.qmodel.common.exception.enums.GlobalErrorCodeConstants;
import tech.qiantong.qmodel.module.model.controller.admin.history.vo.ModelHistorySaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.operate.vo.ModelOperateSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.version.vo.ModelVersionPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.version.vo.ModelVersionRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.version.vo.ModelVersionSaveReqVO;
import tech.qiantong.qmodel.module.model.convert.version.ModelVersionConvert;
import tech.qiantong.qmodel.module.model.dal.dataobject.version.ModelVersionDO;
import tech.qiantong.qmodel.module.model.service.history.IModelHistoryService;
import tech.qiantong.qmodel.module.model.service.modelReconstitution.IModelReconstitutionService;
import tech.qiantong.qmodel.module.model.service.operate.IModelOperateService;
import tech.qiantong.qmodel.module.model.service.version.IModelVersionService;
import tech.qiantong.qmodel.module.modelReconstitution.domain.ModelReconstitution;
import tech.qiantong.qmodel.module.modelReconstitution.domain.ModelVersionReconstitution;


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

    @Autowired
    private IModelReconstitutionService modelReconstitutionService;

    @Autowired
    private IModelHistoryService modelHistoryService;

    @Autowired
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
    public AjaxResult handoffVersion(@RequestBody JSONObject jsonObject) {
        ModelVersionSaveReqVO version = new ModelVersionSaveReqVO();
        if (jsonObject.getLong("beforeVersionId") != null) {
            version.setId(jsonObject.getLong("beforeVersionId"));
            version.setStatus(0);
            Integer i = modelVersionService.updateModelVersion(version);
        }
        ModelReconstitution model = new ModelReconstitution();
        model.setId(jsonObject.getLong("modelId"));
        if (jsonObject.getLong("afterVersionId") == null) {
            model.setParamByKey("clearVersionId", true);
        } else {
            model.setVersionId(jsonObject.getLong("afterVersionId"));
            version.setId(jsonObject.getLong("afterVersionId"));
            version.setStatus(1);
            modelVersionService.updateModelVersion(version);
            modelHistoryService.createModelHistory(jsonObject.getLong("modelId"), jsonObject.getStr("modelName"), "切换了模型的版本号, 切换到了【" + jsonObject.getDouble("afterVersion") + "】", jsonObject.getStr("afterVersion"), getUserId(), getNickName());
        }
        modelReconstitutionService.updateModelReconstitution(model);
        return success();
    }


    @Operation(summary = "修改版本管理")
    @PreAuthorize("@ss.hasPermi('model:version:version:edit')")
    @Log(title = "版本管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public CommonResult<Integer> edit(@Valid @RequestBody ModelVersionSaveReqVO modelVersion) {
        ModelReconstitution modelReconstitution = modelReconstitutionService.selectModelReconstitutionById(modelVersion.getId());
        if (modelVersion.getStatus() != null && modelVersion.getStatus() == 1) {
            if (modelReconstitution.getAccessMode() != null && modelReconstitution.getAccessMode().equals(1)) {
                modelReconstitution.setInterfaceorfileAddress(modelVersion.getInterfaceAddress());
            }
            if (modelReconstitution.getAccessMode() != null && modelReconstitution.getAccessMode().equals(0)) {
                modelReconstitution.setInterfaceorfileAddress(modelVersion.getFileAddress());
            }
            modelReconstitution.setVersionId(modelVersion.getId());
            modelReconstitution.setRemark(modelVersion.getRemark());
            modelReconstitutionService.updateModelReconstitution(modelReconstitution);

            modelHistoryService.createModelHistory(modelVersion.getModelId(), modelVersion.getModelName(), "启用了" + modelVersion.getModelName() + "【" + modelVersion.getVersion() + "】版本", modelVersion.getVersion(), getUserId(), getNickName());

            ModelOperateSaveReqVO operate = new ModelOperateSaveReqVO();
            operate.setCompanyId(modelReconstitution.getCompanyId());
            operate.setCreatorId(getUserId());
            operate.setCreateBy(getNickName());
            operate.setModuleName(modelReconstitution.getName());
            operate.setContent("启用"+ "【" + modelVersion.getVersion() + "】版本");
            operate.setType(2L);
            JSONObject object = new JSONObject();
            object.set("模型名称", modelReconstitution.getName());
            object.set("启用版本", modelVersion.getVersion());
            operate.setRespContent(object.toString());
            modelOperateService.createModelOperate(operate);
        }
        ModelVersionDO modelVersionDO = new ModelVersionDO();
        modelVersionDO.setModelId(modelVersion.getModelId());
        List<ModelVersionDO> mvList = modelVersionService.selectModelVersionList(modelVersionDO);
        Boolean isStatus = true;
        for (ModelVersionDO version : mvList) {
            if (version.getStatus() == 1){
                isStatus = false;
            }
        }
        //停用
        if (isStatus) {
            modelReconstitutionService.updateModelReconstitution(modelReconstitution);
            //历史操作记录插入
            modelHistoryService.createModelHistory(modelVersion.getModelId(), modelVersion.getModelName(), "停用了" + modelVersion.getModelName() + "【" + modelVersion.getVersion() + "】版本", modelVersion.getVersion(), getUserId(), getNickName());

            ModelOperateSaveReqVO operate = new ModelOperateSaveReqVO();
            operate.setCompanyId(modelReconstitution.getCompanyId());
            operate.setCreatorId(getUserId());
            operate.setCreateBy(getNickName());
            operate.setModuleName(modelReconstitution.getName());
            operate.setContent("停用【" + modelVersion.getVersion() + "】版本");
            operate.setType(2L);
            JSONObject object = new JSONObject();
            object.set("模型名称", modelReconstitution.getName());
            object.set("启用版本", modelVersion.getVersion());
            operate.setRespContent(object.toString());
            modelOperateService.createModelOperate(operate);
        }else {
            //历史操作记录插入
            modelHistoryService.createModelHistory(modelVersion.getModelId(), modelVersion.getModelName(), "修改了" + modelVersion.getModelName() + "【" + modelVersion.getVersion() + "】版本的内容", modelVersion.getVersion(), getUserId(), getNickName());
        }
        return CommonResult.toAjax(modelVersionService.updateModelVersion(modelVersion));
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
