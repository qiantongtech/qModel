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

package tech.qiantong.qmodel.module.model.controller.admin.cacl;

import cn.hutool.core.io.file.FileReader;
import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HttpRequest;
import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.alibaba.fastjson2.JSONArray;
import com.google.common.collect.Maps;
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
import tech.qiantong.qmodel.common.core.domain.R;
import tech.qiantong.qmodel.common.core.page.PageParam;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.enums.BusinessType;
import tech.qiantong.qmodel.common.utils.DateUtils;
import tech.qiantong.qmodel.common.utils.StringUtils;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.common.utils.poi.ExcelUtil;
import tech.qiantong.qmodel.module.model.controller.admin.cacl.vo.ModelCaclSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelCacl.vo.ModelCaclPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelCacl.vo.ModelCaclRespVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.cacl.ModelCaclDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.input.ModelInputDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.interfaceAddress.ModelInterfaceAddressDO;
import tech.qiantong.qmodel.module.model.domain.ModelCacl;
import tech.qiantong.qmodel.module.model.domain.ModelInput;
import tech.qiantong.qmodel.module.model.enums.RequestMethodEnum;
import tech.qiantong.qmodel.module.model.service.cacl.IModelCaclService;
import tech.qiantong.qmodel.module.model.service.history.IModelHistoryService;
import tech.qiantong.qmodel.module.model.service.input.IModelInputService;
import tech.qiantong.qmodel.module.model.service.interfaceAddress.IModelInterfaceAddressService;
import tech.qiantong.qmodel.module.model.service.model.IModelService;
import tech.qiantong.qmodel.module.model.service.modelReconstitution.IModelReconstitutionService;
import tech.qiantong.qmodel.module.model.enums.AccessModeEnum;
import tech.qiantong.qmodel.module.modelReconstitution.domain.ModelReconstitution;
import tech.qiantong.qmodel.module.modelReconstitution.service.IModelVirtualCalcService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 模型计算重构Controller
 *
 * @author qModel
 * @date 2026-01-12
 */
@Tag(name = "模型计算重构")
@RestController
@RequestMapping("/model/cacl")
@Validated
public class ModelCaclController extends BaseController {
    @Resource
    private IModelCaclService modelCaclService;

    @Resource
    private IModelReconstitutionService modelReconstitutionService;

    @Resource
    private IModelInterfaceAddressService modelInterfaceAddressService;

    @Resource
    private IModelHistoryService modelHistoryService;

    @Resource
    private IModelInputService modelInputReconstitutionService;

    @Resource
    private IModelVirtualCalcService modelVirtualCalcService;

    @Resource
    private IModelService modelService;

    @Operation(summary = "查询模型计算重构列表")
    @PreAuthorize("@ss.hasPermi('model:modelCacl:cacl:list')")
    @GetMapping("/list")
    public CommonResult<PageResult<ModelCaclRespVO>> list(ModelCaclPageReqVO modelCacl) {
        PageResult<ModelCaclDO> page = modelCaclService.getModelCaclPage(modelCacl);
        return CommonResult.success(BeanUtils.toBean(page, ModelCaclRespVO.class));
    }

    @Operation(summary = "导出模型计算重构列表")
    @PreAuthorize("@ss.hasPermi('model:modelCacl:cacl:export')")
    @Log(title = "模型计算重构", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelCaclPageReqVO exportReqVO) {
        exportReqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<ModelCaclDO> list = (List<ModelCaclDO>) modelCaclService.getModelCaclPage(exportReqVO).getRows();
        ExcelUtil<ModelCaclRespVO> util = new ExcelUtil<>(ModelCaclRespVO.class);
        util.exportExcel(response, BeanUtils.toBean(list, ModelCaclRespVO.class), "模型计算数据");
    }

