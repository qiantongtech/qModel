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

package tech.qiantong.qmodel.module.example.convert.user;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import tech.qiantong.qmodel.module.example.controller.admin.user.vo.UserTypePageReqVO;
import tech.qiantong.qmodel.module.example.controller.admin.user.vo.UserTypeRespVO;
import tech.qiantong.qmodel.module.example.controller.admin.user.vo.UserTypeSaveReqVO;
import tech.qiantong.qmodel.module.example.dal.dataobject.user.UserTypeDO;

import java.util.List;

/**
 * 用户类型 Convert
 *
 * @author anivia
 * @date 2024-11-27
 */
@Mapper
public interface UserTypeConvert {
    UserTypeConvert INSTANCE = Mappers.getMapper(UserTypeConvert.class);

    /**
     * PageReqVO 转换为 DO
     * @param userTypePageReqVO 请求参数
     * @return UserTypeDO
     */
     UserTypeDO convertToDO(UserTypePageReqVO userTypePageReqVO);

    /**
     * SaveReqVO 转换为 DO
     * @param userTypeSaveReqVO 保存请求参数
     * @return UserTypeDO
     */
     UserTypeDO convertToDO(UserTypeSaveReqVO userTypeSaveReqVO);

    /**
     * DO 转换为 RespVO
     * @param userTypeDO 实体对象
     * @return UserTypeRespVO
     */
     UserTypeRespVO convertToRespVO(UserTypeDO userTypeDO);

    /**
     * DOList 转换为 RespVOList
     * @param userTypeDOList 实体对象列表
     * @return List<UserTypeRespVO>
     */
     List<UserTypeRespVO> convertToRespVOList(List<UserTypeDO> userTypeDOList);
}
