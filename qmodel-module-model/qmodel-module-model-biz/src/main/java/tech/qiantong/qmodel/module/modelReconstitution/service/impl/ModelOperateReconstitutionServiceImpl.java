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
 * 模型历史管理 Service业务层处理
 *
 * @author YangWenGuang
 * @date 2023-09-26
 */
@Service
public class ModelOperateReconstitutionServiceImpl implements IModelOperateReconstitutionService {
    @Autowired
    private ModelOperateReconstitutionMapper modelOperateReconstitutionMapper;

    /**
     * 查询模型历史管理
     *
     * @param id 模型历史管理 主键
     * @return 模型历史管理
     */
    @Override
    public ModelOperateReconstitution selectModelOperateById(Long id) {
        return modelOperateReconstitutionMapper.selectModelOperateById(id);
    }

    /**
     * 查询模型历史管理 列表
     *
     * @param modelOperate 模型历史管理
     * @return 模型历史管理
     */
    @Override
    public List<ModelOperateReconstitution> selectModelOperateList(ModelOperateReconstitution modelOperate) {
        modelOperate.setDelFlag(false);
        return modelOperateReconstitutionMapper.selectModelOperateList(modelOperate);
    }

    /**
     * 新增模型历史管理
     *
     * @param modelOperate 模型历史管理
     * @return 结果
     */
    @Override
    public int insertModelOperate(ModelOperateReconstitution modelOperate) {
                modelOperate.setCreateTime(DateUtils.getNowDate());
            return modelOperateReconstitutionMapper.insertModelOperate(modelOperate);
    }

    /**
     * 修改模型历史管理
     *
     * @param modelOperate 模型历史管理
     * @return 结果
     */
    @Override
    public int updateModelOperate(ModelOperateReconstitution modelOperate) {
                modelOperate.setUpdateTime(DateUtils.getNowDate());
        return modelOperateReconstitutionMapper.updateModelOperate(modelOperate);
    }

    /**
     * 批量删除模型历史管理
     *
     * @param ids 需要删除的模型历史管理 主键
     * @return 结果
     */
    @Override
    public int deleteModelOperateByIds(Long[] ids) {
        return modelOperateReconstitutionMapper.deleteModelOperateByIds(ids);
    }

    /**
     * 删除模型历史管理 信息
     *
     * @param id 模型历史管理 主键
     * @return 结果
     */
    @Override
    public int deleteModelOperateById(Long id) {
        return modelOperateReconstitutionMapper.deleteModelOperateById(id);
    }
}
