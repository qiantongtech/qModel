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

package tech.qiantong.qmodel.server.controller.modelReconstitution;

import cn.hutool.core.collection.*;
import cn.hutool.core.io.*;
import cn.hutool.core.util.*;
import com.alibaba.fastjson.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.transaction.annotation.*;
import org.springframework.web.bind.annotation.*;
import tech.qiantong.qmodel.common.annotation.*;
import tech.qiantong.qmodel.common.config.*;
import tech.qiantong.qmodel.common.constant.*;
import tech.qiantong.qmodel.common.core.controller.*;
import tech.qiantong.qmodel.common.core.domain.*;
import tech.qiantong.qmodel.common.core.page.*;
import tech.qiantong.qmodel.common.enums.*;
import tech.qiantong.qmodel.common.utils.*;
import tech.qiantong.qmodel.common.utils.poi.*;
import tech.qiantong.qmodel.common.utils.uuid.*;
import tech.qiantong.qmodel.common.utils.uuid.UUID;
import tech.qiantong.qmodel.module.modelReconstitution.domain.*;
import tech.qiantong.qmodel.module.modelReconstitution.service.*;

import javax.servlet.http.*;
import java.io.*;
import java.util.*;

/**
 * 模型库的重构表Controller
 *
 * @author shu
 * @date 2024-01-02
 */
@RestController
@RequestMapping("/modelReconstitution/model" )
public class ModelReconstitutionController extends BaseController {

    @Autowired
    private IModelReconstitutionService modelReconstitutionService;

    @Autowired
    private IModelClassifyReconstitutionService modelClassifyReconstitutionService;

    @Autowired
    private IModelVersionReconstitutionService modelVersionReconstitutionService;

    @Autowired
    private IModelHistoryReconstitutionService modelHistoryReconstitutionService;

