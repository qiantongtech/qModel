package tech.qiantong.qmodel.server.controller.model;

import cn.hutool.json.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.web.bind.annotation.*;
import tech.qiantong.qmodel.common.annotation.*;
import tech.qiantong.qmodel.common.core.controller.*;
import tech.qiantong.qmodel.common.core.domain.*;
import tech.qiantong.qmodel.common.core.page.*;
import tech.qiantong.qmodel.common.enums.*;
import tech.qiantong.qmodel.common.utils.poi.*;
import tech.qiantong.qmodel.module.model.domain.*;
import tech.qiantong.qmodel.module.model.service.*;

import javax.servlet.http.*;
import java.util.*;

/**
 * 版本管理Controller
 *
 * @author surge
 * @date 2023-09-15
 */
@RestController
@RequestMapping("/model/version")
public class ModelVersionController extends BaseController {
    @Autowired
    private IModelVersionService modelVersionService;

    @Autowired
    private IModelService modelService;

    @Autowired
    private IModelHistoryService modelHistoryService;

    @Autowired
    private IModelOperateService modelOperateService;
    /**
     * 查询版本管理列表
     */
    @PreAuthorize("@ss.hasPermi('model:version:list')")
    @GetMapping("/list")
    public TableDataInfo list(ModelVersion modelVersion) {
        startPage();
//        modelVersion.setSchoolId(super.getSchoolId());
        List<ModelVersion> list = modelVersionService.selectModelVersionList(modelVersion);
        return getDataTable(list);
    }

    /**
     * 查询版本管理列表
     */
    @PreAuthorize("@ss.hasPermi('model:version:list')")
    @GetMapping("/VersionList")
    public TableDataInfo getList(ModelVersion modelVersion) {
        Long modelId = modelVersion.getModelId();
        startPage();
        List<ModelVersion> list = modelVersionService.selectMVList(modelId);
        return getDataTable(list);
    }

    /**
     * 导出版本管理列表
     */
    @PreAuthorize("@ss.hasPermi('model:version:export')")
    @Log(title = "版本管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelVersion modelVersion) {
//        modelVersion.setSchoolId(super.getSchoolId());
        List<ModelVersion> list = modelVersionService.selectModelVersionList(modelVersion);
        ExcelUtil<ModelVersion> util = new ExcelUtil<ModelVersion>(ModelVersion.class);
        util.exportExcel(response, list, "版本管理数据");
    }

    /**
     * 获取版本管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('model:version:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(modelVersionService.selectModelVersionById(id));
    }

    /**
     * 新增版本管理
     */
    @PreAuthorize("@ss.hasPermi('model:version:add')")
    @Log(title = "版本管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ModelVersion modelVersion) {
//        modelVersion.setSchoolId(super.getSchoolId());
        modelVersion.setCreatorId(getUserId());
        modelVersion.setCreateBy(getNickName());
        modelVersion.setStatus(0);
        int version = modelVersionService.selectMVList(modelVersion.getModelId()).stream()
                .mapToInt(maxVersion -> Integer.parseInt(maxVersion.getVersion())).max().orElse(1);
        modelVersion.setVersion(String.valueOf(version + 1));
        if (modelVersion != null) {
            ModelHistory modelHistory = new ModelHistory();
            modelHistory.setModelId(modelVersion.getModelId());
            modelHistory.setModelName(modelVersion.getModelName());
            modelHistory.setContext("新增了" + modelVersion.getModelName() + "一个版本");
            //获取最大版本号
            modelHistory.setModelVersion(String.valueOf(version + 1));
            modelHistory.setUpdatorId(getUserId());
            modelHistory.setUpdateBy(getNickName());
            modelHistoryService.insertModelHistory(modelHistory);
        }
        return toAjax(modelVersionService.insertModelVersion(modelVersion));
    }

    /**
     * 确保启动版本唯一
     */
    @GetMapping(value = "/MVList/{modelId}")
    public AjaxResult getMVList(@PathVariable("modelId") Long modelId) {
        List<ModelVersion> list = modelVersionService.selectMVList(modelId);
        for (ModelVersion modelVersion : list) {
            if (modelVersion.getStatus() == 1) {
                return AjaxResult.success(modelVersion);
            }
        }
        return null;
    }

