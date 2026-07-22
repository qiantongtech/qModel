/*
 * Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
 *  *
 * This file is part of qModel Module Platform (Open Source Edition).
 *  *
 * qModel is licensed under Apache License 2.0 with additional qModel terms.
 * You may use qModel for commercial purposes, but you may not remove, hide,
 * modify, or replace the qModel logo, copyright notices, license notices,
 * or attribution information without a separate commercial license.
 *  *
 * White-label use, OEM distribution, rebranding, or presenting qModel as
 * another product requires separate commercial authorization from
 * Jiangsu Qiantong Technology Co., Ltd.
 *  *
 * Business License: `https://qmodel.tech/`
 * See the LICENSE file in the project root for full license information.
 */

package tech.qiantong.qmodel.module.model.convert.invokeHistory;

import java.util.List;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import tech.qiantong.qmodel.module.model.controller.admin.invokeHistory.vo.ModelInvokeHistoryPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.invokeHistory.vo.ModelInvokeHistoryRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.invokeHistory.vo.ModelInvokeHistorySaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.invokeHistory.ModelInvokeHistoryDO;

/**
 * 模型调用历史记录 Convert
 *
 * @author qmodel
 * @date 2026-07-14
 */
@Mapper
public interface ModelInvokeHistoryConvert {
    ModelInvokeHistoryConvert INSTANCE = Mappers.getMapper(ModelInvokeHistoryConvert.class);

    /**
     * PageReqVO 转换为 DO
     * @param modelInvokeHistoryPageReqVO 请求参数
     * @return ModelInvokeHistoryDO
     */
     ModelInvokeHistoryDO convertToDO(ModelInvokeHistoryPageReqVO modelInvokeHistoryPageReqVO);

    /**
     * SaveReqVO 转换为 DO
     * @param modelInvokeHistorySaveReqVO 保存请求参数
     * @return ModelInvokeHistoryDO
     */
     ModelInvokeHistoryDO convertToDO(ModelInvokeHistorySaveReqVO modelInvokeHistorySaveReqVO);

    /**
     * DO 转换为 RespVO
     * @param modelInvokeHistoryDO 实体对象
     * @return ModelInvokeHistoryRespVO
     */
     ModelInvokeHistoryRespVO convertToRespVO(ModelInvokeHistoryDO modelInvokeHistoryDO);

    /**
     * DOList 转换为 RespVOList
     * @param modelInvokeHistoryDOList 实体对象列表
     * @return List<ModelInvokeHistoryRespVO>
     */
     List<ModelInvokeHistoryRespVO> convertToRespVOList(List<ModelInvokeHistoryDO> modelInvokeHistoryDOList);
}
