package tech.qiantong.qmodel.server.controller.model;

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
 * 操作历史Controller
 *
 * @author surge
 * @date 2023-09-15
 */
@RestController
@RequestMapping("/model/history" )
public class ModelHistoryController extends BaseController {
    @Autowired
    private IModelHistoryService modelHistoryService;

/**
 * 查询操作历史列表
 */
@PreAuthorize("@ss.hasPermi('model:history:list')" )
@GetMapping("/list" )
    public TableDataInfo list(ModelHistory modelHistory) {
        startPage();
//        modelHistory.setSchoolId(super.getSchoolId());
        List<ModelHistory> list = modelHistoryService.selectModelHistoryList(modelHistory);
        return getDataTable(list);
    }

    /**
     * 查询操作历史列表
     */
    @PreAuthorize("@ss.hasPermi('model:history:list')" )
    @GetMapping("/modelList" )
    public TableDataInfo modelList(ModelHistory modelHistory) {
        startPage();
        Long modelId = modelHistory.getModelId();
        List<ModelHistory> list = modelHistoryService.selectModelHistoryByModelId(modelId);
        return getDataTable(list);
    }

    /**
     * 导出操作历史列表
     */
    @PreAuthorize("@ss.hasPermi('model:history:export')" )
    @Log(title = "操作历史" , businessType = BusinessType.EXPORT)
    @PostMapping("/export" )
    public void export(HttpServletResponse response, ModelHistory modelHistory) {
//        modelHistory.setSchoolId(super.getSchoolId());
        List<ModelHistory> list = modelHistoryService.selectModelHistoryList(modelHistory);
        ExcelUtil<ModelHistory> util = new ExcelUtil<ModelHistory>(ModelHistory. class);
        util.exportExcel(response, list, "操作历史数据" );
    }

    /**
     * 获取操作历史详细信息
     */
    @PreAuthorize("@ss.hasPermi('model:history:query')" )
    @GetMapping(value = "/{id}" )
    public AjaxResult getInfo(@PathVariable("id" ) Long id) {
        return AjaxResult.success(modelHistoryService.selectModelHistoryById(id));
    }

    /**
     * 新增操作历史
     */
    @PreAuthorize("@ss.hasPermi('model:history:add')" )
    @Log(title = "操作历史" , businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ModelHistory modelHistory) {
//        modelHistory.setSchoolId(super.getSchoolId());
        modelHistory.setCreatorId(getUserId());
        modelHistory.setCreateBy(getNickName());
        return toAjax(modelHistoryService.insertModelHistory(modelHistory));
    }

    /**
     * 修改操作历史
     */
    @PreAuthorize("@ss.hasPermi('model:history:edit')" )
    @Log(title = "操作历史" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ModelHistory modelHistory) {
        return toAjax(modelHistoryService.updateModelHistory(modelHistory));
    }

    /**
     * 删除操作历史
     */
    @PreAuthorize("@ss.hasPermi('model:history:remove')" )
    @Log(title = "操作历史" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}" )
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(modelHistoryService.deleteModelHistoryByIds(ids));
    }
}
