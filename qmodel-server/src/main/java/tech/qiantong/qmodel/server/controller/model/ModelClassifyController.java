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
 * 模型分类Controller
 *
 * @author model
 * @date 2023-09-15
 */
@RestController
@RequestMapping("/model/classify")
public class ModelClassifyController extends BaseController {
    @Autowired
    private IModelClassifyService modelClassifyService;

    /**
     * 查询模型分类列表
     */
    @PreAuthorize("@ss.hasPermi('model:classify:list')")
    @GetMapping("/list")
    public TableDataInfo list(ModelClassify modelClassify) {
        startPage();
//        modelClassify.setSchoolId(super.getSchoolId());
        List<ModelClassify> list = modelClassifyService.selectModelClassifyList(modelClassify);
        return getDataTable(list);
    }

    /**
     * 导出模型分类列表
     */
    @PreAuthorize("@ss.hasPermi('model:classify:export')")
    @Log(title = "模型分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelClassify modelClassify) {
//        modelClassify.setSchoolId(super.getSchoolId());
        List<ModelClassify> list = modelClassifyService.selectModelClassifyList(modelClassify);
        ExcelUtil<ModelClassify> util = new ExcelUtil<ModelClassify>(ModelClassify.class);
        util.exportExcel(response, list, "模型分类数据");
    }

    /**
     * 获取模型分类详细信息
     */
    @PreAuthorize("@ss.hasPermi('model:classify:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(modelClassifyService.selectModelClassifyById(id));
    }

    /**
     * 新增模型分类
     */
    @PreAuthorize("@ss.hasPermi('model:classify:add')")
    @Log(title = "模型分类", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ModelClassify modelClassify) {
//        modelClassify.setSchoolId(super.getSchoolId());
        modelClassify.setCreatorId(getUserId());
        modelClassify.setCreateBy(getNickName());
        return toAjax(modelClassifyService.insertModelClassify(modelClassify));
    }

    /**
     * 修改模型分类
     */
    @PreAuthorize("@ss.hasPermi('model:classify:edit')")
    @Log(title = "模型分类", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ModelClassify modelClassify) {
        return toAjax(modelClassifyService.updateModelClassify(modelClassify));
    }

    /**
     * 删除模型分类
     */
    @PreAuthorize("@ss.hasPermi('model:classify:remove')")
    @Log(title = "模型分类", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(modelClassifyService.deleteModelClassifyByIds(ids));
    }
}
