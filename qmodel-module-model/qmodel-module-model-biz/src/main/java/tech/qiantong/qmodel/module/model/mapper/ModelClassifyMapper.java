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
 * 模型分类Mapper接口
 *
 * @author surge
 * @date 2023-09-18
 */
public interface ModelClassifyMapper {
    /**
     * 查询模型分类
     *
     * @param id 模型分类主键
     * @return 模型分类
     */
    public ModelClassify selectModelClassifyById(Long id);

    /**
     * 查询模型分类列表
     *
     * @param modelClassify 模型分类
     * @return 模型分类集合
     */
    public List<ModelClassify> selectModelClassifyList(ModelClassify modelClassify);

    /**
     * 新增模型分类
     *
     * @param modelClassify 模型分类
     * @return 结果
     */
    public int insertModelClassify(ModelClassify modelClassify);

    /**
     * 修改模型分类
     *
     * @param modelClassify 模型分类
     * @return 结果
     */
    public int updateModelClassify(ModelClassify modelClassify);

    /**
     * 删除模型分类
     *
     * @param id 模型分类主键
     * @return 结果
     */
    public int deleteModelClassifyById(Long id);

    /**
     * 批量删除模型分类
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteModelClassifyByIds(Long[] ids);
}
