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

package tech.qiantong.qmodel.module.model.convert.interfaceAddress;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.vo.ModelInterfaceAddressPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.vo.ModelInterfaceAddressRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.vo.ModelInterfaceAddressSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.interfaceAddress.ModelInterfaceAddressDO;

import java.util.List;

/**
 * 接口地址 Convert
 *
 * @author qModel
 * @date 2026-01-09
 */
@Mapper
public interface ModelInterfaceAddressConvert {
    ModelInterfaceAddressConvert INSTANCE = Mappers.getMapper(ModelInterfaceAddressConvert.class);

    /**
     * PageReqVO 转换为 DO
     * @param modelInterfaceAddressPageReqVO 请求参数
     * @return ModelInterfaceAddressDO
     */
     ModelInterfaceAddressDO convertToDO(ModelInterfaceAddressPageReqVO modelInterfaceAddressPageReqVO);

    /**
     * SaveReqVO 转换为 DO
     * @param modelInterfaceAddressSaveReqVO 保存请求参数
     * @return ModelInterfaceAddressDO
     */
     ModelInterfaceAddressDO convertToDO(ModelInterfaceAddressSaveReqVO modelInterfaceAddressSaveReqVO);

    /**
     * DO 转换为 RespVO
     * @param modelInterfaceAddressDO 实体对象
     * @return ModelInterfaceAddressRespVO
     */
     ModelInterfaceAddressRespVO convertToRespVO(ModelInterfaceAddressDO modelInterfaceAddressDO);

    /**
     * DOList 转换为 RespVOList
     * @param modelInterfaceAddressDOList 实体对象列表
     * @return List<ModelInterfaceAddressRespVO>
     */
     List<ModelInterfaceAddressRespVO> convertToRespVOList(List<ModelInterfaceAddressDO> modelInterfaceAddressDOList);
}
