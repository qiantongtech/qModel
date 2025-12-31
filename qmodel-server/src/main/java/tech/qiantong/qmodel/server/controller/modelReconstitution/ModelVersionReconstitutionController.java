package tech.qiantong.qmodel.server.controller.modelReconstitution;

import cn.hutool.json.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.transaction.annotation.*;
import org.springframework.web.bind.annotation.*;
import tech.qiantong.qmodel.common.annotation.*;
import tech.qiantong.qmodel.common.core.controller.*;
import tech.qiantong.qmodel.common.core.domain.*;
import tech.qiantong.qmodel.common.core.page.*;
import tech.qiantong.qmodel.common.enums.*;
import tech.qiantong.qmodel.common.utils.poi.*;
import tech.qiantong.qmodel.module.modelReconstitution.domain.*;
import tech.qiantong.qmodel.module.modelReconstitution.service.*;

import javax.servlet.http.*;
import java.util.*;

/**
 * 版本管理Controller
 *
 * @author surge
 * @date 2023-09-15
 */
@RestController
@RequestMapping("/modelReconstitution/version")
public class ModelVersionReconstitutionController extends BaseController {
    @Autowired
    private IModelVersionReconstitutionService modelVersionService;

    @Autowired
    private IModelReconstitutionService modelReconstitutionService;

    @Autowired
    private IModelHistoryReconstitutionService modelHistoryService;

