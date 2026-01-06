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
 * 接口地址Mapper接口
 *
 * @author shu
 * @date 2024-01-10
 */
public interface ModelInterfaceAddressMapper {
    /**
     * 查询接口地址
     *
     * @param id 接口地址主键
     * @return 接口地址
     */
    public ModelInterfaceAddress selectModelInterfaceAddressById(Long id);

    /**
     * 查询接口地址列表
     *
     * @param modelInterfaceAddress 接口地址
     * @return 接口地址集合
     */
    public List<ModelInterfaceAddress> selectModelInterfaceAddressList(ModelInterfaceAddress modelInterfaceAddress);

    /**
     * 新增接口地址
     *
     * @param modelInterfaceAddress 接口地址
     * @return 结果
     */
    public int insertModelInterfaceAddress(ModelInterfaceAddress modelInterfaceAddress);

    /**
     * 修改接口地址
     *
     * @param modelInterfaceAddress 接口地址
     * @return 结果
     */
    public int updateModelInterfaceAddress(ModelInterfaceAddress modelInterfaceAddress);

    /**
     * 删除接口地址
     *
     * @param id 接口地址主键
     * @return 结果
     */
    public int deleteModelInterfaceAddressById(Integer id);

    /**
     * 批量删除接口地址
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteModelInterfaceAddressByIds(Integer[] ids);
}
