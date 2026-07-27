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

package tech.qiantong.qmodel.module.model.service.buildLog;

import java.util.List;
import java.util.Map;
import java.util.Collection;
import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.buildLog.vo.ModelBuildLogSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.buildLog.vo.ModelBuildLogPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.buildLog.vo.ModelBuildLogRespVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.buildLog.ModelBuildLogDO;
/**
 * 构建日志Service接口
 *
 * @author qModel
 * @date 2026-07-14
 */
public interface IModelBuildLogService extends IService<ModelBuildLogDO> {

    /**
     * 获得构建日志分页列表
     *
     * @param pageReqVO 分页请求
     * @return 构建日志分页列表
     */
    PageResult<ModelBuildLogDO> getModelBuildLogPage(ModelBuildLogPageReqVO pageReqVO);

    /**
     * 创建构建日志
     *
     * @param createReqVO 构建日志信息
     * @return 构建日志编号
     */
    Long createModelBuildLog(ModelBuildLogSaveReqVO createReqVO);

    /**
     * 更新构建日志
     *
     * @param updateReqVO 构建日志信息
     */
    int updateModelBuildLog(ModelBuildLogSaveReqVO updateReqVO);

    /**
     * 删除构建日志
     *
     * @param idList 构建日志编号
     */
    int removeModelBuildLog(Collection<Long> idList);

    /**
     * 获得构建日志详情
     *
     * @param id 构建日志编号
     * @return 构建日志
     */
    ModelBuildLogDO getModelBuildLogById(Long id);

    /**
     * 获得全部构建日志列表
     *
     * @return 构建日志列表
     */
    List<ModelBuildLogDO> getModelBuildLogList();

    /**
     * 获得全部构建日志 Map
     *
     * @return 构建日志 Map
     */
    Map<Long, ModelBuildLogDO> getModelBuildLogMap();


    /**
     * 导入构建日志数据
     *
     * @param importExcelList 构建日志数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    String importModelBuildLog(List<ModelBuildLogRespVO> importExcelList, boolean isUpdateSupport, String operName);

    /**
     * 创建构建日志开始记录
     *
     * @param resourceId 模型文件id
     * @param modelId 模型id
     * @param modelName 模型名称
     * @param buildType 构建类型
     * @return 构建日志编号
     */
    Long createBuildLogStart(Long resourceId, Long modelId, String modelName, Integer buildType);

    /**
     * 更新构建日志成功状态
     *
     * @param buildLogId 构建日志编号
     * @param installedPackages 已安装依赖包列表JSON
     * @param missingPackages 缺失依赖包列表JSON
     * @param requirements requirements.txt内容
     * @param buildLog 构建日志内容
     */
    void updateBuildLogSuccess(Long buildLogId, String installedPackages, String missingPackages,
                              String requirements, String buildLog);

    /**
     * 更新构建日志失败状态
     *
     * @param buildLogId 构建日志编号
     * @param errorMessage 错误信息
     * @param failedPackages 安装失败的依赖包列表JSON
     * @param buildLog 构建日志内容
     */
    void updateBuildLogFailed(Long buildLogId, String errorMessage, String failedPackages, String buildLog);

    /**
     * 获取最新的构建日志
     *
     * @param resourceId 模型文件id
     * @return 构建日志
     */
    ModelBuildLogDO getLatestBuildLog(Long resourceId);

}
