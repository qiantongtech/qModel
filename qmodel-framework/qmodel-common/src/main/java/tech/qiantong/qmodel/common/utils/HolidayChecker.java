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

package tech.qiantong.qmodel.common.utils;


import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;

@Component
public class HolidayChecker {
    private static final String HOLIDAY_URL = "https://timor.tech/api/holiday/year/";
    //节假日日期集合
    public static ArrayList<String> holidayList = new ArrayList<>();
    //补班集合
    public static ArrayList<String> workdayList = new ArrayList<>();


    public void getAllHoliday(Integer year){

        String url = year != null ? HOLIDAY_URL+year : HOLIDAY_URL;
        String response = HttpUtil.get(url);
        Collection<Object> holidays = JSONUtil.parseObj(response).getJSONObject("holiday").values();
        // 遍历节假日数据
        for (Object holiday : holidays) {
            JSONObject dateJson = JSONUtil.parseObj(holiday);
            String name = dateJson.getStr("name");
            String dateStr = dateJson.getStr("date");

            // 判断是否为补班日
            if (!name.contains("补")) {
                // 非补班日，加入节假日集合
                holidayList.add(dateStr);
            } else {
                // 补班日，加入补班日集合
                workdayList.add(dateStr);
            }
        }
    }

    public Boolean isHoliday(LocalDate date){
        //获取当前年
        int year = LocalDate.now().getYear();
        this.getAllHoliday(year);
        Boolean isTrue = false;
        HolidayChecker holidayChecker = new HolidayChecker();
        holidayChecker.getAllHoliday(date.getYear());
        //判断是否是节假日
        if (holidayList.contains(date.toString())){
             isTrue = true;
            return isTrue;

        }
        //判断date是否是周六日
        if (date.getDayOfWeek().getValue() == 6 || date.getDayOfWeek().getValue() == 7) {
            //判断是否补班
            if (workdayList.contains(date.toString())){
                  isTrue = false;
                return isTrue;
            }else {
                 isTrue = true;
                return isTrue;
            }
        }
        return isTrue;

    }






}
