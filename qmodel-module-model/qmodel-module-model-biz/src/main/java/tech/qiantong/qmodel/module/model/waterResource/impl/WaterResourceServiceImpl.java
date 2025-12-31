package tech.qiantong.qmodel.module.model.waterResource.impl;

import cn.hutool.core.date.*;
import cn.hutool.core.io.*;
import cn.hutool.core.io.file.FileWriter;
import cn.hutool.core.io.file.*;
import cn.hutool.core.util.*;
import com.alibaba.fastjson2.*;
import com.google.common.collect.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import tech.qiantong.qmodel.common.core.domain.*;
import tech.qiantong.qmodel.common.utils.*;
import tech.qiantong.qmodel.module.model.waterResource.*;
import tech.qiantong.qmodel.module.modelReconstitution.domain.*;
import tech.qiantong.qmodel.module.modelReconstitution.service.*;

import java.io.*;
import java.util.*;

/**
 * 模型计算管理 Service业务层处理
 *
 * @author Ywg
 * @date 2023-09-18
 */
@Service
public class WaterResourceServiceImpl implements IWaterResourceService {


    @Value("${model.hydrodynamicModel}")
    private String filePathRoot;

    @Value("${model.newHydrodynamicModel}")
    private String newHydrodynamicModel;

    @Value("${model.newHydrodynamicModel}")
    private String newHydrodynamicModelCopy;

    private Long id;

    @Autowired
    private IModelReconstitutionService modelReconstitutionService;

    /**
     * 水资源模型 -- 保存用户输入的参数
     * @param target
     * @return
     */
    @Override
    public JSONObject saveInputForModelWaterResource(JSONObject target) {
        String startDateString = target.getString("开始日期");
        return new JSONObject();
    }

    @Override
    public AjaxResult getAllDatFileMsg() {
        String datFilePathRoot = filePathRoot + "\\dat";
        //文件路径
        BufferedReader reader = null;
        List<List<String>> data = null;
        File filePath = new File(datFilePathRoot);
        JSONObject jsonObject = new JSONObject();
        if (filePath == null || !filePath.exists() || !filePath.isDirectory()) {
            System.out.println("无效的文件夹路径");

        }
        File[] files = filePath.listFiles();
        if (files == null || files.length == 0) {
            System.out.println("文件夹为空");

        }
        jsonObject.put("第一分水枢纽河道水位流量", boundaryFile(datFilePathRoot + "\\1_Boundary_xsk_diyi_hd.DAT"));
        jsonObject.put("第一分水枢纽渠道水位流量", boundaryFile(datFilePathRoot + "\\1_Boundary_xsk_diyi_qd.DAT"));
        jsonObject.put("第一分水枢纽河道断面地形", crossFile(datFilePathRoot + "\\1_cross_xsk_diyi_hd.dat"));
        jsonObject.put("第一分水枢纽渠道断面地形", crossFile(datFilePathRoot + "\\1_cross_xsk_diyi_qd.dat"));
        jsonObject.put("第一分水枢纽河道初始水流流量", initializationFile(datFilePathRoot + "\\1_initialization_xsk_diyi_hd.dat"));
        jsonObject.put("第一分水枢纽渠道初始水位流量", initializationFile(datFilePathRoot + "\\1_initialization_xsk_diyi_qd.dat"));
        jsonObject.put("第二分水枢纽水位流量", boundaryFile(datFilePathRoot + "\\3_Boundary_diyi_dier.DAT"));
        jsonObject.put("第二分水枢纽断面地形", crossFile(datFilePathRoot + "\\3_cross_diyi_dier.dat"));
        jsonObject.put("第二分水枢纽初始水流流量", initializationFile(datFilePathRoot + "\\3_initialization_diyi_dier.dat"));
        jsonObject.put("宝浪苏木枢纽水位流量", boundaryFile(datFilePathRoot + "\\4_Boundary_dier_blsm.DAT"));
        jsonObject.put("宝浪苏木枢纽断面地形", crossFile(datFilePathRoot + "\\4_cross_dier_blsm.dat"));
        jsonObject.put("宝浪苏木枢纽初始水流流量", initializationFile(datFilePathRoot + "\\4_initialization_dier_blsm.dat"));
        jsonObject.put("西支水位流量", boundaryFile(datFilePathRoot + "\\5_Boundary_blsm_bsth_xizhi.DAT"));
        jsonObject.put("西支断面地形", crossFile(datFilePathRoot + "\\5_cross_blsm_bsth_xizhi.dat"));
        jsonObject.put("西支初始水流流量", initializationFile(datFilePathRoot + "\\5_initialization_blsm_xizhi.dat"));
        jsonObject.put("东支水位流量", boundaryFile(datFilePathRoot + "\\6_Boundary_blsm_bsth_dongzhi.DAT"));
        jsonObject.put("东支断面地形", crossFile(datFilePathRoot + "\\6_cross_blsm_bsth_dongzhi.dat"));
        jsonObject.put("东支初始水流流量", initializationFile(datFilePathRoot + "\\6_initialization_blsm_dongzhi.dat"));
        jsonObject.put("支流", qQSPFile(datFilePathRoot + "\\QQSP_zhiliu.dat"));
        AjaxResult ajaxResult = new AjaxResult();
        ajaxResult.put("value",jsonObject);
        return ajaxResult;
    }

