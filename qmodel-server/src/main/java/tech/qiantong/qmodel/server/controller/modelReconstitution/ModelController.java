package tech.qiantong.qmodel.server.controller.modelReconstitution;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import tech.qiantong.qmodel.common.annotation.Log;
import tech.qiantong.qmodel.common.core.controller.BaseController;
import tech.qiantong.qmodel.common.core.domain.AjaxResult;
import tech.qiantong.qmodel.common.core.page.TableDataInfo;
import tech.qiantong.qmodel.common.enums.BusinessType;
import tech.qiantong.qmodel.common.utils.poi.ExcelUtil;
import tech.qiantong.qmodel.module.model.domain.*;
import tech.qiantong.qmodel.module.model.service.*;
import tech.qiantong.qmodel.module.system.service.ISysDictDataService;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 模型管理 Controller
 *
 * @author YWG
 * @date 2023-09-14
 */
@RestController
@RequestMapping("/model/model")
public class ModelController extends BaseController {
    @Autowired
    private IModelService modelService;

    @Autowired
    private IModelVersionService modelVersionService;

    @Autowired
    private IModelHistoryService modelHistoryService;

    @Autowired
    private IModelClassifyService modelClassifyService;

    @Autowired
    private ISysDictDataService sysDictDataService;

    @Autowired
    private IModelOperateService modelOperateService;

    /**
     * 查询模型管理 列表
     */
    @PreAuthorize("@ss.hasPermi('model:model:list')")
    @GetMapping("/list")
    public TableDataInfo list(Model model) {
        ModelClassify classify = modelClassifyService.selectModelClassifyById(model.getClassifyId());
        if (classify != null ) {
            ModelClassify modelClassify = new ModelClassify();
            modelClassify.setParentId(classify.getId());
            List<ModelClassify> classifyList = modelClassifyService.selectModelClassifyList(modelClassify);
            classifyList.add(classify);
            if (CollUtil.isNotEmpty(classifyList)) {
                model.setParamByKey("model" , classifyList);
            }
            model.setClassifyId(null);
        }
        startPage();
        List<Model> list = modelService.selectModelList(model);
        return getDataTable(list);
    }

    /**
     * 导出模型管理 列表
     */
    @PreAuthorize("@ss.hasPermi('model:model:export')")
    @Log(title = "模型管理 ", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Model model) {
        List<Model> list = modelService.selectModelList(model);
        ExcelUtil<Model> util = new ExcelUtil<Model>(Model.class);
        util.exportExcel(response, list, "模型管理 数据");
    }

    /**
     * 获取模型管理 详细信息
     */
    @PreAuthorize("@ss.hasPermi('model:model:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(modelService.selectModelById(id));
    }

    /**
     * 新增模型管理
     */
    @PreAuthorize("@ss.hasPermi('model:model:add')")
    @Log(title = "模型管理 ", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Model model, @RequestBody ModelVersion modelVersion) {
        //设置初始版本
        model.setVersion("1");
        model.setUploadStatus(1);
        model.setCreatorId(getUserId());
        model.setCreateBy(getNickName());
        int insertModel = modelService.insertModel(model);
        //设置模型id
        modelVersion.setModelId(model.getId());
        //设置模型名称
        modelVersion.setModelName(model.getName());
        //设置接口格式 0 文件， 1 接口
        if (model.getFormat() == 0) {
            modelVersion.setFileAddress(model.getUploadFile());
        }
        if (model.getFormat() == 1) {
            modelVersion.setInterfaceAddress(model.getUploadInterface());
        }
        //设置状态
        modelVersion.setStatus(model.getUploadStatus());
        //版本设置
        modelVersion.setVersion(model.getVersion());
        //数据库插入数据
        modelVersionService.insertModelVersion(modelVersion);
        // 添加操作历史
        if (model !=null) {
            ModelHistory modelHistory = new ModelHistory();
            modelHistory.setModelId(model.getId());
            modelHistory.setModelName(model.getName());
            modelHistory.setContext("新增了"+model.getName());
            modelHistory.setModelVersion(model.getVersion());
            modelHistory.setUpdatorId(getUserId());
            modelHistory.setUpdateBy(getNickName());
            modelHistory.setStartTime(model.getCreateTime());
            modelHistoryService.insertModelHistory(modelHistory);

            ModelOperate operate = new ModelOperate();
            operate.setCompanyId(model.getCompanyId());
            operate.setCreatorId(getUserId());
            operate.setCreateBy(getNickName());
            operate.setModuleName(model.getName());
            operate.setContent("新增了"+model.getName());
            operate.setType(0);
            JSONObject object = new JSONObject();
            object.set("模型名称", model.getName());
            object.set("模型分类", modelClassifyService.selectModelClassifyById(model.getClassifyId().longValue()).getName());
//            object.set("所属模型类别", sysDictDataService.selectDictLabel(
//                    "model_waterconserve_modelmanage_type", model.getType().toString()));
            object.set("模型格式", model.getFormat() == 0 ? "文件格式" : "接口格式");
            object.set("版本发布说明", modelVersion.getDescription());
            object.set("模型介绍", model.getRemark() == null ? " -- " : model.getRemark());
            operate.setRespContent(object.toString());
            modelOperateService.insertModelOperate(operate);
        }
        return toAjax(insertModel);
    }

