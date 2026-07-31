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
import tech.qiantong.qmodel.module.model.service.calc.dto.CalcExecuteResultDTO;
import tech.qiantong.qmodel.module.model.service.calc.dto.CalcQueueStatusDTO;
import tech.qiantong.qmodel.module.model.service.calc.dto.QueueTask;

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

    /**
     * 提交计算任务（加入优先级队列），并同步主表 input_params / 清旧 output_result 等字段
     *
     * @param id 计算任务ID
     * @return 执行结果
     */
    CalcExecuteResultDTO executeCalc(Long id);

    /**
     * 取消排队中的任务（按 executionNo）
     *
     * @param executionNo 执行批次号
     * @return 是否取消成功
     */
    boolean cancelCalc(String executionNo);

    /**
     * 按 calcId 终止当前「未完成」的执行批次（若找不到则直接标记主任务为终止）。
     *
     * @param calcId 模型计算任务ID
     * @return 是否终止成功
     */
    boolean cancelCalcByCalcId(Long calcId);

    /**
     * 获取队列状态（等待中、运行中、死信数量）
     *
     * @return 队列状态
     */
    CalcQueueStatusDTO getQueueStatus();

    /**
     * 获取等待中的任务列表
     *
     * @return 任务列表
     */
    List<QueueTask> listWaitingTasks();

    /**
     * 仅更新主表 status 字段（保留给只需要改状态的轻量场景用）。
     *
     * @param id     任务ID
     * @param status 新状态
     */
    void updateCalcStatus(Long id, Integer status);

    /**
     * 更新主表执行信息快照（使用 {@link ModelCalcSaveReqVO} 对象传参，字段为 null 代表本次不更新）。
     * <p>
     * 可更新字段：status / inputParams / outputResult / startTime / endTime / duration / errorMessage。
     * 要求 reqVO.id 必填，其他字段均 nullable。
     * </p>
     *
     * @param reqVO 承载待更新字段的 VO（直接复用保存请求 VO，不额外建 DTO）
     */
    void updateCalcExecutionInfo(ModelCalcSaveReqVO reqVO);
}
