/*
 * Copyright © 2026-present Jiangsu Qiantong Technology Co., Ltd.
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

package tech.qiantong.qmodel.module.model.service.modelReconstitution;

import com.alibaba.fastjson2.JSONArray;
import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.vo.ModelReconstitutionPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.vo.ModelReconstitutionRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.vo.ModelReconstitutionSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.modelReconstitution.FileItemDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.modelReconstitution.ModelReconstitutionDO;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 模型库重构Service接口
 *
 * @author qModel
 * @date 2026-01-12
 */
public interface IModelReconstitutionService extends IService<ModelReconstitutionDO> {

    /**
     * 获得模型库重构分页列表
     *
     * @param pageReqVO 分页请求
     * @return 模型库重构分页列表
     */
    PageResult<ModelReconstitutionDO> getModelReconstitutionPage(ModelReconstitutionPageReqVO pageReqVO);

    /**
     * 创建模型库重构
     *
     * @param createReqVO 模型库重构信息
     * @return 模型库重构编号
     */
    Long createModelReconstitution(ModelReconstitutionSaveReqVO createReqVO);

    /**
     * 更新模型库重构
     *
     * @param updateReqVO 模型库重构信息
     */
    int updateModelReconstitution(ModelReconstitutionSaveReqVO updateReqVO);

    /**
     * 删除模型库重构
     *
     * @param idList 模型库重构编号
     */
    int removeModelReconstitution(Collection<Long> idList);

    /**
     * 获得模型库重构详情
     *
     * @param id 模型库重构编号
     * @return 模型库重构
     */
    ModelReconstitutionDO getModelReconstitutionById(Long id);

    /**
     * 获得全部模型库重构列表
     *
     * @return 模型库重构列表
     */
    List<ModelReconstitutionDO> getModelReconstitutionList();

    /**
     * 获得全部模型库重构 Map
     *
     * @return 模型库重构 Map
     */
    Map<Long, ModelReconstitutionDO> getModelReconstitutionMap();


    /**
     * 导入模型库重构数据
     *
     * @param importExcelList 模型库重构数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    String importModelReconstitution(List<ModelReconstitutionRespVO> importExcelList, boolean isUpdateSupport, String operName);

    /**
     * 按条件查询模型库重构列表
     *
     * @param modelReconstitution 查询条件
     * @return 模型库重构列表
     */
    List<ModelReconstitutionDO> selectModelReconstitutionList(ModelReconstitutionDO modelReconstitution);
    /**
     * 查询模型总数
     *
     * @return 模型总数
     */
    int countModelReconstitution();

    /**
     * 查询上周新增的模型数量
     *
     * @return 上周新增的模型数量
     */
    public int countLastWeek();

    /**
     * 获取压缩包内文件列表
     *
     * @param reqJsonStr 请求JSON字符串，包含fileUrl字段
     * @return 文件列表的JSONArray
     */
    List<FileItemDO> getFileList(String reqJsonStr);

}
