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

import com.alibaba.fastjson.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.web.bind.annotation.*;
import tech.qiantong.qmodel.common.annotation.*;
import tech.qiantong.qmodel.common.core.controller.*;
import tech.qiantong.qmodel.common.core.domain.*;
import tech.qiantong.qmodel.common.core.page.*;
import tech.qiantong.qmodel.common.enums.*;
import tech.qiantong.qmodel.common.utils.poi.*;
import tech.qiantong.qmodel.module.model.service.*;
import tech.qiantong.qmodel.module.modelReconstitution.domain.*;
import tech.qiantong.qmodel.module.modelReconstitution.service.*;

import javax.servlet.http.*;
import java.util.*;

/**
 * 模型输出管理Controller
 *
 * @author surge
 * @date 2023-09-14
 */
@RestController
@RequestMapping("/modelReconstitution/output")
public class ModelOutputReconstitutionController extends BaseController {

    @Autowired
    private IModelOutputReconstitutionService modelOutputReconstitutionService;

    @Autowired
    private IModelOutputService modelOutputService;

    @Autowired
    private IModelReconstitutionService modelReconstitutionService;

    @Autowired
    private IModelVersionReconstitutionService modelVersionService;


//    @Value("${model.filePathRoot}")
    private String filePathRoot = "D:\\model\\chengxuhuizong11.5";



    /**
     * 查询 模型输出管理列表
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:output:list')")
    @GetMapping("/list")
    public TableDataInfo list(ModelOutputReconstitution modelOutput) {
        startPage();
        modelOutput.setCompanyId(null);
        List<ModelOutputReconstitution> list = modelOutputReconstitutionService.selectModelOutputList(modelOutput);
        return getDataTable(list);
    }

    /**
     * 导出 模型输出管理列表
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:output:export')")
    @Log(title = " 模型输出管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelOutputReconstitution modelOutput) {
        modelOutput.setCompanyId(null);
        List<ModelOutputReconstitution> list = modelOutputReconstitutionService.selectModelOutputList(modelOutput);
        ExcelUtil<ModelOutputReconstitution> util = new ExcelUtil<ModelOutputReconstitution>(ModelOutputReconstitution.class);
        util.exportExcel(response, list, " 模型输出管理数据");
    }

    /**
     * 获取 模型输出管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:output:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(modelOutputReconstitutionService.selectModelOutputById(id));
    }

    /**
     * 新增 模型输出管理
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:output:add')")
    @Log(title = " 模型输出管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ModelOutputReconstitution modelOutput) {
        modelOutput.setCompanyId(null);
        modelOutput.setCreatorId(getUserId());
        modelOutput.setCreateBy(getNickName());
        return toAjax(modelOutputReconstitutionService.insertModelOutput(modelOutput));
    }

    /**
     * 修改 模型输出管理
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:output:edit')")
    @Log(title = " 模型输出管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ModelOutputReconstitution modelOutput) {
        return toAjax(modelOutputReconstitutionService.updateModelOutput(modelOutput));
    }

    /**
     * 删除 模型输出管理
     */
    @PreAuthorize("@ss.hasPermi('modelReconstitution:output:remove')")
    @Log(title = " 模型输出管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(modelOutputReconstitutionService.deleteModelOutputByIds(ids));
    }

    /**
     * 查询所有模型
     */
    @PostMapping("/findAllModel")
    public AjaxResult findAllModel(@RequestBody ModelReconstitution modelReconstitution) {
        modelReconstitution.setCompanyId(null);
        modelReconstitution.setDelFlag(false);
        return AjaxResult.success(modelReconstitutionService.selectModelReconstitutionList(modelReconstitution));
    }
    /**
     * 查询所有模型版本
     */
    @PostMapping("/findAllModelVersion")
    public AjaxResult findAllModelVersion(@RequestBody ModelVersionReconstitution modelVersion) {
        modelVersion.setDelFlag(false);
        return AjaxResult.success(modelVersionService.selectModelVersionList(modelVersion));
    }
    /**
     * 查询所有模型版本
     */
    @GetMapping("/waterSurfaceProfileAndQzhb/{modelId}")
    public AjaxResult waterSurfaceProfileAndQzhb(@PathVariable("modelId") Long modelId) {
        ModelReconstitution modelReconstitution = modelReconstitutionService.selectModelReconstitutionById(modelId);
        if (modelId.equals(12L)) {
            JSONObject jsonObject = new JSONObject();
            return AjaxResult.success(jsonObject);
        }
        String url = modelReconstitution.getInterfaceorfileAddress().substring(0, modelReconstitution.getInterfaceorfileAddress().lastIndexOf("/")) + "/" + modelReconstitution.getFileName();
        url = url.replaceAll("/","\\\\");
        JSONObject jsonObject = modelOutputService.readNewQzhbFile(url);
        return AjaxResult.success(jsonObject);
    }

    /**
     * 查询所有模型版本并且合并在一起
     *
     * |--时间
     *      |--断面名称
     *         |--断面累计距离（m）
     *         |--断面水位（m）
     *         |--流量(m3/s)
     *         |--水深(m)
     *         |--水面宽(m)
     *         |--堤顶的距离(m)
     */
    @PostMapping("/waterSurfaceProfileAndQzhbMerge")
    public AjaxResult waterSurfaceProfileAndQzhbMerge() {
        List<String> shuiMianXianPathList = new ArrayList<>();
        List<String> QzhbPathList = new ArrayList<>();

        shuiMianXianPathList.add(filePathRoot + "\\out\\shuimianxian_blsm_bsth_dongzhi.dat");
        shuiMianXianPathList.add(filePathRoot + "\\out\\shuimianxian_blsm_bsth_xizhi.dat");
        shuiMianXianPathList.add(filePathRoot + "\\out\\shuimianxian_desn_blsm.dat");
        shuiMianXianPathList.add(filePathRoot + "\\out\\shuimianxian_dysn_desn.dat");
        shuiMianXianPathList.add(filePathRoot + "\\out\\shuimianxian_xsk_dysn_hd.dat");
        shuiMianXianPathList.add(filePathRoot + "\\out\\shuimianxian_xsk_dysn_qd.dat");

        QzhbPathList.add(filePathRoot + "\\out\\Qzhb_blsm_bsth_dongzhi.dat");
        QzhbPathList.add(filePathRoot + "\\out\\Qzhb_blsm_bsth_xizhi.dat");
        QzhbPathList.add(filePathRoot + "\\out\\Qzhb_desn_blsm.dat");
        QzhbPathList.add(filePathRoot + "\\out\\Qzhb_dysn_desn.dat");
        QzhbPathList.add(filePathRoot + "\\out\\Qzhb_xsk_dysn_hd.dat");
        QzhbPathList.add(filePathRoot + "\\out\\Qzhb_xsk_dysn_qd.dat");

        Map<String, Object> stringObjectMap = modelOutputReconstitutionService.waterSurfaceProfileAndQzhb(shuiMianXianPathList, QzhbPathList);
        Map<String, Map<String, List<String>>> waterSurfaceProfile = modelOutputReconstitutionService.waterSurfaceProfileAndQzhbMerge(stringObjectMap);
        return AjaxResult.success(waterSurfaceProfile);
    }

}