    @Operation(summary = "导入模型计算重构列表")
    @PreAuthorize("@ss.hasPermi('model:modelCacl:cacl:import')")
    @Log(title = "模型计算重构", businessType = BusinessType.IMPORT)
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<ModelCaclRespVO> util = new ExcelUtil<>(ModelCaclRespVO.class);
        List<ModelCaclRespVO> importExcelList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = modelCaclService.importModelCacl(importExcelList, updateSupport, operName);
        return success(message);
    }

    @Operation(summary = "获取模型计算重构详细信息")
    @PreAuthorize("@ss.hasPermi('model:modelCacl:cacl:query')")
    @GetMapping(value = "/{id}")
    public CommonResult<ModelCaclRespVO> getInfo(@PathVariable("id") Long id) {
        ModelCaclDO modelCaclDO = modelCaclService.getModelCaclById(id);
        if (AccessModeEnum.API_INTERFACE.getValue().equals(modelCaclDO.getAddressType())){
            ModelInterfaceAddressDO interfaceAddress = modelInterfaceAddressService.getModelInterfaceAddressById(modelCaclDO.getAddressId());
            modelCaclDO.setAddress(interfaceAddress.getInterfaceAddress());
            modelCaclDO.setRequestMethod(interfaceAddress.getRequestMethod());
        }
        return CommonResult.success(BeanUtils.toBean(modelCaclDO, ModelCaclRespVO.class));
    }

    @Operation(summary = "新增模型计算重构")
    @PreAuthorize("@ss.hasPermi('model:modelCacl:cacl:add')")
    @Log(title = "模型计算重构", businessType = BusinessType.INSERT)
    @PostMapping
    public CommonResult<Long> add(@Valid @RequestBody ModelCaclSaveReqVO modelCacl) {
        if (modelCacl != null) {
            modelHistoryService.createModelHistory(modelCacl.getModelId(), modelCacl.getModelName(), "添加了一条【" + modelCacl.getName() + "】模型计算", modelCacl.getModelVersion(), getUserId(), getNickName());
        }
        return CommonResult.toAjax(modelCaclService.createModelCacl(modelCacl));
    }

    @Operation(summary = "修改模型计算重构")
    @PreAuthorize("@ss.hasPermi('model:modelCacl:cacl:edit')")
    @Log(title = "模型计算重构", businessType = BusinessType.UPDATE)
    @PutMapping
    public CommonResult<Integer> edit(@Valid @RequestBody ModelCaclSaveReqVO modelCacl) {
        if (modelCacl != null) {
            modelHistoryService.createModelHistory(modelCacl.getModelId(), modelCacl.getModelName(), "修改了【" + modelCacl.getName() + "】基本信息", modelCacl.getModelVersion(), getUserId(), getNickName());
        }
        return CommonResult.toAjax(modelCaclService.updateModelCacl(modelCacl));
    }

    @Operation(summary = "删除模型计算重构")
    @PreAuthorize("@ss.hasPermi('model:modelCacl:cacl:remove')")
    @Log(title = "模型计算重构", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public CommonResult<Integer> remove(@PathVariable Long[] ids) {
        return CommonResult.toAjax(modelCaclService.removeModelCacl(Arrays.asList(ids)));
    }

    /**
     * 开始计算模型
     */
    @Log(title = "模型计算管理", businessType = BusinessType.UPDATE)
    @GetMapping("/calculate")
    public R calculate(@RequestParam(value = "modelCaclId") Long modelCaclId) throws IOException {
        ModelCaclDO modelCacl = modelCaclService.getModelCaclById(modelCaclId);
        ModelReconstitution model = modelReconstitutionService.selectModelReconstitutionById(modelCacl.getModelId());
        if (AccessModeEnum.API_INTERFACE.getValue().equals(model.getAccessMode())) {
            JSONObject jsonObject = new JSONObject();
            String result = "";
            ModelInterfaceAddressDO interfaceAddress = modelInterfaceAddressService.getModelInterfaceAddressById(modelCacl.getAddressId());
            if (modelCacl.getInputContent() == null) {
                jsonObject = JSONUtil.parseObj(interfaceAddress.getInputParameter());
            } else {
                jsonObject = JSONUtil.parseObj(modelCacl.getInputContent());
            }
            Map<String, String> headersMap = new HashMap<>();
            headersMap.put("userId", getUserId().toString());
            RequestMethodEnum requestMethod = RequestMethodEnum.getByValue(interfaceAddress.getRequestMethod());
            switch (requestMethod) {
                case GET:
                    String url = HttpUtil.urlWithForm(interfaceAddress.getInterfaceAddress(), jsonObject, null, false);
                    result = HttpUtil.get(url);
                    break;
                case POST:
                    result = HttpRequest.post(interfaceAddress.getInterfaceAddress()).addHeaders(headersMap).body(JSONUtil.toJsonStr(jsonObject), "application/json").execute().body();
                    break;
                case PUT:
                    result = HttpRequest.put(interfaceAddress.getInterfaceAddress()).addHeaders(headersMap).body(JSONUtil.toJsonStr(jsonObject), "application/json").execute().body();
                    break;
                case DELETE:
                    result = HttpRequest.delete(interfaceAddress.getInterfaceAddress()).addHeaders(headersMap).execute().body();
                    break;
                default:
                    break;
            }
            modelCacl.setStartTime(DateUtils.getNowDate());
            modelCacl.setEndTime(DateUtils.getNowDate());
            modelCacl.setStatus(1);
            modelCacl.setOutputContent(result);
            modelCaclService.updateModelCacl(BeanUtils.toBean(modelCacl, ModelCaclSaveReqVO.class));
        } else {
            if (model.getId().equals(12L)) {
                modelCacl.setStartTime(DateUtils.getNowDate());
                modelCacl.setEndTime(DateUtils.getNowDate());
                modelCacl.setStatus(1);
                modelCacl.setOutputContent(modelVirtualCalcService.getOneResult().toJSONString());
                modelCaclService.updateModelCacl(BeanUtils.toBean(modelCacl, ModelCaclSaveReqVO.class));
            }
            if (model.getId().equals(13L)) {
                modelCacl.setStartTime(DateUtils.getNowDate());
                modelCacl.setEndTime(DateUtils.getNowDate());
                modelCacl.setStatus(1);
                modelCacl.setOutputContent(modelVirtualCalcService.getTwoResult().toJSONString());
                modelCaclService.updateModelCacl(BeanUtils.toBean(modelCacl, ModelCaclSaveReqVO.class));
            }
            if (model.getId().equals(28L) || model.getId() > 28L) {
                FileReader reader = new FileReader("/data/jgst/jgst.chaoshen.20250113/data_output.json");
                String join = StringUtils.join(reader.readLines(), " ");
                join = StrUtil.removePrefix(join, "\"");
                join = StrUtil.removeSuffix(join, "\"");
                modelCacl.setOutputContent((StrUtil.removeAll(join, "\\n").replace("\\\"", "'").replaceAll(" ", "")));
                modelCacl.setStartTime(DateUtils.getNowDate());
                modelCacl.setEndTime(DateUtils.getNowDate());
                modelCacl.setStatus(1);
                modelCaclService.updateModelCacl(BeanUtils.toBean(modelCacl, ModelCaclSaveReqVO.class));
            }
        }
        return R.ok();
    }

    /**
     * 设置参数接口 --查看
     */
    @GetMapping("/findModelInputById")
    public R findModelInputById(@RequestParam(value = "modelCaclId") Long modelCaclId) {
        String inputJson = "{}";
        String inputNames = null;
        ModelCaclDO modelCacl = modelCaclService.getModelCaclById(modelCaclId);
        ModelInterfaceAddressDO interfaceAddress = modelInterfaceAddressService.getModelInterfaceAddressById(modelCacl.getAddressId());
        ModelReconstitution modelReconstitution = modelReconstitutionService.selectModelReconstitutionById(modelCacl.getModelId());

        HashMap<String, Object> resultMap = Maps.newHashMap();
        if (AccessModeEnum.FILE.getValue().equals(modelReconstitution.getAccessMode())) {
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
                    JSONArray array = new JSONArray(0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 0.03, 0.08, 0.12, 0.15, 0.12, 0.1, 0.08, 0.07, 0.06, 0.05, 0.04, 0.03, 0.02, 0.01, 0.01, 0.01);
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
                if (modelCacl.getAddressType() != null && modelCacl.getAddressType().equals(1L)) {
                    inputJson = interfaceAddress.getInputParameter();
                }
            } else {
                inputJson = modelCacl.getInputContent();
            }
            resultMap.put("modelInputJson", inputJson);
            resultMap.put("modelInputNames", inputNames);
        }

        return R.ok(resultMap);
    }

    /**
     * 设置参数接口 --查看
     */
