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

package tech.qiantong.qmodel.module.model.service.input;

import java.util.List;
import java.util.Map;
import java.util.Collection;
import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.input.vo.ModelInputSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.input.vo.ModelInputPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.input.vo.ModelInputRespVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.input.ModelInputDO;
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
