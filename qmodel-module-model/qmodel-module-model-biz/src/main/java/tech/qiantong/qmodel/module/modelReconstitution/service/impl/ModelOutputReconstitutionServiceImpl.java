package tech.qiantong.qmodel.module.modelReconstitution.service.impl;

import cn.hutool.core.date.*;
import cn.hutool.core.io.file.FileReader;
import com.alibaba.fastjson.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import tech.qiantong.qmodel.common.utils.*;
import tech.qiantong.qmodel.module.modelReconstitution.domain.*;
import tech.qiantong.qmodel.module.modelReconstitution.mapper.*;
import tech.qiantong.qmodel.module.modelReconstitution.service.*;

import java.io.*;
import java.util.*;
import java.util.stream.*;

/**
 * 模型输出管理Service业务层处理
 *
 * @author surge
 * @date 2023-09-14
 */
@Service
public class ModelOutputReconstitutionServiceImpl implements IModelOutputReconstitutionService {
    @Autowired
    private ModelOutputReconstitutionMapper modelOutputReconstitutionMapper;

    /**
     * 查询 模型输出管理
     *
     * @param id 模型输出管理主键
     * @return 模型输出管理
     */
    @Override
    public ModelOutputReconstitution selectModelOutputById(Long id) {
        return modelOutputReconstitutionMapper.selectModelOutputById(id);
    }

    /**
     * 查询 模型输出管理列表
     *
     * @param modelOutput 模型输出管理
     * @return 模型输出管理
     */
    @Override
    public List<ModelOutputReconstitution> selectModelOutputList(ModelOutputReconstitution modelOutput) {
        modelOutput.setDelFlag(false);
        return modelOutputReconstitutionMapper.selectModelOutputList(modelOutput);
    }

    /**
     * 新增 模型输出管理
     *
     * @param modelOutput 模型输出管理
     * @return 结果
     */
    @Override
    public int insertModelOutput(ModelOutputReconstitution modelOutput) {
        modelOutput.setCreateTime(DateUtils.getNowDate());
        return modelOutputReconstitutionMapper.insertModelOutput(modelOutput);
    }

    /**
     * 修改 模型输出管理
     *
     * @param modelOutput 模型输出管理
     * @return 结果
     */
    @Override
    public int updateModelOutput(ModelOutputReconstitution modelOutput) {
        modelOutput.setUpdateTime(DateUtils.getNowDate());
        return modelOutputReconstitutionMapper.updateModelOutput(modelOutput);
    }

    /**
     * 批量删除 模型输出管理
     *
     * @param ids 需要删除的 模型输出管理主键
     * @return 结果
     */
    @Override
    public int deleteModelOutputByIds(Long[] ids) {
        return modelOutputReconstitutionMapper.deleteModelOutputByIds(ids);
    }