    /**
     * 查询模型库的重构表列表
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:model:list')" )
    @GetMapping("/list" )
    public TableDataInfo list(ModelReconstitution modelReconstitution) {
        modelReconstitution.setCompanyId(null);
        startPage();
        List<ModelReconstitution> list = modelReconstitutionService.selectModelReconstitutionList(modelReconstitution);
        ModelVersionReconstitution modelVersionReconstitution = new ModelVersionReconstitution();
        List<Long> ids = new ArrayList<>();
        for (ModelReconstitution reconstitution : list) {
            ids.add(reconstitution.getVersionId());
        }
        Map<String,Object> params = new HashMap<>();
        params.put("ids",ids);
        modelVersionReconstitution.setParams(params);
        List<ModelVersionReconstitution> modelVersionReconstitutions = modelVersionReconstitutionService.selectModelVersionList(modelVersionReconstitution);
        for (ModelReconstitution reconstitution : list) {
            if (reconstitution.getVersionId() == null) continue;
            for (ModelVersionReconstitution versionReconstitution : modelVersionReconstitutions) {
                if (reconstitution.getVersionId().equals(versionReconstitution.getId())){
                    reconstitution.setVersion(versionReconstitution.getVersion());
                    reconstitution.setDescription(versionReconstitution.getDescription());
                }
            }
        }
        return getDataTable(list);
    }

    /**
     * 导出模型库的重构表列表
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:model:export')" )
    @Log(title = "模型库的重构表" , businessType = BusinessType.EXPORT)
    @PostMapping("/export" )
    public void export(HttpServletResponse response, ModelReconstitution modelReconstitution) {
        modelReconstitution.setCompanyId(null);
        List<ModelReconstitution> list = modelReconstitutionService.selectModelReconstitutionList(modelReconstitution);
        ExcelUtil<ModelReconstitution> util = new ExcelUtil<ModelReconstitution>(ModelReconstitution. class);
        util.exportExcel(response, list, "模型库的重构表数据" );
    }

    /**
     * 获取模型库的重构表详细信息
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:model:query')" )
    @GetMapping(value = "/{id}" )
    public AjaxResult getInfo(@PathVariable("id" ) Long id) {
        ModelReconstitution modelReconstitution = modelReconstitutionService.selectModelReconstitutionById(id);
        if (modelReconstitution.getVersionId() != null) {
            ModelVersionReconstitution version = modelVersionReconstitutionService.selectModelVersionById(modelReconstitution.getVersionId());
            modelReconstitution.setVersion(version.getVersion());
            modelReconstitution.setDescription(version.getDescription());
            modelReconstitution.setRunnableFileAddress(version.getRunnableFileAddress());
        }
        ModelClassifyReconstitution modelClassifyReconstitution = modelClassifyReconstitutionService.selectModelClassifyById(modelReconstitution.getClassifyId());
        modelReconstitution.setClassifyName(modelClassifyReconstitution.getName());
        return AjaxResult.success(modelReconstitution);
    }

    /**
     * 新增模型库的重构表
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:model:add')" )
    @Log(title = "模型库的重构表" , businessType = BusinessType.INSERT)
    @PostMapping
    @Transactional
    public AjaxResult add(@RequestBody ModelReconstitution model) {
        model.setCompanyId(null);
        model.setCreatorId(getUserId());
        model.setCreateBy(getNickName());

        ModelVersionReconstitution version = new ModelVersionReconstitution();
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
        modelVersionReconstitutionService.insertModelVersion(version);

        model.setVersionId(version.getId());
        int insert = modelReconstitutionService.insertModelReconstitution(model);
        version.setModelId(model.getId());
        modelVersionReconstitutionService.updateModelVersion(version);
        // 添加操作历史
        ModelHistoryReconstitution modelHistory = new ModelHistoryReconstitution();
        modelHistory.setCompanyId(null);
        modelHistory.setModelId(model.getId());
        modelHistory.setModelName(model.getName());
        modelHistory.setContext("新增了"+model.getName());
        modelHistory.setModelVersion(version.getVersion());
        modelHistory.setUpdatorId(getUserId());
        modelHistory.setUpdateBy(getNickName());
        modelHistory.setUpdateTime(model.getCreateTime());
        modelHistoryReconstitutionService.insertModelHistory(modelHistory);
        /*ModelOperate operate = new ModelOperate();
        operate.setCompanyId(model.getCompanyId());
        operate.setCreatorId(getUserId());
        operate.setCreateBy(getNickName());
        operate.setModuleName(model.getName());
        operate.setContent("新增了"+model.getName());
        operate.setType(0);
        JSONObject object = new JSONObject();
        object.set("模型名称", model.getName());
        object.set("模型分类", modelClassifyService.selectModelClassifyById(model.getClassifyId().longValue()).getName());
        object.set("所属模型类别", sysDictDataService.selectDictLabel(
                "model_waterconserve_modelmanage_type", model.getType().toString()));
        object.set("模型格式", model.getFormat() == 0 ? "文件格式" : "接口格式");
        object.set("版本发布说明", modelVersion.getDescription());
        object.set("模型介绍", model.getRemark() == null ? " -- " : model.getRemark());
        operate.setRespContent(object.toString());
        modelOperateService.insertModelOperate(operate);*/
        AjaxResult ajax = toAjax(insert);
        return ajax;
    }

    /**
     * 修改模型库的重构表
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:model:edit')" )
    @Log(title = "模型库的重构表" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ModelReconstitution modelReconstitution) {
        ModelReconstitution modelReconstitutionInfo = modelReconstitutionService.selectModelReconstitutionById(modelReconstitution.getId());
        if (modelReconstitution !=null) {
            ModelHistoryReconstitution modelHistory = new ModelHistoryReconstitution();
            modelHistory.setCompanyId(null);
            modelHistory.setModelId(modelReconstitution.getId());
            modelHistory.setModelName(modelReconstitution.getName());
            modelHistory.setContext("修改了"+modelReconstitution.getName()+"基本信息");
            modelHistory.setModelVersion(modelReconstitution.getVersion());
            modelHistory.setUpdatorId(getUserId());
            modelHistory.setUpdateBy(getNickName());
            modelHistory.setUpdateTime(modelReconstitution.getCreateTime());
            modelHistoryReconstitutionService.insertModelHistory(modelHistory);
            /*ModelOperate operate = new ModelOperate();
            operate.setCompanyId(modelReconstitution.getCompanyId());
            operate.setCreatorId(getUserId());
            operate.setCreateBy(getNickName());
            operate.setModuleName(modelReconstitution.getName());
            operate.setContent("新增了"+modelReconstitution.getName());
            operate.setType(0);
            JSONObject object = new JSONObject();
            object.set("模型名称", modelReconstitution.getName());
            object.set("模型分类", modelClassifyService.selectModelClassifyById(model.getClassifyId().longValue()).getName());
            object.set("所属模型类别", sysDictDataService.selectDictLabel(
                    "model_waterconserve_modelmanage_type", model.getType().toString()));
            object.set("模型格式", model.getFormat() == 0 ? "文件格式" : "接口格式");
            object.set("版本发布说明", modelVersion.getDescription());
            object.set("模型介绍", model.getRemark() == null ? " -- " : model.getRemark());
            operate.setRespContent(object.toString());
            modelOperateService.insertModelOperate(operate);*/
        }
        if (modelReconstitution.getWhetherPublish() != null){
            modelReconstitution.setPublishTime(DateUtils.getNowDate());
        }
        return toAjax(modelReconstitutionService.updateModelReconstitution(modelReconstitution));
    }

    /**
     * 删除模型库的重构表
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:model:remove')" )
    @Log(title = "模型库的重构表" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}" )
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(modelReconstitutionService.deleteModelReconstitutionByIds(ids));
    }


    @PostMapping("/getFileList")
    public AjaxResult getFileList(@RequestBody String reqJsonStr) {
        JSONArray fileListArray = new JSONArray();
        // 下载文件
        String localPath = AniviaConfig.getProfile();
        String downloadPath = localPath + StringUtils.substringAfter(
          JSONObject.parseObject(reqJsonStr).getString("fileUrl"), Constants.RESOURCE_PREFIX
        );
//        File zipFile = fileService.downloadFileFromModel(
//        JSONObject.parseObject(reqJsonStr).getString("fileUrl"), UUID.randomUUID() + ".zip");
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
                if (curPath.isEmpty()) continue;
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
//        FileUtil.del(zipFile);
//        FileUtil.del(unzip);
        return AjaxResult.success(fileListArray);
    }
}
