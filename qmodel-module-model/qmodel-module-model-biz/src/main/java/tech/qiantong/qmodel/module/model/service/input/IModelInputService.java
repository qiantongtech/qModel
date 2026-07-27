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

package tech.qiantong.qmodel.module.model.service.input;

import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.input.vo.ModelInputPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.input.vo.ModelInputRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.input.vo.ModelInputSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.input.ModelInputDO;

import java.util.Collection;
import java.util.List;
import java.util.Map;
/**
 * 模型输入管理Service接口
 *
 * @author qModel
 * @date 2026-01-09
 */
public interface IModelInputService extends IService<ModelInputDO> {

    /**
     * 获得模型输入管理分页列表
     *
     * @param pageReqVO 分页请求
     * @return 模型输入管理分页列表
     */
    PageResult<ModelInputDO> getModelInputPage(ModelInputPageReqVO pageReqVO);

    /**
     * 创建模型输入管理
     *
     * @param createReqVO 模型输入管理信息
     * @return 模型输入管理编号
     */
    Long createModelInput(ModelInputSaveReqVO createReqVO);

    /**
     * 更新模型输入管理
     *
     * @param updateReqVO 模型输入管理信息
     */
    int updateModelInput(ModelInputSaveReqVO updateReqVO);

    /**
     * 删除模型输入管理
     *
     * @param idList 模型输入管理编号
     */
    int removeModelInput(Collection<Long> idList);

    /**
     * 获得模型输入管理详情
     *
     * @param id 模型输入管理编号
     * @return 模型输入管理
     */
    ModelInputDO getModelInputById(Long id);

    /**
     * 获得全部模型输入管理列表
     *
     * @return 模型输入管理列表
     */
    List<ModelInputDO> getModelInputList();

    /**
     * 获得全部模型输入管理 Map
     *
     * @return 模型输入管理 Map
     */
    Map<Long, ModelInputDO> getModelInputMap();


    /**
     * 导入模型输入管理数据
     *
     * @param importExcelList 模型输入管理数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    String importModelInput(List<ModelInputRespVO> importExcelList, boolean isUpdateSupport, String operName);


    /**
     * 查询模型输入总数
     *
     * @return 模型输入总数
     */
    public int countModelInput();

    /**
     * 查询上周新增的模型输入数量
     *
     * @return 上周新增的模型输入数量
     */
    public int countLastWeek();


    public List<ModelInputDO> selectModelInputList(ModelInputDO query);
}
