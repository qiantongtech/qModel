package tech.qiantong.qmodel.common.utils;


import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.*;

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
