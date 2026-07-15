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

package tech.qiantong.qmodel.module.model.service.invokeHistory;

import java.util.List;
import java.util.Map;
import java.util.Collection;
import java.util.Date;
import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.invokeHistory.vo.ModelInvokeHistorySaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.invokeHistory.vo.ModelInvokeHistoryPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.invokeHistory.vo.ModelInvokeHistoryRespVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.invokeHistory.ModelInvokeHistoryDO;
/**
 * 模型调用历史记录Service接口
 *
 * @author qmodel
 * @date 2026-07-14
 */
public interface IModelInvokeHistoryService extends IService<ModelInvokeHistoryDO> {

    /**
     * 获得模型调用历史记录分页列表
     *
     * @param pageReqVO 分页请求
     * @return 模型调用历史记录分页列表
     */
    PageResult<ModelInvokeHistoryDO> getModelInvokeHistoryPage(ModelInvokeHistoryPageReqVO pageReqVO);

    /**
     * 创建模型调用历史记录
     *
     * @param createReqVO 模型调用历史记录信息
     * @return 模型调用历史记录编号
     */
    Long createModelInvokeHistory(ModelInvokeHistorySaveReqVO createReqVO);

    /**
     * 更新模型调用历史记录
     *
     * @param updateReqVO 模型调用历史记录信息
     */
    int updateModelInvokeHistory(ModelInvokeHistorySaveReqVO updateReqVO);

    /**
     * 删除模型调用历史记录
     *
     * @param idList 模型调用历史记录编号
     */
    int removeModelInvokeHistory(Collection<Long> idList);

    /**
     * 获得模型调用历史记录详情
     *
     * @param id 模型调用历史记录编号
     * @return 模型调用历史记录
     */
    ModelInvokeHistoryDO getModelInvokeHistoryById(Long id);

    /**
     * 获得全部模型调用历史记录列表
     *
     * @return 模型调用历史记录列表
     */
    List<ModelInvokeHistoryDO> getModelInvokeHistoryList();

    /**
     * 获得全部模型调用历史记录 Map
     *
     * @return 模型调用历史记录 Map
     */
    Map<Long, ModelInvokeHistoryDO> getModelInvokeHistoryMap();


    /**
     * 导入模型调用历史记录数据
     *
     * @param importExcelList 模型调用历史记录数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    String importModelInvokeHistory(List<ModelInvokeHistoryRespVO> importExcelList, boolean isUpdateSupport, String operName);

    /**
     * 异步保存模型调用日志
     *
     * @param modelId 模型ID
     * @param modelName 模型名称
     * @param invokeType 调用类型（PYTHON/API）
     * @param inputParams 输入参数（JSON格式）
     * @param outputResult 输出结果（JSON格式）
     * @param status 调用状态（SUCCESS/FAILED）
     * @param errorMessage 错误信息
     * @param duration 执行耗时（毫秒）
     * @param startTime 开始时间
     * @param endTime 结束时间
     * @param clientIp 客户端IP
     */
    void saveInvokeLogAsync(Long modelId, String modelName, String invokeType, String inputParams,
                            String outputResult, String status, String errorMessage, Long duration,
                            Date startTime, Date endTime, String clientIp);

}
