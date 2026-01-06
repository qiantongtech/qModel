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

package tech.qiantong.qmodel.module.modelReconstitution.mapper;

import tech.qiantong.qmodel.module.modelReconstitution.domain.*;

import java.util.*;

/**
 * 操作历史Mapper接口
 *
 * @author surge
 * @date 2023-09-15
 */
public interface ModelHistoryReconstitutionMapper {
    /**
     * 查询操作历史
     *
     * @param id 操作历史主键
     * @return 操作历史
     */
    public ModelHistoryReconstitution selectModelHistoryById(Long id);

    /**
     * 查询操作历史列表
     *
     * @param modelHistory 操作历史
     * @return 操作历史集合
     */
    public List<ModelHistoryReconstitution> selectModelHistoryList(ModelHistoryReconstitution modelHistory);

    /**
     * 查询某个操作历史列表
     *
     * @param modelId 操作历史
     * @return 操作历史集合
     */
    public List<ModelHistoryReconstitution> selectModelHistoryByModelId(Long modelId);

    /**
     * 新增操作历史
     *
     * @param modelHistory 操作历史
     * @return 结果
     */
    public int insertModelHistory(ModelHistoryReconstitution modelHistory);

    /**
     * 修改操作历史
     *
     * @param modelHistory 操作历史
     * @return 结果
     */
    public int updateModelHistory(ModelHistoryReconstitution modelHistory);

    /**
     * 删除操作历史
     *
     * @param id 操作历史主键
     * @return 结果
     */
    public int deleteModelHistoryById(Long id);

    /**
     * 批量删除操作历史
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteModelHistoryByIds(Long[] ids);
}
