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

package tech.qiantong.qmodel.module.model.controller.admin.output;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import tech.qiantong.qmodel.common.annotation.Log;
import tech.qiantong.qmodel.common.core.controller.BaseController;
import tech.qiantong.qmodel.common.core.domain.AjaxResult;
import tech.qiantong.qmodel.common.core.domain.CommonResult;
import tech.qiantong.qmodel.common.core.page.PageParam;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.enums.BusinessType;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.common.utils.poi.ExcelUtil;
import tech.qiantong.qmodel.module.model.controller.admin.output.vo.ModelOutputPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.output.vo.ModelOutputRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.output.vo.ModelOutputSaveReqVO;
import tech.qiantong.qmodel.module.model.convert.output.ModelOutputConvert;
import tech.qiantong.qmodel.module.model.dal.dataobject.output.ModelOutputDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.version.ModelVersionDO;
import tech.qiantong.qmodel.module.model.service.modelReconstitution.IModelReconstitutionService;
import tech.qiantong.qmodel.module.model.service.output.IModelOutputService;
import tech.qiantong.qmodel.module.model.service.version.IModelVersionService;
import tech.qiantong.qmodel.module.modelReconstitution.domain.ModelReconstitution;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * 模型输出管理Controller
 *
 * @author qModel
 * @date 2026-01-09
 */
@Tag(name = "模型输出管理")
@RestController
@RequestMapping("/model/output")
@Validated
public class ModelOutputController extends BaseController {
    @Resource
    private IModelOutputService modelOutputService;

    @Resource
    private IModelReconstitutionService modelReconstitutionService;

    @Resource
    private IModelVersionService modelVersionService;


    //    @Value("${model.filePathRoot}")
    private String filePathRoot = "D:\\model\\chengxuhuizong11.5";


    @Operation(summary = "查询模型输出管理列表")
    @PreAuthorize("@ss.hasPermi('model:output:output:list')")
    @GetMapping("/list")
    public CommonResult<PageResult<ModelOutputRespVO>> list(ModelOutputPageReqVO modelOutput) {
        PageResult<ModelOutputDO> page = modelOutputService.getModelOutputPage(modelOutput);
        return CommonResult.success(BeanUtils.toBean(page, ModelOutputRespVO.class));
    }

    @Operation(summary = "导出模型输出管理列表")
    @PreAuthorize("@ss.hasPermi('model:output:output:export')")
    @Log(title = "模型输出管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ModelOutputPageReqVO exportReqVO) {
        exportReqVO.setPageSize(PageParam.PAGE_SIZE_NONE);
        List<ModelOutputDO> list = (List<ModelOutputDO>) modelOutputService.getModelOutputPage(exportReqVO).getRows();
        ExcelUtil<ModelOutputRespVO> util = new ExcelUtil<>(ModelOutputRespVO.class);
        util.exportExcel(response, ModelOutputConvert.INSTANCE.convertToRespVOList(list), "应用管理数据");
    }

    @Operation(summary = "导入模型输出管理列表")
    @PreAuthorize("@ss.hasPermi('model:output:output:import')")
    @Log(title = "模型输出管理", businessType = BusinessType.IMPORT)
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<ModelOutputRespVO> util = new ExcelUtil<>(ModelOutputRespVO.class);
        List<ModelOutputRespVO> importExcelList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = modelOutputService.importModelOutput(importExcelList, updateSupport, operName);
        return success(message);
    }

    @Operation(summary = "获取模型输出管理详细信息")
    @PreAuthorize("@ss.hasPermi('model:output:output:query')")
    @GetMapping(value = "/{id}")
    public CommonResult<ModelOutputRespVO> getInfo(@PathVariable("id") Long id) {
        ModelOutputDO modelOutputDO = modelOutputService.getModelOutputById(id);
        return CommonResult.success(BeanUtils.toBean(modelOutputDO, ModelOutputRespVO.class));
    }

    @Operation(summary = "新增模型输出管理")
    @PreAuthorize("@ss.hasPermi('model:output:output:add')")
    @Log(title = "模型输出管理", businessType = BusinessType.INSERT)
    @PostMapping
    public CommonResult<Long> add(@Valid @RequestBody ModelOutputSaveReqVO modelOutput) {
        return CommonResult.toAjax(modelOutputService.createModelOutput(modelOutput));
    }

    @Operation(summary = "修改模型输出管理")
    @PreAuthorize("@ss.hasPermi('model:output:output:edit')")
    @Log(title = "模型输出管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public CommonResult<Integer> edit(@Valid @RequestBody ModelOutputSaveReqVO modelOutput) {
        return CommonResult.toAjax(modelOutputService.updateModelOutput(modelOutput));
    }

    @Operation(summary = "删除模型输出管理")
    @PreAuthorize("@ss.hasPermi('model:output:output:remove')")
    @Log(title = "模型输出管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public CommonResult<Integer> remove(@PathVariable Long[] ids) {
        return CommonResult.toAjax(modelOutputService.removeModelOutput(Arrays.asList(ids)));
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
    public AjaxResult findAllModelVersion(@RequestBody ModelVersionDO modelVersion) {
        modelVersion.setDelFlag(false);
        return AjaxResult.success(modelVersionService.selectModelVersionList(modelVersion));
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

        Map<String, Object> stringObjectMap = modelOutputService.waterSurfaceProfileAndQzhb(shuiMianXianPathList, QzhbPathList);
        Map<String, Map<String, List<String>>> waterSurfaceProfile = modelOutputService.waterSurfaceProfileAndQzhbMerge(stringObjectMap);
        return AjaxResult.success(waterSurfaceProfile);
    }

}
