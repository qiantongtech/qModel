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

package tech.qiantong.qmodel.module.modelReconstitution.service.impl;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import tech.qiantong.qmodel.common.utils.*;
import tech.qiantong.qmodel.module.modelReconstitution.domain.*;
import tech.qiantong.qmodel.module.modelReconstitution.mapper.*;
import tech.qiantong.qmodel.module.modelReconstitution.service.*;

import java.util.*;

/**
 * 版本管理Service业务层处理
 *
 * @author surge
 * @date 2023-09-15
 */
@Service
public class ModelVersionReconstitutionServiceImpl implements IModelVersionReconstitutionService {
    @Autowired
    private ModelVersionReconstitutionMapper modelVersionReconstitutionMapper;

    /**
     * 查询版本管理
     *
     * @param id 版本管理主键
     * @return 版本管理
     */
    @Override
    public ModelVersionReconstitution selectModelVersionById(Long id) {
        return modelVersionReconstitutionMapper.selectModelVersionById(id);
    }

    /**
     * 查询版本管理列表
     *
     * @param modelVersion 版本管理
     * @return 版本管理
     */
    @Override
    public List<ModelVersionReconstitution> selectModelVersionList(ModelVersionReconstitution modelVersion) {
        modelVersion.setDelFlag(false);
        return modelVersionReconstitutionMapper.selectModelVersionList(modelVersion);
    }

    @Override
    public List<ModelVersionReconstitution> selectMVList(Long modelId) {
        return modelVersionReconstitutionMapper.selectMVList(modelId);
    }

    /**
     * 新增版本管理
     *
     * @param modelVersion 版本管理
     * @return 结果
     */
    @Override
    public int insertModelVersion(ModelVersionReconstitution modelVersion) {
                modelVersion.setCreateTime(DateUtils.getNowDate());
            return modelVersionReconstitutionMapper.insertModelVersion(modelVersion);
    }

    /**
     * 修改版本管理
     *
     * @param modelVersion 版本管理
     * @return 结果
     */
    @Override
    public int updateModelVersion(ModelVersionReconstitution modelVersion) {
                modelVersion.setUpdateTime(DateUtils.getNowDate());
        return modelVersionReconstitutionMapper.updateModelVersion(modelVersion);
    }

    /**
     * 批量删除版本管理
     *
     * @param ids 需要删除的版本管理主键
     * @return 结果
     */
    @Override
    public int deleteModelVersionByIds(Long[] ids) {
        return modelVersionReconstitutionMapper.deleteModelVersionByIds(ids);
    }

    /**
     * 删除版本管理信息
     *
     * @param id 版本管理主键
     * @return 结果
     */
    @Override
    public int deleteModelVersionById(Long id) {
        return modelVersionReconstitutionMapper.deleteModelVersionById(id);
    }
}
