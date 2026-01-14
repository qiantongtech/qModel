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

package tech.qiantong.qmodel.module.model.service.interfaceAddress;

import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.vo.ModelInterfaceAddressPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.vo.ModelInterfaceAddressRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.vo.ModelInterfaceAddressSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.interfaceAddress.ModelInterfaceAddressDO;

import java.util.Collection;
import java.util.List;
import java.util.Map;
/**
 * 接口地址Service接口
 *
 * @author qModel
 * @date 2026-01-09
 */
public interface IModelInterfaceAddressService extends IService<ModelInterfaceAddressDO> {

    /**
     * 获得接口地址分页列表
     *
     * @param pageReqVO 分页请求
     * @return 接口地址分页列表
     */
    PageResult<ModelInterfaceAddressDO> getModelInterfaceAddressPage(ModelInterfaceAddressPageReqVO pageReqVO);

    /**
     * 获得接口地址分页列表（包含版本信息）
     *
     * @param pageReqVO 分页请求
     * @return 接口地址分页列表
     */
    PageResult<ModelInterfaceAddressRespVO> getModelInterfaceAddressPageWithVersion(ModelInterfaceAddressPageReqVO pageReqVO);

    /**
     * 创建接口地址
     *
     * @param createReqVO 接口地址信息
     * @return 接口地址编号
     */
    Long createModelInterfaceAddress(ModelInterfaceAddressSaveReqVO createReqVO);

    /**
     * 更新接口地址
     *
     * @param updateReqVO 接口地址信息
     */
    int updateModelInterfaceAddress(ModelInterfaceAddressSaveReqVO updateReqVO);

    /**
     * 删除接口地址
     *
     * @param idList 接口地址编号
     */
    int removeModelInterfaceAddress(Collection<Long> idList);

    /**
     * 获得接口地址详情
     *
     * @param id 接口地址编号
     * @return 接口地址
     */
    ModelInterfaceAddressDO getModelInterfaceAddressById(Long id);

    /**
     * 获得全部接口地址列表
     *
     * @return 接口地址列表
     */
    List<ModelInterfaceAddressDO> getModelInterfaceAddressList();

    /**
     * 获得全部接口地址 Map
     *
     * @return 接口地址 Map
     */
    Map<Long, ModelInterfaceAddressDO> getModelInterfaceAddressMap();


    /**
     * 导入接口地址数据
     *
     * @param importExcelList 接口地址数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    String importModelInterfaceAddress(List<ModelInterfaceAddressRespVO> importExcelList, boolean isUpdateSupport, String operName);

}