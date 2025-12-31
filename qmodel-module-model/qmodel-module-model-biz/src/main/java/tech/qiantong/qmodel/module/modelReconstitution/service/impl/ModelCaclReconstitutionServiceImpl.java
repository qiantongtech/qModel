package tech.qiantong.qmodel.module.modelReconstitution.service.impl;

import cn.hutool.http.*;
import cn.hutool.json.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import tech.qiantong.qmodel.common.utils.*;
import tech.qiantong.qmodel.module.modelReconstitution.domain.*;
import tech.qiantong.qmodel.module.modelReconstitution.mapper.*;
import tech.qiantong.qmodel.module.modelReconstitution.service.*;

import java.util.*;
import java.util.stream.Collectors;

/**
 * 模型计算管理 Service业务层处理
 *
 * @author Ywg
 * @date 2023-09-18
 */
@Service
public class ModelCaclReconstitutionServiceImpl implements IModelCaclReconstitutionService {
    @Autowired
    private ModelCaclReconstitutionMapper modelCaclReconstitutionMapper;
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
    public ModelCaclReconstitution selectModelCaclById(Long id) {
        return modelCaclReconstitutionMapper.selectModelCaclById(id);
    }

    /**
     * 查询模型计算管理 列表
     *
     * @param modelCacl 模型计算管理
     * @return 模型计算管理
     */
    @Override
    public List<ModelCaclReconstitution> selectModelCaclList(ModelCaclReconstitution modelCacl) {
        modelCacl.setDelFlag(false);
        return modelCaclReconstitutionMapper.selectModelCaclList(modelCacl);
    }

    /**
     * 新增模型计算管理
     *
     * @param modelCacl 模型计算管理
     * @return 结果
     */
    @Override
    public int insertModelCacl(ModelCaclReconstitution modelCacl) {
        modelCacl.setCreateTime(DateUtils.getNowDate());
        return modelCaclReconstitutionMapper.insertModelCacl(modelCacl);
    }

    /**
     * 修改模型计算管理
     *
     * @param modelCacl 模型计算管理
     * @return 结果
     */
    @Override
    public int updateModelCacl(ModelCaclReconstitution modelCacl) {
        modelCacl.setUpdateTime(DateUtils.getNowDate());
        return modelCaclReconstitutionMapper.updateModelCacl(modelCacl);
    }

    /**
     * 批量删除模型计算管理
     *
     * @param ids 需要删除的模型计算管理 主键
     * @return 结果
     */
    @Override
    public int deleteModelCaclByIds(Long[] ids) {
        return modelCaclReconstitutionMapper.deleteModelCaclByIds(ids);
    }

    /**
     * 删除模型计算管理 信息
     *
     * @param id 模型计算管理 主键
     * @return 结果
     */
    @Override
    public int deleteModelCaclById(Long id) {
        return modelCaclReconstitutionMapper.deleteModelCaclById(id);
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

    @Override
    public int count() {
        return this.modelCaclReconstitutionMapper.selectModelCaclList(new ModelCaclReconstitution()).size();
    }

    @Override
    public int countLastWeek() {
        ModelCaclReconstitution modelCaclReconstitution = new ModelCaclReconstitution();
        modelCaclReconstitution.setDelFlag(false);
        return this.modelCaclReconstitutionMapper.selectModelCaclList(modelCaclReconstitution).stream()
                .filter(output -> output.getCreateTime().after(DateUtils.getLastWeekStartTime())
                        && output.getCreateTime().before(DateUtils.getLastWeekEndTime()))
                .collect(Collectors.toList()).size();
    }
}
