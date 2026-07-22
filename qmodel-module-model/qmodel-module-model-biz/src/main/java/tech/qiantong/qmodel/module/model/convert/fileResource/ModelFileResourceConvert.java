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

package tech.qiantong.qmodel.module.model.convert.fileResource;

import java.util.List;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import tech.qiantong.qmodel.module.model.controller.admin.fileResource.vo.ModelFileResourcePageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.fileResource.vo.ModelFileResourceRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.fileResource.vo.ModelFileResourceSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.fileResource.ModelFileResourceDO;

/**
 * 模型文件部署 Convert
 *
 * @author anivia
 * @date 2026-07-07
 */
@Mapper
public interface ModelFileResourceConvert {
    ModelFileResourceConvert INSTANCE = Mappers.getMapper(ModelFileResourceConvert.class);

    /**
     * PageReqVO 转换为 DO
     * @param modelFileResourcePageReqVO 请求参数
     * @return ModelFileResourceDO
     */
     ModelFileResourceDO convertToDO(ModelFileResourcePageReqVO modelFileResourcePageReqVO);

    /**
     * SaveReqVO 转换为 DO
     * @param modelFileResourceSaveReqVO 保存请求参数
     * @return ModelFileResourceDO
     */
     ModelFileResourceDO convertToDO(ModelFileResourceSaveReqVO modelFileResourceSaveReqVO);

    /**
     * DO 转换为 RespVO
     * @param modelFileResourceDO 实体对象
     * @return ModelFileResourceRespVO
     */
     ModelFileResourceRespVO convertToRespVO(ModelFileResourceDO modelFileResourceDO);

    /**
     * DOList 转换为 RespVOList
     * @param modelFileResourceDOList 实体对象列表
     * @return List<ModelFileResourceRespVO>
     */
     List<ModelFileResourceRespVO> convertToRespVOList(List<ModelFileResourceDO> modelFileResourceDOList);
}
