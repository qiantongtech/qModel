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
