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

package tech.qiantong.qmodel.module.model.convert.interfaceAddress;

import java.util.List;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.vo.ModelInterfaceAddressPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.vo.ModelInterfaceAddressRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.vo.ModelInterfaceAddressSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.interfaceAddress.ModelInterfaceAddressDO;

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
