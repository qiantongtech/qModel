package tech.qiantong.qmodel.server.controller.model;

import cn.hutool.http.*;
import cn.hutool.json.*;
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
import tech.qiantong.qmodel.module.model.domain.*;
import tech.qiantong.qmodel.module.model.service.*;
import tech.qiantong.qmodel.module.model.waterResource.*;

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
@RequestMapping("/model/cacl")
public class ModelCaclController extends BaseController {
    @Autowired
    private IModelCaclService modelCaclService;

    @Autowired
    private IModelInputService modelInputService;

    @Autowired
    private IModelOutputService modelOutputService;

    @Autowired
    private IWaterResourceService waterResourceService;

    @Autowired
    private IModelService modelService;


    /**
     * 查询模型计算管理 列表
     */
    @PreAuthorize("@ss.hasPermi('model:cacl:list')")
    @GetMapping("/list")
    public TableDataInfo list(ModelCacl modelCacl) {
        startPage();
        List<ModelCacl> list = modelCaclService.selectModelCaclList(modelCacl);
        return getDataTable(list);
    }

    /**
     * 导出模型计算管理 列表
     */
    @PreAuthorize("@ss.hasPermi('model:cacl:export')")
    @Log(title = "模型计算管理 ", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelCacl modelCacl) {
        List<ModelCacl> list = modelCaclService.selectModelCaclList(modelCacl);
        ExcelUtil<ModelCacl> util = new ExcelUtil<ModelCacl>(ModelCacl.class);
        util.exportExcel(response, list, "模型计算管理 数据");
    }

    /**
     * 获取模型计算管理 详细信息
     */
    @PreAuthorize("@ss.hasPermi('model:cacl:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(modelCaclService.selectModelCaclById(id));
    }

    /**
     * 新增模型计算管理
     */
    @PreAuthorize("@ss.hasPermi('model:cacl:add')")
    @Log(title = "模型计算管理 ", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ModelCacl modelCacl) {
        modelCacl.setCreatorId(getUserId());
        modelCacl.setCreateBy(getNickName());
        return toAjax(modelCaclService.insertModelCacl(modelCacl));
    }

    /**
     * 修改模型计算管理
     */
    @PreAuthorize("@ss.hasPermi('model:cacl:edit')")
    @Log(title = "模型计算管理 ", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ModelCacl modelCacl) {
        return toAjax(modelCaclService.updateModelCacl(modelCacl));
    }

    /**
     * 删除模型计算管理
     */
    @PreAuthorize("@ss.hasPermi('model:cacl:remove')")
    @Log(title = "模型计算管理 ", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(modelCaclService.deleteModelCaclByIds(ids));
    }

    /**
     * 开始计算模型
     */
    @Log(title = "模型计算管理 ", businessType = BusinessType.DELETE)
    @PostMapping("/calculate")
    public AjaxResult calculate(@RequestBody ModelCacl modelCacl) {
        modelCacl = modelCaclService.selectModelCaclById(modelCacl.getId());
        Model model = modelService.selectModelById(modelCacl.getModelId());
        if (model.getFormat() == 1){
            HashMap<String, Object> paramMap = new HashMap<>();
            JSONObject jsonObject = new JSONObject();
            String url = "";
            if (modelCacl.getInputContent() == null){
                ModelInput modelInput = new ModelInput();
                modelInput.setModelId(model.getId());
                List<ModelInput> modelInputList = modelInputService.selectModelInputList(modelInput);
                for (ModelInput input : modelInputList) {
                    if (input.getType() == 0){
                        input.setSingleContent(input.getSingleContent().replace("\"", ""));
                        paramMap.put(input.getEngName(),input.getSingleContent());
                    }
                }
                url = HttpUtil.urlWithForm(model.getUploadInterface(), paramMap, null, false);
            }else {
                jsonObject = JSONUtil.parseObj(modelCacl.getInputContent());
                url = HttpUtil.urlWithForm(model.getUploadInterface(), jsonObject, null, false);
            }
            String result = HttpUtil.get(url);
            JSONArray resultJsonArray = JSONUtil.parseArray(result);
            JSONArray outputArray = new JSONArray();
            if ("start".equals(resultJsonArray.get(0))){
                String data = resultJsonArray.get(1).toString();
                JSONObject dataJsonObj = JSONUtil.parseObj(data.substring(data.indexOf("{"), data.indexOf("}") + 1));
                if ( "2".equals(jsonObject.get("P1")) || "2".equals(paramMap.get("P1"))){
                    String substringData = data.substring(data.indexOf("}") + 2, data.length() - 1);
                    dataJsonObj.set(substringData.substring(0,substringData.indexOf(":")),substringData.substring(substringData.indexOf(":") + 1).trim());
                }else {
                    JSONArray objects = JSONUtil.parseArray(data.substring(data.indexOf("}") + 1));
                    for (Object object : objects) {
                        String replace = object.toString().replace("\"", "");
                        dataJsonObj.set(replace.substring(0,replace.indexOf(":")),replace.substring(replace.indexOf(":") + 1).trim());
                    }
                }
                outputArray.set(dataJsonObj);
            }else{
                return error(resultJsonArray.get(0).toString());
            }
            if (outputArray.size() > 0){
                ModelCacl modelCaclUpdateOutput = new ModelCacl();
                modelCaclUpdateOutput.setId(modelCacl.getId());
                modelCaclUpdateOutput.setOutputContent(outputArray.toString());
                modelCacl.setStartTime(DateUtils.getNowDate());
                modelCacl.setStatus(1);
                new OneThread(modelCacl.getId()).start();
                modelCaclService.updateModelCacl(modelCaclUpdateOutput);
            }
        }else {
            modelCacl.setStartTime(DateUtils.getNowDate());
            modelCacl.setStatus(1);
            modelCaclService.updateModelCacl(modelCacl);
            new OneThread(modelCacl.getId()).start();
        }
        return success();
    }


