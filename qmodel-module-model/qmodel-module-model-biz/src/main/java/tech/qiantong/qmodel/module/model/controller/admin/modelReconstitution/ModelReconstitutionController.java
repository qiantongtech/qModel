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

    @Operation(summary = "新增模型库重构")
    @PreAuthorize("@ss.hasPermi('model:modelReconstitution:reconstitution:add')")
    @Log(title = "模型库重构", businessType = BusinessType.INSERT)
    @PostMapping
    public CommonResult<Long> add(@Valid @RequestBody ModelReconstitutionSaveReqVO model) {
        model.setCompanyId(null);
        model.setCreatorId(getUserId());
        model.setCreateBy(getNickName());

        ModelVersionSaveReqVO version = new ModelVersionSaveReqVO();
        version.setCompanyId(null);
        version.setCreatorId(getUserId());
        version.setCreateBy(getNickName());
        version.setVersion(model.getVersion());
        version.setDescription(model.getDescription());
        version.setStatus(1);
        version.setModelName(model.getName());
        version.setFileAddress(model.getInterfaceorfileAddress());
        version.setInterfaceAddress(model.getInterfaceorfileAddress());
        version.setRunnableFileAddress(model.getRunnableFileAddress());
        modelVersionService.createModelVersion(version);

        model.setVersionId(version.getId());
        Long modelReconstitution = modelReconstitutionService.createModelReconstitution(model);
        version.setModelId(model.getId());
        modelVersionService.updateModelVersion(version);
        // 添加操作历史
        modelHistoryService.createModelHistory(model.getId(), model.getName(), "新增了"+model.getName(), version.getVersion(), getUserId(), getNickName());

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
    public AjaxResult getFileList(@RequestBody String reqJsonStr) {
        JSONArray fileListArray = new JSONArray();
        // 下载文件
        String localPath = AniviaConfig.getProfile();
        String downloadPath = localPath + StringUtils.substringAfter(
                JSONObject.parseObject(reqJsonStr).getString("fileUrl"), Constants.RESOURCE_PREFIX
        );
        // 解压文件
        File unzip = ZipUtil.unzip(downloadPath);

        logger.info(String.valueOf(unzip.exists()));
        logger.info(unzip.getAbsolutePath());
        // 读取所有文件
        List<File> fileList = FileUtil.loopFiles(unzip);
        fileList.forEach(file -> {
            // 根据压缩包绝对路径，获取解压后的文件的相对路径
            String absolutePath = unzip.getAbsolutePath();
            String fileAbsolutePath = file.getAbsolutePath();
            String filePath = StrUtil.removePrefix(fileAbsolutePath, absolutePath);

            // 构建文件路径树，用于前台展示
            // {fileName: 文件夹名称或者文件名称, children: 子文件名称}
            JSONArray curFileJson = fileListArray;
            // 根据分隔符辨别文件路径，构建父级文件夹目录
            String[] strings = filePath.split("/");
            for (int i = 0; i < strings.length; i++) {
                String curPath = strings[i];
                if (curPath.isEmpty()) {
                    continue;
                }
                // 如果时最后一个，则应该是文件名，直接存储展示
                if (i == strings.length - 1) {
                    JSONObject temp = new JSONObject();
                    temp.put("fileName", curPath);
                    curFileJson.add(temp);
                } else {
                    // 父级文件夹。判断有没有，有则直接进入，没有则新建
                    JSONObject temp = null;
                    for (int i1 = 0; i1 < curFileJson.size(); i1++) {
                        temp = curFileJson.getJSONObject(i1);
                        if (temp.getString("fileName").equals(curPath)) {
                            break;
                        } else {
                            temp = null;
                        }
                    }
                    if (temp == null) {
                        temp = new JSONObject();
                        temp.put("fileName", curPath);
                        temp.put("children", new JSONArray());
                        curFileJson.add(temp);
                    }
                    curFileJson = temp.getJSONArray("children");
                }
            }
        });
        return AjaxResult.success(fileListArray);
    }

}
