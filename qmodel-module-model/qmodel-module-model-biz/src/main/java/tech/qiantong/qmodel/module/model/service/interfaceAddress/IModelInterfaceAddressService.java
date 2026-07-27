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
