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
 * 模型历史管理 Controller
 *
 * @author YangWenGuang
 * @date 2023-09-26
 */
@RestController
@RequestMapping("/model/operate")
public class ModelOperateController extends BaseController {
    @Autowired
    private IModelOperateService modelOperateService;

    /**
     * 查询模型历史管理 列表
     */
    @PreAuthorize("@ss.hasPermi('model:operate:list')")
    @GetMapping("/list")
    public TableDataInfo list(ModelOperate modelOperate) {
        startPage();
        List<ModelOperate> list = modelOperateService.selectModelOperateList(modelOperate);
        return getDataTable(list);
    }

    /**
     * 导出模型历史管理 列表
     */
    @PreAuthorize("@ss.hasPermi('model:operate:export')")
    @Log(title = "模型历史管理 ", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelOperate modelOperate) {
        List<ModelOperate> list = modelOperateService.selectModelOperateList(modelOperate);
        ExcelUtil<ModelOperate> util = new ExcelUtil<ModelOperate>(ModelOperate.class);
        util.exportExcel(response, list, "模型历史管理 数据");
    }

    /**
     * 获取模型历史管理 详细信息
     */
    @PreAuthorize("@ss.hasPermi('model:operate:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(modelOperateService.selectModelOperateById(id));
    }

    /**
     * 新增模型历史管理
     */
    @PreAuthorize("@ss.hasPermi('model:operate:add')")
    @Log(title = "模型历史管理 ", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ModelOperate modelOperate) {
        modelOperate.setCreatorId(getUserId());
        modelOperate.setCreateBy(getNickName());
        return toAjax(modelOperateService.insertModelOperate(modelOperate));
    }

    /**
     * 修改模型历史管理
     */
    @PreAuthorize("@ss.hasPermi('model:operate:edit')")
    @Log(title = "模型历史管理 ", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ModelOperate modelOperate) {
        return toAjax(modelOperateService.updateModelOperate(modelOperate));
    }

    /**
     * 删除模型历史管理
     */
    @PreAuthorize("@ss.hasPermi('model:operate:remove')")
    @Log(title = "模型历史管理 ", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(modelOperateService.deleteModelOperateByIds(ids));
    }
}
