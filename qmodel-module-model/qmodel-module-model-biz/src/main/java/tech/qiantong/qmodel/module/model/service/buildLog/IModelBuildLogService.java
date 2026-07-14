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

}