    /**
     * 修改模型管理基础信息（版本不会自增）
     */
    @PreAuthorize("@ss.hasPermi('model:model:edit')")
    @Log(title = "模型管理 ", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Model model) {
        if (model != null) {
            Model originModel = modelService.selectModelById(model.getId());
            ModelHistory modelHistory = new ModelHistory();
            modelHistory.setModelId(model.getId());
            modelHistory.setModelName(model.getName());
            modelHistory.setContext("修改了"+model.getName()+"基本信息");
            modelHistory.setModelVersion(model.getVersion());
            modelHistory.setUpdatorId(getUserId());
            modelHistory.setUpdateBy(getNickName());
            modelHistoryService.insertModelHistory(modelHistory);

            ModelOperate operate = new ModelOperate();
            operate.setCompanyId(model.getCompanyId());
            operate.setCreatorId(getUserId());
            operate.setCreateBy(getNickName());
            operate.setModuleName(model.getName());
            operate.setContent("新增了"+model.getName());
            operate.setType(1);
            {
                JSONObject object = new JSONObject();
                object.set("模型名称", model.getName());
                object.set("模型分类", modelClassifyService.selectModelClassifyById(model.getClassifyId()).getName());
//                object.set("所属模型类别", sysDictDataService.selectDictLabel(
//                        "model_waterconserve_modelmanage_type", model.getType().toString()));
                object.set("模型介绍", model.getRemark() == null ? " -- " : model.getRemark());
                operate.setRespContent(object.toString());
            }
            {
                JSONObject object = new JSONObject();
                object.set("模型名称", originModel.getName());
                object.set("模型分类", modelClassifyService.selectModelClassifyById(originModel.getClassifyId()).getName());
//                object.set("所属模型类别", sysDictDataService.selectDictLabel(
//                        "model_waterconserve_modelmanage_type", originModel.getType().toString()));
                object.set("模型介绍", model.getRemark() == null ? " -- " : originModel.getRemark());
                operate.setReqContent(object.toString());
            }
            modelOperateService.insertModelOperate(operate);
        }
        return toAjax(modelService.updateModel(model));
    }

    /**
     * 修改模型管理详细信息（版本会自增）
     */
    @PreAuthorize("@ss.hasPermi('model:model:edit')")
    @Log(title = "模型管理 ", businessType = BusinessType.UPDATE)
    @PutMapping("/update")
    public AjaxResult update(@RequestBody Model model, @RequestBody ModelVersion modelVersion) {
        //设置模型id
        modelVersion.setModelId(model.getId());
        //设置模型名称
        modelVersion.setModelName(model.getName());
        //设置接口格式 0 文件， 1 接口
        if (model.getFormat() == 0) {
            modelVersion.setFileAddress(model.getUploadFile());
            modelVersion.setInterfaceAddress(null);
        }
        if (model.getFormat() == 1) {
            modelVersion.setInterfaceAddress(model.getInterfaceAddress());
            modelVersion.setFileAddress(null);
        }
        //设置状态
        modelVersion.setStatus(0);
        //版本设置
        int version = Integer.parseInt(model.getVersion()) + 1;
        modelVersion.setVersion(String.valueOf(version));
        //数据库插入数据
        modelVersionService.insertModelVersion(modelVersion);
        model.setVersion(String.valueOf(version));
        model.setUploadStatus(0);
        //接口格式和文件格式转换，清楚另一种的数据
        if (model.getFormat() == 0) {
            model.setUploadInterface(null);
        }
        if (model.getFormat() == 1) {
            model.setUploadFile(null);
        }

        if (model != null) {
            ModelHistory modelHistory = new ModelHistory();
            modelHistory.setModelId(model.getId());
            modelHistory.setModelName(model.getName());
            modelHistory.setContext("修改了"+model.getName()+"详细信息");
            modelHistory.setModelVersion(model.getVersion());
            modelHistory.setUpdatorId(getUserId());
            modelHistory.setUpdateBy(getNickName());
            modelHistoryService.insertModelHistory(modelHistory);
        }
        return toAjax(modelService.updateModel(model));
    }

    /**
     * 删除模型管理
     */
    @PreAuthorize("@ss.hasPermi('model:model:remove')")
    @Log(title = "模型管理 ", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        for (Long id : ids) {
            Model model = modelService.selectModelById(id);
            if (model != null) {
                ModelHistory modelHistory = new ModelHistory();
                modelHistory.setModelId(model.getId());
                modelHistory.setModelName(model.getName());
                modelHistory.setContext("删除了"+model.getName());
                modelHistory.setModelVersion(model.getVersion());
                modelHistory.setUpdatorId(getUserId());
                modelHistory.setUpdateBy(getNickName());
                modelHistoryService.insertModelHistory(modelHistory);
            }
        }

        return toAjax(modelService.deleteModelByIds(ids));
    }
}
