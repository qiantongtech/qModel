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
