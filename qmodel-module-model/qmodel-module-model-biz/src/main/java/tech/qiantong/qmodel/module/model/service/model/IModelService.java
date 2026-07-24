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

package tech.qiantong.qmodel.module.model.service.model;

import java.util.List;
import java.util.Map;
import java.util.Collection;
import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelSaveWithConfigReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelRespVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.model.ModelDO;
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
    ModelDO getModelById(Long id);

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
     * @param operName 操作用户
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
     * @param id 模型基础信息编号
     * @param status 状态
     */
    void updateModelStatus(Long id, String status);

}
