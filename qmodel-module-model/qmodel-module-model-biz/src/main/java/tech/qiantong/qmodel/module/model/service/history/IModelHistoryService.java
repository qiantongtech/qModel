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

package tech.qiantong.qmodel.module.model.service.history;

import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.history.vo.ModelHistoryPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.history.vo.ModelHistoryRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.history.vo.ModelHistorySaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.history.ModelHistoryDO;

import java.util.Collection;
import java.util.List;
import java.util.Map;
/**
 * 模型历史Service接口
 *
 * @author qModel
 * @date 2026-01-09
 */
public interface IModelHistoryService extends IService<ModelHistoryDO> {

    /**
     * 获得模型历史分页列表
     *
     * @param pageReqVO 分页请求
     * @return 模型历史分页列表
     */
    PageResult<ModelHistoryDO> getModelHistoryPage(ModelHistoryPageReqVO pageReqVO);

    /**
     * 创建模型历史
     *
     * @param createReqVO 模型历史信息
     * @return 模型历史编号
     */
    Long createModelHistory(ModelHistorySaveReqVO createReqVO);

    /**
     * 更新模型历史
     *
     * @param updateReqVO 模型历史信息
     */
    int updateModelHistory(ModelHistorySaveReqVO updateReqVO);

    /**
     * 删除模型历史
     *
     * @param idList 模型历史编号
     */
    int removeModelHistory(Collection<Long> idList);

    /**
     * 获得模型历史详情
     *
     * @param id 模型历史编号
     * @return 模型历史
     */
    ModelHistoryDO getModelHistoryById(Long id);

    /**
     * 获得全部模型历史列表
     *
     * @return 模型历史列表
     */
    List<ModelHistoryDO> getModelHistoryList();



    /**
     * 获得全部模型历史 Map
     *
     * @return 模型历史 Map
     */
    Map<Long, ModelHistoryDO> getModelHistoryMap();


    /**
     * 导入模型历史数据
     *
     * @param importExcelList 模型历史数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    String importModelHistory(List<ModelHistoryRespVO> importExcelList, boolean isUpdateSupport, String operName);

    /**
     * 创建模型历史记录的便捷方法
     *
     * @param modelId 模型ID
     * @param modelName 模型名称
     * @param context 操作内容
     * @param modelVersion 模型版本
     * @param updatorId 更新人ID
     * @param updateBy 更新人姓名
     * @return 模型历史编号
     */
    Long createModelHistory(Long modelId, String modelName, String context, String modelVersion, Long updatorId, String updateBy);


}
