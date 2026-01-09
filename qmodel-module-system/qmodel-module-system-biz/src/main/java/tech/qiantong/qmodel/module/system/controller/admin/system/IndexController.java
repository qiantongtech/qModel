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

package tech.qiantong.qmodel.module.system.controller.admin.system;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import tech.qiantong.qmodel.common.core.domain.AjaxResult;
import tech.qiantong.qmodel.module.model.service.classify.IModelClassifyService;
import tech.qiantong.qmodel.module.model.service.input.IModelInputService;
import tech.qiantong.qmodel.module.model.service.output.IModelOutputService;
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
    private IModelClassifyService modelClassifyService;

    @Autowired
    private IModelReconstitutionService modelReconstitutionService;

    @Autowired
    private IModelInputService modelInputService;

    @Autowired
    private IModelOutputService modelOutputReconstitutionService;

    @Autowired
    private IModelCaclReconstitutionService modelCaclService;



    /**
     * 数量变化统计
     */
    @RequestMapping("/count")
    public AjaxResult count() {
        //统计模型分类数量信息
        int modelClassifyCount = modelClassifyService.countModelClassify();
        int modelClassifyWeekCount = modelClassifyService.countLastWeek();

        //统计模型数量信息
        int modelCount = modelReconstitutionService.count();
        int modelWeekCount = modelReconstitutionService.countLastWeek();

        //统计模型输入数量信息
        int modelInputCount = modelInputService.countModelInput();
        int modelInputWeekCount = modelInputService.countLastWeek();

        //统计模型输出数量信息
        int modelOutputCount = modelOutputReconstitutionService.countModelOutput();
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
