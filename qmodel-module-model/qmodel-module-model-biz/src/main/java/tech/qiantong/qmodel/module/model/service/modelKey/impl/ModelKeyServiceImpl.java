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

package tech.qiantong.qmodel.module.model.service.modelKey.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.qiantong.qmodel.common.utils.uuid.UUID;
import tech.qiantong.qmodel.module.model.controller.admin.modelKey.vo.ModelKeyPageVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.modelKey.ModelKeyDO;
import tech.qiantong.qmodel.module.model.dal.mapper.modelKey.ModelKeyMapper;
import tech.qiantong.qmodel.module.model.service.modelKey.IModelKeyService;

import java.util.Collection;
import java.util.List;
/**
 * 模型访问 keyService业务层处理
 *
 * @author anivia
 * @date 2026-07-30
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class ModelKeyServiceImpl  extends ServiceImpl<ModelKeyMapper,ModelKeyDO> implements IModelKeyService {

    @Override
    public List<ModelKeyDO> listByModel(ModelKeyPageVO pageReqVO) {
        LambdaQueryWrapper<ModelKeyDO> queryWrapper = Wrappers.lambdaQuery(ModelKeyDO.class)
                .eq(ModelKeyDO::getModelId, pageReqVO.getModelId());
        return super.list(queryWrapper);
    }

    /**
     * 创建模型访问 key
     *
     * @param modelId 模型Id
     * @return 模型访问 key编号
     */
    @Override
    public Long createModelKey(Long modelId) {
        ModelKeyDO dictType = new ModelKeyDO();
        dictType.setModelId(modelId);
        dictType.setApiKey(UUID.fastUUID().toString());
        baseMapper.insert(dictType);
        return dictType.getId();
    }

    /**
     * 删除模型访问 key
     *
     * @param idList 模型访问 key编号
     */
    @Override
    public int removeModelKey(Collection<Long> idList) {
        // 批量删除模型访问 key
        return baseMapper.deleteBatchIds(idList);
    }
}
