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

package tech.qiantong.qmodel.module.model.dal.mapper.operate;

import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.module.model.controller.admin.operate.vo.ModelOperatePageReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.operate.ModelOperateDO;
import tech.qiantong.qmodel.mybatis.core.mapper.BaseMapperX;
import tech.qiantong.qmodel.mybatis.core.query.LambdaQueryWrapperX;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 模型历史管理Mapper接口
 *
 * @author qModel
 * @date 2026-01-09
 */
public interface ModelOperateMapper extends BaseMapperX<ModelOperateDO> {

    default PageResult<ModelOperateDO> selectPage(ModelOperatePageReqVO reqVO) {
        // 定义排序的字段（防止 SQL 注入，与数据库字段名称一致）
        Set<String> allowedColumns = new HashSet<>(Arrays.asList("id", "create_time", "update_time"));

        // 构造动态查询条件
        return selectPage(reqVO, new LambdaQueryWrapperX<ModelOperateDO>()
                .eqIfPresent(ModelOperateDO::getCompanyId, reqVO.getCompanyId())
                .likeIfPresent(ModelOperateDO::getModuleName, reqVO.getModuleName())
                .eqIfPresent(ModelOperateDO::getType, reqVO.getType())
                .eqIfPresent(ModelOperateDO::getContent, reqVO.getContent())
                .eqIfPresent(ModelOperateDO::getMethod, reqVO.getMethod())
                .eqIfPresent(ModelOperateDO::getReqContent, reqVO.getReqContent())
                .eqIfPresent(ModelOperateDO::getRespContent, reqVO.getRespContent())
                .eqIfPresent(ModelOperateDO::getIp, reqVO.getIp())
                .eqIfPresent(ModelOperateDO::getAddress, reqVO.getAddress())
                .eqIfPresent(ModelOperateDO::getStatus, reqVO.getStatus())
                .eqIfPresent(ModelOperateDO::getCreateTime, reqVO.getCreateTime())
                // 如果 reqVO.getName() 不为空，则添加 name 的精确匹配条件（name = '<name>'）
                // .likeIfPresent(ModelOperateDO::getName, reqVO.getName())
                // 按照 createTime 字段降序排序
                .orderBy(reqVO.getOrderByColumn(), reqVO.getIsAsc(), allowedColumns));
    }

    public List<ModelOperateDO> selectModelOperateList(ModelOperateDO query);
}
