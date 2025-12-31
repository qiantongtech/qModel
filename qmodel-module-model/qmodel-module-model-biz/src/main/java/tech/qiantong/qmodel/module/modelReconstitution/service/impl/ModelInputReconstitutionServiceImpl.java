package tech.qiantong.qmodel.module.modelReconstitution.service.impl;

import cn.hutool.core.io.file.FileReader;
import cn.hutool.json.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import tech.qiantong.qmodel.common.utils.*;
import tech.qiantong.qmodel.module.modelReconstitution.domain.*;
import tech.qiantong.qmodel.module.modelReconstitution.mapper.*;
import tech.qiantong.qmodel.module.modelReconstitution.service.*;

import java.io.*;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 模型输入管理 Service业务层处理
 *
 * @author YWG
 * @date 2023-09-14
 */
@Service
public class ModelInputReconstitutionServiceImpl implements IModelInputReconstitutionService {
    @Autowired
    private ModelInputReconstitutionMapper modelInputReconstitutionMapper;

    /**
     * 查询模型输入管理
     *
     * @param id 模型输入管理 主键
     * @return 模型输入管理
     */
    @Override
    public ModelInputReconstitution selectModelInputById(Long id) {
        return modelInputReconstitutionMapper.selectModelInputById(id);
    }

    /**
     * 查询模型输入管理 列表
     *
     * @param modelInput 模型输入管理
     * @return 模型输入管理
     */
    @Override
    public List<ModelInputReconstitution> selectModelInputList(ModelInputReconstitution modelInput) {
        modelInput.setDelFlag(false);
        return modelInputReconstitutionMapper.selectModelInputList(modelInput);
    }

    /**
     * 新增模型输入管理
     *
     * @param modelInput 模型输入管理
     * @return 结果
     */
    @Override
    public int insertModelInput(ModelInputReconstitution modelInput) {
                modelInput.setCreateTime(DateUtils.getNowDate());
            return modelInputReconstitutionMapper.insertModelInput(modelInput);
    }

    /**
     * 修改模型输入管理
     *
     * @param modelInput 模型输入管理
     * @return 结果
     */
    @Override
    public int updateModelInput(ModelInputReconstitution modelInput) {
                modelInput.setUpdateTime(DateUtils.getNowDate());
        return modelInputReconstitutionMapper.updateModelInput(modelInput);
    }

    /**
     * 批量删除模型输入管理
     *
     * @param ids 需要删除的模型输入管理 主键
     * @return 结果
     */
    @Override
    public int deleteModelInputByIds(Long[] ids) {
        return modelInputReconstitutionMapper.deleteModelInputByIds(ids);
    }

    /**
     * 删除模型输入管理 信息
     *
     * @param id 模型输入管理 主键
     * @return 结果
     */
    @Override
    public int deleteModelInputById(Long id) {
        return modelInputReconstitutionMapper.deleteModelInputById(id);
    }

    /**
     * 获取结果集
     * @param path 模型dat文件的绝对地址
     * @return 结果
     * |————1.1 1_Boundary_xsk_diyi_hd.DAT文件名
     * |——————1.2第一分水枢纽渠道水位流量--表头
     * |————————1.3 [
     *           "1248.6", 水位
     *           "0"       流量
     *         ],
     * |————2.1 1_cross_xsk_diyi_hd.dat文件名
     * |------2.2 编号 断面间距 糙率  [
     *           "1",   编号
     *           "0",   断面累计距离
     *           "0.013"  糙率
     *         ],
     * |------2.3 水文站编号 ["2", "3","4","5","6","7"],
     * |-----2.3 "断面地形2023年汛前（河道内地形）
     * |------2.3.1 cs1 断面编号
     * |————————2.3.2 "1\t859.114\t1277.154\t\t", 1-序号  859.114 起点距  1277.154 高程
     * |—————3.1  1_initialization_xsk_diyi_hd.dat 文件名
     * |——————3.1.2 断面    流量     水位 [
     *           "",
     *           "1", 断面
     *           "55.000", 流量
     *           "1278.917" 水位
     *         ],
     */
    @Override
    public HashMap<String, Object> getAllDatFileMsg(String path) {
        // 文件路径
        List<List<String>> data = null;
        File filePath = new File(path);
        HashMap<String, Object> jsonObject = new HashMap<>();

        if (filePath == null || !filePath.exists() || !filePath.isDirectory()) {
            System.out.println("无效的文件夹路径");
            return new HashMap<String, Object>();
        }

        File[] files = filePath.listFiles();
        if (files == null || files.length == 0) {
            System.out.println("文件夹为空");
            return new HashMap<String, Object>();
        }

        for (File file : files) {
            if (file.getName().contains("Boundary")) {
                try (BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(file), "gbk"))) {
                    data = new ArrayList<>();
                    String title = reader.readLine();
                    int line = 2;
                    String text;
                    while ((text = reader.readLine()) != null) {
                        if (line >= 2) {
                            List<String> row = Arrays.asList(text.split("\\s+"));
                            data.add(row);
                        }
                        line++;
                    }
                    data.remove(0);
                    HashMap<String, List<List<String>>> map = new HashMap<>();
                    map.put(title, data);
                    jsonObject.put(file.getName(), map);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            if (file.getName().contains("cross")) {
                List<String> data2 = new ArrayList<>();
                try (BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file), "gbk"))) {
                    String title = br.readLine(); // 读取表头
                    String line;
                    while ((line = br.readLine()) != null) {
                        data2.add(line);
                    }

                    // Process data...
                    Map<String, List<String[]>> map = new HashMap<>();
                    int count = 1;
                    for (int i = 0; i < Integer.valueOf(data2.get(0).trim()); i++) {
                        List<String[]> dataTwoList = new ArrayList<>();
                        String[] split = data2.get(count).split("\\s+");
                        Integer integer = Integer.valueOf(split[1].trim());
                        count++;
                        int index = integer + count;
                        for (int j = count; j < index; j++) {
                            dataTwoList.add(data2.get(j).split("\\s+"));
                        }
                        if (map.get(split[2]) != null) {
                            map.put("cs4", dataTwoList);
                        } else {
                            map.put(split[2], dataTwoList);
                        }
                        count += integer;
                    }

                    // Add data...
                    Map<String, Object> hashMap = new HashMap<>();
                    hashMap.put(title, map);
                    jsonObject.put(file.getName(), hashMap);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            if (file.getName().contains("initialization")) {
                try (BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(file), "gbk"))) {
                    data = new ArrayList<>();
                    reader.readLine();
                    String title = reader.readLine();
                    int line = 2;
                    String text;
                    while ((text = reader.readLine()) != null) {
                        if (line >= 2) {
                            List<String> row = Arrays.asList(text.trim().split("\\s+"));
                            data.add(row);
                        }
                        line++;
                    }
                    data.remove(0);
                    data.remove(data.size() - 1);
                    HashMap<String, List<List<String>>> map = new HashMap<>();
                    map.put(title, data);
                    jsonObject.put(file.getName(), data);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return jsonObject;
    }


