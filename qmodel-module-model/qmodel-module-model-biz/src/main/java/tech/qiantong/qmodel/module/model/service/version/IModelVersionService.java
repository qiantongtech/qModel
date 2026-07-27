/*
 * Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
 *  
 * This file is part of qModel Module Platform (Open Source Edition).
 *  
 * qModel is licensed under Apache License 2.0 with additional qModel terms.
 * You may use qModel for commercial purposes, but you may not remove, hide,
 * modify, or replace the qModel logo, copyright notices, license notices,
 * or attribution information without a separate commercial license.
 *  
 * White-label use, OEM distribution, rebranding, or presenting qModel as
 * another product requires separate commercial authorization from
 * Jiangsu Qiantong Technology Co., Ltd.
 *  
 * Business License: `https://qmodel.tech/`
 * See the LICENSE file in the project root for full license information.
 */

package tech.qiantong.qmodel.module.model.service.version;

import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.vo.ModelInterfaceAddressPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.vo.ModelInterfaceAddressRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.vo.ModelReconstitutionSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.version.vo.ModelVersionPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.version.vo.ModelVersionRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.version.vo.ModelVersionSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.interfaceAddress.ModelInterfaceAddressDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.version.ModelVersionDO;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import com.alibaba.fastjson.JSONObject;
import tech.qiantong.qmodel.common.core.domain.AjaxResult;
/**
 * 版本管理Service接口
 *
 * @author qModel
 * @date 2026-01-09
 */
public interface IModelVersionService extends IService<ModelVersionDO> {

    /**
     * 获得版本管理分页列表
     *
     * @param pageReqVO 分页请求
     * @return 版本管理分页列表
     */
    PageResult<ModelVersionDO> getModelVersionPage(ModelVersionPageReqVO pageReqVO);

    /**
     * 查询版本管理列表
     *
     * @param modelVersion 版本管理
     * @return 版本管理集合
     */
    public List<ModelVersionDO> selectModelVersionList(ModelVersionDO modelVersion);

    /**
     * 创建版本管理
     *
     * @param createReqVO 版本管理信息
     * @return 版本管理编号
     */
    Long createModelVersion(ModelVersionSaveReqVO createReqVO);

    /**
     * 更新版本管理
     *
     * @param updateReqVO 版本管理信息
     */
    int updateModelVersion(ModelVersionSaveReqVO updateReqVO);

    /**
     * 删除版本管理
     *
     * @param idList 版本管理编号
     */
    int removeModelVersion(Collection<Long> idList);

    /**
     * 获得版本管理详情
     *
     * @param id 版本管理编号
     * @return 版本管理
     */
    ModelVersionDO getModelVersionById(Long id);

    /**
     * 获得全部版本管理列表
     *
     * @return 版本管理列表
     */
    List<ModelVersionDO> getModelVersionList();

    /**
     * 获得全部版本管理 Map
     *
     * @return 版本管理 Map
     */
    Map<Long, ModelVersionDO> getModelVersionMap();

    /**
     * 创建模型版本并更新模型ID
     *
     * @param version 版本信息
     * @param modelId 模型ID
     * @return 版本管理编号
     */
    Long createModelVersionWithModelId(ModelVersionSaveReqVO version, Long modelId);

    /**
     * 创建模型版本（带属性设置）
     *
     * @param modelReconstitution 模型重构信息
     * @param userId 用户ID
     * @param nickName 用户昵称
     * @return 版本管理编号
     */
    Long createModelVersionWithAttributes(ModelReconstitutionSaveReqVO modelReconstitution, Long userId, String nickName);

    /**
     * 导入版本管理数据
     *
     * @param importExcelList 版本管理数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    String importModelVersion(List<ModelVersionRespVO> importExcelList, boolean isUpdateSupport, String operName);

    /**
     * 切换版本
     *
     * @param modelVersionRespVO 包含切换版本所需参数
     * @param userId 用户ID
     * @param nickName 用户昵称
     * @return 操作结果
     */
    AjaxResult handoffVersion(ModelVersionRespVO modelVersionRespVO, Long userId, String nickName);

    /**
     * 更新版本管理
     *
     * @param modelVersion 版本管理信息
     * @param userId 用户ID
     * @param nickName 用户昵称
     * @return 操作结果
     */
    int updateModelVersionWithBusinessLogic(ModelVersionSaveReqVO modelVersion, Long userId, String nickName);

}
