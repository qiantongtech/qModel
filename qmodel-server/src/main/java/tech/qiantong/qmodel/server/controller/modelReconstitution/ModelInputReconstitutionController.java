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

import cn.hutool.core.io.file.*;
import com.alibaba.fastjson2.*;
import com.google.common.collect.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.web.bind.annotation.*;
import tech.qiantong.qmodel.common.annotation.*;
import tech.qiantong.qmodel.common.core.controller.*;
import tech.qiantong.qmodel.common.core.domain.*;
import tech.qiantong.qmodel.common.core.page.*;
import tech.qiantong.qmodel.common.enums.*;
import tech.qiantong.qmodel.common.utils.*;
import tech.qiantong.qmodel.common.utils.poi.*;
import tech.qiantong.qmodel.module.modelReconstitution.domain.*;
import tech.qiantong.qmodel.module.modelReconstitution.service.*;

import javax.servlet.http.*;
import java.util.*;

/**
 * 模型输入管理 Controller
 *
 * @author YWG
 * @date 2023-09-14
 */
@RestController
@RequestMapping("/modelReconstitution/input")
public class ModelInputReconstitutionController extends BaseController {
    @Autowired
    private IModelInputReconstitutionService modelInputService;

    @Autowired
    private IModelReconstitutionService modelReconstitutionService;

    @Autowired
    private IModelVersionReconstitutionService modelVersionService;

    @Autowired
    private IModelInputReconstitutionService modelInputReconstitutionService;


//    @Value("${model.filePathRoot}")
    private String filePathRoot = "D:\\model\\chengxuhuizong11.5";

    /**
     * 查询模型输入管理 列表
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:input:list')")
    @GetMapping("/list")
    public TableDataInfo list(ModelInputReconstitution modelInput) {
        startPage();
        List<ModelInputReconstitution> list = modelInputService.selectModelInputList(modelInput);
        return getDataTable(list);
    }

    /**
     * 导出模型输入管理 列表
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:input:export')")
    @Log(title = "模型输入管理 ", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelInputReconstitution modelInput) {
        List<ModelInputReconstitution> list = modelInputService.selectModelInputList(modelInput);
        ExcelUtil<ModelInputReconstitution> util = new ExcelUtil<ModelInputReconstitution>(ModelInputReconstitution.class);
        util.exportExcel(response, list, "模型输入管理 数据");
    }

    /**
     * 获取模型输入管理 详细信息
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:input:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(modelInputService.selectModelInputById(id));
    }

    /**
     * 新增模型输入管理
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:input:add')")
    @Log(title = "模型输入管理 ", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ModelInputReconstitution modelInput) {
        modelInput.setCreateBy(getNickName());
        return toAjax(modelInputService.insertModelInput(modelInput));
    }

    /**
     * 修改模型输入管理
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:input:edit')")
    @Log(title = "模型输入管理 ", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ModelInputReconstitution modelInput) {
        return toAjax(modelInputService.updateModelInput(modelInput));
    }

    /**
     * 删除模型输入管理
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:input:remove')")
    @Log(title = "模型输入管理 ", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(modelInputService.deleteModelInputByIds(ids));
    }


    /**
     * 查询所有模型
     */
    @PostMapping("/findAllModel")
    public AjaxResult findAllModel(@RequestBody ModelReconstitution modelReconstitution) {
//        modelReconstitution.setCompanyId(null);
        modelReconstitution.setDelFlag(false);
        return AjaxResult.success(modelReconstitutionService.selectModelReconstitutionList(modelReconstitution));
    }


    /**
     * 查询所有模型版本
     */
    @PostMapping("/findAllModelVersion")
    public AjaxResult findAllModelVersion(@RequestBody ModelVersionReconstitution modelVersion) {
        modelVersion.setDelFlag(false);
        return AjaxResult.success(modelVersionService.selectModelVersionList(modelVersion));
    }

    /**
     * 获取模型文件内容
     */
    @GetMapping("/getAllDatFileJson")
    public AjaxResult getAllFileJSon(){
        String path = filePathRoot + "\\dat";
        HashMap<String, Object> allDatFileMsg = modelInputService.getAllDatFileMsg(path);
        if (allDatFileMsg.size() == 0){
            return AjaxResult.error("文件里面可能没有数据！或者文件路径有误");
        }
        return AjaxResult.success(allDatFileMsg);
    }

