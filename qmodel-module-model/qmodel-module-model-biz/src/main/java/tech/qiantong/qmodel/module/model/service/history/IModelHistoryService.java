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
