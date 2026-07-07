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

package tech.qiantong.qmodel.module.model.service.model.impl;

import java.util.Collection;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import javax.annotation.Resource;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.common.utils.StringUtils;
import tech.qiantong.qmodel.common.exception.ServiceException;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.model.ModelDO;
import tech.qiantong.qmodel.module.model.dal.mapper.model.ModelMapper;
import tech.qiantong.qmodel.module.model.service.model.IModelService;
/**
 * 模型基础信息Service业务层处理
 *
 * @author anivia
 * @date 2026-07-07
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class ModelServiceImpl  extends ServiceImpl<ModelMapper,ModelDO> implements IModelService {
    @Resource
    private ModelMapper modelMapper;

    @Override
    public PageResult<ModelDO> getModelPage(ModelPageReqVO pageReqVO) {
        return modelMapper.selectPage(pageReqVO);
    }

    @Override
    public Long createModel(ModelSaveReqVO createReqVO) {
        ModelDO dictType = BeanUtils.toBean(createReqVO, ModelDO.class);
        modelMapper.insert(dictType);
        return dictType.getId();
    }

    @Override
    public int updateModel(ModelSaveReqVO updateReqVO) {
        // 相关校验

        // 更新模型基础信息
        ModelDO updateObj = BeanUtils.toBean(updateReqVO, ModelDO.class);
        return modelMapper.updateById(updateObj);
    }
    @Override
    public int removeModel(Collection<Long> idList) {
        // 批量删除模型基础信息
        return modelMapper.deleteBatchIds(idList);
    }

    @Override
    public ModelDO getModelById(Long id) {
        return modelMapper.selectById(id);
    }

    @Override
    public List<ModelDO> getModelList() {
        return modelMapper.selectList();
    }

    @Override
    public Map<Long, ModelDO> getModelMap() {
        List<ModelDO> modelList = modelMapper.selectList();
        return modelList.stream()
                .collect(Collectors.toMap(
                        ModelDO::getId,
                        modelDO -> modelDO,
                        // 保留已存在的值
                        (existing, replacement) -> existing
                ));
    }


    /**
     * 导入模型基础信息数据
     *
     * @param importExcelList 模型基础信息数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    @Override
    public String importModel(List<ModelRespVO> importExcelList, boolean isUpdateSupport, String operName) {
        if (StringUtils.isNull(importExcelList) || importExcelList.size() == 0) {
            throw new ServiceException("导入数据不能为空！");
        }

        int successNum = 0;
        int failureNum = 0;
        List<String> successMessages = new ArrayList<>();
        List<String> failureMessages = new ArrayList<>();

        for (ModelRespVO respVO : importExcelList) {
            try {
                ModelDO modelDO = BeanUtils.toBean(respVO, ModelDO.class);
                Long modelId = respVO.getId();
                if (isUpdateSupport) {
                    if (modelId != null) {
                        ModelDO existingModel = modelMapper.selectById(modelId);
                        if (existingModel != null) {
                            modelMapper.updateById(modelDO);
                            successNum++;
                            successMessages.add("数据更新成功，ID为 " + modelId + " 的模型基础信息记录。");
                        } else {
                            failureNum++;
                            failureMessages.add("数据更新失败，ID为 " + modelId + " 的模型基础信息记录不存在。");
                        }
                    } else {
                        failureNum++;
                        failureMessages.add("数据更新失败，某条记录的ID不存在。");
                    }
                } else {
                    QueryWrapper<ModelDO> queryWrapper = new QueryWrapper<>();
                    queryWrapper.eq("id", modelId);
                    ModelDO existingModel = modelMapper.selectOne(queryWrapper);
                    if (existingModel == null) {
                        modelMapper.insert(modelDO);
                        successNum++;
                        successMessages.add("数据插入成功，ID为 " + modelId + " 的模型基础信息记录。");
                    } else {
                        failureNum++;
                        failureMessages.add("数据插入失败，ID为 " + modelId + " 的模型基础信息记录已存在。");
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
