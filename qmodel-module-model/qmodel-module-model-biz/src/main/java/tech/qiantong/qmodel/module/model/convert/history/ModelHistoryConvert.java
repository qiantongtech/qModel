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

package tech.qiantong.qmodel.module.model.convert.history;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import tech.qiantong.qmodel.module.model.controller.admin.history.vo.ModelHistoryPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.history.vo.ModelHistoryRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.history.vo.ModelHistorySaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.history.ModelHistoryDO;

import java.util.List;

/**
 * 模型历史 Convert
 *
 * @author qModel
 * @date 2026-01-09
 */
@Mapper
public interface ModelHistoryConvert {
    ModelHistoryConvert INSTANCE = Mappers.getMapper(ModelHistoryConvert.class);

    /**
     * PageReqVO 转换为 DO
     * @param modelHistoryPageReqVO 请求参数
     * @return ModelHistoryDO
     */
     ModelHistoryDO convertToDO(ModelHistoryPageReqVO modelHistoryPageReqVO);

    /**
     * SaveReqVO 转换为 DO
     * @param modelHistorySaveReqVO 保存请求参数
     * @return ModelHistoryDO
     */
     ModelHistoryDO convertToDO(ModelHistorySaveReqVO modelHistorySaveReqVO);

    /**
     * DO 转换为 RespVO
     * @param modelHistoryDO 实体对象
     * @return ModelHistoryRespVO
     */
     ModelHistoryRespVO convertToRespVO(ModelHistoryDO modelHistoryDO);

    /**
     * DOList 转换为 RespVOList
     * @param modelHistoryDOList 实体对象列表
     * @return List<ModelHistoryRespVO>
     */
     List<ModelHistoryRespVO> convertToRespVOList(List<ModelHistoryDO> modelHistoryDOList);
}
