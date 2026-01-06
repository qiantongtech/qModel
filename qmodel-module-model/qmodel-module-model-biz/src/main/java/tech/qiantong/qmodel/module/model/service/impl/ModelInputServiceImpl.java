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

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import tech.qiantong.qmodel.common.utils.*;
import tech.qiantong.qmodel.module.model.domain.*;
import tech.qiantong.qmodel.module.model.mapper.*;
import tech.qiantong.qmodel.module.model.service.*;

import java.io.*;
import java.util.*;

/**
 * 模型输入管理 Service业务层处理
 *
 * @author YWG
 * @date 2023-09-14
 */
@Service
public class ModelInputServiceImpl implements IModelInputService {
    @Autowired
    private ModelInputMapper modelInputMapper;

    /**
     * 查询模型输入管理
     *
     * @param id 模型输入管理 主键
     * @return 模型输入管理
     */
    @Override
    public ModelInput selectModelInputById(Long id) {
        return modelInputMapper.selectModelInputById(id);
    }

    /**
     * 查询模型输入管理 列表
     *
     * @param modelInput 模型输入管理
     * @return 模型输入管理
     */
    @Override
    public List<ModelInput> selectModelInputList(ModelInput modelInput) {
        modelInput.setDelFlag(false);
        return modelInputMapper.selectModelInputList(modelInput);
    }

    /**
     * 新增模型输入管理
     *
     * @param modelInput 模型输入管理
     * @return 结果
     */
    @Override
    public int insertModelInput(ModelInput modelInput) {
                modelInput.setCreateTime(DateUtils.getNowDate());
            return modelInputMapper.insertModelInput(modelInput);
    }

    /**
     * 修改模型输入管理
     *
     * @param modelInput 模型输入管理
     * @return 结果
     */
    @Override
    public int updateModelInput(ModelInput modelInput) {
                modelInput.setUpdateTime(DateUtils.getNowDate());
        return modelInputMapper.updateModelInput(modelInput);
    }

    /**
     * 批量删除模型输入管理
     *
     * @param ids 需要删除的模型输入管理 主键
     * @return 结果
     */
    @Override
    public int deleteModelInputByIds(Long[] ids) {
        return modelInputMapper.deleteModelInputByIds(ids);
    }

    /**
     * 删除模型输入管理 信息
     *
     * @param id 模型输入管理 主键
     * @return 结果
     */
    @Override
    public int deleteModelInputById(Long id) {
        return modelInputMapper.deleteModelInputById(id);
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
        File filePath = new File(path);
        HashMap<String, Object> jsonObject = new HashMap<>();

        if (filePath == null || !filePath.exists() || !filePath.isDirectory()) {
            System.out.println("无效的文件夹路径");
            return new HashMap<>();
        }

        File[] files = filePath.listFiles();
        if (files == null || files.length == 0) {
            System.out.println("文件夹为空");
            return new HashMap<>();
        }

        for (File file : files) {
            if (file.getName().contains("Boundary")) {
                try (BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(file), "gbk"))) {
                    List<List<String>> data = new ArrayList<>();
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
                try (BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file), "gbk"))) {
                    List<String> data2 = new ArrayList<>();
                    String title = br.readLine(); // 读取表头
                    String line;
                    while ((line = br.readLine()) != null) {
                        data2.add(line);
                    }

                    //获取相应起点距和高程的对应断面
                    int count = 1;
                    Map<String, List<String[]>> map = new HashMap<>();
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

                    //添加相应起点距和高程到对应断面
                    Map<String, Object> hashMap = new HashMap<>();
                    hashMap.put(title, map);
                    jsonObject.put(file.getName(), hashMap);

                    //获取断面间距和糙率并添加到json数组里面
                    ArrayList<List<String>> list = new ArrayList<>();
                    for (int i = count; i < data2.size(); i++) {
                        if (i > count && i - count <= Integer.valueOf(data2.get(0).trim())) {
                            List<String> row = Arrays.asList(data2.get(i).split("\\s+"));
                            list.add(row);
                        }
                    }
                    hashMap.put("编号 断面间距 糙率", list);

                    //获取水文站编号信息
                    while (data2.get(data2.size() - 1).trim().equals("")) {
                        data2.remove(data2.size() - 1);
                    }
                    List<String> row = Arrays.asList(data2.get(data2.size() - 1).split("\\s+"));
                    hashMap.put(data2.get(data2.size() - 3), row);
                    jsonObject.put(file.getName(), hashMap);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            if (file.getName().contains("initialization")) {
                try (BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(file), "gbk"))) {
                    List<List<String>> data = new ArrayList<>();
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
}
