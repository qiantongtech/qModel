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
