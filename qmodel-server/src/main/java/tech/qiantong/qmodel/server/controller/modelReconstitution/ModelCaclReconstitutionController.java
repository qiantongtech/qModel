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

import cn.hutool.core.io.file.FileReader;
import cn.hutool.core.util.*;
import cn.hutool.http.*;
import cn.hutool.json.JSONObject;
import cn.hutool.json.*;
import com.alibaba.fastjson2.JSONArray;
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
import tech.qiantong.qmodel.module.model.controller.admin.history.vo.ModelHistorySaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.input.ModelInputDO;
import tech.qiantong.qmodel.module.model.service.history.IModelHistoryService;
import tech.qiantong.qmodel.module.model.service.input.IModelInputService;
import tech.qiantong.qmodel.module.model.service.output.IModelOutputService;
import tech.qiantong.qmodel.module.modelReconstitution.domain.*;
import tech.qiantong.qmodel.module.modelReconstitution.service.*;

import javax.servlet.http.*;
import java.io.*;
import java.util.*;

/**
 * 模型计算管理 Controller
 *
 * @author Ywg
 * @date 2023-09-18
 */
@RestController
@RequestMapping("/modelReconstitution/cacl")
public class ModelCaclReconstitutionController extends BaseController {
    @Autowired
    private IModelCaclReconstitutionService modelCaclService;


    @Autowired
    private IModelReconstitutionService modelReconstitutionService;

    @Autowired
    private IModelInterfaceAddressService modelInterfaceAddressService;

    @Autowired
    private IModelHistoryService modelHistoryService;

    @Autowired
    private IModelInputService modelInputReconstitutionService;

    @Autowired
    private IModelOutputService modelOutputReconstitutionService;
    @Autowired
    private IModelVirtualCalcService modelVirtualCalcService;


