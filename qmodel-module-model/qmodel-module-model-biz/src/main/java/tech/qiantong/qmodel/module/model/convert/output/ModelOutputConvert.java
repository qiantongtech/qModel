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

package tech.qiantong.qmodel.module.model.convert.output;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import tech.qiantong.qmodel.module.model.controller.admin.output.vo.ModelOutputPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.output.vo.ModelOutputRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.output.vo.ModelOutputSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.output.ModelOutputDO;

import java.util.List;

/**
 * 模型输出管理 Convert
 *
 * @author qModel
 * @date 2026-01-09
 */
@Mapper
public interface ModelOutputConvert {
    ModelOutputConvert INSTANCE = Mappers.getMapper(ModelOutputConvert.class);

    /**
     * PageReqVO 转换为 DO
     * @param modelOutputPageReqVO 请求参数
     * @return ModelOutputDO
     */
     ModelOutputDO convertToDO(ModelOutputPageReqVO modelOutputPageReqVO);

    /**
     * SaveReqVO 转换为 DO
     * @param modelOutputSaveReqVO 保存请求参数
     * @return ModelOutputDO
     */
     ModelOutputDO convertToDO(ModelOutputSaveReqVO modelOutputSaveReqVO);

    /**
     * DO 转换为 RespVO
     * @param modelOutputDO 实体对象
     * @return ModelOutputRespVO
     */
     ModelOutputRespVO convertToRespVO(ModelOutputDO modelOutputDO);

    /**
     * DOList 转换为 RespVOList
     * @param modelOutputDOList 实体对象列表
     * @return List<ModelOutputRespVO>
     */
     List<ModelOutputRespVO> convertToRespVOList(List<ModelOutputDO> modelOutputDOList);
}
