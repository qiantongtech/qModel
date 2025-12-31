package tech.qiantong.qmodel.server.controller.model;

import cn.hutool.core.io.file.*;
import com.alibaba.fastjson2.*;
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

import javax.servlet.http.*;
import java.util.*;

/**
 * 模型输入管理 Controller
 *
 * @author YWG
 * @date 2023-09-14
 */
@RestController
@RequestMapping("/model/input")
public class ModelInputController extends BaseController {
    @Autowired
    private IModelInputService modelInputService;

    @Autowired
    private IModelService modelService;

    @Autowired
    private IModelVersionService modelVersionService;


//    @Value("${model.filePathRoot}")
    private String filePathRoot = "D:\\model\\chengxuhuizong11.5";

    /**
     * 查询模型输入管理 列表
     */
    @PreAuthorize("@ss.hasPermi('model:input:list')")
    @GetMapping("/list")
    public TableDataInfo list(ModelInput modelInput) {
        startPage();
        List<ModelInput> list = modelInputService.selectModelInputList(modelInput);
        return getDataTable(list);
    }

    /**
     * 导出模型输入管理 列表
     */
    @PreAuthorize("@ss.hasPermi('model:input:export')")
    @Log(title = "模型输入管理 ", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelInput modelInput) {
        List<ModelInput> list = modelInputService.selectModelInputList(modelInput);
        ExcelUtil<ModelInput> util = new ExcelUtil<ModelInput>(ModelInput.class);
        util.exportExcel(response, list, "模型输入管理 数据");
    }

    /**
     * 获取模型输入管理 详细信息
     */
    @PreAuthorize("@ss.hasPermi('model:input:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(modelInputService.selectModelInputById(id));
    }

    /**
     * 新增模型输入管理
     */
    @PreAuthorize("@ss.hasPermi('model:input:add')")
    @Log(title = "模型输入管理 ", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ModelInput modelInput) {
        modelInput.setCreateBy(getNickName());
        return toAjax(modelInputService.insertModelInput(modelInput));
    }

    /**
     * 修改模型输入管理
     */
    @PreAuthorize("@ss.hasPermi('model:input:edit')")
    @Log(title = "模型输入管理 ", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ModelInput modelInput) {
        return toAjax(modelInputService.updateModelInput(modelInput));
    }

    /**
     * 删除模型输入管理
     */
    @PreAuthorize("@ss.hasPermi('model:input:remove')")
    @Log(title = "模型输入管理 ", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(modelInputService.deleteModelInputByIds(ids));
    }


    /**
     * 查询所有模型
     */
    @PostMapping("/findAllModel")
    public AjaxResult findAllModel(@RequestBody Model model) {
        model.setDelFlag(false);
        return AjaxResult.success(modelService.selectModelList(model));
    }


    /**
     * 查询所有模型版本
     */
    @PostMapping("/findAllModelVersion")
    public AjaxResult findAllModelVersion(@RequestBody ModelVersion modelVersion) {
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

    @GetMapping("/getAllInputJson")
    public AjaxResult getAllInputJson(){
        String path =  filePathRoot + "\\input\\";
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("小山口流量", readInputFile(path+ "qqsp_xsk.dat"));
        jsonObject.put("第一枢纽地下水补给", readInputFile(path+  "Qin_diyishuniu_dixiashuibugei.dat"));
        jsonObject.put("第二枢纽地下水补给", readInputFile(path+  "Qin_diershuniu_dixiashuibugei.dat"));
        jsonObject.put("黄水沟流量", readInputFile(path+ "Qin_huangshuigou.dat"));
        jsonObject.put("乌拉斯台河流量", readInputFile(path+  "Qin_wulasitaihe.dat"));
        jsonObject.put("宝浪苏木东支河道损失", readInputFile(path+  "Qout_baolangsumu_dongzhi_hedaoshunshi.dat"));
        jsonObject.put("宝浪苏木西支河道损失", readInputFile(path+  "Qout_baolangsumu_xizhi_hedaoshunshi.dat"));
        jsonObject.put("第一枢纽北干分水", readInputFile(path+  "Qout_diyishuniu_beiganfenshui.dat"));
        jsonObject.put("第一枢纽南干分水", readInputFile(path+  "Qout_diyishuniu_nanganfenshui.dat"));
        jsonObject.put("第二枢纽北干分水", readInputFile(path+  "Qout_diershuniu_beiganfenshui.dat"));
        jsonObject.put("第二枢纽南干分水", readInputFile(path+  "Qout_diershuniu_nanganfenshui.dat"));
        jsonObject.put("第一枢纽河道损失", readInputFile(path+  "Qout_diyishuniu_hedaoshunshi.dat"));
        jsonObject.put("第二枢纽河道损失", readInputFile(path+  "Qout_diershuniu_hedaoshunshi.dat"));
        return AjaxResult.success(jsonObject);
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
//                objects.add(s.trim());
//            }
//            array.add(objects);
        }
        return array;
    }

    public static void main(String[] args) {

        String path = "C:\\Users\\MeltyLand\\Desktop\\chengxuhuizong11.5\\input";
        ModelInputController inputController = new ModelInputController();
        inputController.getAllInputJson();
    }
}