    @GetMapping("/getAllInputJson/{modelId}")
    public AjaxResult getAllInputJson(@PathVariable("modelId") Long modelId){
        ModelReconstitution modelReconstitution = modelReconstitutionService.selectModelReconstitutionById(modelId);
        ModelInputReconstitution modelInputReconstitution = new ModelInputReconstitution();
        modelInputReconstitution.setModelId(modelReconstitution.getId());
        List<ModelInputReconstitution> modelInputReconstitutionList = modelInputReconstitutionService.selectModelInputList(modelInputReconstitution);
        HashMap<String, Object> resultMap = Maps.newHashMap();
        if (modelId.equals(12L)) {
            HashMap<String, Object> multipleContent = Maps.newHashMap();
            multipleContent.put("IK", 1);
            multipleContent.put("M", 1);
            {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("f0", 156);
                jsonObject.put("fc", 24);
                jsonObject.put("K", 6.1);
                jsonObject.put("误差", 0.05);
                jsonObject.put("BX", 1);
                jsonObject.put("AREA", 187);
                jsonObject.put("WT", 15);
                jsonObject.put("DT", 0.2);
                multipleContent.put("PAR", jsonObject);
            }
            {
                JSONArray array = new JSONArray(0.0,0.0,0.0,0.0,0.0,2.0,0.03,0.08,0.12,0.15,0.12,0.1,0.08,0.07,0.06,0.05,0.04,0.03,0.02,0.01,0.01,0.01);
                multipleContent.put("无因次单位线", array);
            }
            HashMap<String, Object> result = Maps.newHashMap();
            resultMap.put("multipleContent", multipleContent);
            result.put("data", resultMap);
            return AjaxResult.success(result);
        }
        if (modelId.equals(13L)) {
            HashMap<String, Object> multipleContent = Maps.newHashMap();
            multipleContent.put("IK", 1);
            multipleContent.put("M", 1);
            {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("f0", 156);
                jsonObject.put("fc", 24);
                jsonObject.put("K", 6.1);
                jsonObject.put("误差", 0.05);
                jsonObject.put("BX", 1);
                jsonObject.put("AREA", 187);
                jsonObject.put("WT", 15);
                jsonObject.put("DT", 0.2);
                multipleContent.put("PAR", jsonObject);
            }
            {
                JSONArray array = new JSONArray(0.0,0.0,0.0,0.0,0.0,2.0,0.03,0.08,0.12,0.15,0.12,0.1,0.08,0.07,0.06,0.05,0.04,0.03,0.02,0.01,0.01,0.01);
                multipleContent.put("无因次单位线", array);
            }
            HashMap<String, Object> result = Maps.newHashMap();
            resultMap.put("multipleContent", multipleContent);
            result.put("data", resultMap);
            return AjaxResult.success(result);
        }
        String url = modelReconstitution.getInterfaceorfileAddress().substring(0, modelReconstitution.getInterfaceorfileAddress().lastIndexOf("/")) + "/" + modelReconstitution.getFileName() + "/input/";
        for (ModelInputReconstitution inputReconstitution : modelInputReconstitutionList) {
            if (inputReconstitution.getEngName().equals("hedaosunshi.dat")){
                resultMap.put(inputReconstitution.getName(), modelInputReconstitutionService.hedaosunshi(url + inputReconstitution.getEngName()));
            }else if (inputReconstitution.getEngName().equals("shuniu_zhamenkongzhi.dat")){
                cn.hutool.json.JSONArray shuniuZhamenkongzhiJsonArray = modelInputReconstitutionService.shuniuZhamenkongzhi(url + inputReconstitution.getEngName());
                cn.hutool.json.JSONArray jsonArray = new cn.hutool.json.JSONArray();
                for (int i = 0; i < shuniuZhamenkongzhiJsonArray.size(); i++) {
                    if (i == 0 || i == 3 || i == 6){
                        for (int j = 0; j < shuniuZhamenkongzhiJsonArray.getJSONArray(i).size(); j++) {
                            cn.hutool.json.JSONArray jsonArrayTwo = new cn.hutool.json.JSONArray();
                            jsonArrayTwo.add(shuniuZhamenkongzhiJsonArray.getJSONArray(i).getStr(j));
                            jsonArrayTwo.add(shuniuZhamenkongzhiJsonArray.getJSONArray(i + 1).getStr(j));
                            jsonArrayTwo.add(shuniuZhamenkongzhiJsonArray.getJSONArray(i + 2).getStr(j));
                            jsonArray.add(jsonArrayTwo);
                        }
                    }
                }
                resultMap.put(inputReconstitution.getName(), jsonArray);
            }else {
                resultMap.put(inputReconstitution.getName(), readInputFile(url + inputReconstitution.getEngName()));
            }
        }
        return AjaxResult.success(resultMap);
    }

    public JSONArray readInputFile(String filePath) {
        FileReader fileReader = new FileReader(filePath);
        List<String> lines = fileReader.readLines();
        JSONArray array = new JSONArray();
        for (String line : lines) {
            if (line.equals(lines.get(0))) {
                continue;
            }
//            List<String> list = StringUtils.splitByRegex(line, "\"");
//            JSONArray objects = new JSONArray();
//            for (String s : list) {
//                if (s.indexOf(",\t") != -1){
//                    s = s.replace(",\t","");
//                }else if (s.indexOf(",") != -1){
//                    s = s.replace(",","");
//                }
//                objects.add(s.trim());
//            }
//            array.add(objects);
        }
        return array;
    }
}
