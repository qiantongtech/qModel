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

package tech.qiantong.qmodel.mybatis.core.util;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import tech.qiantong.qmodel.common.core.domain.model.LoginUser;
import tech.qiantong.qmodel.common.utils.SecurityUtils;

import java.util.Date;

@Component
public class MyMetaObjectHandler implements MetaObjectHandler {
    protected final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public void insertFill(MetaObject metaObject) {
        // 检查是否有名为createTime的字段，如果有则自动填充当前时间
        boolean hasCreateTime = metaObject.hasSetter("createTime");
        if (hasCreateTime) {
            metaObject.setValue("createTime", new Date());
        }
        // 检查是否有名为updateTime的字段，如果有则自动填充当前时间 部分表设置的updateTime不能为空
        boolean hasUpdateTime = metaObject.hasSetter("updateTime");
        if (hasUpdateTime) {
            metaObject.setValue("updateTime", new Date());
        }
        boolean hasCreatorId = metaObject.hasSetter("creatorId");
        boolean hasCreateBy = metaObject.hasSetter("createBy");
        boolean hasUpdatorId = metaObject.hasSetter("updatorId");
        boolean HasUpdateBy = metaObject.hasSetter("updateBy");
        LoginUser loginUser = null;
        try {
            loginUser = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        } catch (Exception e) {
            logger.info("获取用户信息异常:{}", e);
        }
        if (loginUser != null) {
            if (hasCreatorId) {
                metaObject.setValue("creatorId", loginUser.getUserId());
            }
            if (hasCreateBy) {
                metaObject.setValue("createBy", loginUser.getUser().getNickName());
            }
            if (hasUpdatorId) {
                metaObject.setValue("updatorId", loginUser.getUserId());
            }
            if (HasUpdateBy) {
                metaObject.setValue("updateBy", loginUser.getUser().getNickName());
            }
        }

    }


    @Override
    public void updateFill(MetaObject metaObject) {
        // 检查是否有名为updateTime的字段，如果有则自动填充当前时间
        boolean hasUpdateTime = metaObject.hasSetter("updateTime");
        if (hasUpdateTime) {
            metaObject.setValue("updateTime", new Date());
        }

        boolean hasUpdatorId = metaObject.hasSetter("updatorId");
        boolean HasUpdateBy = metaObject.hasSetter("updateBy");

        LoginUser loginUser = null;
        try {
            loginUser = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        } catch (Exception e) {
            logger.info("获取用户信息异常:{}", e);
        }
        if (loginUser != null) {
            if (hasUpdatorId) {
                metaObject.setValue("updatorId", loginUser.getUserId());
            }
            if (HasUpdateBy) {
                metaObject.setValue("updateBy", loginUser.getUser().getNickName());
            }
        }
    }
}
