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

import cn.hutool.core.date.*;
import cn.hutool.core.io.file.FileReader;
import com.alibaba.fastjson.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import tech.qiantong.qmodel.common.utils.*;
import tech.qiantong.qmodel.module.model.domain.*;
import tech.qiantong.qmodel.module.model.mapper.*;
import tech.qiantong.qmodel.module.model.service.*;

import java.io.*;
import java.util.*;

/**
 * 模型输出管理Service业务层处理
 *
 * @author surge
 * @date 2023-09-14
 */
@Service
public class ModelOutputServiceImpl implements IModelOutputService {
    @Autowired
    private ModelOutputMapper modelOutputMapper;

    @Value("${model.newHydrodynamicModel}")
    private String newHydrodynamicModel;

    /**
     * 查询 模型输出管理
     *
     * @param id 模型输出管理主键
     * @return 模型输出管理
     */
    @Override
    public ModelOutput selectModelOutputById(Long id) {
        return modelOutputMapper.selectModelOutputById(id);
    }

    /**
     * 查询 模型输出管理列表
     *
     * @param modelOutput 模型输出管理
     * @return 模型输出管理
     */
    @Override
    public List<ModelOutput> selectModelOutputList(ModelOutput modelOutput) {
        modelOutput.setDelFlag(false);
        return modelOutputMapper.selectModelOutputList(modelOutput);
    }

    /**
     * 新增 模型输出管理
     *
     * @param modelOutput 模型输出管理
     * @return 结果
     */
    @Override
    public int insertModelOutput(ModelOutput modelOutput) {
        modelOutput.setCreateTime(DateUtils.getNowDate());
        return modelOutputMapper.insertModelOutput(modelOutput);
    }

    /**
     * 修改 模型输出管理
     *
     * @param modelOutput 模型输出管理
     * @return 结果
     */
    @Override
    public int updateModelOutput(ModelOutput modelOutput) {
        modelOutput.setUpdateTime(DateUtils.getNowDate());
        return modelOutputMapper.updateModelOutput(modelOutput);
    }

    /**
     * 批量删除 模型输出管理
     *
     * @param ids 需要删除的 模型输出管理主键
     * @return 结果
     */
    @Override
    public int deleteModelOutputByIds(Long[] ids) {
        return modelOutputMapper.deleteModelOutputByIds(ids);
    }

    /**
     * 删除 模型输出管理信息
     *
     * @param id 模型输出管理主键
     * @return 结果
     */
    @Override
    public int deleteModelOutputById(Long id) {
        return modelOutputMapper.deleteModelOutputById(id);
    }

    /**
     * out输入文件读取
     * @param shuiMianXianPathList out文件里面的水面线文件地址集合
     * @param QzhbPathList out文件里面的Qzhb文件地址集合
     * @return 数据集合
     *
     * 结构说明：
    |--waterSurfaceProfile(水面线文件类型数据读取)
    |  |--时间
    |     |--断面名称
    |        |--断面累计距离（m）
    |        |--断面水位（m）
    |--Qzhb(断面信息文件读取)
    |  |--时间
    |     |--计算典型断面计算流量(m3/s)
    |        |--断面名称
    |           |--流量(m3/s)
    |     |--计算典型断面计算水深(m)
    |           |--水深(m)
    |     |--计算典型断面水面宽(m)
    |           |--水面宽(m)
    |     |--计算水面与堤顶的距离(m)
    |           |--堤顶的距离(m)
     */
    @Override
    public Map<String, Object> waterSurfaceProfileAndQzhb(List<String> shuiMianXianPathList,List<String> QzhbPathList) {
        // shuimianxian文件读取
        Map<String, Map> mapKeyDate = new HashMap<>();
        for (String path : shuiMianXianPathList) {
            Map<String, Map> stringMapMap = this.waterSurfaceProfileFileDat(path);
            for (String key : stringMapMap.keySet()) {
                if (mapKeyDate.get(key) == null) {
                    mapKeyDate.put(key, stringMapMap.get(key));
                } else {
                    mapKeyDate.get(key).putAll(stringMapMap.get(key));
                }
            }
        }
        // Qzhb文件读取
        Map<String, List<Map<String, Object>>> mapListKeyDate = new HashMap<>();
        for (String path : QzhbPathList) {
            Map<String, List<Map<String, Object>>> stringListMap = this.fileQzhbDat(path);
            for (String key : stringListMap.keySet()) {
                if (mapListKeyDate.get(key) == null){
                    mapListKeyDate.put(key,stringListMap.get(key));
                }else {
                    mapListKeyDate.get(key).get(0).putAll(stringListMap.get(key).get(0));
                    mapListKeyDate.get(key).get(1).putAll(stringListMap.get(key).get(1));
                    mapListKeyDate.get(key).get(2).putAll(stringListMap.get(key).get(2));
                    mapListKeyDate.get(key).get(3).putAll(stringListMap.get(key).get(3));
                }
            }
        }
        // 最总数据展示
        Map<String, Object> finalDataMap = new HashMap<>();
        finalDataMap.put("waterSurfaceProfile",mapKeyDate);
        finalDataMap.put("Qzhb",mapListKeyDate);
        return finalDataMap;
    }

