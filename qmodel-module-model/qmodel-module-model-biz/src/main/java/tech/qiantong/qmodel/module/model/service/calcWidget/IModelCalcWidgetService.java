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

package tech.qiantong.qmodel.module.model.service.calcWidget;

import java.util.List;
import java.util.Map;
import java.util.Collection;
import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.calcWidget.vo.ModelCalcWidgetSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.calcWidget.vo.ModelCalcWidgetPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.calcWidget.vo.ModelCalcWidgetRespVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.calcWidget.ModelCalcWidgetDO;
/**
 * 模型计算任务可视化组件配置Service接口
 *
 * @author anivia
 * @date 2026-08-04
 */
public interface IModelCalcWidgetService extends IService<ModelCalcWidgetDO> {

    /**
     * 获得模型计算任务可视化组件配置分页列表
     *
     * @param pageReqVO 分页请求
     * @return 模型计算任务可视化组件配置分页列表
     */
    PageResult<ModelCalcWidgetDO> getModelCalcWidgetPage(ModelCalcWidgetPageReqVO pageReqVO);

    /**
     * 根据计算任务ID获得可视化组件配置列表
     *
     * @param calcId 计算任务ID
     * @return 可视化组件配置列表
     */
    List<ModelCalcWidgetRespVO> getModelCalcWidgetListByCalcId(Long calcId);

    /**
     * 创建模型计算任务可视化组件配置
     *
     * @param createReqVO 模型计算任务可视化组件配置信息
     * @return 模型计算任务可视化组件配置编号
     */
    Long createModelCalcWidget(ModelCalcWidgetSaveReqVO createReqVO);

    /**
     * 更新模型计算任务可视化组件配置
     *
     * @param updateReqVO 模型计算任务可视化组件配置信息
     */
    int updateModelCalcWidget(ModelCalcWidgetSaveReqVO updateReqVO);

    /**
     * 删除模型计算任务可视化组件配置
     *
     * @param idList 模型计算任务可视化组件配置编号
     */
    int removeModelCalcWidget(Collection<Long> idList);

    /**
     * 获得模型计算任务可视化组件配置详情
     *
     * @param id 模型计算任务可视化组件配置编号
     * @return 模型计算任务可视化组件配置
     */
    ModelCalcWidgetDO getModelCalcWidgetById(Long id);

    /**
     * 获得全部模型计算任务可视化组件配置列表
     *
     * @return 模型计算任务可视化组件配置列表
     */
    List<ModelCalcWidgetDO> getModelCalcWidgetList();

    /**
     * 获得全部模型计算任务可视化组件配置 Map
     *
     * @return 模型计算任务可视化组件配置 Map
     */
    Map<Long, ModelCalcWidgetDO> getModelCalcWidgetMap();


    /**
     * 导入模型计算任务可视化组件配置数据
     *
     * @param importExcelList 模型计算任务可视化组件配置数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    String importModelCalcWidget(List<ModelCalcWidgetRespVO> importExcelList, boolean isUpdateSupport, String operName);

}
