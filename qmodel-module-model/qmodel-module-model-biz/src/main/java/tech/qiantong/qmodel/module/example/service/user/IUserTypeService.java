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

package tech.qiantong.qmodel.module.example.service.user;

import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.example.controller.admin.user.vo.UserTypePageReqVO;
import tech.qiantong.qmodel.module.example.controller.admin.user.vo.UserTypeSaveReqVO;
import tech.qiantong.qmodel.module.example.dal.dataobject.user.UserTypeDO;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 用户类型Service接口
 *
 * @author anivia
 * @date 2024-11-27
 */
public interface IUserTypeService extends IService<UserTypeDO> {

    /**
     * 获得用户类型分页列表
     *
     * @param pageReqVO 分页请求
     * @return 用户类型分页列表
     */
    PageResult<UserTypeDO> getUserTypePage(UserTypePageReqVO pageReqVO);

    /**
     * 创建用户类型
     *
     * @param createReqVO 用户类型信息
     * @return 用户类型编号
     */
    Long createUserType(UserTypeSaveReqVO createReqVO);

    /**
     * 更新用户类型
     *
     * @param updateReqVO 用户类型信息
     */
    int updateUserType(UserTypeSaveReqVO updateReqVO);

    /**
     * 删除用户类型
     *
     * @param idList 用户类型编号
     */
    int removeUserType(Collection<Long> idList);

    /**
     * 获得用户类型详情
     *
     * @param id 用户类型编号
     * @return 用户类型
     */
    UserTypeDO getUserTypeById(Long id);

    /**
     * 获得全部用户类型列表
     *
     * @return 用户类型列表
     */
    List<UserTypeDO> getUserTypeList();

    /**
     * 获得全部用户类型 Map
     *
     * @return 用户类型 Map
     */
    Map<Long, UserTypeDO> getUserTypeMap();

}
