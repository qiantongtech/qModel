/*
 * Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
 *  *
 * This file is part of qModel Module Platform (Open Source Edition).
 *  *
 * qModel is licensed under Apache License 2.0 with additional qModel terms.
 * You may use qModel for commercial purposes, but you may not remove, hide,
 * modify, or replace the qModel logo, copyright notices, license notices,
 * or attribution information without a separate commercial license.
 *  *
 * White-label use, OEM distribution, rebranding, or presenting qModel as
 * another product requires separate commercial authorization from
 * Jiangsu Qiantong Technology Co., Ltd.
 *  *
 * Business License: `https://qmodel.tech/`
 * See the LICENSE file in the project root for full license information.
 */

package tech.qiantong.qmodel.module.model.service.operate;

import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.operate.vo.ModelOperatePageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.operate.vo.ModelOperateRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.operate.vo.ModelOperateSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.operate.ModelOperateDO;

import java.util.Collection;
import java.util.List;
import java.util.Map;
/**
 * 模型历史管理Service接口
 *
 * @author qModel
 * @date 2026-01-09
 */
public interface IModelOperateService extends IService<ModelOperateDO> {

    /**
     * 获得模型历史管理分页列表
     *
     * @param pageReqVO 分页请求
     * @return 模型历史管理分页列表
     */
    PageResult<ModelOperateDO> getModelOperatePage(ModelOperatePageReqVO pageReqVO);

    /**
     * 创建模型历史管理
     *
     * @param createReqVO 模型历史管理信息
     * @return 模型历史管理编号
     */
    Long createModelOperate(ModelOperateSaveReqVO createReqVO);

    /**
     * 更新模型历史管理
     *
     * @param updateReqVO 模型历史管理信息
     */
    int updateModelOperate(ModelOperateSaveReqVO updateReqVO);

    /**
     * 删除模型历史管理
     *
     * @param idList 模型历史管理编号
     */
    int removeModelOperate(Collection<Long> idList);

    /**
     * 获得模型历史管理详情
     *
     * @param id 模型历史管理编号
     * @return 模型历史管理
     */
    ModelOperateDO getModelOperateById(Long id);

    /**
     * 获得全部模型历史管理列表
     *
     * @return 模型历史管理列表
     */
    List<ModelOperateDO> getModelOperateList();

    /**
     * 获得全部模型历史管理 Map
     *
     * @return 模型历史管理 Map
     */
    Map<Long, ModelOperateDO> getModelOperateMap();


    /**
     * 导入模型历史管理数据
     *
     * @param importExcelList 模型历史管理数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    String importModelOperate(List<ModelOperateRespVO> importExcelList, boolean isUpdateSupport, String operName);

}
