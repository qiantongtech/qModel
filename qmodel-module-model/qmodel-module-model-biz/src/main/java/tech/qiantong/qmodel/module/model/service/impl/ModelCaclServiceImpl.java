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

package tech.qiantong.qmodel.module.model.service.impl;

import cn.hutool.http.HttpRequest;
import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import tech.qiantong.qmodel.common.utils.DateUtils;
import tech.qiantong.qmodel.module.model.domain.ModelCacl;
import tech.qiantong.qmodel.module.model.mapper.ModelCaclMapper;
import tech.qiantong.qmodel.module.model.service.IModelCaclService;

import java.util.List;
import java.util.Map;

/**
 * 模型计算管理 Service业务层处理
 *
 * @author Ywg
 * @date 2023-09-18
 */
@Service
public class ModelCaclServiceImpl implements IModelCaclService {
    @Autowired
    private ModelCaclMapper modelCaclMapper;

    @Value("${modelUrl}")
    private String modelUrl;
    @Value("${modelUrl2}")
    private String modelUrl2;



    /**
     * 查询模型计算管理
     *
     * @param id 模型计算管理 主键
     * @return 模型计算管理
     */
    @Override
    public ModelCacl selectModelCaclById(Long id) {
        return modelCaclMapper.selectModelCaclById(id);
    }

    /**
     * 查询模型计算管理 列表
     *
     * @param modelCacl 模型计算管理
     * @return 模型计算管理
     */
    @Override
    public List<ModelCacl> selectModelCaclList(ModelCacl modelCacl) {
        modelCacl.setDelFlag(false);
        return modelCaclMapper.selectModelCaclList(modelCacl);
    }

    /**
     * 新增模型计算管理
     *
     * @param modelCacl 模型计算管理
     * @return 结果
     */
    @Override
    public int insertModelCacl(ModelCacl modelCacl) {
        modelCacl.setCreateTime(DateUtils.getNowDate());
        return modelCaclMapper.insertModelCacl(modelCacl);
    }

    /**
     * 修改模型计算管理
     *
     * @param modelCacl 模型计算管理
     * @return 结果
     */
    @Override
    public int updateModelCacl(ModelCacl modelCacl) {
        modelCacl.setUpdateTime(DateUtils.getNowDate());
        return modelCaclMapper.updateModelCacl(modelCacl);
    }

    /**
     * 批量删除模型计算管理
     *
     * @param ids 需要删除的模型计算管理 主键
     * @return 结果
     */
    @Override
    public int deleteModelCaclByIds(Long[] ids) {
        return modelCaclMapper.deleteModelCaclByIds(ids);
    }

    /**
     * 删除模型计算管理 信息
     *
     * @param id 模型计算管理 主键
     * @return 结果
     */
    @Override
    public int deleteModelCaclById(Long id) {
        return modelCaclMapper.deleteModelCaclById(id);
    }

    /**
     * 模拟量触发水导轴承剩余趋势预测模型
     *
     * @param jsonObject
     * @return
     */
    @Override
    public String trendPredictionModelTry(JSONObject jsonObject) {
        String trendPredictionModelTry = HttpRequest.post(modelUrl+"/trend_prediction_model/try/").body(JSONUtil.toJsonStr(jsonObject), "application/json").execute().body();
        return trendPredictionModelTry;
    }

    /**
     * 模拟量进行机组安全情况进行打分
     *
     * @param jsonObject
     * @return
     */
    @Override
    public String safetyEvaluationModelTry(JSONObject jsonObject) {
        String trendPredictionModelTry = HttpRequest.post(modelUrl+"/safety_evaluation_model/try/").body(JSONUtil.toJsonStr(jsonObject), "application/json").execute().body();
        return trendPredictionModelTry;
    }

    /**
     * 供水计划查询
     *
     * @param jsonObject
     * @return
     */
    @Override
    public String waterSupplyPlan(JSONObject jsonObject) {
        String body = HttpRequest.post(modelUrl2+"/waterdiversion/api/water_balance/water_supply_plan/list").body(JSONUtil.toJsonStr(jsonObject), "application/json").execute().body();
        return body;
    }