    /**
     * 设置参数接口 --查看
     */
    @GetMapping("/findModelInputById")
    public AjaxResult findModelInputById(@RequestParam(value = "modelCaclId") Long modelCaclId) {
        ModelCacl modelCacl = modelCaclService.selectModelCaclById(modelCaclId);
        ModelInput modelInputQo = new ModelInput();
        modelInputQo.setDelFlag(false);
        modelInputQo.setModelId(modelCacl.getModelId());
        modelInputQo.setModelVersion(modelCacl.getModelVersion());
        // 所有模型输入对象
        List<ModelInput> modelInputList = modelInputService.selectModelInputList(modelInputQo);
        // 模型计算拿到输入内容
//        String inputContent = modelCacl.getInputContent();
//        JSONArray inputContentJsonArray = JSONUtil.parseArray(inputContent);
        // 将输入内容转为List集合
//        List<JSONObject> jsonObjectList = inputContentJsonArray.toList(JSONObject.class);
        //
        /*Map<String, List<JSONObject>> inputMap = jsonObjectList.stream().collect(Collectors.groupingBy(entries -> entries.getStr("inputId")));
        for (ModelInput modelInput : modelInputList) {
            List<JSONObject> inputContentList = inputMap.get(modelInput.getId().toString());
            if (ListUtil.isNotEmpty(inputContentList)) {
                modelInput.setInputContent(inputContentList.get(0).toString());
            }
        }*/
        HashMap<String, Object> resultMap = Maps.newHashMap();
        resultMap.put("modelCacl", modelCacl);
        resultMap.put("modelInputList", modelInputList);
        return AjaxResult.success(resultMap);
    }

    /**
     * 查看计算结果接口
     */
    @GetMapping("/findModelOutputById")
    public AjaxResult findModelOutputById(@RequestParam(value = "modelCaclId") Long modelCaclId) {
        ModelCacl modelCacl = modelCaclService.selectModelCaclById(modelCaclId);

        ModelOutput modelOutputQo = new ModelOutput();
        modelOutputQo.setDelFlag(false);
        modelOutputQo.setModelId(modelCacl.getModelId());
        modelOutputQo.setModelVersion(modelCacl.getModelVersion());
        // 所有模型输入对象
        List<ModelOutput> modelOutputList = modelOutputService.selectModelOutputList(modelOutputQo);
        return AjaxResult.success(modelOutputList);
    }

    class OneThread extends Thread {
        private Long id;

        public OneThread(Long id){
            this.id = id;
        }

        @Override
        public void run() {
            try {
                waterResourceService.runProcess(null);
                ModelCacl model = new ModelCacl();
                model.setId(id);
                model.setStatus(2);
                model.setEndTime(DateUtils.getNowDate());
                modelCaclService.updateModelCacl(model);
                logger.info("执行完毕");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

    }
}