    /**
     * 查询所有模型版本并且合并在一起
     *
     * |--时间
     *      |--断面名称
     *         |--断面累计距离（m）
     *         |--断面水位（m）
     *         |--流量(m3/s)
     *         |--水深(m)
     *         |--水面宽(m)
     *         |--堤顶的距离(m)
     */
    @Override
    public Map<String, Map<String, List<String>>> waterSurfaceProfileAndQzhbMerge(Map<String, Object> stringObjectMap) {
        Map<String, Map<String, List<String>>> waterSurfaceProfile = (Map<String, Map<String,List<String>>>) stringObjectMap.get("waterSurfaceProfile");
        Map<String, List<Map<String, Object>>> qzhb = (Map<String, List<Map<String, Object>>>) stringObjectMap.get("Qzhb");

        for (String timeKey : waterSurfaceProfile.keySet()) {
            for (String sectionKey : waterSurfaceProfile.get(timeKey).keySet()) {
                String flowRateMap = null;
                String depthMap = null;
                String waterWideMap = null;
                String liftTheTopDistanceMap = null;
                // 根据时间获取数据
                List<Map<String, Object>> mapList = qzhb.get(timeKey);
                if (mapList == null){
                    break;
                }
                // 根据断面名称获取数据
                Object data = mapList.get(0).get(sectionKey);
                if (data == null){
                    waterSurfaceProfile.get(timeKey).get(sectionKey).add(flowRateMap);
                    waterSurfaceProfile.get(timeKey).get(sectionKey).add(depthMap);
                    waterSurfaceProfile.get(timeKey).get(sectionKey).add(waterWideMap);
                    waterSurfaceProfile.get(timeKey).get(sectionKey).add(liftTheTopDistanceMap);
                    break;
                }
                if (sectionKey.equals("C10")){
                    // 获取流量数据
                    flowRateMap = mapList.get(0).get("CS10").toString();
                    // 获取水深数据
                    depthMap = mapList.get(1).get("CS10").toString();
                    // 获取水面宽数据
                    waterWideMap = mapList.get(2).get("CS10").toString();
                    // 获取提顶的距离的数据
                    liftTheTopDistanceMap = mapList.get(3).get("CS10").toString();
                }else {
                    // 获取流量数据
                    flowRateMap  = mapList.get(0).get(sectionKey).toString();
                    // 获取水深数据
                    depthMap = mapList.get(1).get(sectionKey).toString();
                    // 获取水面宽数据
                    waterWideMap = mapList.get(2).get(sectionKey).toString();
                    // 获取提顶的距离的数据
                    liftTheTopDistanceMap = mapList.get(3).get(sectionKey).toString();
                }
                waterSurfaceProfile.get(timeKey).get(sectionKey).add(flowRateMap);
                waterSurfaceProfile.get(timeKey).get(sectionKey).add(depthMap);
                waterSurfaceProfile.get(timeKey).get(sectionKey).add(waterWideMap);
                waterSurfaceProfile.get(timeKey).get(sectionKey).add(liftTheTopDistanceMap);
            }
        }
        return waterSurfaceProfile;
    }

