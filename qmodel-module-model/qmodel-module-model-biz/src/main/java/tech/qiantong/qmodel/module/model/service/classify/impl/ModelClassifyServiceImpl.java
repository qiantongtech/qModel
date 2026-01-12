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

package tech.qiantong.qmodel.module.model.service.classify.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.exception.ServiceException;
import tech.qiantong.qmodel.common.utils.DateUtils;
import tech.qiantong.qmodel.common.utils.StringUtils;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.module.model.controller.admin.classify.vo.ModelClassifyPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.classify.vo.ModelClassifyRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.classify.vo.ModelClassifySaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.classify.ModelClassifyDO;
import tech.qiantong.qmodel.module.model.dal.mapper.classify.ModelClassifyMapper;
import tech.qiantong.qmodel.module.model.service.classify.IModelClassifyService;
import tech.qiantong.qmodel.mybatis.core.query.LambdaQueryWrapperX;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 模型分类Service业务层处理
 *
 * @author qModel
 * @date 2026-01-07
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class ModelClassifyServiceImpl extends ServiceImpl<ModelClassifyMapper, ModelClassifyDO> implements IModelClassifyService {
    @Resource
    private ModelClassifyMapper modelClassifyMapper;

    @Override
    public PageResult<ModelClassifyDO> getModelClassifyPage(ModelClassifyPageReqVO pageReqVO) {
        return modelClassifyMapper.selectPage(pageReqVO);
    }

    /**
     * 获得全部模型分类
     *
     * @param reqVO 模型分类信息
     * @return 获得全部获得模型分类
     */
    @Override
    public List<ModelClassifyDO> getModelClassifyList(ModelClassifyPageReqVO reqVO) {
        LambdaQueryWrapperX<ModelClassifyDO> queryWrapperX = new LambdaQueryWrapperX<>();
        queryWrapperX.likeIfPresent(ModelClassifyDO::getName, reqVO.getName())
                .likeRightIfPresent(ModelClassifyDO::getAncestors, reqVO.getAncestors())
                .orderByAsc(ModelClassifyDO::getCreateTime);
        return modelClassifyMapper.selectList(queryWrapperX);
    }

    @Override
    public Long createModelClassify(ModelClassifySaveReqVO createReqVO) {
        ModelClassifyDO dictType = BeanUtils.toBean(createReqVO, ModelClassifyDO.class);

        ModelClassifyDO modelClassify = this.getModelClassifyById(createReqVO.getParentId());
        if (ObjectUtil.isNotNull(modelClassify)) {
            dictType.setAncestors(modelClassify.getAncestors() + "," + createReqVO.getParentId());
        } else {
            dictType.setAncestors(createReqVO.getParentId().toString());
        }
        modelClassifyMapper.insert(dictType);
        return dictType.getId();
    }

    @Override
    public int updateModelClassify(ModelClassifySaveReqVO updateReqVO) {
        // 相关校验
        ModelClassifyDO parentClassify = this.getModelClassifyById(updateReqVO.getParentId());
        ModelClassifyDO oldClassify = this.getModelClassifyById(updateReqVO.getId());

        if (StringUtils.isNotNull(parentClassify) && StringUtils.isNotNull(oldClassify)) {
            String newAncestors = parentClassify.getAncestors() + "," + parentClassify.getId();
            String oldAncestors = oldClassify.getAncestors();
            updateReqVO.setAncestors(newAncestors);
            updateModelClassifyChildren(updateReqVO.getId(), newAncestors, oldAncestors);
        }
        // 更新模型分类
        ModelClassifyDO updateObj = BeanUtils.toBean(updateReqVO, ModelClassifyDO.class);
        return modelClassifyMapper.updateById(updateObj);
    }

    /**
     * 修改子元素关系
     *
     * @param classifyId   被修改的分类ID
     * @param newAncestors 新的父ID集合
     * @param oldAncestors 旧的父ID集合
     */
    public void updateModelClassifyChildren(Long classifyId, String newAncestors, String oldAncestors) {
        List<ModelClassifyDO> children = modelClassifyMapper.selectChildrenClassifyById(classifyId);
        for (ModelClassifyDO child : children) {
            child.setAncestors(child.getAncestors().replaceFirst(oldAncestors, newAncestors));
        }
        if (children.size() > 0) {
            this.updateBatchById(children);
        }
    }

    @Override
    public int removeModelClassify(Collection<Long> idList) {
        // 批量删除模型分类
        return modelClassifyMapper.deleteBatchIds(idList);
    }

    @Override
    public ModelClassifyDO getModelClassifyById(Long id) {
        return modelClassifyMapper.selectById(id);
    }

    @Override
    public List<ModelClassifyDO> getModelClassifyList() {
        return modelClassifyMapper.selectList();
    }

    @Override
    public Map<Long, ModelClassifyDO> getModelClassifyMap() {
        List<ModelClassifyDO> modelClassifyList = modelClassifyMapper.selectList();
        return modelClassifyList.stream()
                .collect(Collectors.toMap(
                        ModelClassifyDO::getId,
                        modelClassifyDO -> modelClassifyDO,
                        // 保留已存在的值
                        (existing, replacement) -> existing
                ));
    }


    /**
     * 导入模型分类数据
     *
     * @param importExcelList 模型分类数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName        操作用户
     * @return 结果
     */
    @Override
    public String importModelClassify(List<ModelClassifyRespVO> importExcelList, boolean isUpdateSupport, String operName) {
        if (StringUtils.isNull(importExcelList) || importExcelList.size() == 0) {
            throw new ServiceException("导入数据不能为空！");
        }

        int successNum = 0;
        int failureNum = 0;
        List<String> successMessages = new ArrayList<>();
        List<String> failureMessages = new ArrayList<>();

        for (ModelClassifyRespVO respVO : importExcelList) {
            try {
                ModelClassifyDO modelClassifyDO = BeanUtils.toBean(respVO, ModelClassifyDO.class);
                Long modelClassifyId = respVO.getId();
                if (isUpdateSupport) {
                    if (modelClassifyId != null) {
                        ModelClassifyDO existingModelClassify = modelClassifyMapper.selectById(modelClassifyId);
                        if (existingModelClassify != null) {
                            modelClassifyMapper.updateById(modelClassifyDO);
                            successNum++;
                            successMessages.add("数据更新成功，ID为 " + modelClassifyId + " 的模型分类记录。");
                        } else {
                            failureNum++;
                            failureMessages.add("数据更新失败，ID为 " + modelClassifyId + " 的模型分类记录不存在。");
                        }
                    } else {
                        failureNum++;
                        failureMessages.add("数据更新失败，某条记录的ID不存在。");
                    }
                } else {
                    QueryWrapper<ModelClassifyDO> queryWrapper = new QueryWrapper<>();
                    queryWrapper.eq("id", modelClassifyId);
                    ModelClassifyDO existingModelClassify = modelClassifyMapper.selectOne(queryWrapper);
                    if (existingModelClassify == null) {
                        modelClassifyMapper.insert(modelClassifyDO);
                        successNum++;
                        successMessages.add("数据插入成功，ID为 " + modelClassifyId + " 的模型分类记录。");
                    } else {
                        failureNum++;
                        failureMessages.add("数据插入失败，ID为 " + modelClassifyId + " 的模型分类记录已存在。");
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
     * 获取模型分类ID列表
     *
     * @param id 模型分类ID
     * @return 模型分类ID列表
     */
    @Override
    public List<Long> getModelClassifyIds(Long id) {
        ArrayList<Long> classifyIds = new ArrayList<>();
        ModelClassifyDO classify = this.getModelClassifyById(id);
        if (classify != null ) {
            classifyIds.add(classify.getId());
            ModelClassifyPageReqVO modelClassify = new ModelClassifyPageReqVO();
            modelClassify.setParentId(classify.getId());
            List<ModelClassifyDO> modelClassifyList = modelClassifyMapper.selectChildrenClassifyById(classify.getId());
            if (CollUtil.isNotEmpty(modelClassifyList)) {
                modelClassifyList.forEach(item -> classifyIds.add(item.getId()));
            }
        }
        return classifyIds;
    }

    /**
     * 查询模型分类总数
     *
     * @return 模型分类总数
     */
    @Override
    public int countModelClassify() {
        return Math.toIntExact(this.lambdaQuery()
                .eq(ModelClassifyDO::getDelFlag, false)
                .count());
    }

    /**
     * 查询上周新增的模型分类数量
     *
     * @return 上周新增的模型分类数量
     */
    @Override
    public int countLastWeek() {
        LambdaQueryWrapper<ModelClassifyDO> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.gt(ModelClassifyDO::getCreateTime, DateUtils.getLastWeekStartTime());
        queryWrapper.lt(ModelClassifyDO::getCreateTime, DateUtils.getLastWeekEndTime());
        queryWrapper.eq(ModelClassifyDO::getDelFlag, false);
        return modelClassifyMapper.selectList(queryWrapper).size();
    }
}
