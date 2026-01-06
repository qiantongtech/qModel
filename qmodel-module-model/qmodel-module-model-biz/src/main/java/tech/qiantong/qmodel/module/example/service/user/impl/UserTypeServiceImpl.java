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

package tech.qiantong.qmodel.module.example.service.user.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.module.example.controller.admin.user.vo.UserTypePageReqVO;
import tech.qiantong.qmodel.module.example.controller.admin.user.vo.UserTypeSaveReqVO;
import tech.qiantong.qmodel.module.example.dal.dataobject.user.UserTypeDO;
import tech.qiantong.qmodel.module.example.dal.mapper.user.UserTypeMapper;
import tech.qiantong.qmodel.module.example.service.user.IUserTypeService;

import javax.annotation.Resource;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 用户类型Service业务层处理
 *
 * @author anivia
 * @date 2024-11-27
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class UserTypeServiceImpl  extends ServiceImpl<UserTypeMapper,UserTypeDO> implements IUserTypeService {
    @Resource
    private UserTypeMapper userTypeMapper;

    @Override
    public PageResult<UserTypeDO> getUserTypePage(UserTypePageReqVO pageReqVO) {
        return userTypeMapper.selectPage(pageReqVO);
    }

    @Override
    public Long createUserType(UserTypeSaveReqVO createReqVO) {
        UserTypeDO dictType = BeanUtils.toBean(createReqVO, UserTypeDO.class);
        userTypeMapper.insert(dictType);
        return dictType.getId();
    }

    @Override
    public int updateUserType(UserTypeSaveReqVO updateReqVO) {
        // 相关校验

        // 更新用户类型
        UserTypeDO updateObj = BeanUtils.toBean(updateReqVO, UserTypeDO.class);
        return userTypeMapper.updateById(updateObj);
    }

    @Override
    public int removeUserType(Collection<Long> idList) {
        // 批量删除用户类型
        return userTypeMapper.deleteBatchIds(idList);
    }

    @Override
    public UserTypeDO getUserTypeById(Long id) {
        return userTypeMapper.selectById(id);
    }

    @Override
    public List<UserTypeDO> getUserTypeList() {
        return userTypeMapper.selectList();
    }

    @Override
    public Map<Long, UserTypeDO> getUserTypeMap() {
        List<UserTypeDO> userTypeList = userTypeMapper.selectList();
        return userTypeList.stream()
                .collect(Collectors.toMap(
                        UserTypeDO::getId,
                        userTypeDO -> userTypeDO,
                        // 保留已存在的值
                        (existing, replacement) -> existing
                ));
    }

}
