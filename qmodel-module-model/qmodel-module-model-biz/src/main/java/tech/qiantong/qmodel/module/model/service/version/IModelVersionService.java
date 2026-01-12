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

package tech.qiantong.qmodel.module.model.service.version;

import java.util.List;
import java.util.Map;
import java.util.Collection;
import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.version.vo.ModelVersionSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.version.vo.ModelVersionPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.version.vo.ModelVersionRespVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.version.ModelVersionDO;
import tech.qiantong.qmodel.module.modelReconstitution.domain.ModelVersionReconstitution;

/**
 * 版本管理Service接口
 *
 * @author qModel
 * @date 2026-01-09
 */
public interface IModelVersionService extends IService<ModelVersionDO> {

    /**
     * 获得版本管理分页列表
     *
     * @param pageReqVO 分页请求
     * @return 版本管理分页列表
     */
    PageResult<ModelVersionDO> getModelVersionPage(ModelVersionPageReqVO pageReqVO);

    /**
     * 查询版本管理列表
     *
     * @param modelVersion 版本管理
     * @return 版本管理集合
     */
    public List<ModelVersionDO> selectModelVersionList(ModelVersionDO modelVersion);

    /**
     * 创建版本管理
     *
     * @param createReqVO 版本管理信息
     * @return 版本管理编号
     */
    Long createModelVersion(ModelVersionSaveReqVO createReqVO);

    /**
     * 更新版本管理
     *
     * @param updateReqVO 版本管理信息
     */
    int updateModelVersion(ModelVersionSaveReqVO updateReqVO);

    /**
     * 删除版本管理
     *
     * @param idList 版本管理编号
     */
    int removeModelVersion(Collection<Long> idList);

    /**
     * 获得版本管理详情
     *
     * @param id 版本管理编号
     * @return 版本管理
     */
    ModelVersionDO getModelVersionById(Long id);

    /**
     * 获得全部版本管理列表
     *
     * @return 版本管理列表
     */
    List<ModelVersionDO> getModelVersionList();

    /**
     * 获得全部版本管理 Map
     *
     * @return 版本管理 Map
     */
    Map<Long, ModelVersionDO> getModelVersionMap();


    /**
     * 导入版本管理数据
     *
     * @param importExcelList 版本管理数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    String importModelVersion(List<ModelVersionRespVO> importExcelList, boolean isUpdateSupport, String operName);

}