    /**
     * 删除 模型输出管理信息
     *
     * @param id 模型输出管理主键
     * @return 结果
     */
    @Override
    public int deleteModelOutputById(Long id) {
        return modelOutputReconstitutionMapper.deleteModelOutputById(id);
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
     * 输出计算河段水面线文件读取
     */
    public Map<String, Map> waterSurfaceProfileFileDat(String path) {
        List<String> data2 = new ArrayList<>();
        Map<String, Map> mapKeyDate = new HashMap<>();

        // 使用 try-with-resources 自动关闭 BufferedReader
        try (BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(path), "gbk"))) {
            String line = br.readLine(); // 读取表头

            while ((line = br.readLine()) != null) {
                data2.add(line);
            }

            List<List<String>> dataTwoList = new ArrayList<>();
            ArrayList<String> list = new ArrayList<>();

            // 处理数据
            for (int i = 0; i < data2.size(); i++) {
                String s = data2.get(i).trim();
                String substring = s.substring(2, s.length() - 1);
                list.add(data2.get(i));
            }

            dataTwoList.add(list);

            // 处理并将数据映射到结果中
            for (List<String> dataList : dataTwoList) {
                String date = dataList.get(0).trim();
                date = date.substring(1, date.length() - 1);
                Map<String, List<String>> mapListObject = new HashMap<>();

                for (int i = 2; i < dataList.size(); i++) {
                    ArrayList<String> waterLevelList = new ArrayList<>();
                    String row = dataList.get(i).trim();
                    String[] split = row.split("\\s+");
                    waterLevelList.add(split[1]);
                    waterLevelList.add(split[2]);

                    if (path.contains("_hd")) {
                        mapListObject.put(split[0].toUpperCase() + "河道", waterLevelList);
                    } else if (path.contains("_qd")) {
                        mapListObject.put(split[0].toUpperCase() + "渠道", waterLevelList);
                    } else {
                        mapListObject.put(split[0].toUpperCase(), waterLevelList);
                    }
                }
                mapKeyDate.put(date, mapListObject);
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
        List<String> data2 = new ArrayList<>();
        Map<String, List<Map<String, Object>>> mapKeyDate = new HashMap<>();

        // 使用 try-with-resources 自动关闭 BufferedReader
        try (BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(path), "gbk"))) {
            String line = br.readLine(); // 读取表头
            while ((line = br.readLine()) != null) {
                data2.add(line);
            }

            List<List<String>> dataTwoList = new ArrayList<>();
            List<String> keyDateList = new ArrayList<>();
            Set<String> titleSet = new TreeSet<>();
            String[] titleSplit = data2.get(0).trim().split("\\s+");
            for (String s : titleSplit) {
                titleSet.add(s);
            }
            Object[] titleArray = titleSet.toArray();

            for (int i = 1; i < data2.size(); i++) {
                String row = data2.get(i).trim();
                String substringDate = row.substring(1, row.indexOf("\"", row.indexOf("\"") + 1));
                keyDateList.add(substringDate);
                String substring = row.substring(substringDate.length() + 2, row.length()).trim();
                String[] split = substring.split("\\s+");
                int count = 0;
                ArrayList<String> list = new ArrayList<>();
                for (int j = 0; j < split.length; j++) {
                    if (count % titleArray.length == 0) {
                        if (list.size() > 0) {
                            dataTwoList.add(list);
                        }
                        list = new ArrayList<>();
                    }
                    list.add(split[j]);
                    if (j == split.length - 1) {
                        dataTwoList.add(list);
                    }
                    count++;
                }
            }

            int keyDateNum = 0;
            List<Map<String, Object>> sectionList = new ArrayList<>();
            for (int i = 0; i < dataTwoList.size(); i++) {
                Map<String, Object> jsonObject = new HashMap<>();
                if (i != 0 && i % 4 == 0) {
                    mapKeyDate.put(keyDateList.get(keyDateNum++), sectionList);
                    sectionList = new ArrayList<>();
                }
                for (int j = 0; j < dataTwoList.get(i).size(); j++) {
                    if (path.contains("_hd")) {
                        jsonObject.put(titleArray[j].toString().toUpperCase() + "河道", dataTwoList.get(i).get(j));
                    } else if (path.contains("_qd")) {
                        jsonObject.put(titleArray[j].toString().toUpperCase() + "渠道", dataTwoList.get(i).get(j));
                    } else {
                        jsonObject.put(titleArray[j].toString().toUpperCase(), dataTwoList.get(i).get(j));
                    }
                }
                sectionList.add(jsonObject);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return mapKeyDate;
    }


    @Override
    public JSONObject readNewQzhbFile() {
        List<String> csList = com.google.common.collect.Lists.newArrayList(
                "CS1", "CS2", "CS3", "CS4", "CS5", "CS6", "CS7", "CS8", "CS9", "CS10",
                "CS11", "CS12", "CS13", "CS14", "CS15", "CS16", "CS17", "CS18", "CS19", "CS20",
                "CS21", "CS22", "CS23", "CS24", "CS25", "CS26", "CS27", "CS28", "CS29", "CS30",
                "CS31", "CS32", "cs东1", "cs东2", "cs西2", "cs东3", "cs西3");
        List<String> paramList = com.google.common.collect.Lists.newArrayList("流量", "参数2", "参数3", "水位", "水面与堤顶距离");

        // 使用 try-with-resources 和 BufferedReader
        try (BufferedReader reader = new BufferedReader(new FileReader("C:\\Users\\yuexin\\Desktop\\exe12.10-3\\out\\Qzhb.dat").getReader())) {
            List<String> lines = reader.lines().collect(Collectors.toList());

            JSONObject resultObject = new JSONObject();

            for (int i = 0; i < lines.size(); i++) {
                if (i < 2) {
                    continue;
                }
                String line = lines.get(i);
                line = line.replaceAll("\"", "");
            }

            return resultObject;

        } catch (IOException e) {
            e.printStackTrace();
            // 根据实际需求处理异常，可以返回空对象或重新抛出异常
            return new JSONObject();
        }
    }

    /**
     * 查询模型输出总数
     *
     * @return 模型输出总数
     */
    @Override
    public int count() {
        ModelOutputReconstitution modelOutput = new ModelOutputReconstitution();
        modelOutput.setDelFlag(false);
        return modelOutputReconstitutionMapper.selectModelOutputList(modelOutput).size();
    }

    /**
     * 查询上周新增的模型输出数量
     *
     * @return 上周新增的模型输出数量
     */
    @Override
    public int countLastWeek() {
        ModelOutputReconstitution modelOutput = new ModelOutputReconstitution();
        modelOutput.setDelFlag(false);
        return modelOutputReconstitutionMapper.selectModelOutputList(modelOutput).stream()
                .filter(output -> output.getCreateTime().after(DateUtils.getLastWeekStartTime())
                        && output.getCreateTime().before(DateUtils.getLastWeekEndTime()))
                .collect(Collectors.toList()).size();
    }

}
