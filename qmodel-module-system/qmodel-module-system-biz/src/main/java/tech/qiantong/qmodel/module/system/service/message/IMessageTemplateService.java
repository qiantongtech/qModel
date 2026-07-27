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

package tech.qiantong.qmodel.module.system.service.message;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.github.pagehelper.PageInfo;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.system.controller.admin.system.message.vo.MessageTemplatePageReqVO;
import tech.qiantong.qmodel.module.system.convert.message.MessageTemplateConvert;
import tech.qiantong.qmodel.module.system.dal.dataobject.message.MessageTemplateDO;

import java.util.List;

/**
 * 消息模板Service接口
 *
 * @author anivia
 * @date 2024-10-31
 */
public interface IMessageTemplateService extends IService<MessageTemplateDO> {

    default PageResult<MessageTemplateDO> getMessageTemplatePage(MessageTemplatePageReqVO messageTemplate) {
        QueryWrapper<MessageTemplateDO> queryWrapper = new QueryWrapper<>(MessageTemplateConvert.INSTANCE.convertToDO(messageTemplate));
        List<MessageTemplateDO> list = list(queryWrapper);

        return new PageResult(list, new PageInfo(list).getTotal());
    }
}