    public void saveInputValue(String filePath, Date startDate, Date endDate, String value) {
        // 使用FileUtil读取文件内容，而不是FileReader
        List<String> lines = FileUtil.readLines(filePath, "UTF-8");
        String firstLine = lines.get(0);

        // 清空文件
        FileWriter fileWriter = new FileWriter(filePath);
        fileWriter.write("", false);

        // 使用FileAppender追加数据
        FileAppender fileAppender = new FileAppender(new File(filePath), 16, true);
        fileAppender.append(firstLine);
        fileAppender.flush();
    }

    public void saveInputHeDaoSunShiValue(String filePath, List<String> sunshi) {
        // 使用FileUtil读取文件内容
        List<String> lines = FileUtil.readLines(filePath, "UTF-8");
        String firstLine = lines.get(0);

        // 清空文件
        FileWriter fileWriter = new FileWriter(filePath);
        fileWriter.write("", false);

        // 使用FileAppender追加数据
        FileAppender fileAppender = new FileAppender(new File(filePath), 2, true);
        fileAppender.append(firstLine);
        fileAppender.append(sunshi.get(0) + "    " + sunshi.get(1) + "    " + sunshi.get(2));
        fileAppender.flush();
    }

    public void saveInputShuNiuZhaMenKongZhi(String filePath, String diyishuniu, String diershuniu, String disanshuniu) {
        // 使用 FileUtil 读取文件内容，避免资源关闭问题
        List<String> lines = FileUtil.readLines(filePath, "UTF-8");

        // 解析 JSON 字符串为 JSONArray
        JSONArray diyishuniuJsonArray = JSONArray.parseArray(diyishuniu);
        JSONArray diershuniuJsonArray = JSONArray.parseArray(diershuniu);
        JSONArray disanshuniuJsonArray = JSONArray.parseArray(disanshuniu);

        // 清空文件
        FileWriter fileWriter = new FileWriter(filePath);
        fileWriter.write("", false);

        // 使用 FileAppender 追加内容
        FileAppender fileAppender = new FileAppender(new File(filePath), 5, true);

        // 构建各个数据字符串
        String diyishuniuId = "", diyishuniuWaterLevel = "", diyishuniuStatus = "";
        String diershuniuId = "", diershuniuWaterLevel = "", diershuniuStatus = "";
        String disanshuniuId = "", disanshuniuWaterLevel = "", disanshuniuStatus = "";

        // 处理 diyishuniu 数据
        for (Object obj : diyishuniuJsonArray) {
            JSONObject jsonObject = JSONObject.parseObject(obj.toString());
            diyishuniuId += "     " + jsonObject.getString("id");
            diyishuniuWaterLevel += "     " + jsonObject.getString("waterLevel");
            diyishuniuStatus += "     " + jsonObject.getString("status");
        }

        // 处理 diershuniu 数据
        for (Object obj : diershuniuJsonArray) {
            JSONObject jsonObject = JSONObject.parseObject(obj.toString());
            diershuniuId += "     " + jsonObject.getString("id");
            diershuniuWaterLevel += "     " + jsonObject.getString("waterLevel");
            diershuniuStatus += "     " + jsonObject.getString("status");
        }

        // 处理 disanshuniu 数据
        for (Object obj : disanshuniuJsonArray) {
            JSONObject jsonObject = JSONObject.parseObject(obj.toString());
            disanshuniuId += "     " + jsonObject.getString("id");
            disanshuniuWaterLevel += "     " + jsonObject.getString("waterLevel");
            disanshuniuStatus += "     " + jsonObject.getString("status");
        }

        // 追加内容到文件
        fileAppender.append(lines.get(0));  // 第一行
        fileAppender.append(lines.get(1));  // 第二行
        fileAppender.append(diyishuniuId);
        fileAppender.append(diyishuniuWaterLevel);
        fileAppender.append(diyishuniuStatus);

        fileAppender.append(lines.get(5));  // 第五行
        fileAppender.append(lines.get(6));  // 第六行
        fileAppender.append(diershuniuId);
        fileAppender.append(diershuniuWaterLevel);
        fileAppender.append(diershuniuStatus);

        fileAppender.append(lines.get(10)); // 第十行
        fileAppender.append(lines.get(11)); // 第十一行
        fileAppender.append(disanshuniuId);
        fileAppender.append(disanshuniuWaterLevel);
        fileAppender.append(disanshuniuStatus);

        // 刷新并关闭
        fileAppender.flush();
    }