    /**
     * 根据引水口分组及用水时间查询需水情况
     *
     * @param jsonObject
     * @return
     */
    @Override
    public String waterNeedSituationList(JSONObject jsonObject) {
        String body = HttpRequest.post(modelUrl2+"/waterdiversion/api/water_balance/water_need_situation/list").body(JSONUtil.toJsonStr(jsonObject), "application/json").execute().body();
        return body;
    }

    /**
     * 获取泵站参数
     *
     * @param jsonObject
     * @return
     */
    @Override
    public String selectCalcEquipmentParam(JSONObject jsonObject, Map<String, String> headersMap) {
        String body = HttpRequest.post(modelUrl2+"/waterdiversion/waterBalance/calc/selectCalcEquipmentParam").addHeaders(headersMap).body(JSONUtil.toJsonStr(jsonObject), "application/json").execute().body();
        return body;
    }

    /**
     * 运行状态参数
     *
     * @param jsonObject
     * @return
     */
    @Override
    public String queryRunningData(JSONObject jsonObject, Map<String, String> headersMap) {
        String body = HttpRequest.post(modelUrl2+"/waterdiversion/waterBalance/calc/queryRunningData").addHeaders(headersMap).body(JSONUtil.toJsonStr(jsonObject), "application/json").execute().body();
        return body;
    }

    /**
     * 保存泵站参数
     *
     * @param jsonArray
     * @return
     */
    @Override
    public String saveCalcEquipmentParam(JSONArray jsonArray, Map<String, String> headersMap) {
        String body = HttpRequest.post(modelUrl2+"/waterdiversion/waterBalance/calc/saveCalcEquipmentParam").addHeaders(headersMap).body(JSONUtil.toJsonStr(jsonArray), "application/json").execute().body();
        return body;
    }

    /**
     * 模拟计算
     * @param jsonObject
     * @return
     */
    @Override
    public String getScheme(JSONObject jsonObject) {
        String body = HttpRequest.post(modelUrl2+"/waterCalc/api/calc/getScheme").body(JSONUtil.toJsonStr(jsonObject), "application/json").execute().body();
        return body;
    }

    /**
     * 配置水导轴承剩余趋势预测模型的静态参数
     * @param jsonObject
     * @return
     */
    @Override
    public String trendPredictionModelConf(JSONObject jsonObject) {
        String body = HttpRequest.post(modelUrl+"/trend_prediction_model/conf/").body(JSONUtil.toJsonStr(jsonObject), "application/json").execute().body();
        return body;
    }

    /**
     * 配置机组安全评价模型
     * @param jsonObject
     * @return
     */
    @Override
    public String safetyEvaluationModelConf(JSONObject jsonObject) {
        String body = HttpRequest.post(modelUrl+"/safety_evaluation_model/conf/").body(JSONUtil.toJsonStr(jsonObject), "application/json").execute().body();
        return body;
    }

    /**
     * 获取设备故障诊断模型输出的故障列表信息
     * @param jsonObject
     * @return
     */
    @Override
    public String faultTreeModelGet(JSONObject jsonObject) {
        String body = HttpRequest.post(modelUrl+"/fault_tree_model/get/").body(JSONUtil.toJsonStr(jsonObject), "application/json").execute().body();
        return body;
    }

    @Override
    public String trendPredictionModel(JSONObject jsonObject) {
        String body = HttpRequest.post(modelUrl+"/trend_prediction_model/pred/").body(JSONUtil.toJsonStr(jsonObject), "application/json").execute().body();
        return body;
    }

    @Override
    public String safetyEvaluationModel(JSONObject jsonObject) {
        String body = HttpRequest.post(modelUrl+"/safety_evaluation_model/pred/").body(JSONUtil.toJsonStr(jsonObject), "application/json").execute().body();
        return body;
    }
}