    /**
     * 查询模型计算管理 列表
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:cacl:list')")
    @GetMapping("/list")
    public TableDataInfo list(ModelCaclReconstitution modelCacl) {
        startPage();
        List<ModelCaclReconstitution> list = modelCaclService.selectModelCaclList(modelCacl);
        return getDataTable(list);
    }

    /**
     * 导出模型计算管理 列表
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:cacl:export')")
    @Log(title = "模型计算管理 ", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelCaclReconstitution modelCacl) {
        List<ModelCaclReconstitution> list = modelCaclService.selectModelCaclList(modelCacl);
        ExcelUtil<ModelCaclReconstitution> util = new ExcelUtil<ModelCaclReconstitution>(ModelCaclReconstitution.class);
        util.exportExcel(response, list, "模型计算管理 数据");
    }

    /**
     * 获取模型计算管理 详细信息
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:cacl:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        ModelCaclReconstitution modelCaclReconstitution = modelCaclService.selectModelCaclById(id);
        if (modelCaclReconstitution.getAddressType() == 1){
            ModelInterfaceAddress interfaceAddress = modelInterfaceAddressService.selectModelInterfaceAddressById(modelCaclReconstitution.getAddressId());
            modelCaclReconstitution.setAddress(interfaceAddress.getInterfaceAddress());
            modelCaclReconstitution.setRequestMethod(interfaceAddress.getRequestMethod());
        }
        return AjaxResult.success(modelCaclReconstitution);
    }

    /**
     * 新增模型计算管理
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:cacl:add')")
    @Log(title = "模型计算管理 ", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ModelCaclReconstitution modelCacl) {
        modelCacl.setCreatorId(getUserId());
        modelCacl.setCreateBy(getNickName());
        if (modelCacl != null){
            ModelHistorySaveReqVO modelHistory = new ModelHistorySaveReqVO();
            modelHistory.setModelId(modelCacl.getModelId());
            modelHistory.setModelName(modelCacl.getModelName());
            modelHistory.setContext("添加了一条【" + modelCacl.getName() + "】模型计算");
            modelHistory.setModelVersion(modelCacl.getModelVersion());
            modelHistory.setUpdatorId(getUserId());
            modelHistory.setUpdateBy(getNickName());
            modelHistoryService.createModelHistory(modelHistory);
        }
        return toAjax(modelCaclService.insertModelCacl(modelCacl));
    }

    /**
     * 修改模型计算管理
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:cacl:edit')")
    @Log(title = "模型计算管理 ", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ModelCaclReconstitution modelCacl) {
        if (modelCacl != null){
            ModelHistorySaveReqVO modelHistory = new ModelHistorySaveReqVO();
            modelHistory.setModelId(modelCacl.getModelId());
            modelHistory.setModelName(modelCacl.getModelName());
            modelHistory.setContext("修改了【" + modelCacl.getName() + "】基本信息");
            modelHistory.setModelVersion(modelCacl.getModelVersion());
            modelHistory.setUpdatorId(getUserId());
            modelHistory.setUpdateBy(getNickName());
            modelHistoryService.createModelHistory(modelHistory);
        }
        return toAjax(modelCaclService.updateModelCacl(modelCacl));
    }

    /**
     * 删除模型计算管理
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:cacl:remove')")
    @Log(title = "模型计算管理 ", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(modelCaclService.deleteModelCaclByIds(ids));
    }

    /**
     * 开始计算模型
     */
    @Log(title = "模型计算管理 ", businessType = BusinessType.DELETE)
    @GetMapping("/calculate")
    public AjaxResult calculate(@RequestParam(value = "modelCaclId") Long modelCaclId) throws IOException {
        ModelCaclReconstitution modelCacl = modelCaclService.selectModelCaclById(modelCaclId);
        ModelReconstitution model = modelReconstitutionService.selectModelReconstitutionById(modelCacl.getModelId());
        if (model.getAccessMode() == 1)
        {
            JSONObject jsonObject = new JSONObject();
            String result = "";
            ModelInterfaceAddress interfaceAddress = modelInterfaceAddressService.selectModelInterfaceAddressById(modelCacl.getAddressId());
            if (modelCacl.getInputContent() == null){
                jsonObject = JSONUtil.parseObj(interfaceAddress.getInputParameter());
            }else {
                jsonObject = JSONUtil.parseObj(modelCacl.getInputContent());
            }
            Map<String,String> headersMap = new HashMap<>();
            headersMap.put("userId",getUserId().toString());
            switch (interfaceAddress.getRequestMethod()){
                case 0:
                    String url = HttpUtil.urlWithForm(interfaceAddress.getInterfaceAddress(), jsonObject, null, false);
                    result = HttpUtil.get(url);
                    break;
                case 1:
                    result = HttpRequest.post(interfaceAddress.getInterfaceAddress()).addHeaders(headersMap).body(JSONUtil.toJsonStr(jsonObject), "application/json").execute().body();
                    break;
                case 2:
                    result = HttpRequest.put(interfaceAddress.getInterfaceAddress()).addHeaders(headersMap).body(JSONUtil.toJsonStr(jsonObject), "application/json").execute().body();
                    break;
                case 3:
                    result = HttpRequest.delete(interfaceAddress.getInterfaceAddress()).addHeaders(headersMap).execute().body();
                    break;
                default:break;
            }
            modelCacl.setStartTime(DateUtils.getNowDate());
            modelCacl.setEndTime(DateUtils.getNowDate());
            modelCacl.setStatus(2);
            modelCacl.setOutputContent(result);
            modelCaclService.updateModelCacl(modelCacl);
        }
        else {
            if (model.getId().equals(12L)) {
                modelCacl.setStartTime(DateUtils.getNowDate());
                modelCacl.setEndTime(DateUtils.getNowDate());
                modelCacl.setStatus(2);
                modelCacl.setOutputContent(modelVirtualCalcService.getOneResult().toJSONString());
                modelCaclService.updateModelCacl(modelCacl);
            }
            if (model.getId().equals(13L)) {
                modelCacl.setStartTime(DateUtils.getNowDate());
                modelCacl.setEndTime(DateUtils.getNowDate());
                modelCacl.setStatus(2);
                modelCacl.setOutputContent(modelVirtualCalcService.getTwoResult().toJSONString());
                modelCaclService.updateModelCacl(modelCacl);
            }
            if (model.getId().equals(28L) || model.getId() > 28L) {
//                FileWriter writer = new FileWriter("\\data\\jgst.chaoshen.20250113\\data_input.json");
//                writer.write(JSONUtil.parse(modelCacl.getInputContent()).toStringPretty());
//                new Thread(() -> {
//                  Process exec = null;
//                  try {
//                    exec = Runtime.getRuntime().exec("cmd /c cd C:\\data\\model\\7e015df2-d228-424a-b6c0-f9f29bee4487\\jgst.chaoshen.20250113 && python chaoshen.20250113.py");
//                  } catch (IOException e) {
//                    throw new RuntimeException(e);
//                  }
//                  final InputStream is1 = exec.getInputStream();
//                    StringBuilder stringBuilder = new StringBuilder();
//                    BufferedReader bufferedReader = null;
//                    String line = null;
//                    try {
//                        bufferedReader = new BufferedReader(new InputStreamReader(is1, "GBK"));
//                        while ((line = bufferedReader.readLine()) != null) {
//                            stringBuilder.append(line + "\n");
//                            logger.info(line);
//                        }
//                        is1.close();
//                        InputStream is2 = exec.getErrorStream();
//                        BufferedReader br2 = new BufferedReader(new InputStreamReader(is2));
//                        StringBuilder buf = new StringBuilder(); // 保存输出结果流
//                        String line2 = null;
//                        while((line2 = br2.readLine()) != null) buf.append(line2); //
//                        System.out.println(buf);
//                    } catch (Exception e) {
//                        // TODO Auto-generated catch block
//                        e.printStackTrace();
//                    }
//                }).start(); // 启动单独的线程来清空p.getInputStream()的缓冲区;
                FileReader reader = new FileReader("/data/jgst/jgst.chaoshen.20250113/data_output.json");
                String join = StringUtils.join(reader.readLines(), " ");
                join = StrUtil.removePrefix(join, "\"");
                join = StrUtil.removeSuffix(join, "\"");
                modelCacl.setOutputContent((StrUtil.removeAll(join, "\\n").replace("\\\"", "'").replaceAll(" ", "")));
                modelCacl.setStartTime(DateUtils.getNowDate());
                modelCacl.setEndTime(DateUtils.getNowDate());
                modelCacl.setStatus(2);
                modelCaclService.updateModelCacl(modelCacl);
            }
        }
        ModelHistorySaveReqVO modelHistory = new ModelHistorySaveReqVO();
        modelHistory.setModelId(modelCacl.getModelId());
        modelHistory.setModelName(modelCacl.getModelName());
        modelHistory.setContext("【" + modelCacl.getName() + "】进行了模型计算");
        modelHistory.setModelVersion(modelCacl.getModelVersion());
        modelHistory.setUpdatorId(getUserId());
        modelHistory.setUpdateBy(getNickName());
        modelHistoryService.createModelHistory(modelHistory);
        return success();
    }