    /**
     * shuniuzhamen文件读取
     * @param path
     * @return
     *
     * |--时间
     *    |--出库总流量(List类型)
     *    |--各闸门开度(List类型)
     *    |--各闸门流量(List类型)
     *    |--北干灌溉,河道泄洪,南干灌溉(List类型)
     */
    @Override
    public JSONObject shuniuzhamen(String path) {
        JSONObject shuniuzhamen = new JSONObject();
        List<String> data = new ArrayList<>();

        // 使用 try-with-resources 自动关闭资源
        try (BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(path), "gbk"))) {
            // 读取文件内容
            String line = br.readLine(); // 读取表头
            while ((line = br.readLine()) != null) {
                data.add(line);
            }

            // 处理数据逻辑
            Set<String> titleSet = new TreeSet<>();
            String[] titleSplit = data.get(0).trim().split("\\s+");
            for (String s : titleSplit) {
                if (s.contains("闸门")) {  // 优化：直接使用 contains 替代 indexOf
                    titleSet.add(s);
                }
            }
            Object[] titleArray = titleSet.toArray();

            for (int i = 1; i < data.size(); i++) {
                String row = data.get(i).trim();
                String substringDate = row.substring(1, row.indexOf("\"", row.indexOf("\"") + 1));
                shuniuzhamen.put(substringDate, new JSONArray());

                String substring = row.substring(substringDate.length() + 2).trim(); // 优化：去掉冗余的 row.length()
                String[] split = substring.split("\\s+");

                int count = 0;
                List<String> list = new ArrayList<>();
                list.add(split[0]);
                shuniuzhamen.getJSONArray(substringDate).add(list);

                list = new ArrayList<>();
                for (int j = 1; j < split.length; j++) {
                    if (count % titleArray.length == 0) {
                        if (!list.isEmpty()) {
                            shuniuzhamen.getJSONArray(substringDate).add(list);
                        }
                        list = new ArrayList<>();
                    }
                    list.add(split[j]);
                    count++;
                }
                shuniuzhamen.getJSONArray(substringDate).add(list);
            }
        } catch (Exception e) {
            e.printStackTrace();  // 建议替换为日志框架（如 SLF4J）
        }
        return shuniuzhamen;
    }

    /**
     * shuiku文件读取
     * @param path
     * @return
     * |--时间
     *    |--第一枢纽运行状态
     *    |--库水位
     *    |--库容
     *    |--小山口流量
     */
    @Override
    public JSONObject shuiku(String path) {
        List<String> data2 = new ArrayList<>();
        JSONObject shuiku = new JSONObject();

        try (BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(path), "gbk"))) {
            br.readLine(); // 跳过表头
            String line;
            while ((line = br.readLine()) != null) {
                data2.add(line);
            }

            for (String row : data2) {
                row = row.trim();
                String substringDate = row.substring(1, row.indexOf("\"", row.indexOf("\"") + 1));
                shuiku.put(substringDate, new JSONArray());
                String substring = row.substring(substringDate.length() + 2).trim();
                String[] split = substring.split("\\s+");
                // 更安全的数组访问方式
                for (int i = 0; i < Math.min(4, split.length); i++) {
                    shuiku.getJSONArray(substringDate).add(split[i]);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return shuiku;
    }

    /**
     * 输出计算河段水面线文件读取(水面线文件里面只有断面累计距离（m）和断面水位（m）两个数据)
     */
    public Map<String, Map> waterSurfaceProfileFileDat(String path) {
        Map<String, Map> mapKeyDate = new HashMap<>();
        List<String> dataLines = new ArrayList<>();

        try (BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(path), "gbk"))) {
            // 读取文件内容
            br.readLine(); // 跳过表头
            String line;
            while ((line = br.readLine()) != null) {
                dataLines.add(line);
            }

            // 按日期分组数据
            List<List<String>> dateGroups = new ArrayList<>();
            List<String> currentGroup = new ArrayList<>();

            for (String row : dataLines) {
                String trimmedRow = row.trim();
                String datePart = trimmedRow.substring(2, trimmedRow.length() - 1);

                currentGroup.add(row);
            }

            if (!currentGroup.isEmpty()) {
                dateGroups.add(currentGroup);
            }

            // 处理每个日期组
            for (List<String> dateGroup : dateGroups) {
                if (dateGroup.isEmpty()) continue;

                // 提取日期
                String dateStr = dateGroup.get(0).trim();
                String date = dateStr.substring(1, dateStr.length() - 1);

                Map<String, List<String>> waterLevelMap = new HashMap<>();

                // 处理水位数据 (从第3行开始)
                for (int i = 2; i < dateGroup.size(); i++) {
                    String row = dateGroup.get(i).trim();
                    String[] columns = row.split("\\s+");

                    if (columns.length < 3) continue; // 确保有足够的数据列

                    List<String> waterLevelData = new ArrayList<>();
                    waterLevelData.add(columns[1]); // 断面累计距离
                    waterLevelData.add(columns[2]); // 断面水位

                    // 处理断面名称
                    String sectionKey = columns[0].toUpperCase();
                    if (path.contains("_hd")) {
                        sectionKey += "河道";
                    } else if (path.contains("_qd")) {
                        sectionKey += "渠道";
                    }

                    waterLevelMap.put(sectionKey, waterLevelData);
                }

                mapKeyDate.put(date, waterLevelMap);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return mapKeyDate;
    }

    /**
     * 输出计算河段水面线文件读取(水面线文件里面有 与小山口的距离（m）和断面流量（m3/s）和水位（m）和堤顶高程（m）四个数据)
     */
    public Map<String, Map> waterSurfaceProfileFileDatNew(String path) {
        Map<String, Map> mapKeyDate = new HashMap<>();
        List<String> dataLines = new ArrayList<>();

        try (BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(path), "gbk"))) {
            // 读取文件内容
            br.readLine(); // 跳过表头
            String line;
            while ((line = br.readLine()) != null) {
                dataLines.add(line);
            }

            // 按日期分组数据
            List<List<String>> dateGroups = new ArrayList<>();
            List<String> currentGroup = new ArrayList<>();

            for (String row : dataLines) {
                String trimmedRow = row.trim();
                String datePart = trimmedRow.substring(2, trimmedRow.length() - 1);

                if (DateUtil.parseDate(datePart) != null) {
                    if (!currentGroup.isEmpty()) {
                        dateGroups.add(currentGroup);
                        currentGroup = new ArrayList<>();
                    }
                }
                currentGroup.add(row);
            }

            if (!currentGroup.isEmpty()) {
                dateGroups.add(currentGroup);
            }

            // 处理每个日期组
            for (List<String> dateGroup : dateGroups) {
                if (dateGroup.isEmpty()) continue;

                // 提取日期
                String dateStr = dateGroup.get(0).trim();
                String date = dateStr.substring(1, dateStr.length() - 1);

                Map<String, List<String>> waterLevelMap = new HashMap<>();

                // 处理水位数据 (从第3行开始)
                for (int i = 2; i < dateGroup.size(); i++) {
                    String row = dateGroup.get(i).trim();
                    String[] columns = row.split("\\s+");

                    if (columns.length < 5) continue; // 确保有足够的数据列

                    List<String> waterLevelData = new ArrayList<>();
                    waterLevelData.add(columns[1]); // 距离
                    waterLevelData.add(columns[2]); // 流量
                    waterLevelData.add(columns[3]); // 水位
                    waterLevelData.add(columns[4]); // 堤顶高程

                    // 处理特殊断面名称
                    String locationKey;
                    switch (columns[0]) {
                        case "东支cs1": locationKey = "cs东1"; break;
                        case "东支cs2": locationKey = "cs东2"; break;
                        case "西支cs2": locationKey = "cs西2"; break;
                        case "东支cs3": locationKey = "cs东3"; break;
                        case "西支cs3": locationKey = "cs西3"; break;
                        case "C10": locationKey = "CS10"; break;
                        default: locationKey = columns[0].toUpperCase();
                    }

                    waterLevelMap.put(locationKey, waterLevelData);
                }

                mapKeyDate.put(date, waterLevelMap);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return mapKeyDate;
    }


    /**
     * 输出计算河段水面线文件读取
     */
    public Map<String, List<Map<String, Object>>> fileQzhbDat(String path) {
        Map<String, List<Map<String, Object>>> mapKeyDate = new HashMap<>();
        List<String> dataLines = new ArrayList<>();

        try (BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(path), "gbk"))) {
            // 读取文件内容
            String headerLine = br.readLine(); // 读取表头
            String line;
            while ((line = br.readLine()) != null) {
                dataLines.add(line);
            }

            // 处理表头
            Set<String> titleSet = new TreeSet<>();
            String[] titleSplit = headerLine.trim().split("\\s+");
            Collections.addAll(titleSet, titleSplit);
            Object[] titleArray = titleSet.toArray();

            // 处理数据行
            List<String> dateList = new ArrayList<>();
            List<List<String>> groupedData = new ArrayList<>();

            for (int i = 0; i < dataLines.size(); i++) {
                String row = dataLines.get(i).trim();
                String date = row.substring(1, row.indexOf("\"", row.indexOf("\"") + 1));
                dateList.add(date);

                String dataPart = row.substring(date.length() + 2).trim();
                String[] values = dataPart.split("\\s+");

                // 按标题长度分组数据
                List<String> currentGroup = new ArrayList<>();
                for (int j = 0; j < values.length; j++) {
                    currentGroup.add(values[j]);
                    if ((j + 1) % titleArray.length == 0 || j == values.length - 1) {
                        groupedData.add(new ArrayList<>(currentGroup));
                        currentGroup.clear();
                    }
                }
            }

            // 构建最终结果
            int dateIndex = 0;
            List<Map<String, Object>> sectionList = new ArrayList<>();

            for (int i = 0; i < groupedData.size(); i++) {
                Map<String, Object> dataMap = new HashMap<>();
                List<String> group = groupedData.get(i);

                // 为每个数据项添加标题
                for (int j = 0; j < Math.min(group.size(), titleArray.length); j++) {
                    String key = titleArray[j].toString().toUpperCase();
                    if (path.contains("_hd")) {
                        key += "河道";
                    } else if (path.contains("_qd")) {
                        key += "渠道";
                    }
                    dataMap.put(key, group.get(j));
                }

                sectionList.add(dataMap);

                // 每4个数据项为一组对应一个日期
                if ((i + 1) % 4 == 0 || i == groupedData.size() - 1) {
                    if (!sectionList.isEmpty()) {
                        mapKeyDate.put(dateList.get(dateIndex++), new ArrayList<>(sectionList));
                        sectionList.clear();
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return mapKeyDate;
    }

    /**
     * 文件读取和汇总
     *
     * @return
     */
    @Override
    public JSONObject readNewQzhbFile() {
        List<String> csList = com.google.common.collect.Lists.newArrayList(
                "CS1", "CS2", "CS3", "CS4", "CS5", "CS6", "CS7", "CS8", "CS9", "CS10",
                "CS11", "CS12", "CS13", "CS14", "CS15", "CS16", "CS17", "CS18", "CS19", "CS20",
                "CS21", "CS22", "CS23", "CS24", "CS25", "CS26", "CS27", "CS28", "CS29", "CS30",
                "CS31", "CS32", "cs东1", "cs东2", "cs西2", "cs东3", "cs西3");
        List<String> paramList = com.google.common.collect.Lists.newArrayList("流量", "水深", "水面宽", "水位", "水面与堤顶距离");
        FileReader fileReader = new FileReader(newHydrodynamicModel + "\\out\\Qzhb.dat");

        JSONObject finalDataMap = new JSONObject();
        return finalDataMap;
    }

    @Override
    public JSONObject readNewQzhbFile(String filePath) {
        List<String> csList = com.google.common.collect.Lists.newArrayList(
                "CS1", "CS2", "CS3", "CS4", "CS5", "CS6", "CS7", "CS8", "CS9", "CS10",
                "CS11", "CS12", "CS13", "CS14", "CS15", "CS16", "CS17", "CS18", "CS19", "CS20",
                "CS21", "CS22", "CS23", "CS24", "CS25", "CS26", "CS27", "CS28", "CS29", "CS30",
                "CS31", "CS32", "cs东1", "cs东2", "cs西2", "cs东3", "cs西3");
        List<String> paramList = com.google.common.collect.Lists.newArrayList("流量", "水深", "水面宽", "水位", "水面与堤顶距离");
        FileReader fileReader = new FileReader(filePath + "\\out\\Qzhb.dat");
        List<String> lines = fileReader.readLines();

        JSONObject resultObject = new JSONObject();

        JSONObject finalDataMap = new JSONObject();
        return finalDataMap;
    }
}