    public void saveTableInputValue(String filePath, String value) {
        // 使用 FileUtil 读取文件内容
        List<String> lines = FileUtil.readLines(filePath, "UTF-8");
        String firstLine = lines.get(0);

        // 解析传入的 JSON 字符串
        JSONObject jsonObject = JSONObject.parseObject(value);

        // 清空文件
        FileWriter fileWriter = new FileWriter(filePath);
        fileWriter.write("", false);

        // 使用 FileAppender 追加内容
        FileAppender fileAppender = new FileAppender(new File(filePath), 16, true);
        fileAppender.append(firstLine);

        // 遍历 JSON 对象的 key，格式化并追加到文件
        for (String timeString : jsonObject.keySet()) {
            Date time = DateUtils.parseDate(timeString);
            String dateFormat = DateUtil.format(time, "yyyy-MM-dd HH:mm:ss");
            fileAppender.append(StrUtil.format(" \"{}\"   {}", dateFormat, jsonObject.getString(timeString)));
        }

        // 刷新并关闭文件
        fileAppender.flush();
    }

    @Override
    public void runProcess(Long id) throws IOException {
        this.id = id;
       /* List<String> list = Lists.newArrayList();
        list.add(filePathRoot + "\\1_xsk_diyishuniu_qd.exe");
        list.add(filePathRoot + "\\2_xsk_diyishuniu_hd.exe");
        list.add(filePathRoot + "\\3_diyishuniu_diershuniu.exe");
        list.add(filePathRoot + "\\4_diershuniu_baolangsumu.exe");
        list.add(filePathRoot + "\\5_baolangsumu_bsth_xizhi.exe");
        list.add(filePathRoot + "\\6_baolangsumu_bsth_dongzhi.exe");
        String directoryPath = filePathRoot; // 目标目录的路径
        for (String processPath : list) {
            runOneProcess(directoryPath, processPath);
        }*/
        runOneProcess(newHydrodynamicModel, newHydrodynamicModel + "\\Console1.exe");
    }