//    @GetMapping("/findModelInputById")
//    public AjaxResult findModelInputById(@RequestParam(value = "modelCaclId") Long modelCaclId) {
//        ModelCaclDO modelCacl = modelCaclService.getModelCaclById(modelCaclId);
//        ModelInputDO modelInputQo = new ModelInputDO();
//        modelInputQo.setDelFlag(false);
//        modelInputQo.setModelId(modelCacl.getModelId());
//        modelInputQo.setModelVersion(modelCacl.getModelVersion());
//        // 所有模型输入对象
//        List<ModelInputDO> modelInputList = modelInputReconstitutionService.selectModelInputList(modelInputQo);
//        HashMap<String, Object> resultMap = Maps.newHashMap();
//        resultMap.put("modelCacl", modelCacl);
//        resultMap.put("modelInputList", modelInputList);
//        return AjaxResult.success(resultMap);
//    }

    /**
     * 查看计算结果接口
     */
    @GetMapping("/findModelOutputById")
    public R findModelOutputById(@RequestParam(value = "modelCaclId") Long modelCaclId) {
        ModelCaclDO modelCacl = modelCaclService.getModelCaclById(modelCaclId);
        ModelInterfaceAddressDO interfaceAddress = modelInterfaceAddressService.getModelInterfaceAddressById(modelCacl.getAddressId());
        ModelReconstitution modelReconstitution = modelReconstitutionService.selectModelReconstitutionById(modelCacl.getModelId());
        HashMap<String, Object> resultMap = Maps.newHashMap();
        if (AccessModeEnum.FILE.getValue().equals(modelReconstitution.getAccessMode())) {
            String outputJson = modelCacl.getOutputContent();
            String outputNames = "";
            String inputNames = "null";
            resultMap.put("modelOutputJson", outputJson);
            resultMap.put("modelOutputNames", outputNames);
            resultMap.put("modelInputNames", inputNames);
        } else {
            String outputJson = "{}";
            String outputNames = null;
            String inputNames = null;
            outputNames = interfaceAddress.getOutputParameterIllustrate();
            inputNames = interfaceAddress.getInputParameterIllustrate();
            if (modelCacl.getOutputContent() == null) {
                if (modelCacl.getAddressType() != null && modelCacl.getAddressType().equals(1L)) {
                    outputJson = interfaceAddress.getOutputParameter();
                }
            } else {
                outputJson = modelCacl.getOutputContent();
            }
            resultMap.put("modelOutputJson", outputJson);
            resultMap.put("modelOutputNames", outputNames);
            resultMap.put("modelInputNames", inputNames);
        }
        return R.ok(resultMap);
    }

}
