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

package tech.qiantong.qmodel.module.example.service.gen.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.module.example.controller.admin.gen.vo.ExampleDeptPageReqVO;
import tech.qiantong.qmodel.module.example.controller.admin.gen.vo.ExampleDeptSaveReqVO;
import tech.qiantong.qmodel.module.example.dal.dataobject.gen.ExampleDeptDO;
import tech.qiantong.qmodel.module.example.dal.mapper.gen.ExampleDeptMapper;
import tech.qiantong.qmodel.module.example.service.gen.IExampleDeptService;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
/**
 * 示例部门Service业务层处理
 *
 * @author anivia
 * @date 2024-12-09
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class ExampleDeptServiceImpl  extends ServiceImpl<ExampleDeptMapper,ExampleDeptDO> implements IExampleDeptService {
    @Resource
    private ExampleDeptMapper exampleDeptMapper;

    @Override
    public PageResult<ExampleDeptDO> getExampleDeptPage(ExampleDeptPageReqVO pageReqVO) {
        return exampleDeptMapper.selectPage(pageReqVO);
    }

    @Override
    public Long createExampleDept(ExampleDeptSaveReqVO createReqVO) {
        ExampleDeptDO dictType = BeanUtils.toBean(createReqVO, ExampleDeptDO.class);
        exampleDeptMapper.insert(dictType);
        return dictType.getId();
    }

    @Override
    public int updateExampleDept(ExampleDeptSaveReqVO updateReqVO) {
        // 相关校验

        // 更新示例部门
        ExampleDeptDO updateObj = BeanUtils.toBean(updateReqVO, ExampleDeptDO.class);
        return exampleDeptMapper.updateById(updateObj);
    }
    @Override
    public int removeExampleDept(Long id) {
        // 单独删除示例部门
        return exampleDeptMapper.deleteById(id);
    }

    @Override
    public ExampleDeptDO getExampleDeptById(Long id) {
        return exampleDeptMapper.selectById(id);
    }

    @Override
    public List<ExampleDeptDO> getExampleDeptList() {
        return exampleDeptMapper.selectList();
    }

    @Override
    public Map<Long, ExampleDeptDO> getExampleDeptMap() {
        List<ExampleDeptDO> exampleDeptList = exampleDeptMapper.selectList();
        return exampleDeptList.stream()
                .collect(Collectors.toMap(
                        ExampleDeptDO::getId,
                        exampleDeptDO -> exampleDeptDO,
                        // 保留已存在的值
                        (existing, replacement) -> existing
                ));
    }

    @Override
    public boolean hasChildByExampleDeptId(Long id) {
        return exampleDeptMapper.selectCount(ExampleDeptDO::getParentId, id) > 0;
    }


}
