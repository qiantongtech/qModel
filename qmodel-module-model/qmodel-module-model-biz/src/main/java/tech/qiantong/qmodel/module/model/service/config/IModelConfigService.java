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