    @Autowired
    private IModelOperateReconstitutionService modelOperateService;
    /**
     * 查询版本管理列表
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:version:list')")
    @GetMapping("/list")
    public TableDataInfo list(ModelVersionReconstitution modelVersion) {
        startPage();
        modelVersion.setCompanyId(null);
        List<ModelVersionReconstitution> list = modelVersionService.selectModelVersionList(modelVersion);
        return getDataTable(list);
    }

    /**
     * 查询版本管理列表
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:version:list')")
    @GetMapping("/VersionList")
    public TableDataInfo getList(ModelVersionReconstitution modelVersion) {
        modelVersion.setCompanyId(null);
        List<ModelVersionReconstitution> list = modelVersionService.selectModelVersionList(modelVersion);
        return getDataTable(list);
    }

    /**
     * 导出版本管理列表
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:version:export')")
    @Log(title = "版本管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelVersionReconstitution modelVersion) {
        modelVersion.setCompanyId(null);
        List<ModelVersionReconstitution> list = modelVersionService.selectModelVersionList(modelVersion);
        ExcelUtil<ModelVersionReconstitution> util = new ExcelUtil<ModelVersionReconstitution>(ModelVersionReconstitution.class);
        util.exportExcel(response, list, "版本管理数据");
    }

    /**
     * 获取版本管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:version:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(modelVersionService.selectModelVersionById(id));
    }

    /**
     * 新增版本管理
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:version:add')")
    @Log(title = "版本管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ModelVersionReconstitution modelVersion) {
        modelVersion.setCompanyId(null);
        modelVersion.setCreatorId(getUserId());
        modelVersion.setCreateBy(getNickName());
        modelVersion.setStatus(0);
        if (modelVersion != null) {
            ModelHistoryReconstitution modelHistory = new ModelHistoryReconstitution();
            modelHistory.setCompanyId(null);
            modelHistory.setModelId(modelVersion.getModelId());
            modelHistory.setModelName(modelVersion.getModelName());
            modelHistory.setContext("新增了" + modelVersion.getModelName() + "一个版本");
            //获取最大版本号
            modelHistory.setModelVersion(modelVersion.getVersion());
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
        List<ModelVersionReconstitution> list = modelVersionService.selectMVList(modelId);
        for (ModelVersionReconstitution modelVersion : list) {
            if (modelVersion.getStatus() == 1) {
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
        ModelVersionReconstitution version = new ModelVersionReconstitution();
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
            ModelHistoryReconstitution history = new ModelHistoryReconstitution();
            history.setCompanyId(null);
            history.setModelId(jsonObject.getLong("modelId"));
            history.setModelName(jsonObject.getStr("modelName"));
            history.setContext("切换了模型的版本号, 切换到了【" + jsonObject.getDouble("afterVersion") + "】");
            history.setModelVersion(jsonObject.getStr("afterVersion"));
            history.setUpdatorId(getUserId());
            history.setUpdateBy(getNickName());
            modelHistoryService.insertModelHistory(history);
        }
        modelReconstitutionService.updateModelReconstitution(model);
        return success();
    }



    /**
     * 修改版本管理
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:version:edit')")
    @Log(title = "版本管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ModelVersionReconstitution modelVersion) {
        int i = modelVersionService.updateModelVersion(modelVersion);
        Long modelId = modelVersion.getModelId();
        ModelReconstitution modelReconstitution = modelReconstitutionService.selectModelReconstitutionById(modelId);
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

            ModelHistoryReconstitution modelHistory = new ModelHistoryReconstitution();
            modelHistory.setCompanyId(null);
            modelHistory.setModelId(modelVersion.getModelId());
            modelHistory.setModelName(modelVersion.getModelName());
            modelHistory.setContext("启用了" + modelVersion.getModelName() + "【" + modelVersion.getVersion() + "】版本");
            //获取最大版本号
            modelHistory.setModelVersion(modelVersion.getVersion());
            modelHistory.setUpdatorId(getUserId());
            modelHistory.setUpdateBy(getNickName());
            modelHistoryService.insertModelHistory(modelHistory);

            ModelOperateReconstitution operate = new ModelOperateReconstitution();
            operate.setCompanyId(modelReconstitution.getCompanyId());
            operate.setCreatorId(getUserId());
            operate.setCreateBy(getNickName());
            operate.setModuleName(modelReconstitution.getName());
            operate.setContent("启用"+ "【" + modelVersion.getVersion() + "】版本");
            operate.setType(2);
            JSONObject object = new JSONObject();
            object.set("模型名称", modelReconstitution.getName());
            object.set("启用版本", modelVersion.getVersion());
            operate.setRespContent(object.toString());
            modelOperateService.insertModelOperate(operate);
        }
        List<ModelVersionReconstitution> mvList = modelVersionService.selectMVList(modelId);
        Boolean isStatus = true;
        for (ModelVersionReconstitution version : mvList) {
            if (version.getStatus() == 1){
                isStatus = false;
            }
        }
        //停用
        if (isStatus) {
            modelReconstitutionService.updateModelReconstitution(modelReconstitution);
            //历史操作记录插入
            ModelHistoryReconstitution modelHistory = new ModelHistoryReconstitution();
            modelHistory.setCompanyId(null);
            modelHistory.setModelId(modelVersion.getModelId());
            modelHistory.setModelName(modelVersion.getModelName());
            modelHistory.setContext("停用了" + modelVersion.getModelName() + "【" + modelVersion.getVersion() + "】版本");
            modelHistory.setModelVersion(modelVersion.getVersion());
            modelHistory.setUpdatorId(getUserId());
            modelHistory.setUpdateBy(getNickName());
            modelHistoryService.insertModelHistory(modelHistory);

            ModelOperateReconstitution operate = new ModelOperateReconstitution();
            operate.setCompanyId(modelReconstitution.getCompanyId());
            operate.setCreatorId(getUserId());
            operate.setCreateBy(getNickName());
            operate.setModuleName(modelReconstitution.getName());
            operate.setContent("停用【" + modelVersion.getVersion() + "】版本");
            operate.setType(2);
            JSONObject object = new JSONObject();
            object.set("模型名称", modelReconstitution.getName());
            object.set("启用版本", modelVersion.getVersion());
            operate.setRespContent(object.toString());
            modelOperateService.insertModelOperate(operate);
        }else {
            //历史操作记录插入
            ModelHistoryReconstitution modelHistory = new ModelHistoryReconstitution();
            modelHistory.setCompanyId(null);
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
    @PreAuthorize("@ss.hasPermi('modelReconstitution:version:remove')")
    @Log(title = "版本管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        if (ids != null) {
            for (Long id : ids) {
                ModelVersionReconstitution modelVersion = modelVersionService.selectModelVersionById(id);
                //历史操作记录插入
                ModelHistoryReconstitution modelHistory = new ModelHistoryReconstitution();
                modelHistory.setCompanyId(null);
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
