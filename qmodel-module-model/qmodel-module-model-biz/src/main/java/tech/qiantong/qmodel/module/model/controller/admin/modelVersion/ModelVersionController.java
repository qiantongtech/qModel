/*
 * Copyright (c) 2026 Jiangsu Qiantong Technology Co., Ltd.
 *  *
 * Software Name: qModel Algorithm Model Platform (Commercial Edition)
 *
 *  *
 * [RIGHTS AND LICENSE STATEMENT]
 * This file contains non-public commercial source code of which Jiangsu Qiantong
 * Technology Co., Ltd. lawfully possesses complete intellectual property rights.
 *  *
 * Access and use are limited to entities or individuals who have signed a valid
 * commercial license agreement, within the scope stipulated in the agreement.
 * The "accessibility" of this source code is premised on lawful authorization
 * and does not constitute any form of transfer of intellectual property rights
 * or implied licensing.
 *  *
 * [PROHIBITIONS]
 * Unless explicitly agreed in the license agreement, the following acts in any
 * form are strictly prohibited:
 * 1. Copying, disseminating, disclosing, selling, renting, or redistributing
 * this source code;
 * 2. Providing the software's functionality to third parties via SaaS, PaaS,
 * cloud hosting, or other means;
 * 3. Using this software or its derivative versions to develop products that
 * compete with the Right Holder;
 * 4. Providing or displaying this source code or related technical information
 * to unauthorized third parties;
 * 5. Tampering with, circumventing, or destroying copyright notices, license
 * verifications, or other technical protection measures.
 *  *
 * [LEGAL LIABILITY]
 * Any unauthorized use constitutes an infringement of trade secrets and
 * intellectual property rights.
 *  *
 * The Right Holder will strictly pursue liability for breach of contract and
 * infringement in accordance with the commercial agreement and laws such as
 * the "Copyright Law of the People's Republic of China" and the "Anti-Unfair
 * Competition Law".
 *  *
 * ============================================================================
 *  *
 * Copyright (c) 2026 江苏千桐科技有限公司
 *  *
 * 软件名称：qModel 算法模型平台（商业版）
 *  *
 * 【权利与授权声明】
 * 本文件属于江苏千桐科技有限公司依法享有完全知识产权的非公开商业源代码。
 * 仅限已签署有效商业授权合同的单位或个人在约定范围内查阅和使用。
 * 源代码的“可访问性”均以合法授权为前提，不构成任何形式的知识产权转让或默示授权。
 *  *
 * 【禁止事项】
 * 除授权合同明确约定外，严禁任何形式的：
 * 1. 复制、传播、披露、出售、出租或再分发本源代码；
 * 2. 通过 SaaS、PaaS、云托管等方式向第三方提供本软件功能；
 * 3. 将本软件或其衍生版本用于开发与权利人构成竞争的产品；
 * 4. 向未授权第三方提供或展示本源代码或相关技术信息；
 * 5. 篡改、规避或破坏版权标识、授权校验及其他技术保护措施。
 *  *
 * 【法律责任】
 * 任何未经授权的利用行为，均构成对商业秘密及知识产权的侵害。
 * 权利人将依据商业合同及《中华人民共和国著作权法》《反不正当竞争法》
 * 等法律法规，严厉追究违约与侵权责任。
 */

package tech.qiantong.qmodel.module.model.controller.admin.modelVersion;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import tech.qiantong.qmodel.common.annotation.Log;
import tech.qiantong.qmodel.common.core.controller.BaseController;
import tech.qiantong.qmodel.common.core.domain.CommonResult;
import tech.qiantong.qmodel.common.core.domain.entity.SysDictData;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.enums.BusinessType;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.module.model.controller.admin.modelVersion.vo.ModelVersionPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelVersion.vo.ModelVersionRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelVersion.vo.ModelVersionSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.modelVersion.ModelVersionDO;
import tech.qiantong.qmodel.module.model.service.modelVersion.IModelVersionService;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;

