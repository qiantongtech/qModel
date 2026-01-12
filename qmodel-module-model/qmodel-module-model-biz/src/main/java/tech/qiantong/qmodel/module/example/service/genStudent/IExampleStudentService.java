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

package tech.qiantong.qmodel.module.example.service.genStudent;

import com.baomidou.mybatisplus.extension.service.IService;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.example.controller.admin.genStudent.vo.ExampleStudentPageReqVO;
import tech.qiantong.qmodel.module.example.controller.admin.genStudent.vo.ExampleStudentRespVO;
import tech.qiantong.qmodel.module.example.controller.admin.genStudent.vo.ExampleStudentSaveReqVO;
import tech.qiantong.qmodel.module.example.dal.dataobject.genStudent.ExampleStudentDO;

import java.util.Collection;
import java.util.List;
import java.util.Map;
/**
 * 学生Service接口
 *
 * @author anivia
 * @date 2025-02-18
 */
public interface IExampleStudentService extends IService<ExampleStudentDO> {

    /**
     * 获得学生分页列表
     *
     * @param pageReqVO 分页请求
     * @return 学生分页列表
     */
    PageResult<ExampleStudentDO> getExampleStudentPage(ExampleStudentPageReqVO pageReqVO);

    /**
     * 创建学生
     *
     * @param createReqVO 学生信息
     * @return 学生编号
     */
    Long createExampleStudent(ExampleStudentSaveReqVO createReqVO);

    /**
     * 更新学生
     *
     * @param updateReqVO 学生信息
     */
    int updateExampleStudent(ExampleStudentSaveReqVO updateReqVO);

    /**
     * 删除学生
     *
     * @param idList 学生编号
     */
    int removeExampleStudent(Collection<Long> idList);

    /**
     * 获得学生详情
     *
     * @param id 学生编号
     * @return 学生
     */
    ExampleStudentDO getExampleStudentById(Long id);

    /**
     * 获得全部学生列表
     *
     * @return 学生列表
     */
    List<ExampleStudentDO> getExampleStudentList();

    /**
     * 获得全部学生 Map
     *
     * @return 学生 Map
     */
    Map<Long, ExampleStudentDO> getExampleStudentMap();


    /**
     * 导入学生数据
     *
     * @param importExcelList 学生数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    String importExampleStudent(List<ExampleStudentRespVO> importExcelList, boolean isUpdateSupport, String operName);

}
