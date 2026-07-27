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

package tech.qiantong.qmodel.module.model.service.calc;

import java.util.List;
import java.util.Map;
import java.util.Collection;
import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.calc.vo.ModelCalcSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.calc.vo.ModelCalcPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.calc.vo.ModelCalcRespVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.calc.ModelCalcDO;
/**
 * 模型计算任务Service接口
 *
 * @author qModel
 * @date 2026-07-27
 */
public interface IModelCalcService extends IService<ModelCalcDO> {

    /**
     * 获得模型计算任务分页列表
     *
     * @param pageReqVO 分页请求
     * @return 模型计算任务分页列表
     */
    PageResult<ModelCalcDO> getModelCalcPage(ModelCalcPageReqVO pageReqVO);

    /**
     * 创建模型计算任务
     *
     * @param createReqVO 模型计算任务信息
     * @return 模型计算任务编号
     */
    Long createModelCalc(ModelCalcSaveReqVO createReqVO);

    /**
     * 更新模型计算任务
     *
     * @param updateReqVO 模型计算任务信息
     */
    int updateModelCalc(ModelCalcSaveReqVO updateReqVO);

    /**
     * 删除模型计算任务
     *
     * @param idList 模型计算任务编号
     */
    int removeModelCalc(Collection<Long> idList);

    /**
     * 获得模型计算任务详情
     *
     * @param id 模型计算任务编号
     * @return 模型计算任务
     */
    ModelCalcDO getModelCalcById(Long id);

    /**
     * 获得全部模型计算任务列表
     *
     * @return 模型计算任务列表
     */
    List<ModelCalcDO> getModelCalcList();

    /**
     * 获得全部模型计算任务 Map
     *
     * @return 模型计算任务 Map
     */
    Map<Long, ModelCalcDO> getModelCalcMap();


    /**
     * 导入模型计算任务数据
     *
     * @param importExcelList 模型计算任务数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    String importModelCalc(List<ModelCalcRespVO> importExcelList, boolean isUpdateSupport, String operName);

}
