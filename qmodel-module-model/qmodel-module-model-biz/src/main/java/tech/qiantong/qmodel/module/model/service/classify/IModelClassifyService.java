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

package tech.qiantong.qmodel.module.model.service.classify;

import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.classify.vo.ModelClassifyPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.classify.vo.ModelClassifyRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.classify.vo.ModelClassifySaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.classify.ModelClassifyDO;

import java.util.Collection;
import java.util.List;
import java.util.Map;
/**
 * 模型分类Service接口
 *
 * @author qModel
 * @date 2026-01-07
 */
public interface IModelClassifyService extends IService<ModelClassifyDO> {

    /**
     * 获得模型分类分页列表
     *
     * @param pageReqVO 分页请求
     * @return 模型分类分页列表
     */
    PageResult<ModelClassifyDO> getModelClassifyPage(ModelClassifyPageReqVO pageReqVO);

    /**
     * 获得全部获得模型分类
     * @param reqVO 模型分类信息
     * @return 获得全部获得模型分类
     */
    List<ModelClassifyDO> getModelClassifyList(ModelClassifyPageReqVO reqVO);

    /**
     * 创建模型分类
     *
     * @param createReqVO 模型分类信息
     * @return 模型分类编号
     */
    Long createModelClassify(ModelClassifySaveReqVO createReqVO);

    /**
     * 更新模型分类
     *
     * @param updateReqVO 模型分类信息
     */
    int updateModelClassify(ModelClassifySaveReqVO updateReqVO);

    /**
     * 删除模型分类
     *
     * @param idList 模型分类编号
     */
    int removeModelClassify(Collection<Long> idList);

    /**
     * 获得模型分类详情
     *
     * @param id 模型分类编号
     * @return 模型分类
     */
    ModelClassifyDO getModelClassifyById(Long id);

    /**
     * 获得全部模型分类列表
     *
     * @return 模型分类列表
     */
    List<ModelClassifyDO> getModelClassifyList();

    /**
     * 获得全部模型分类 Map
     *
     * @return 模型分类 Map
     */
    Map<Long, ModelClassifyDO> getModelClassifyMap();


    /**
     * 导入模型分类数据
     *
     * @param importExcelList 模型分类数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    String importModelClassify(List<ModelClassifyRespVO> importExcelList, boolean isUpdateSupport, String operName);

    /**
     * 获取模型分类下的所有子孙级模型id集合
     *
     * @param id 模型分类id
     * @return 模型分类下的所有子孙级模型id集合
     */
    List<Long> getModelClassifyIds(Long id);

    /**
     * 查询模型分类总数
     *
     * @return 模型分类总数
     */
    public int countModelClassify();

    /**
     * 查询上周新增的模型分类数量
     *
     * @return 上周新增的模型分类数量
     */
    public int countLastWeek();

}
