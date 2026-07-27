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

package tech.qiantong.qmodel.module.example.service.gen;

import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.example.controller.admin.gen.vo.ExampleDeptPageReqVO;
import tech.qiantong.qmodel.module.example.controller.admin.gen.vo.ExampleDeptSaveReqVO;
import tech.qiantong.qmodel.module.example.dal.dataobject.gen.ExampleDeptDO;

import java.util.List;
import java.util.Map;
/**
 * 示例部门Service接口
 *
 * @author anivia
 * @date 2024-12-09
 */
public interface IExampleDeptService extends IService<ExampleDeptDO> {

    /**
     * 获得示例部门分页列表
     *
     * @param pageReqVO 分页请求
     * @return 示例部门分页列表
     */
    PageResult<ExampleDeptDO> getExampleDeptPage(ExampleDeptPageReqVO pageReqVO);

    /**
     * 创建示例部门
     *
     * @param createReqVO 示例部门信息
     * @return 示例部门编号
     */
    Long createExampleDept(ExampleDeptSaveReqVO createReqVO);

    /**
     * 更新示例部门
     *
     * @param updateReqVO 示例部门信息
     */
    int updateExampleDept(ExampleDeptSaveReqVO updateReqVO);

    /**
     * 删除示例部门
     *
     * @param id 示例部门编号
     */
    int removeExampleDept(Long id);

    /**
     * 获得示例部门详情
     *
     * @param id 示例部门编号
     * @return 示例部门
     */
    ExampleDeptDO getExampleDeptById(Long id);

    /**
     * 获得全部示例部门列表
     *
     * @return 示例部门列表
     */
    List<ExampleDeptDO> getExampleDeptList();

    /**
     * 获得全部示例部门 Map
     *
     * @return 示例部门 Map
     */
    Map<Long, ExampleDeptDO> getExampleDeptMap();

    /**
     * 是否存在示例部门子节点
     *
     * @param id 示例部门id
     * @return 结果 true 存在 false 不存在
     */
    boolean hasChildByExampleDeptId(Long id);


}