    /**
     * 修改版本管理
     */
    @PreAuthorize("@ss.hasPermi('model:version:edit')")
    @Log(title = "版本管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ModelVersion modelVersion) {
        int i = modelVersionService.updateModelVersion(modelVersion);
        Long modelId = modelVersion.getModelId();
        Model model = modelService.selectModelById(modelId);
        if (modelVersion.getStatus() != null && modelVersion.getStatus() == 1) {
            if (model.getFormat() != null) {
                if (model.getFormat() == 1) {
                    model.setUploadInterface(modelVersion.getInterfaceAddress());
                }
                if (model.getFormat() == 0) {
                    model.setUploadFile(modelVersion.getFileAddress());
                }
            }
            model.setUploadStatus(modelVersion.getStatus());
            model.setVersion(modelVersion.getVersion());
            model.setDescription(modelVersion.getDescription());
            model.setRemark(modelVersion.getRemark());
            modelService.updateModel(model);

            ModelHistory modelHistory = new ModelHistory();
            modelHistory.setModelId(modelVersion.getModelId());
            modelHistory.setModelName(modelVersion.getModelName());
            modelHistory.setContext("启用了" + modelVersion.getModelName() + "【" + modelVersion.getVersion() + "】版本");
            //获取最大版本号
            modelHistory.setModelVersion(modelVersion.getVersion());
            modelHistory.setUpdatorId(getUserId());
            modelHistory.setUpdateBy(getNickName());
            modelHistoryService.insertModelHistory(modelHistory);

            ModelOperate operate = new ModelOperate();
            operate.setCompanyId(model.getCompanyId());
            operate.setCreatorId(getUserId());
            operate.setCreateBy(getNickName());
            operate.setModuleName(model.getName());
            operate.setContent("启用"+ "【" + modelVersion.getVersion() + "】版本");
            operate.setType(2);
            JSONObject object = new JSONObject();
            object.set("模型名称", model.getName());
            object.set("启用版本", modelVersion.getVersion());
            operate.setRespContent(object.toString());
            modelOperateService.insertModelOperate(operate);
        }
        List<ModelVersion> mvList = modelVersionService.selectMVList(modelId);
        Boolean isStatus = true;
        for (ModelVersion version : mvList) {
            if (version.getStatus() == 1){
                isStatus = false;
            }
        }
        //停用
        if (isStatus) {
            model.setUploadStatus(modelVersion.getStatus());
            modelService.updateModel(model);
            //历史操作记录插入
            ModelHistory modelHistory = new ModelHistory();
            modelHistory.setModelId(modelVersion.getModelId());
            modelHistory.setModelName(modelVersion.getModelName());
            modelHistory.setContext("停用了" + modelVersion.getModelName() + "【" + modelVersion.getVersion() + "】版本");
            modelHistory.setModelVersion(modelVersion.getVersion());
            modelHistory.setUpdatorId(getUserId());
            modelHistory.setUpdateBy(getNickName());
            modelHistoryService.insertModelHistory(modelHistory);

            ModelOperate operate = new ModelOperate();
            operate.setCompanyId(model.getCompanyId());
            operate.setCreatorId(getUserId());
            operate.setCreateBy(getNickName());
            operate.setModuleName(model.getName());
            operate.setContent("停用【" + modelVersion.getVersion() + "】版本");
            operate.setType(2);
            JSONObject object = new JSONObject();
            object.set("模型名称", model.getName());
            object.set("启用版本", modelVersion.getVersion());
            operate.setRespContent(object.toString());
            modelOperateService.insertModelOperate(operate);
        }else {
            //历史操作记录插入
            ModelHistory modelHistory = new ModelHistory();
            modelHistory.setModelId(modelVersion.getModelId());
            modelHistory.setModelName(modelVersion.getModelName());
            modelHistory.setContext("修改了" + modelVersion.getModelName() + "【" + modelVersion.getVersion() + "】版本的内容");
            modelHistory.setModelVersion(modelVersion.getVersion());
            modelHistory.setUpdatorId(getUserId());
            modelHistory.setUpdateBy(getNickName());
            modelHistoryService.insertModelHistory(modelHistory);
        }
        return toAjax(i);
    }

    /**
     * 删除版本管理
     */
    @PreAuthorize("@ss.hasPermi('model:version:remove')")
    @Log(title = "版本管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        if (ids != null) {
            for (Long id : ids) {
                ModelVersion modelVersion = modelVersionService.selectModelVersionById(id);
                //历史操作记录插入
                ModelHistory modelHistory = new ModelHistory();
                modelHistory.setModelId(modelVersion.getModelId());
                modelHistory.setModelName(modelVersion.getModelName());
                modelHistory.setContext("删除了" + modelVersion.getModelName() + "【" + modelVersion.getVersion() + "】版本的内容");
                modelHistory.setModelVersion(modelVersion.getVersion());
                modelHistory.setUpdatorId(getUserId());
                modelHistory.setUpdateBy(getNickName());
                modelHistoryService.insertModelHistory(modelHistory);
            }
        }
        return toAjax(modelVersionService.deleteModelVersionByIds(ids));
    }
}
