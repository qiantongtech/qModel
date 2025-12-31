package tech.qiantong.qmodel.module.model.service;

import cn.hutool.json.*;
import tech.qiantong.qmodel.module.model.domain.*;

import java.util.*;

/**
 * 模型计算管理 Service接口
 *
 * @author Ywg
 * @date 2023-09-18
 */
public interface IModelCaclService {
    /**
     * 查询模型计算管理
     *
     * @param id 模型计算管理 主键
     * @return 模型计算管理
     */
    public ModelCacl selectModelCaclById(Long id);

    /**
     * 查询模型计算管理 列表
     *
     * @param modelCacl 模型计算管理
     * @return 模型计算管理 集合
     */
    public List<ModelCacl> selectModelCaclList(ModelCacl modelCacl);

    /**
     * 新增模型计算管理
     *
     * @param modelCacl 模型计算管理
     * @return 结果
     */
    public int insertModelCacl(ModelCacl modelCacl);

    /**
     * 修改模型计算管理
     *
     * @param modelCacl 模型计算管理
     * @return 结果
     */
    public int updateModelCacl(ModelCacl modelCacl);

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
     * 配置水导轴承剩余趋势预测模型的静态参数
     * @param jsonObject
     * @return
     */
    String trendPredictionModelConf(JSONObject jsonObject);

    /**
     * 配置机组安全评价模型
     * @param jsonObject
     * @return
     */
    String safetyEvaluationModelConf(JSONObject jsonObject);

    /**
     * 获取设备故障诊断模型输出的故障列表信息
     * @param jsonObject
     * @return
     */
    String faultTreeModelGet(JSONObject jsonObject);

    /**
     * 周期性调用水导轴承剩余趋势预测模型
     * @param jsonObject
     * @return
     */
    String trendPredictionModel(JSONObject jsonObject);

    /**
     * 用于对机组安全情况进行打分
     * @param jsonObject
     * @return
     */
    String safetyEvaluationModel(JSONObject jsonObject);
}
