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

package tech.qiantong.qmodel.auth.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.qiantong.qmodel.auth.domain.AuthClientUser;
import tech.qiantong.qmodel.auth.mapper.AuthClientUserMapper;
import tech.qiantong.qmodel.auth.service.IAuthClientUserService;

import javax.annotation.Resource;

/**
 * 应用和用户关联Service业务层处理
 *
 * @author qModel
 * @date 2024-08-31
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class AuthClientUserServiceImpl  extends ServiceImpl<AuthClientUserMapper,AuthClientUser> implements IAuthClientUserService {
    @Resource
    private AuthClientUserMapper authClientUserMapper;

}