/**
 * 模型版本Controller
 *
 * @author anivia
 * @date 2026-08-17
 */
@Tag(name = "模型版本")
@RestController
@RequestMapping("/model/version")
@Validated
public class ModelVersionController extends BaseController {
    @Resource
    private IModelVersionService modelVersionService;

    @Operation(summary = "查询模型版本列表")
//    @PreAuthorize("@ss.hasPermi('model:modelVersion:version:list')")
    @GetMapping("/list")
    public CommonResult<PageResult<ModelVersionRespVO>> list(ModelVersionPageReqVO modelVersion) {
        PageResult<ModelVersionDO> page = modelVersionService.getModelVersionPage(modelVersion);
        return CommonResult.success(BeanUtils.toBean(page, ModelVersionRespVO.class));
    }

    @Operation(summary = "获取模型版本详细信息")
//    @PreAuthorize("@ss.hasPermi('model:modelVersion:version:query')")
    @GetMapping(value = "/getModelVersion")
    public CommonResult<ModelVersionRespVO> getModelVersion(Long modelId, String version) {
        ModelVersionDO modelVersionDO = modelVersionService.getModelVersion(modelId, version);
        return CommonResult.success(BeanUtils.toBean(modelVersionDO, ModelVersionRespVO.class));
    }

    @Operation(summary = "新增模型版本")
//    @PreAuthorize("@ss.hasPermi('model:modelVersion:version:add')")
    @Log(title = "模型版本", businessType = BusinessType.INSERT)
    @PostMapping
    public CommonResult<Long> add(@Valid @RequestBody ModelVersionSaveReqVO modelVersion) {
        return CommonResult.toAjax(modelVersionService.createModelVersion(modelVersion));
    }

    @Operation(summary = "修改模型版本")
//    @PreAuthorize("@ss.hasPermi('model:modelVersion:version:edit')")
    @Log(title = "模型版本", businessType = BusinessType.UPDATE)
    @PutMapping
    public CommonResult<Boolean> edit(@Valid @RequestBody ModelVersionSaveReqVO modelVersion) {
        return CommonResult.toAjax(modelVersionService.updateModelVersion(modelVersion));
    }

    @Operation(summary = "删除模型版本")
//    @PreAuthorize("@ss.hasPermi('model:modelVersion:version:remove')")
    @Log(title = "模型版本", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public CommonResult<Integer> remove(@PathVariable Long[] ids) {
        return CommonResult.success(modelVersionService.removeModelVersion(Arrays.asList(ids)));
    }

    @Operation(summary = "版本切换")
//    @PreAuthorize("@ss.hasPermi('model:modelVersion:version:edit')")
    @Log(title = "模型版本", businessType = BusinessType.UPDATE)
    @PostMapping("/changeVersion")
    public CommonResult<Boolean> changeVersion(@Valid @RequestBody ModelVersionSaveReqVO modelVersion) {
        return CommonResult.success(modelVersionService.changeVersion(modelVersion));
    }

    @Operation(summary = "获取版本号字典")
//    @PreAuthorize("@ss.hasPermi('model:modelVersion:version:query')")
    @GetMapping(value = "/getModelVersionDict")
    public CommonResult<List<SysDictData>> getModelVersionDict(Long modelId) {
        List<SysDictData> modelVersionDict = modelVersionService.getModelVersionDict(modelId);
        return CommonResult.success(modelVersionDict);
    }

    @Operation(summary = "查询版本号是否存在")
//    @PreAuthorize("@ss.hasPermi('model:modelVersion:version:query')")
    @GetMapping(value = "/isModelVersionExists")
    public CommonResult<Boolean> isModelVersionExists(Long modelId, String modelVersion) {
        Boolean res = modelVersionService.isModelVersionExists(modelId, modelVersion);
        return CommonResult.success(res);
    }

}
