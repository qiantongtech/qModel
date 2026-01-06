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

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.prepost.*;
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
 * 模型历史管理 Controller
 *
 * @author YangWenGuang
 * @date 2023-09-26
 */
@RestController
@RequestMapping("/modelReconstitution/operate")
public class ModelOperateReconstitutionController extends BaseController {
    @Autowired
    private IModelOperateReconstitutionService modelOperateService;

    /**
     * 查询模型历史管理 列表
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:operate:list')")
    @GetMapping("/list")
    public TableDataInfo list(ModelOperateReconstitution modelOperate) {
        startPage();
        List<ModelOperateReconstitution> list = modelOperateService.selectModelOperateList(modelOperate);
        return getDataTable(list);
    }

    /**
     * 导出模型历史管理 列表
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:operate:export')")
    @Log(title = "模型历史管理 ", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelOperateReconstitution modelOperate) {
        List<ModelOperateReconstitution> list = modelOperateService.selectModelOperateList(modelOperate);
        ExcelUtil<ModelOperateReconstitution> util = new ExcelUtil<ModelOperateReconstitution>(ModelOperateReconstitution.class);
        util.exportExcel(response, list, "模型历史管理 数据");
    }

    /**
     * 获取模型历史管理 详细信息
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:operate:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(modelOperateService.selectModelOperateById(id));
    }

    /**
     * 新增模型历史管理
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:operate:add')")
    @Log(title = "模型历史管理 ", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ModelOperateReconstitution modelOperate) {
        modelOperate.setCreatorId(getUserId());
        modelOperate.setCreateBy(getNickName());
        return toAjax(modelOperateService.insertModelOperate(modelOperate));
    }

    /**
     * 修改模型历史管理
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:operate:edit')")
    @Log(title = "模型历史管理 ", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ModelOperateReconstitution modelOperate) {
        return toAjax(modelOperateService.updateModelOperate(modelOperate));
    }

    /**
     * 删除模型历史管理
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:operate:remove')")
    @Log(title = "模型历史管理 ", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(modelOperateService.deleteModelOperateByIds(ids));
    }
}
