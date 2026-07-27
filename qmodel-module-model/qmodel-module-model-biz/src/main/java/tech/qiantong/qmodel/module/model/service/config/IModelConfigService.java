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

package tech.qiantong.qmodel.module.model.service.config;

import java.util.List;
import java.util.Map;
import java.util.Collection;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.web.multipart.MultipartFile;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigTestReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigTestRespVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.config.ModelConfigDO;
/**
 * 模型配置详情Service接口
 *
 * @author anivia
 * @date 2026-07-07
 */
public interface IModelConfigService extends IService<ModelConfigDO> {

    /**
     * 获得模型配置详情分页列表
     *
     * @param pageReqVO 分页请求
     * @return 模型配置详情分页列表
     */
    PageResult<ModelConfigDO> getModelConfigPage(ModelConfigPageReqVO pageReqVO);

    /**
     * 创建模型配置详情
     *
     * @param createReqVO 模型配置详情信息
     * @return 模型配置详情编号
     */
    Long createModelConfig(ModelConfigSaveReqVO createReqVO);

    /**
     * 更新模型配置详情
     *
     * @param updateReqVO 模型配置详情信息
     */
    int updateModelConfig(ModelConfigSaveReqVO updateReqVO);

    /**
     * 删除模型配置详情
     *
     * @param idList 模型配置详情编号
     */
    int removeModelConfig(Collection<Long> idList);

    /**
     * 获得模型配置详情详情
     *
     * @param id 模型配置详情编号
     * @return 模型配置详情
     */
    ModelConfigDO getModelConfigById(Long id);

    /**
     * 获得全部模型配置详情列表
     *
     * @return 模型配置详情列表
     */
    List<ModelConfigDO> getModelConfigList();

    /**
     * 获得全部模型配置详情 Map
     *
     * @return 模型配置详情 Map
     */
    Map<Long, ModelConfigDO> getModelConfigMap();


    /**
     * 测试模型配置接口调用
     *
     * @param testReqVO 测试请求参数
     * @return 测试结果
     */
    ModelConfigTestRespVO testModelConfig(ModelConfigTestReqVO testReqVO);

    /**
     * 导入模型配置详情数据
     *
     * @param importExcelList 模型配置详情数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    String importModelConfig(List<ModelConfigRespVO> importExcelList, boolean isUpdateSupport, String operName);

}
