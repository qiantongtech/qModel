/*
 * Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
 *  *
 * This file is part of qModel Module Platform (Open Source Edition).
 *  *
 * qModel is licensed under Apache License 2.0 with additional qModel terms.
 * You may use qModel for commercial purposes, but you may not remove, hide,
 * modify, or replace the qModel logo, copyright notices, license notices,
 * or attribution information without a separate commercial license.
 *  *
 * White-label use, OEM distribution, rebranding, or presenting qModel as
 * another product requires separate commercial authorization from
 * Jiangsu Qiantong Technology Co., Ltd.
 *  *
 * Business License: `https://qmodel.tech/`
 * See the LICENSE file in the project root for full license information.
 */

package tech.qiantong.qmodel.module.model.dal.mapper.modelAudit;

import com.baomidou.mybatisplus.core.metadata.IPage;
import org.apache.ibatis.annotations.Param;
import tech.qiantong.qmodel.module.model.controller.admin.modelAudit.vo.ModelAuditPageReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.modelAudit.ModelAuditDO;
import tech.qiantong.qmodel.mybatis.core.mapper.BaseMapperX;

/**
 * 模型审批Mapper接口
 *
 * @author anivia
 * @date 2026-07-23
 */
public interface ModelAuditMapper extends BaseMapperX<ModelAuditDO> {

    /**
     * 模型审批分页
     *
     * @param page  分页数据
     * @param query 筛选条件
     * @return 分页数据
     */
    IPage<ModelAuditPageReqVO> selectPage(IPage<ModelAuditPageReqVO> page, @Param("query") ModelAuditPageReqVO query);
}
