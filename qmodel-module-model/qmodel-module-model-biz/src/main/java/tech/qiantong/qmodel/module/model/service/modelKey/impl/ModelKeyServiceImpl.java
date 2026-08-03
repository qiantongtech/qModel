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

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.UserCache;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.qiantong.qmodel.common.core.domain.entity.SysUser;
import tech.qiantong.qmodel.common.core.domain.model.LoginUser;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.exception.ServiceException;
import tech.qiantong.qmodel.common.utils.uuid.UUID;
import tech.qiantong.qmodel.module.model.controller.admin.modelKey.vo.ModelKeyPageVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelKey.vo.ModelKeySaveVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.modelKey.ModelKeyDO;
import tech.qiantong.qmodel.module.model.dal.mapper.modelKey.ModelKeyMapper;
import tech.qiantong.qmodel.module.model.service.modelKey.IModelKeyService;

import java.util.Collection;
import java.util.Date;
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
public class ModelKeyServiceImpl extends ServiceImpl<ModelKeyMapper, ModelKeyDO> implements IModelKeyService {

    /**
     * 获得模型访问 key分页列表
     *
     * @param pageReqVO 分页请求
     * @return 模型访问 key分页列表
     */
    @Override
    public PageResult<ModelKeyDO> listByModel(ModelKeyPageVO pageReqVO) {
        PageResult<ModelKeyDO> pageResult = baseMapper.selectPage(pageReqVO);
        pageResult.getList().forEach(this::maskKey);
        return pageResult;
    }

    /**
     * 创建模型访问 key
     *
     * @param saveVO      模型访问 key
     * @param currentUser 当前用户
     * @return 模型访问 key编号
     */
    @Override
    public Long createModelKey(ModelKeySaveVO saveVO, LoginUser currentUser) {
        ModelKeyDO entity = new ModelKeyDO();
        entity.setName(saveVO.getName());
        entity.setRemark(saveVO.getRemark());
        entity.setUserId(currentUser.getUserId());
        entity.setApiKey(generateApiKey());
        baseMapper.insert(entity);
        return entity.getId();
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

    /**
     * 根据apiKey查询用户信息
     *
     * @param apiKey apiKey
     */
    @Override
    public SysUser getUserByApiKey(String apiKey) {
        List<SysUser> sysUserList = baseMapper.selectUserList(apiKey);
        if (CollUtil.isEmpty(sysUserList)) {
            throw new ServiceException("apiKey 异常");
        }
        return sysUserList.get(0);
    }

    /**
     * 根据模型编号获取模型访问 key
     *
     * @param modelId 模型编号
     */
    @Override
    public String getKey(Long modelId) {
        ModelKeyDO modelKeyDO = super.getById(modelId);
        return modelKeyDO.getApiKey();
    }

    /**
     * 更新模型访问 key使用时间
     *
     * @param apiKey apiKey
     */
    @Override
    public void updateUseTime(String apiKey) {
        LambdaUpdateWrapper<ModelKeyDO> updateWrapper = Wrappers.lambdaUpdate(ModelKeyDO.class)
                .eq(ModelKeyDO::getApiKey, apiKey)
                .set(ModelKeyDO::getLastUseTime, new Date());
        super.update(updateWrapper);
    }

    /**
     * 生成模型访问 key
     *
     * @return 模型访问 key
     */
    private String generateApiKey() {
        String uuid = UUID.fastUUID().toString().replace("-", "");
        return "model-" + uuid;
    }

    /**
     * 模型访问 key脱敏
     *
     * @param modelKeyDO 模型访问 key
     */
    private void maskKey(ModelKeyDO modelKeyDO) {
        String data = modelKeyDO.getApiKey();
        if (StrUtil.isBlank(data) || data.length() < 18) {
            return;
        }
        String maskData = data.substring(0, 8) +
                "********************" +
                data.substring(data.length() - 10);
        modelKeyDO.setApiKey(maskData);
    }
}
