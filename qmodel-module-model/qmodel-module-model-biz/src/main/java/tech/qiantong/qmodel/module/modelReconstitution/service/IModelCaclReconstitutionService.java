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

package tech.qiantong.qmodel.module.modelReconstitution.service;

import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONObject;
import tech.qiantong.qmodel.module.modelReconstitution.domain.ModelCaclReconstitution;

import java.util.List;
import java.util.Map;

/**
 * 模型计算管理 Service接口
 *
 * @author Ywg
 * @date 2023-09-18
 */
public interface IModelCaclReconstitutionService {
    /**
     * 查询模型计算管理
     *
     * @param id 模型计算管理 主键
     * @return 模型计算管理
     */
    public ModelCaclReconstitution selectModelCaclById(Long id);

    /**
     * 查询模型计算管理 列表
     *
     * @param modelCacl 模型计算管理
     * @return 模型计算管理 集合
     */
    public List<ModelCaclReconstitution> selectModelCaclList(ModelCaclReconstitution modelCacl);

    /**
     * 新增模型计算管理
     *
     * @param modelCacl 模型计算管理
     * @return 结果
     */
    public int insertModelCacl(ModelCaclReconstitution modelCacl);

    /**
     * 修改模型计算管理
     *
     * @param modelCacl 模型计算管理
     * @return 结果
     */
    public int updateModelCacl(ModelCaclReconstitution modelCacl);

    /**
     * 批量删除模型计算管理
     *
     * @param ids 需要删除的模型计算管理 主键集合
     * @return 结果
     */
    public int deleteModelCaclByIds(Long[] ids);

    /**
     * 删除模型计算管理 信息
     *
     * @param id 模型计算管理 主键
     * @return 结果
     */
    public int deleteModelCaclById(Long id);

    /**
     * 模拟量触发水导轴承剩余趋势预测模型
     *
     * @param jsonObject
     * @return
     */
    String trendPredictionModelTry(JSONObject jsonObject);

    /**
     * 模拟量进行机组安全情况进行打分
     *
     * @param jsonObject
     * @return
     */
    String safetyEvaluationModelTry(JSONObject jsonObject);

    /**
     * 供水计划查询
     * @param jsonObject
     * @return
     */
    String waterSupplyPlan(JSONObject jsonObject);

    /**
     * 根据引水口分组及用水时间查询需水情况
     * @param jsonObject
     * @return
     */
    String waterNeedSituationList(JSONObject jsonObject);

    /**
     * 获取泵站参数
     * @param jsonObject
     * @return
     */
    String selectCalcEquipmentParam(JSONObject jsonObject, Map<String,String> headersMap);

    /**
     * 运行状态参数
     * @param jsonObject
     * @return
     */
    String queryRunningData(JSONObject jsonObject, Map<String,String> headersMap);

    /**
     * 保存泵站参数
     * @param jsonArray
     * @return
     */
    String saveCalcEquipmentParam(JSONArray jsonArray, Map<String,String> headersMap);

    /**
     * 模拟计算
     * @param jsonObject
     * @return
     */
    String getScheme(JSONObject jsonObject);

    /**
     * 查询模型输出总数
     *
     * @return 模型输出总数
     */
    public int count();

    /**
     * 查询上周新增的模型输出数量
     *
     * @return 上周新增的模型输出数量
     */
    public int countLastWeek();
}
