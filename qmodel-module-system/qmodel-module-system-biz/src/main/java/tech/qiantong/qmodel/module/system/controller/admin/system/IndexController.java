package tech.qiantong.qmodel.module.system.controller.admin.system;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import tech.qiantong.qmodel.common.core.domain.AjaxResult;
import tech.qiantong.qmodel.module.modelReconstitution.service.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * 首页
 *
 * @author liu
 * @date 2025/12/08 16:49
 **/
@RestController
@RequestMapping("/system/index")
public class IndexController {

    @Autowired
    private IModelClassifyReconstitutionService modelClassifyReconstitutionService;

    @Autowired
    private IModelReconstitutionService modelReconstitutionService;

    @Autowired
    private IModelInputReconstitutionService modelInputService;

    @Autowired
    private IModelOutputReconstitutionService modelOutputReconstitutionService;

    @Autowired
    private IModelCaclReconstitutionService modelCaclService;



    /**
     * 数量变化统计
     */
    @RequestMapping("/count")
    public AjaxResult count() {
        //统计模型分类数量信息
        int modelClassifyCount = modelClassifyReconstitutionService.count();
        int modelClassifyWeekCount = modelClassifyReconstitutionService.countLastWeek();

        //统计模型数量信息
        int modelCount = modelReconstitutionService.count();
        int modelWeekCount = modelReconstitutionService.countLastWeek();

        //统计模型输入数量信息
        int modelInputCount = modelInputService.count();
        int modelInputWeekCount = modelInputService.countLastWeek();

        //统计模型输出数量信息
        int modelOutputCount = modelOutputReconstitutionService.count();
        int modelOutputWeekCount = modelOutputReconstitutionService.countLastWeek();

        //统计模型计算数量信息
        int modelCalcCount = modelCaclService.count();
        int modelCalcWeekCount = modelCaclService.countLastWeek();

        //计算周同比
        double modelClassifyGrowth = calculateGrowth(modelClassifyCount, modelClassifyWeekCount);
        double modelGrowth = calculateGrowth(modelCount, modelWeekCount);
        double modelInputGrowth = calculateGrowth(modelInputCount, modelInputWeekCount);
        double modelOutputGrowth = calculateGrowth(modelOutputCount, modelOutputWeekCount);
        double modelCalcGrowth = calculateGrowth(modelCalcCount, modelCalcWeekCount);

        //构建返回结果
        Map<String, Object> result = new HashMap<>();
        result.put("modelClassify", buildCountData(modelClassifyCount, modelClassifyWeekCount, modelClassifyGrowth));
        result.put("model", buildCountData(modelCount, modelWeekCount, modelGrowth));
        result.put("modelInput", buildCountData(modelInputCount, modelInputWeekCount, modelInputGrowth));
        result.put("modelOutput", buildCountData(modelOutputCount, modelOutputWeekCount, modelOutputGrowth));
        result.put("modelCalc", buildCountData(modelCalcCount, modelCalcWeekCount, modelCalcGrowth));

        return AjaxResult.success(result);
    }

    /**
     * 计算周同比增长率
     * @param currentCount 当前数量
     * @param lastWeekCount 上周数量
     * @return 增长率（百分比）
     */
    private double calculateGrowth(int currentCount, int lastWeekCount) {
        if (lastWeekCount == 0) {
            // 如果上周为0，则根据当前值判断增长情况
            return currentCount > 0 ? 100.0 : 0.0;
        }
        return ((double)(currentCount - lastWeekCount) / lastWeekCount) * 100;
    }

    /**
     * 构建统计数据对象
     * @param currentCount 当前数量
     * @param lastWeekCount 上周数量
     * @param growth 增长率
     * @return 统计数据Map
     */
    private Map<String, Object> buildCountData(int currentCount, int lastWeekCount, double growth) {
        Map<String, Object> data = new HashMap<>();
        data.put("current", currentCount);
        data.put("lastWeek", lastWeekCount);
        data.put("growth", Math.round(growth * 100) / 100.0); //保留两位小数
        return data;
    }


}
