/*
 * Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
 *  
 * This file is part of qModel Module Platform (Open Source Edition).
 *  
 * qModel is licensed under Apache License 2.0 with additional qModel terms.
 * You may use qModel for commercial purposes, but you may not remove, hide,
 * modify, or replace the qModel logo, copyright notices, license notices,
 * or attribution information without a separate commercial license.
 *  
 * White-label use, OEM distribution, rebranding, or presenting qModel as
 * another product requires separate commercial authorization from
 * Jiangsu Qiantong Technology Co., Ltd.
 *  
 * Business License: `https://qmodel.tech/`
 * See the LICENSE file in the project root for full license information.
 */

package tech.qiantong.qmodel.module.model.service.output;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.output.vo.ModelOutputPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.output.vo.ModelOutputRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.output.vo.ModelOutputSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.output.ModelOutputDO;

import java.util.Collection;
import java.util.List;
import java.util.Map;
/**
 * 模型输出管理Service接口
 *
 * @author qModel
 * @date 2026-01-09
 */
public interface IModelOutputService extends IService<ModelOutputDO> {

    /**
     * 获得模型输出管理分页列表
     *
     * @param pageReqVO 分页请求
     * @return 模型输出管理分页列表
     */
    PageResult<ModelOutputDO> getModelOutputPage(ModelOutputPageReqVO pageReqVO);

    /**
     * 创建模型输出管理
     *
     * @param createReqVO 模型输出管理信息
     * @return 模型输出管理编号
     */
    Long createModelOutput(ModelOutputSaveReqVO createReqVO);

    /**
     * 更新模型输出管理
     *
     * @param updateReqVO 模型输出管理信息
     */
    int updateModelOutput(ModelOutputSaveReqVO updateReqVO);

    /**
     * 删除模型输出管理
     *
     * @param idList 模型输出管理编号
     */
    int removeModelOutput(Collection<Long> idList);

    /**
     * 获得模型输出管理详情
     *
     * @param id 模型输出管理编号
     * @return 模型输出管理
     */
    ModelOutputDO getModelOutputById(Long id);

    /**
     * 获得全部模型输出管理列表
     *
     * @return 模型输出管理列表
     */
    List<ModelOutputDO> getModelOutputList();

    /**
     * 获得全部模型输出管理 Map
     *
     * @return 模型输出管理 Map
     */
    Map<Long, ModelOutputDO> getModelOutputMap();


    /**
     * 导入模型输出管理数据
     *
     * @param importExcelList 模型输出管理数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    String importModelOutput(List<ModelOutputRespVO> importExcelList, boolean isUpdateSupport, String operName);

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
    |        |--断面名称
    |           |--水深(m)
    |     |--计算典型断面水面宽(m)
    |        |--断面名称
    |           |--水面宽(m)
    |     |--计算水面与堤顶的距离(m)
    |        |--断面名称
    |           |--堤顶的距离(m)
     */
    public Map<String, Object>  waterSurfaceProfileAndQzhb(List<String> shuiMianXianPathList,List<String> QzhbPathList);

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
    Map<String, Map<String, List<String>>> waterSurfaceProfileAndQzhbMerge(Map<String, Object> stringObjectMap);

    JSONObject readNewQzhbFile();

    /**
     * 查询模型输出总数
     *
     * @return 模型输出总数
     */
    public int countModelOutput();

    /**
     * 查询上周新增的模型输出数量
     *
     * @return 上周新增的模型输出数量
     */
    public int countLastWeek();
}
