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
 * 模型输入管理 Mapper接口
 *
 * @author YWG
 * @date 2023-09-14
 */
public interface ModelInputReconstitutionMapper {
    /**
     * 查询模型输入管理
     *
     * @param id 模型输入管理 主键
     * @return 模型输入管理
     */
    public ModelInputReconstitution selectModelInputById(Long id);

    /**
     * 查询模型输入管理 列表
     *
     * @param modelInput 模型输入管理
     * @return 模型输入管理 集合
     */
    public List<ModelInputReconstitution> selectModelInputList(ModelInputReconstitution modelInput);

    /**
     * 新增模型输入管理
     *
     * @param modelInput 模型输入管理
     * @return 结果
     */
    public int insertModelInput(ModelInputReconstitution modelInput);

    /**
     * 修改模型输入管理
     *
     * @param modelInput 模型输入管理
     * @return 结果
     */
    public int updateModelInput(ModelInputReconstitution modelInput);

    /**
     * 删除模型输入管理
     *
     * @param id 模型输入管理 主键
     * @return 结果
     */
    public int deleteModelInputById(Long id);

    /**
     * 批量删除模型输入管理
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteModelInputByIds(Long[] ids);
}