    /**
     * 设置参数接口 --查看
     */
    @GetMapping("/findModelInputById")
    public AjaxResult findModelInputById(@RequestParam(value = "modelCaclId") Long modelCaclId) {
        String inputJson = "{}";
        String inputNames = null;
        ModelCaclReconstitution modelCacl = modelCaclService.selectModelCaclById(modelCaclId);
        ModelInterfaceAddress interfaceAddress = modelInterfaceAddressService.selectModelInterfaceAddressById(modelCacl.getAddressId());
        ModelReconstitution modelReconstitution = modelReconstitutionService.selectModelReconstitutionById(modelCacl.getModelId());
        ModelInputReconstitution modelInputReconstitution = new ModelInputReconstitution();
        modelInputReconstitution.setModelId(modelReconstitution.getId());
        HashMap<String, Object> resultMap = Maps.newHashMap();
        if (modelReconstitution.getAccessMode() == 0) {
            if (modelReconstitution.getId().equals(12L)) {
                {
                    JSONObject multipleContent = new JSONObject();
                    multipleContent.set("IK", 1);
                    multipleContent.set("M", 1);
                    com.alibaba.fastjson2.JSONObject jsonObject = new com.alibaba.fastjson2.JSONObject();
                    jsonObject.put("f0", 156);
                    jsonObject.put("fc", 24);
                    jsonObject.put("K", 6.1);
                    jsonObject.put("误差", 0.05);
                    jsonObject.put("BX", 1);
                    jsonObject.put("AREA", 187);
                    jsonObject.put("WT", 15);
                    jsonObject.put("DT", 0.2);
                    multipleContent.set("PAR", jsonObject);
                    JSONArray array = new JSONArray(0.0,0.0,0.0,0.0,0.0,2.0,0.03,0.08,0.12,0.15,0.12,0.1,0.08,0.07,0.06,0.05,0.04,0.03,0.02,0.01,0.01,0.01);
                    multipleContent.set("无因次单位线", array);
                    inputJson = multipleContent.toStringPretty();
                }
                {
                    JSONObject multipleContent = new JSONObject();
                    multipleContent.set("IK", "IK");
                    multipleContent.set("M", "M");
                    multipleContent.set("PAR", "PAR");
                    multipleContent.set("无因次单位线", "无因次单位线");
                    inputNames = multipleContent.toStringPretty();
                }
                resultMap.put("modelInputJson", inputJson);
                resultMap.put("modelInputNames", inputNames);
            } else if (modelReconstitution.getId().equals(13L)) {
                {
                    JSONArray array = new JSONArray();
                    {
                        JSONObject multipleContent = new JSONObject();
                        multipleContent.set("date", "19950101");
                        multipleContent.set("realrunoff", "1.58");
                        multipleContent.set("evap", "1.2");
                        multipleContent.set("cheng", "1");
                        multipleContent.set("wang", "1.1");
                        multipleContent.set("zhang", "0.7");
                        multipleContent.set("di", "0.8");
                        multipleContent.set("dong", "1.2");
                        multipleContent.set("yong", "1.2");
                        multipleContent.set("zuo", "1.3");
                        multipleContent.set("feng", "1.3");
                        multipleContent.set("tian", "1.7");
                        multipleContent.set("da", "1.1");
                        array.add(multipleContent);
                    }
                    {
                        JSONObject multipleContent = new JSONObject();
                        multipleContent.set("date", "19950102");
                        multipleContent.set("realrunoff", "1.49");
                        multipleContent.set("evap", "0.5");
                        multipleContent.set("cheng", "31.2");
                        multipleContent.set("wang", "31.4");
                        multipleContent.set("zhang", "28.3");
                        multipleContent.set("di", "30.5");
                        multipleContent.set("dong", "21.7");
                        multipleContent.set("yong", "32.9");
                        multipleContent.set("zuo", "33.8");
                        multipleContent.set("feng", "30.2");
                        multipleContent.set("tian", "37.6");
                        multipleContent.set("da", "36");
                        array.add(multipleContent);
                    }
                    inputJson = array.toString();
                }
                {
                    JSONObject multipleContent = new JSONObject();
                    multipleContent.set("IK", "IK");
                    multipleContent.set("M", "M");
                    multipleContent.set("PAR", "PAR");
                    multipleContent.set("无因次单位线", "无因次单位线");
                    inputNames = multipleContent.toStringPretty();
                }
                resultMap.put("modelInputJson", inputJson);
                resultMap.put("modelInputNames", inputNames);
            } else {
                ModelInputDO modelInputQo = new ModelInputDO();
                modelInputQo.setDelFlag(false);
                modelInputQo.setModelId(modelCacl.getModelId());
                modelInputQo.setModelVersion(modelCacl.getModelVersion());
                // 所有模型输入对象
                List<ModelInputDO> modelInputList = modelInputReconstitutionService.selectModelInputList(modelInputQo);
                JSONObject multipleContent = new JSONObject();
                JSONObject inputContent = new JSONObject();
                modelInputList.forEach((modelInput) -> {
                    multipleContent.set(modelInput.getName(), modelInput.getName());
                    String s = StrUtil.removePrefix(modelInput.getSingleContent(), "\"");
                    s = StrUtil.removeSuffix(s, "\"");
                    if (modelInput.getSingleContent().contains("[")) {
                        inputContent.set(modelInput.getName(), JSONUtil.parseArray(s));
                    } else {
                        inputContent.set(modelInput.getName(), JSONUtil.parseObj(s));
                    }
                });
                resultMap.put("modelInputList", modelInputList);
                resultMap.put("modelInputJson", inputContent.toStringPretty());
                resultMap.put("modelInputNames", multipleContent.toStringPretty());
            }
        } else {
            inputNames = interfaceAddress.getInputParameterIllustrate();
            if (modelCacl.getInputContent() == null) {
                if (modelCacl.getAddressType() == 1) {
                    inputJson = interfaceAddress.getInputParameter();
                }
            } else {
                inputJson = modelCacl.getInputContent();
            }
            resultMap.put("modelInputJson", inputJson);
            resultMap.put("modelInputNames", inputNames);
        }

        return AjaxResult.success(resultMap);
    }

