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

package tech.qiantong.qmodel.module.example.service.genStudent.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.exception.ServiceException;
import tech.qiantong.qmodel.common.utils.StringUtils;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.module.example.controller.admin.genStudent.vo.ExampleStudentPageReqVO;
import tech.qiantong.qmodel.module.example.controller.admin.genStudent.vo.ExampleStudentRespVO;
import tech.qiantong.qmodel.module.example.controller.admin.genStudent.vo.ExampleStudentSaveReqVO;
import tech.qiantong.qmodel.module.example.dal.dataobject.genStudent.ExampleStudentDO;
import tech.qiantong.qmodel.module.example.dal.mapper.genStudent.ExampleStudentMapper;
import tech.qiantong.qmodel.module.example.service.genStudent.IExampleStudentService;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
/**
 * 学生Service业务层处理
 *
 * @author anivia
 * @date 2025-02-18
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class ExampleStudentServiceImpl  extends ServiceImpl<ExampleStudentMapper,ExampleStudentDO> implements IExampleStudentService {
    @Resource
    private ExampleStudentMapper exampleStudentMapper;

    @Override
    public PageResult<ExampleStudentDO> getExampleStudentPage(ExampleStudentPageReqVO pageReqVO) {
        return exampleStudentMapper.selectPage(pageReqVO);
    }

    @Override
    public Long createExampleStudent(ExampleStudentSaveReqVO createReqVO) {
        ExampleStudentDO dictType = BeanUtils.toBean(createReqVO, ExampleStudentDO.class);
        exampleStudentMapper.insert(dictType);
        return dictType.getId();
    }

    @Override
    public int updateExampleStudent(ExampleStudentSaveReqVO updateReqVO) {
        // 相关校验

        // 更新学生
        ExampleStudentDO updateObj = BeanUtils.toBean(updateReqVO, ExampleStudentDO.class);
        return exampleStudentMapper.updateById(updateObj);
    }
    @Override
    public int removeExampleStudent(Collection<Long> idList) {
        // 批量删除学生
        return exampleStudentMapper.deleteBatchIds(idList);
    }

    @Override
    public ExampleStudentDO getExampleStudentById(Long id) {
        return exampleStudentMapper.selectById(id);
    }

    @Override
    public List<ExampleStudentDO> getExampleStudentList() {
        return exampleStudentMapper.selectList();
    }

    @Override
    public Map<Long, ExampleStudentDO> getExampleStudentMap() {
        List<ExampleStudentDO> exampleStudentList = exampleStudentMapper.selectList();
        return exampleStudentList.stream()
                .collect(Collectors.toMap(
                        ExampleStudentDO::getId,
                        exampleStudentDO -> exampleStudentDO,
                        // 保留已存在的值
                        (existing, replacement) -> existing
                ));
    }


        /**
         * 导入学生数据
         *
         * @param importExcelList 学生数据列表
         * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
         * @param operName 操作用户
         * @return 结果
         */
        @Override
        public String importExampleStudent(List<ExampleStudentRespVO> importExcelList, boolean isUpdateSupport, String operName) {
            if (StringUtils.isNull(importExcelList) || importExcelList.size() == 0) {
                throw new ServiceException("导入数据不能为空！");
            }

            int successNum = 0;
            int failureNum = 0;
            List<String> successMessages = new ArrayList<>();
            List<String> failureMessages = new ArrayList<>();

            for (ExampleStudentRespVO respVO : importExcelList) {
                try {
                    ExampleStudentDO exampleStudentDO = BeanUtils.toBean(respVO, ExampleStudentDO.class);
                    Long exampleStudentId = respVO.getId();
                    if (isUpdateSupport) {
                        if (exampleStudentId != null) {
                            ExampleStudentDO existingExampleStudent = exampleStudentMapper.selectById(exampleStudentId);
                            if (existingExampleStudent != null) {
                                exampleStudentMapper.updateById(exampleStudentDO);
                                successNum++;
                                successMessages.add("数据更新成功，ID为 " + exampleStudentId + " 的学生记录。");
                            } else {
                                failureNum++;
                                failureMessages.add("数据更新失败，ID为 " + exampleStudentId + " 的学生记录不存在。");
                            }
                        } else {
                            failureNum++;
                            failureMessages.add("数据更新失败，某条记录的ID不存在。");
                        }
                    } else {
                        QueryWrapper<ExampleStudentDO> queryWrapper = new QueryWrapper<>();
                        queryWrapper.eq("id", exampleStudentId);
                        ExampleStudentDO existingExampleStudent = exampleStudentMapper.selectOne(queryWrapper);
                        if (existingExampleStudent == null) {
                            exampleStudentMapper.insert(exampleStudentDO);
                            successNum++;
                            successMessages.add("数据插入成功，ID为 " + exampleStudentId + " 的学生记录。");
                        } else {
                            failureNum++;
                            failureMessages.add("数据插入失败，ID为 " + exampleStudentId + " 的学生记录已存在。");
                        }
                    }
                } catch (Exception e) {
                    failureNum++;
                    String errorMsg = "数据导入失败，错误信息：" + e.getMessage();
                    failureMessages.add(errorMsg);
                    log.error(errorMsg, e);
                }
            }
            StringBuilder resultMsg = new StringBuilder();
            if (failureNum > 0) {
                resultMsg.append("很抱歉，导入失败！共 ").append(failureNum).append(" 条数据格式不正确，错误如下：");
                resultMsg.append("<br/>").append(String.join("<br/>", failureMessages));
                throw new ServiceException(resultMsg.toString());
            } else {
                resultMsg.append("恭喜您，数据已全部导入成功！共 ").append(successNum).append(" 条。");
            }
            return resultMsg.toString();
        }
}
