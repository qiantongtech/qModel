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

package tech.qiantong.qmodel.module.example.convert.gen;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import tech.qiantong.qmodel.module.example.controller.admin.gen.vo.ExampleDeptPageReqVO;
import tech.qiantong.qmodel.module.example.controller.admin.gen.vo.ExampleDeptRespVO;
import tech.qiantong.qmodel.module.example.controller.admin.gen.vo.ExampleDeptSaveReqVO;
import tech.qiantong.qmodel.module.example.dal.dataobject.gen.ExampleDeptDO;

import java.util.List;

/**
 * 示例部门 Convert
 *
 * @author anivia
 * @date 2024-12-09
 */
@Mapper
public interface ExampleDeptConvert {
    ExampleDeptConvert INSTANCE = Mappers.getMapper(ExampleDeptConvert.class);

    /**
     * PageReqVO 转换为 DO
     * @param exampleDeptPageReqVO 请求参数
     * @return ExampleDeptDO
     */
     ExampleDeptDO convertToDO(ExampleDeptPageReqVO exampleDeptPageReqVO);

    /**
     * SaveReqVO 转换为 DO
     * @param exampleDeptSaveReqVO 保存请求参数
     * @return ExampleDeptDO
     */
     ExampleDeptDO convertToDO(ExampleDeptSaveReqVO exampleDeptSaveReqVO);

    /**
     * DO 转换为 RespVO
     * @param exampleDeptDO 实体对象
     * @return ExampleDeptRespVO
     */
     ExampleDeptRespVO convertToRespVO(ExampleDeptDO exampleDeptDO);

    /**
     * DOList 转换为 RespVOList
     * @param exampleDeptDOList 实体对象列表
     * @return List<ExampleDeptRespVO>
     */
     List<ExampleDeptRespVO> convertToRespVOList(List<ExampleDeptDO> exampleDeptDOList);
}