    @Override
    public void runProcess(Long id,String filePath) throws IOException {
        this.id = id;
       /* List<String> list = Lists.newArrayList();
        list.add(filePathRoot + "\\1_xsk_diyishuniu_qd.exe");
        list.add(filePathRoot + "\\2_xsk_diyishuniu_hd.exe");
        list.add(filePathRoot + "\\3_diyishuniu_diershuniu.exe");
        list.add(filePathRoot + "\\4_diershuniu_baolangsumu.exe");
        list.add(filePathRoot + "\\5_baolangsumu_bsth_xizhi.exe");
        list.add(filePathRoot + "\\6_baolangsumu_bsth_dongzhi.exe");
        String directoryPath = filePathRoot; // 目标目录的路径
        for (String processPath : list) {
            runOneProcess(directoryPath, processPath);
        }*/
        filePath = filePath.replaceAll("/","\\\\");
        runOneProcess(filePath, filePath + "\\Console1.exe");
    }

    public void runOneProcess(String directoryPath, String processPath) throws IOException {
        File directory = new File(directoryPath);
        // 创建一个ProcessBuilder并指定.exe文件的路径
        ProcessBuilder processBuilder = new ProcessBuilder(processPath);
        // 设置工作目录为目标目录
        processBuilder.directory(directory);
        HashMap<String, Object> returnMap = Maps.newHashMap();
        // 启动进程
        Process p;
        BufferedReader br;
        BufferedReader brError;
        try {
            p = processBuilder.start();
            String line;
            br = new BufferedReader(new InputStreamReader(p.getInputStream(), "gbk"));
            brError = new BufferedReader(new InputStreamReader(p.getErrorStream(), "gbk"));
            while ((line = br.readLine()) != null || (line = brError.readLine()) != null) {
                //输出exe输出的信息以及错误信息
                System.out.println(line);
                if (line.contains("请按")) {
                    BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(p.getOutputStream(), "gbk"));
                    writer.write("\n");
                    writer.flush();
                    writer.close();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public JSONArray boundaryFile(String filepath) {
        BufferedReader reader = null;
        List<List<String>> data = null;
        String title = null;
        try {
            reader = new BufferedReader(new InputStreamReader(new FileInputStream(filepath), "gbk"));
            title = reader.readLine(); // 读取表头
            List<String> header = new ArrayList<String>();
            data = new ArrayList<List<String>>();
            System.out.println("title"+title);
            header.add(title);
            int line = 2;
            String text = "";
            while ((text = reader.readLine()) != null) {
                if (line >= 2) {
                    List<String> row = Arrays.asList(text.split("\\s+"));
                    data.add(row);
                }
                line++;
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                reader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        List<String> titleList = data.get(0);
        data.remove(0);
        JSONObject titleJson = new JSONObject();
        titleJson.put("标题",title);
        titleJson.put("系列数", titleList.get(0));
        titleJson.put("说明", titleList.get(1));
        JSONArray jsonArray = new JSONArray();
        jsonArray.add(titleJson);
        int i = 1;
        for (List<String> row : data) {
            if (row.size() == 2) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("index", i++);
                jsonObject.put("水位", row.get(0));
                jsonObject.put("流量", row.get(1));
                jsonArray.add(jsonObject);
            }
        }
        System.out.println(jsonArray.toString());
        return jsonArray;
    }

    public JSONArray crossFile(String filepath) {
        //
        List<String> data2 = new ArrayList<String>();
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(filepath), "gbk"));
            String line = br.readLine(); // 读取表头
            while ((line = br.readLine()) != null) {
                data2.add(line);
            }
            br.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        //获取相应起点距和高程的对应断面
        int count = 1;
        Map<String, List<String>> map = new HashMap<>();
        for (int i = 0; i < Integer.valueOf(data2.get(0).trim()); i++) {
            List<String> dataTwoList = new ArrayList<String>();
            String[] split = data2.get(count).split("\\s+");
            Integer integer = Integer.valueOf(split[1].trim());
            count++;
            int index = integer + count;
            for (int j = count; j < index; j++) {
                dataTwoList.add(data2.get(j));
            }
            if (map.get(split[2]) != null) {
                map.put("cs4", dataTwoList);
            } else {
                map.put(split[2], dataTwoList);
            }
            count += integer;
        }
        //生成json数组
        JSONArray jsonArray = new JSONArray();
        //添加相应起点距和高程到对应断面
        for (Map.Entry<String, List<String>> entry : map.entrySet()) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put(entry.getKey(), entry.getValue());
            jsonArray.add(jsonObject);
        }
        //获取断面间距和糙率并添加到json数组里面
        for (int i = count; i < data2.size(); i++) {
            if (i > count && i - count <= Integer.valueOf(data2.get(0).trim())) {
                JSONObject jsonObject = new JSONObject();
                List<String> row = Arrays.asList(data2.get(i).split("\\s+"));
                jsonObject.put("编号", row.get(0));
                jsonObject.put("断面间距", row.get(1));
                jsonObject.put("糙率", row.get(2));
                jsonArray.add(jsonObject);
            }
        }
        //获取水文站编号信息
        while (data2.get(data2.size() - 1).trim().equals("")) {
            data2.remove(data2.get(data2.size() - 1));
        }
        JSONObject jsonObject = new JSONObject();
        List<String> row = Arrays.asList(data2.get(data2.size() - 1).split("\\s+"));
        jsonObject.put("水文站编号", row);
        jsonArray.add(jsonObject);
        System.out.println(jsonArray);
        return jsonArray;
    }

    public JSONArray initializationFile(String filepath) {
        BufferedReader reader = null;
        List<List<String>> data = null;
        try {
            reader = new BufferedReader(new InputStreamReader(new FileInputStream(filepath), "gbk"));
            data = new ArrayList<List<String>>();
            String text = "";
            while ((text = reader.readLine()) != null) {
                List<String> row = Arrays.asList(text.split("\\s+"));
                data.add(row);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                reader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        JSONArray jsonArray = new JSONArray();
        for (List<String> row : data) {
            if (row.size() == 4) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("断面", row.get(1));
                jsonObject.put("流量", row.get(2));
                jsonObject.put("水位", row.get(3));
                jsonArray.add(jsonObject);
            }
        }
        jsonArray.remove(0);
        System.out.println(jsonArray.toString());
        return jsonArray;
    }

    public JSONArray qQSPFile(String filepath) {
        BufferedReader reader = null;
        List<List<String>> data = null;
        try {
            reader = new BufferedReader(new InputStreamReader(new FileInputStream(filepath), "gbk"));
            data = new ArrayList<List<String>>();
            String text = "";
            while ((text = reader.readLine()) != null) {
                List<String> row = Arrays.asList(text.split("\\s+"));
                data.add(row);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                reader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
//        System.out.println(data);
        //转json格式
        JSONArray jsonArray = new JSONArray();
        String s = "";
        for (List<String> row : data) {
            if (row.size() == 2) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("总数", row.get(1));
                jsonArray.add(jsonObject);
            }
            if (row.size() == 6) {
                s = row.get(5);
                String[] split = s.split("、");
                String s1 = split.toString();
                System.out.println(s1);

            }
            if (row.size() == 8) {
                JSONObject jsonObject = new JSONObject();
                String time = row.get(2) + "-" + row.get(3) + "-" + row.get(4);
                jsonObject.put("编号", row.get(1));
                jsonObject.put("时间", time);
                jsonObject.put("时段", row.get(5));
                HashMap<String, String> map = new HashMap<>();
                map.put(s + 1, row.get(6));
                map.put(s + 2, row.get(7));
                jsonObject.put("流量", map);
                jsonArray.add(jsonObject);
            }
        }
        return jsonArray;
    }

    public JSONArray otherFile(String filepath) {
        BufferedReader reader = null;
        List<List<String>> data = null;
        try {
            reader = new BufferedReader(new InputStreamReader(new FileInputStream(filepath), "gbk"));
            data = new ArrayList<List<String>>();
            String text = "";
            while ((text = reader.readLine()) != null) {
                List<String> row = Arrays.asList(text.split("\\s+"));
                data.add(row);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                reader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        System.out.println(data);
        JSONArray jsonArray = new JSONArray();
        for (List<String> row : data) {
            if (row.size() == 2) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("水位m", row.get(0));
                jsonObject.put("库容万m3", row.get(1));
                jsonArray.add(jsonObject);
            }
        }
        jsonArray.remove(0);
        System.out.println(jsonArray.toString());
        return jsonArray;
    }

    public static void main(String[] args) throws IOException {
        WaterResourceServiceImpl waterResourceService = new WaterResourceServiceImpl();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("开始日期", "2020-07-01");
        jsonObject.put("结束日期", "2020-08-01");
        {
            JSONArray array = new JSONArray().fluentAdd(10).fluentAdd(3);
            jsonObject.put("地下水", array);
        }
        jsonObject.put("黄水沟", "30");
        jsonObject.put("乌拉斯太河", "35");
        {
            JSONArray array = new JSONArray().fluentAdd(25).fluentAdd(19.4);
            jsonObject.put("北干分水", array);
        }
        {
            JSONArray array = new JSONArray().fluentAdd(23).fluentAdd(14.6);
            jsonObject.put("南干分水", array);
        }
        {
            JSONArray array = new JSONArray().fluentAdd(5).fluentAdd(5);
            jsonObject.put("河道损失", array);
        }
        {
            JSONObject object = new JSONObject();
            object.put("2020-7-1 8:00:00",	160);
            object.put("2020-7-2 8:00:00",	195);
            object.put("2020-7-3 8:00:00",	155);
            object.put("2020-7-4 8:00:00",	194);
            object.put("2020-7-5 8:00:00",	195);
            object.put("2020-7-6 8:00:00",	195);
            object.put("2020-7-7 8:00:00",	218);
            object.put("2020-7-8 8:00:00",	395);
            object.put("2020-7-9 8:00:00",	195);
            object.put("2020-7-10 8:00:00", 195);
            object.put("2020-7-11 8:00:00", 375);
            object.put("2020-7-12 8:00:00", 362);
            object.put("2020-7-13 8:00:00", 195);
            object.put("2020-7-14 8:00:00", 230);
            object.put("2020-7-15 8:00:00", 219);
            object.put("2020-7-16 8:00:00", 215);
            object.put("2020-7-17 8:00:00", 210);
            object.put("2020-7-18 8:00:00", 216);
            object.put("2020-7-19 8:00:00", 230);
            object.put("2020-7-20 8:00:00", 220);
            object.put("2020-7-21 8:00:00", 245);
            object.put("2020-7-22 8:00:00", 299);
            object.put("2020-7-23 8:00:00", 361);
            object.put("2020-7-24 8:00:00", 252);
            object.put("2020-7-25 8:00:00", 200);
            object.put("2020-7-26 8:00:00", 250);
            object.put("2020-7-27 8:00:00", 195);
            object.put("2020-7-28 8:00:00", 228);
            object.put("2020-7-29 8:00:00", 292);
            object.put("2020-7-30 8:00:00", 210);
            object.put("2020-7-31 8:00:00", 230);
            jsonObject.put("小山口", object);
        }
        waterResourceService.saveInputForModelWaterResource(jsonObject);

        waterResourceService.runProcess(null);
        waterResourceService.getAllDatFileMsg();
    }

    @Override
    public JSONObject saveInputForModelWaterResourceByScreen(JSONObject target) {
        String startDateString = target.getString("开始日期");
        String endDateString = target.getString("结束日期");
        Long modelId = target.getLong("modelId");
        if (modelId != null){
            ModelReconstitution modelReconstitution = modelReconstitutionService.selectModelReconstitutionById(modelId);
            newHydrodynamicModel = modelReconstitution.getInterfaceorfileAddress().substring(0, modelReconstitution.getInterfaceorfileAddress().lastIndexOf("/")) + "/" + modelReconstitution.getFileName();
        }else {
            newHydrodynamicModel = newHydrodynamicModelCopy;
        }
        Date startDate = DateUtils.parseDate(startDateString);
        Date endDate = DateUtils.parseDate(endDateString);
        {
            /*saveInputValue(filePathRoot + "\\input\\Qin_diyishuniu_dixiashuibugei.dat",
                    startDate, endDate, target.getString("小山口至一枢纽地下水"));
            saveInputValue(filePathRoot + "\\input\\Qin_diershuniu_dixiashuibugei.dat",
                    startDate, endDate, target.getString("一枢纽至二枢纽地下水"));*/
            /*saveInputValue(newHydrodynamicModel + "\\input\\Qin_diyishuniu_dixiashuibugei.dat",
                    startDate, endDate, target.getString("小山口至一枢纽地下水"));
            saveInputValue(newHydrodynamicModel + "\\input\\Qin_diershuniu_dixiashuibugei.dat",
                    startDate, endDate, target.getString("一枢纽至二枢纽地下水"));*/
            saveInputShuNiuZhaMenKongZhi(newHydrodynamicModel + "\\input\\shuniu_zhamenkongzhi.dat",
                    target.getString("第一枢纽闸门控制"), target.getString("第二枢纽闸门控制"), target.getString("第三枢纽闸门控制"));
        }
        {
            String value = target.getString("黄水沟");
            /*saveInputValueByHour(filePathRoot + "\\input\\Qin_huangshuigou.dat",
                    value);*/
            saveInputValueByHour(newHydrodynamicModel + "\\input\\Qin_huangshuigou.dat",
                    value);
        }
        {
            String value = target.getString("乌拉斯太河");
            /*saveInputValue(filePathRoot + "\\input\\Qin_wulasitaihe.dat",
                    startDate, endDate, value);*/
            saveInputValue(newHydrodynamicModel + "\\input\\Qin_wulasitaihe.dat",
                    startDate, endDate, value);
        }
        {
            /*saveInputValueByHour(filePathRoot + "\\input\\Qout_diyishuniu_beiganfenshui.dat",
                    target.getString("第一枢纽北干分水"));
            saveInputValueByHour(filePathRoot + "\\input\\Qout_diershuniu_beiganfenshui.dat",
                    target.getString("第二枢纽北干分水"));
            saveInputValueByHour(filePathRoot + "\\input\\Qout_diyishuniu_nanganfenshui.dat",
                    target.getString("第一枢纽南干分水"));
            saveInputValueByHour(filePathRoot + "\\input\\Qout_diershuniu_nanganfenshui.dat",
                    target.getString("第二枢纽南干分水"));*/

            saveInputValueByHour(newHydrodynamicModel + "\\input\\Qout_diyishuniu_beiganfenshui.dat",
                    target.getString("第一枢纽北干分水"));
            saveInputValueByHour(newHydrodynamicModel + "\\input\\Qout_diershuniu_beiganfenshui.dat",
                    target.getString("第二枢纽北干分水"));
            saveInputValueByHour(newHydrodynamicModel + "\\input\\Qout_diyishuniu_nanganfenshui.dat",
                    target.getString("第一枢纽南干分水"));
            saveInputValueByHour(newHydrodynamicModel + "\\input\\Qout_diershuniu_nanganfenshui.dat",
                    target.getString("第二枢纽南干分水"));
        }
        {
            /*saveInputValue(filePathRoot + "\\input\\Qout_diyishuniu_hedaoshunshi.dat",
                    startDate, endDate, target.getString("小山口至一枢纽损失"));
            saveInputValue(filePathRoot + "\\input\\Qout_diershuniu_hedaoshunshi.dat",
                    startDate, endDate,  target.getString("一枢纽至二枢纽损失"));
            saveInputValue(filePathRoot + "\\input\\Qout_baolangsumu_dongzhi_hedaoshunshi.dat",
                    startDate, endDate,  target.getString("东支损失"));
            saveInputValue(filePathRoot + "\\input\\Qout_baolangsumu_xizhi_hedaoshunshi.dat",
                    startDate, endDate,  target.getString("西支损失"));*/

            List<String> sunshi = new ArrayList<>();
            sunshi.add("-" + target.getString("小山口至一枢纽损失"));
            sunshi.add("-" + target.getString("一枢纽至二枢纽损失"));
            sunshi.add("-" + target.getString("二枢纽至三枢纽损失"));
            saveInputHeDaoSunShiValue(newHydrodynamicModel + "\\input\\hedaosunshi.dat", sunshi);
        }
        /*{
            JSONObject jsonObject = target.getJSONObject("小山口");
            String filePath = filePathRoot + "\\input\\qqsp_xsk.dat";
            FileReader fileReader = new FileReader(filePath);
            List<String> lines = fileReader.readLines();
            String firstLine = lines.get(0);

            // 清空文件
            FileWriter fileWriter = new FileWriter(filePath);
            fileWriter.write("", false);

            FileAppender fileAppender = new FileAppender(new File(filePath), 16, true);
            fileAppender.append(firstLine);
            for (String timeString : jsonObject.keySet()) {
                Date time = DateUtils.parseDate(timeString);
                String dateFormat = DateUtil.format(time, "yyyy-MM-dd HH:mm:ss");
                fileAppender.append(StringUtils.format(" \"{}\"   {}", dateFormat, jsonObject.getString(timeString)));
            }
            fileAppender.flush();

        }*/
        {
            JSONObject jsonObject = target.getJSONObject("小山口");
            String filePath = newHydrodynamicModel + "\\input\\qqsp_xsk.dat";
            // 使用 FileUtil 读取文件内容
            List<String> lines = FileUtil.readLines(filePath, "UTF-8");
            String firstLine = lines.get(0);

            // 清空文件
            FileWriter fileWriter = new FileWriter(filePath);
            fileWriter.write("", false);

            FileAppender fileAppender = new FileAppender(new File(filePath), 16, true);
            fileAppender.append(firstLine);
            for (String timeString : jsonObject.keySet()) {
                Date time = DateUtils.parseDate(timeString);
                String dateFormat = DateUtil.format(time, "yyyy-MM-dd HH:mm:ss");
                fileAppender.append(StringUtils.format(" \"{}\"   {}", dateFormat, jsonObject.getString(timeString)));
            }
            fileAppender.flush();

        }

        return new JSONObject();
    }

    private void saveInputValueByHour(String filePath, String value) {
        // 使用 FileUtil 读取文件内容
        List<String> lines = FileUtil.readLines(filePath, "UTF-8");
        String firstLine = lines.get(0);
        // 清空文件
        FileWriter fileWriter = new FileWriter(filePath);
        fileWriter.write("", false);
        FileAppender fileAppender = new FileAppender(new File(filePath), 16, true);
        fileAppender.append(firstLine);
        JSONArray jsonArray = JSONArray.parseArray(value);
        for (int i = 0; i < jsonArray.size(); i++) {
            JSONObject jsonObject = jsonArray.getJSONObject(i);
            String time = jsonObject.getString("time");
            String val = jsonObject.getString("val");
            for (int hour = 0; hour < 24; hour++) {
                if (hour < 10) {
                    fileAppender.append(StringUtils.format(" \"{}\"   {}", time + " 0" + hour + ":00:00", val));
                } else {
                    fileAppender.append(StringUtils.format(" \"{}\"   {}", time + " " + hour + ":00:00", val));
                }
            }
        }
        fileAppender.flush();
    }
}
