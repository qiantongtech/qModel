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

package tech.qiantong.qmodel.module.model.service.modelKey;

import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.common.core.domain.model.LoginUser;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.modelKey.vo.ModelKeyPageVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelKey.vo.ModelKeySaveVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.modelKey.ModelKeyDO;

import java.util.Collection;
import java.util.List;
/**
 * 模型访问 keyService接口
 *
 * @author anivia
 * @date 2026-07-30
 */
public interface IModelKeyService extends IService<ModelKeyDO> {

    /**
     * 获得模型访问 key分页列表
     *
     * @param pageReqVO 分页请求
     * @return 模型访问 key分页列表
     */
    PageResult<ModelKeyDO> listByModel(ModelKeyPageVO pageReqVO);

    /**
     * 创建模型访问 key
     *
     * @param modelKey 模型访问 key
     * @param currentUser 当前用户
     * @return 模型访问 key编号
     */
    Long createModelKey(ModelKeySaveVO saveVO, LoginUser currentUser);

    /**
     * 删除模型访问 key
     *
     * @param idList 模型访问 key编号
     */
    int removeModelKey(Collection<Long> idList);

    /**
     * 根据apiKey查询模型访问 key
     *
     * @param apiKey apiKey
     */
    ModelKeyDO getByApiKey(String apiKey);

}
