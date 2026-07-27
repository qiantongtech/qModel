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

package tech.qiantong.qmodel.module.model.convert.buildLog;

import java.util.List;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import tech.qiantong.qmodel.module.model.controller.admin.buildLog.vo.ModelBuildLogPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.buildLog.vo.ModelBuildLogRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.buildLog.vo.ModelBuildLogSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.buildLog.ModelBuildLogDO;

/**
 * 构建日志 Convert
 *
 * @author qModel
 * @date 2026-07-14
 */
@Mapper
public interface ModelBuildLogConvert {
    ModelBuildLogConvert INSTANCE = Mappers.getMapper(ModelBuildLogConvert.class);

    /**
     * PageReqVO 转换为 DO
     * @param modelBuildLogPageReqVO 请求参数
     * @return ModelBuildLogDO
     */
     ModelBuildLogDO convertToDO(ModelBuildLogPageReqVO modelBuildLogPageReqVO);

    /**
     * SaveReqVO 转换为 DO
     * @param modelBuildLogSaveReqVO 保存请求参数
     * @return ModelBuildLogDO
     */
     ModelBuildLogDO convertToDO(ModelBuildLogSaveReqVO modelBuildLogSaveReqVO);

    /**
     * DO 转换为 RespVO
     * @param modelBuildLogDO 实体对象
     * @return ModelBuildLogRespVO
     */
     ModelBuildLogRespVO convertToRespVO(ModelBuildLogDO modelBuildLogDO);

    /**
     * DOList 转换为 RespVOList
     * @param modelBuildLogDOList 实体对象列表
     * @return List<ModelBuildLogRespVO>
     */
     List<ModelBuildLogRespVO> convertToRespVOList(List<ModelBuildLogDO> modelBuildLogDOList);
}
