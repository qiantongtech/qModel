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

package tech.qiantong.qmodel.module.model.mapper;

import tech.qiantong.qmodel.module.model.domain.*;

import java.util.*;

/**
 * 版本管理Mapper接口
 *
 * @author surge
 * @date 2023-09-15
 */
public interface ModelVersionMapper {
    /**
     * 查询版本管理
     *
     * @param id 版本管理主键
     * @return 版本管理
     */
    public ModelVersion selectModelVersionById(Long id);

    /**
     * 查询一个模型其版本管理列表
     *
     * @param modelId 版本管理主键
     * @return 版本管理
     */
    public  List<ModelVersion> selectMVList(Long modelId);

    /**
     * 查询版本管理列表
     *
     * @param modelVersion 版本管理
     * @return 版本管理集合
     */
    public List<ModelVersion> selectModelVersionList(ModelVersion modelVersion);

    /**
     * 新增版本管理
     *
     * @param modelVersion 版本管理
     * @return 结果
     */
    public int insertModelVersion(ModelVersion modelVersion);

    /**
     * 修改版本管理
     *
     * @param modelVersion 版本管理
     * @return 结果
     */
    public int updateModelVersion(ModelVersion modelVersion);

    /**
     * 删除版本管理
     *
     * @param id 版本管理主键
     * @return 结果
     */
    public int deleteModelVersionById(Long id);

    /**
     * 批量删除版本管理
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteModelVersionByIds(Long[] ids);
}
