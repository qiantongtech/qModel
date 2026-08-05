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

package tech.qiantong.qmodel.module.model.service.calcExecution;

import java.util.List;
import java.util.Map;
import java.util.Collection;
import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.calcExecution.vo.ModelCalcExecutionSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.calcExecution.vo.ModelCalcExecutionPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.calcExecution.vo.ModelCalcExecutionRespVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.calcExecution.ModelCalcExecutionDO;
/**
 * 模型计算执行记录Service接口
 *
 * @author qModel
 * @date 2026-07-28
 */
public interface IModelCalcExecutionService extends IService<ModelCalcExecutionDO> {

    /**
     * 获得模型计算执行记录分页列表
     *
     * @param pageReqVO 分页请求
     * @return 模型计算执行记录分页列表
     */
    PageResult<ModelCalcExecutionDO> getModelCalcExecutionPage(ModelCalcExecutionPageReqVO pageReqVO);

    /**
     * 创建模型计算执行记录
     *
     * @param createReqVO 模型计算执行记录信息
     * @return 模型计算执行记录编号
     */
    Long createModelCalcExecution(ModelCalcExecutionSaveReqVO createReqVO);

    /**
     * 更新模型计算执行记录
     *
     * @param updateReqVO 模型计算执行记录信息
     */
    int updateModelCalcExecution(ModelCalcExecutionSaveReqVO updateReqVO);

    /**
     * 删除模型计算执行记录
     *
     * @param idList 模型计算执行记录编号
     */
    int removeModelCalcExecution(Collection<Long> idList);

    /**
     * 获得模型计算执行记录详情
     *
     * @param id 模型计算执行记录编号
     * @return 模型计算执行记录
     */
    ModelCalcExecutionDO getModelCalcExecutionById(Long id);

    /**
     * 获得全部模型计算执行记录列表
     *
     * @return 模型计算执行记录列表
     */
    List<ModelCalcExecutionDO> getModelCalcExecutionList();

    /**
     * 获得全部模型计算执行记录 Map
     *
     * @return 模型计算执行记录 Map
     */
    Map<Long, ModelCalcExecutionDO> getModelCalcExecutionMap();


    /**
     * 导入模型计算执行记录数据
     *
     * @param importExcelList 模型计算执行记录数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    String importModelCalcExecution(List<ModelCalcExecutionRespVO> importExcelList, boolean isUpdateSupport, String operName);

    /**
     * 根据执行批次号获取执行记录
     *
     * @param executionNo 执行批次号
     * @return 执行记录
     */
    ModelCalcExecutionDO getByExecutionNo(String executionNo);

    /**
     * 根据执行批次号更新状态
     *
     * @param executionNo 执行批次号
     * @param status      状态
     * @return 更新行数
     */
    int updateStatusByExecutionNo(String executionNo, Integer status);

    /**
     * 更新执行结果
     *
     * @param executionNo  执行批次号
     * @param status       执行状态
     * @param outputResult 输出结果
     * @param errorMessage 错误信息
     * @param duration     耗时
     * @param resourceUsage 资源使用情况
     * @return 影响行数
     */
    int updateExecutionResult(String executionNo, Integer status, String outputResult, String errorMessage, Long duration, String resourceUsage);

    /**
     * 更新执行日志
     *
     * @param executionNo  执行批次号
     * @param executionLog 执行日志
     * @return 更新行数
     */
    int updateExecutionLog(String executionNo, String executionLog);

    /**
     * 增加重试次数
     *
     * @param executionNo 执行批次号
     * @return 更新行数
     */
    int incrementRetryCount(String executionNo);

    /**
     * 统计指定状态的执行记录数量
     *
     * @param status 状态
     * @return 数量
     */
    Long countByStatus(Integer status);

}
