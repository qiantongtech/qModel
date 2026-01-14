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

package tech.qiantong.qmodel.module.model.service.cacl.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.exception.ServiceException;
import tech.qiantong.qmodel.common.utils.DateUtils;
import tech.qiantong.qmodel.common.utils.StringUtils;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.module.model.controller.admin.cacl.vo.ModelCaclSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelCacl.vo.ModelCaclPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelCacl.vo.ModelCaclRespVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.cacl.ModelCaclDO;
import tech.qiantong.qmodel.module.model.dal.mapper.cacl.ModelCaclMapper;
import tech.qiantong.qmodel.module.model.service.cacl.IModelCaclService;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 模型计算重构Service业务层处理
 *
 * @author qModel
 * @date 2026-01-12
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class ModelCaclServiceImpl extends ServiceImpl<ModelCaclMapper, ModelCaclDO> implements IModelCaclService {
    @Resource
    private ModelCaclMapper modelCaclMapper;

    @Value("${modelUrl}")
    private String modelUrl;
    @Value("${modelUrl2}")
    private String modelUrl2;

    @Override
    public PageResult<ModelCaclDO> getModelCaclPage(ModelCaclPageReqVO pageReqVO) {
        return modelCaclMapper.selectPage(pageReqVO);
    }

    @Override
    public Long createModelCacl(ModelCaclSaveReqVO createReqVO) {
        ModelCaclDO dictType = BeanUtils.toBean(createReqVO, ModelCaclDO.class);
        modelCaclMapper.insert(dictType);
        return dictType.getId();
    }

    @Override
    public int updateModelCacl(ModelCaclSaveReqVO updateReqVO) {
        // 相关校验

        // 更新模型计算重构
        ModelCaclDO updateObj = BeanUtils.toBean(updateReqVO, ModelCaclDO.class);
        return modelCaclMapper.updateById(updateObj);
    }

    @Override
    public int removeModelCacl(Collection<Long> idList) {
        // 批量删除模型计算重构
        return modelCaclMapper.deleteBatchIds(idList);
    }

    @Override
    public ModelCaclDO getModelCaclById(Long id) {
        return modelCaclMapper.selectById(id);
    }

    @Override
    public List<ModelCaclDO> getModelCaclList() {
        return modelCaclMapper.selectList();
    }

    @Override
    public Map<Long, ModelCaclDO> getModelCaclMap() {
        List<ModelCaclDO> modelCaclList = modelCaclMapper.selectList();
        return modelCaclList.stream()
                .collect(Collectors.toMap(
                        ModelCaclDO::getId,
                        modelCaclDO -> modelCaclDO,
                        // 保留已存在的值
                        (existing, replacement) -> existing
                ));
    }


    /**
     * 导入模型计算重构数据
     *
     * @param importExcelList 模型计算重构数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName        操作用户
     * @return 结果
     */
    @Override
    public String importModelCacl(List<ModelCaclRespVO> importExcelList, boolean isUpdateSupport, String operName) {
        if (StringUtils.isNull(importExcelList) || importExcelList.size() == 0) {
            throw new ServiceException("导入数据不能为空！");
        }

        int successNum = 0;
        int failureNum = 0;
        List<String> successMessages = new ArrayList<>();
        List<String> failureMessages = new ArrayList<>();

        for (ModelCaclRespVO respVO : importExcelList) {
            try {
                ModelCaclDO modelCaclDO = BeanUtils.toBean(respVO, ModelCaclDO.class);
                Long modelCaclId = respVO.getId();
                if (isUpdateSupport) {
                    if (modelCaclId != null) {
                        ModelCaclDO existingModelCacl = modelCaclMapper.selectById(modelCaclId);
                        if (existingModelCacl != null) {
                            modelCaclMapper.updateById(modelCaclDO);
                            successNum++;
                            successMessages.add("数据更新成功，ID为 " + modelCaclId + " 的模型计算重构记录。");
                        } else {
                            failureNum++;
                            failureMessages.add("数据更新失败，ID为 " + modelCaclId + " 的模型计算重构记录不存在。");
                        }
                    } else {
                        failureNum++;
                        failureMessages.add("数据更新失败，某条记录的ID不存在。");
                    }
                } else {
                    QueryWrapper<ModelCaclDO> queryWrapper = new QueryWrapper<>();
                    queryWrapper.eq("id", modelCaclId);
                    ModelCaclDO existingModelCacl = modelCaclMapper.selectOne(queryWrapper);
                    if (existingModelCacl == null) {
                        modelCaclMapper.insert(modelCaclDO);
                        successNum++;
                        successMessages.add("数据插入成功，ID为 " + modelCaclId + " 的模型计算重构记录。");
                    } else {
                        failureNum++;
                        failureMessages.add("数据插入失败，ID为 " + modelCaclId + " 的模型计算重构记录已存在。");
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

    @Override
    public int countModelCacl() {
        return Math.toIntExact(this.lambdaQuery()
                .eq(ModelCaclDO::getDelFlag, false)
                .count());
    }

    @Override
    public int countLastWeek() {
        return (int) this.lambdaQuery()
                .eq(ModelCaclDO::getDelFlag, false)
                .list().stream()
                .filter(output -> output.getCreateTime().after(DateUtils.getLastWeekStartTime()) && output.getCreateTime().before(DateUtils.getLastWeekEndTime())).count();
    }
}