    @Override
    public JSONArray shuniuZhamenkongzhi(String filePath) {
        JSONArray array = new JSONArray();
        // Hutool 的 FileReader 会自动管理资源，无需手动关闭
        FileReader fileReader = new FileReader(filePath);
        List<String> lines = fileReader.readLines();

        for (int i = 0; i < lines.size(); i++) {
            if (i == 0 || i == 1 || i == 5 || i == 6 || i == 10 || i == 11) {
                continue;
            }
            String[] split = lines.get(i).trim().split("\\s+");
            JSONArray jsonArray = new JSONArray();

            for (int j = 0; j < split.length; j++) {
                if (split[j].matches("-?\\d+(\\.\\d+)?")) {
                    if (i == 2) {
                        jsonArray.add("第一枢纽" + split[j] + "闸门");
                    } else if (i == 7) {
                        jsonArray.add("第二枢纽" + split[j] + "闸门");
                    } else if (i == 12) {
                        jsonArray.add("第三枢纽" + split[j] + "闸门");
                    } else {
                        jsonArray.add(split[j]);
                    }
                }
            }
            array.add(jsonArray);
        }

        return array;
    }

    @Override
    public JSONArray hedaosunshi(String filePath) {
        // 1. 使用 Hutool 的 FileReader（自动管理资源）
        FileReader fileReader = new FileReader(filePath);
        List<String> lines = fileReader.readLines();

        // 2. 初始化 JSONArray（放在循环外避免重复初始化）
        JSONArray array = new JSONArray();

        // 3. 处理数据（跳过首行）
        for (int i = 1; i < lines.size(); i++) {
            String[] split = lines.get(i).trim().split("\\s+");

            // 4. 每行数据生成一个 JSONArray
            for (int j = 0; j < split.length && j < 3; j++) { // 只处理前3列
                JSONArray jsonArray = new JSONArray();
                switch (j) {
                    case 0:
                        jsonArray.add("小山口至第一枢纽");
                        break;
                    case 1:
                        jsonArray.add("第一枢纽至第二枢纽");
                        break;
                    case 2:
                        jsonArray.add("第二枢纽至第三枢纽");
                        break;
                }
                jsonArray.add(split[j]);
                array.add(jsonArray);
            }
        }
        return array;
    }

    /**
     * 查询模型输入总数
     *
     * @return 模型输入总数
     */
    @Override
    public int count() {
        ModelInputReconstitution modelInput = new ModelInputReconstitution();
        modelInput.setDelFlag(false);
        return modelInputReconstitutionMapper.selectModelInputList(modelInput).size();
    }

    /**
     * 查询上周新增的模型输入数量
     *
     * @return 上周新增的模型输入数量
     */
    @Override
    public int countLastWeek() {
        ModelInputReconstitution modelInput = new ModelInputReconstitution();
        modelInput.setDelFlag(false);
        return modelInputReconstitutionMapper.selectModelInputList(modelInput).stream()
                .filter(input -> input.getCreateTime().after(DateUtils.getLastWeekStartTime())
                        && input.getCreateTime().before(DateUtils.getLastWeekEndTime()))
                .collect(Collectors.toList()).size();
    }
}
