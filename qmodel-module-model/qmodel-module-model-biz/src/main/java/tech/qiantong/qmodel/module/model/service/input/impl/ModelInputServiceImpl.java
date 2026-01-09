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

package tech.qiantong.qmodel.module.model.service.input.impl;

import java.util.Collection;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import javax.annotation.Resource;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.utils.DateUtils;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.common.utils.StringUtils;
import tech.qiantong.qmodel.common.exception.ServiceException;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.qiantong.qmodel.module.model.controller.admin.input.vo.ModelInputPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.input.vo.ModelInputRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.input.vo.ModelInputSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.input.ModelInputDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.output.ModelOutputDO;
import tech.qiantong.qmodel.module.model.dal.mapper.input.ModelInputMapper;
import tech.qiantong.qmodel.module.model.service.input.IModelInputService;
import tech.qiantong.qmodel.module.modelReconstitution.domain.ModelInputReconstitution;

/**
 * 模型输入管理Service业务层处理
 *
 * @author qModel
 * @date 2026-01-09
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class ModelInputServiceImpl  extends ServiceImpl<ModelInputMapper,ModelInputDO> implements IModelInputService {
    @Resource
    private ModelInputMapper modelInputMapper;

    @Override
    public PageResult<ModelInputDO> getModelInputPage(ModelInputPageReqVO pageReqVO) {
        return modelInputMapper.selectPage(pageReqVO);
    }

    @Override
    public Long createModelInput(ModelInputSaveReqVO createReqVO) {
        ModelInputDO dictType = BeanUtils.toBean(createReqVO, ModelInputDO.class);
        modelInputMapper.insert(dictType);
        return dictType.getId();
    }

    @Override
    public int updateModelInput(ModelInputSaveReqVO updateReqVO) {
        // 相关校验

        // 更新模型输入管理
        ModelInputDO updateObj = BeanUtils.toBean(updateReqVO, ModelInputDO.class);
        return modelInputMapper.updateById(updateObj);
    }
    @Override
    public int removeModelInput(Collection<Long> idList) {
        // 批量删除模型输入管理
        return modelInputMapper.deleteBatchIds(idList);
    }

    @Override
    public ModelInputDO getModelInputById(Long id) {
        return modelInputMapper.selectById(id);
    }

    @Override
    public List<ModelInputDO> getModelInputList() {
        return modelInputMapper.selectList();
    }

    @Override
    public Map<Long, ModelInputDO> getModelInputMap() {
        List<ModelInputDO> modelInputList = modelInputMapper.selectList();
        return modelInputList.stream()
                .collect(Collectors.toMap(
                        ModelInputDO::getId,
                        modelInputDO -> modelInputDO,
                        // 保留已存在的值
                        (existing, replacement) -> existing
                ));
    }


        /**
         * 导入模型输入管理数据
         *
         * @param importExcelList 模型输入管理数据列表
         * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
         * @param operName 操作用户
         * @return 结果
         */
        @Override
        public String importModelInput(List<ModelInputRespVO> importExcelList, boolean isUpdateSupport, String operName) {
            if (StringUtils.isNull(importExcelList) || importExcelList.size() == 0) {
                throw new ServiceException("导入数据不能为空！");
            }

            int successNum = 0;
            int failureNum = 0;
            List<String> successMessages = new ArrayList<>();
            List<String> failureMessages = new ArrayList<>();

            for (ModelInputRespVO respVO : importExcelList) {
                try {
                    ModelInputDO modelInputDO = BeanUtils.toBean(respVO, ModelInputDO.class);
                    Long modelInputId = respVO.getId();
                    if (isUpdateSupport) {
                        if (modelInputId != null) {
                            ModelInputDO existingModelInput = modelInputMapper.selectById(modelInputId);
                            if (existingModelInput != null) {
                                modelInputMapper.updateById(modelInputDO);
                                successNum++;
                                successMessages.add("数据更新成功，ID为 " + modelInputId + " 的模型输入管理记录。");
                            } else {
                                failureNum++;
                                failureMessages.add("数据更新失败，ID为 " + modelInputId + " 的模型输入管理记录不存在。");
                            }
                        } else {
                            failureNum++;
                            failureMessages.add("数据更新失败，某条记录的ID不存在。");
                        }
                    } else {
                        QueryWrapper<ModelInputDO> queryWrapper = new QueryWrapper<>();
                        queryWrapper.eq("id", modelInputId);
                        ModelInputDO existingModelInput = modelInputMapper.selectOne(queryWrapper);
                        if (existingModelInput == null) {
                            modelInputMapper.insert(modelInputDO);
                            successNum++;
                            successMessages.add("数据插入成功，ID为 " + modelInputId + " 的模型输入管理记录。");
                        } else {
                            failureNum++;
                            failureMessages.add("数据插入失败，ID为 " + modelInputId + " 的模型输入管理记录已存在。");
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

    /**
     * 查询模型输入总数
     *
     * @return 模型输入总数
     */
    @Override
    public int countModelInput() {

        return Math.toIntExact(this.lambdaQuery()
                .eq(ModelInputDO::getDelFlag, false)
                .count());
    }

    /**
     * 查询上周新增的模型输入数量
     *
     * @return 上周新增的模型输入数量
     */
    @Override
    public int countLastWeek() {
        return Math.toIntExact(this.lambdaQuery()
                .eq(ModelInputDO::getDelFlag, false)
                .list().stream()
                .filter(input -> input.getCreateTime().after(DateUtils.getLastWeekStartTime())
                        && input.getCreateTime().before(DateUtils.getLastWeekEndTime())).count());
    }

    @Override
    public List<ModelInputDO> selectModelInputList(ModelInputDO query) {
        return modelInputMapper.selectModelInputList(query);
    }
}