    /**
     * 查看计算结果接口
     */
    @GetMapping("/findModelOutputById")
    public AjaxResult findModelOutputById(@RequestParam(value = "modelCaclId") Long modelCaclId) {
        ModelCaclReconstitution modelCacl = modelCaclService.selectModelCaclById(modelCaclId);
        ModelInterfaceAddress interfaceAddress = modelInterfaceAddressService.selectModelInterfaceAddressById(modelCacl.getAddressId());
        ModelReconstitution modelReconstitution = modelReconstitutionService.selectModelReconstitutionById(modelCacl.getModelId());
        HashMap<String, Object> resultMap = Maps.newHashMap();
        if (modelReconstitution.getAccessMode() == 0) {
            String outputJson = modelCacl.getOutputContent();
            String outputNames = "";
            String inputNames = "null";
            resultMap.put("modelOutputJson", JSONUtil.parseObj(outputJson));
            resultMap.put("modelOutputNames", outputNames);
            resultMap.put("modelInputNames", inputNames);
        } else {
            String outputJson = "{}";
            String outputNames = null;
            String inputNames = null;
            outputNames = interfaceAddress.getOutputParameterIllustrate();
            inputNames = interfaceAddress.getInputParameterIllustrate();
            if (modelCacl.getOutputContent() == null){
                if (modelCacl.getAddressType() == 1){
                    outputJson = interfaceAddress.getOutputParameter();
                }
            }else {
                outputJson = modelCacl.getOutputContent();
            }
            resultMap.put("modelOutputJson", outputJson);
            resultMap.put("modelOutputNames", outputNames);
            resultMap.put("modelInputNames", inputNames);
        }
        return AjaxResult.success(resultMap);
    }

}
