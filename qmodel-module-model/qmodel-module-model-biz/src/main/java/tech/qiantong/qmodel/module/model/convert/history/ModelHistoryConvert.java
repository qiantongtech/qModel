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
