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

package tech.qiantong.qmodel.module.model.service.cacl;

import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.modelCacl.vo.ModelCaclPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelCacl.vo.ModelCaclRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelCacl.vo.ModelCaclSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.cacl.ModelCaclDO;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 模型计算重构Service接口
 *
 * @author qModel
 * @date 2026-01-12
 */
public interface IModelCaclService extends IService<ModelCaclDO> {

    /**
     * 获得模型计算重构分页列表
     *
     * @param pageReqVO 分页请求
     * @return 模型计算重构分页列表
     */
    PageResult<ModelCaclDO> getModelCaclPage(ModelCaclPageReqVO pageReqVO);

    /**
     * 创建模型计算重构
     *
     * @param createReqVO 模型计算重构信息
     * @return 模型计算重构编号
     */
    Long createModelCacl(ModelCaclSaveReqVO createReqVO);

    /**
     * 更新模型计算重构
     *
     * @param updateReqVO 模型计算重构信息
     */
    int updateModelCacl(ModelCaclSaveReqVO updateReqVO);

    /**
     * 删除模型计算重构
     *
     * @param idList 模型计算重构编号
     */
    int removeModelCacl(Collection<Long> idList);

    /**
     * 获得模型计算重构详情
     *
     * @param id 模型计算重构编号
     * @return 模型计算重构
     */
    ModelCaclDO getModelCaclById(Long id);

    /**
     * 获得全部模型计算重构列表
     *
     * @return 模型计算重构列表
     */
    List<ModelCaclDO> getModelCaclList();

    /**
     * 获得全部模型计算重构 Map
     *
     * @return 模型计算重构 Map
     */
    Map<Long, ModelCaclDO> getModelCaclMap();


    /**
     * 导入模型计算重构数据
     *
     * @param importExcelList 模型计算重构数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    String importModelCacl(List<ModelCaclRespVO> importExcelList, boolean isUpdateSupport, String operName);

    /**
     * 查询模型输出总数
     *
     * @return 模型输出总数
     */
    int countModelCacl();

    /**
     * 查询上周新增的模型输出数量
     *
     * @return 上周新增的模型输出数量
     */
    public int countLastWeek();
}
