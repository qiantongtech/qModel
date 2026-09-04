/*
 * Copyright © 2026-present Jiangsu Qiantong Technology Co., Ltd.
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

package tech.qiantong.qmodel.module.model.service.model;

import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.common.core.domain.model.LoginUser;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.*;
import tech.qiantong.qmodel.module.model.dal.dataobject.model.ModelDO;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 模型基础信息Service接口
 *
 * @author anivia
 * @date 2026-07-07
 */
public interface IModelService extends IService<ModelDO> {

    /**
     * 获得模型基础信息分页列表
     *
     * @param pageReqVO 分页请求
     * @return 模型基础信息分页列表
     */
    PageResult<ModelDO> getModelPage(ModelPageReqVO pageReqVO);

    /**
     * 创建模型基础信息
     *
     * @param createReqVO 模型基础信息信息
     * @return 模型基础信息编号
     */
    Long createModel(ModelSaveReqVO createReqVO);

    /**
     * 更新模型基础信息
     *
     * @param updateReqVO 模型基础信息信息
     */
    int updateModel(ModelSaveReqVO updateReqVO);

    /**
     * 删除模型基础信息
     *
     * @param idList 模型基础信息编号
     */
    int removeModel(Collection<Long> idList);

    /**
     * 获得模型基础信息详情
     *
     * @param id 模型基础信息编号
     * @return 模型基础信息
     */
    ModelRespVO getModelById(Long id);

    /**
     * 获得模型基础信息详情
     *
     * @param modelCode 模型基础编码
     * @return 模型基础信息
     */
    ModelRespVO getModelByCode(String modelCode);

    /**
     * 获得全部模型基础信息列表
     *
     * @return 模型基础信息列表
     */
    List<ModelDO> getModelList();

    /**
     * 获得全部模型基础信息 Map
     *
     * @return 模型基础信息 Map
     */
    Map<Long, ModelDO> getModelMap();


    /**
     * 导入模型基础信息数据
     *
     * @param importExcelList 模型基础信息数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName        操作用户
     * @return 结果
     */
    String importModel(List<ModelRespVO> importExcelList, boolean isUpdateSupport, String operName);

    /**
     * 保存模型基础信息及配置详情
     *
     * @param saveReqVO 模型基础信息 + 配置详情
     * @return 模型基础信息编号
     */
    Long saveModelWithConfig(ModelSaveWithConfigReqVO saveReqVO);

    /**
     * 更新模型状态
     *
     * @param id     模型基础信息编号
     * @param status 状态
     */
    void updateModelStatus(Long id, String status);

    /**
     * 发布模型
     *
     * @param id          模型基础信息编号
     * @param applyReason 申请原因
     * @param currentUser 当前用户
     * @return 是否成功
     */
    Boolean publishModel(Long id, String applyReason, LoginUser currentUser);

    /**
     * 获得模型详细信息
     *
     * @param id 模型基础信息编号
     * @return 模型基础信息
     */
    ModelVO getModelVOById(Long id, String modelVersion);

    /**
     * 创建模型
     *
     * @param modelVO 模型VO
     * @return 模型编号
     */
    Long createModelVO(ModelVO modelVO);

    /**
     * 修改模型
     *
     * @param modelVO 模型VO
     * @return 是否成功
     */
    Boolean updateModelVO(ModelVO modelVO);

    /**
     * 创建模型版本
     *
     * @param modelVO 模型VO
     * @return 模型编号
     */
    Long createModelVersionVO(ModelVO modelVO);

    /**
     * 修改模型版本
     *
     * @param modelVO 模型VO
     * @return 是否成功
     */
    Boolean updateModelVersionVO(ModelVO modelVO);

    /**
     * 获得模型基础信息详情
     *
     * @param id           模型基础信息编号
     * @param modelVersion 模型版本号
     * @return 模型基础信息
     */

    ModelRespVO getModel(Long id, String modelVersion);
}
