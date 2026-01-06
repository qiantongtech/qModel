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

package tech.qiantong.qmodel.module.model.service;

import tech.qiantong.qmodel.module.model.domain.*;

import java.util.*;

/**
 * 模型输入管理 Service接口
 *
 * @author YWG
 * @date 2023-09-14
 */
public interface IModelInputService {
    /**
     * 查询模型输入管理
     *
     * @param id 模型输入管理 主键
     * @return 模型输入管理
     */
    public ModelInput selectModelInputById(Long id);

    /**
     * 查询模型输入管理 列表
     *
     * @param modelInput 模型输入管理
     * @return 模型输入管理 集合
     */
    public List<ModelInput> selectModelInputList(ModelInput modelInput);

    /**
     * 新增模型输入管理
     *
     * @param modelInput 模型输入管理
     * @return 结果
     */
    public int insertModelInput(ModelInput modelInput);

    /**
     * 修改模型输入管理
     *
     * @param modelInput 模型输入管理
     * @return 结果
     */
    public int updateModelInput(ModelInput modelInput);

    /**
     * 批量删除模型输入管理
     *
     * @param ids 需要删除的模型输入管理 主键集合
     * @return 结果
     */
    public int deleteModelInputByIds(Long[] ids);

    /**
     * 删除模型输入管理 信息
     *
     * @param id 模型输入管理 主键
     * @return 结果
     */
    public int deleteModelInputById(Long id);

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
    public HashMap<String, Object> getAllDatFileMsg(String path);
}
