/*
 * Copyright © 2026-present Jiangsu Qiantong Technology Co., Ltd.
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

package tech.qiantong.qmodel.module.model.service.modelData.impl;

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
import tech.qiantong.qmodel.module.model.controller.admin.modelData.vo.ModelDataApiPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelData.vo.ModelDataApiRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelData.vo.ModelDataApiSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.modelData.ModelDataApiDO;
import tech.qiantong.qmodel.module.model.dal.mapper.modelData.ModelDataApiMapper;
import tech.qiantong.qmodel.module.model.service.modelData.IModelDataApiService;
/**
 * 模型数据API接入Service业务层处理
 *
 * @author qModel
 * @date 2026-08-19
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class ModelDataApiServiceImpl  extends ServiceImpl<ModelDataApiMapper,ModelDataApiDO> implements IModelDataApiService {
    @Resource
    private ModelDataApiMapper modelDataApiMapper;

    @Override
    public PageResult<ModelDataApiDO> getModelDataApiPage(ModelDataApiPageReqVO pageReqVO) {
        return modelDataApiMapper.selectPage(pageReqVO);
    }

    @Override
    public Long createModelDataApi(ModelDataApiSaveReqVO createReqVO) {
        ModelDataApiDO dictType = BeanUtils.toBean(createReqVO, ModelDataApiDO.class);
        modelDataApiMapper.insert(dictType);
        return dictType.getId();
    }

    @Override
    public int updateModelDataApi(ModelDataApiSaveReqVO updateReqVO) {
        // 相关校验

        // 更新模型数据API接入
        ModelDataApiDO updateObj = BeanUtils.toBean(updateReqVO, ModelDataApiDO.class);
        return modelDataApiMapper.updateById(updateObj);
    }
    @Override
    public int removeModelDataApi(Collection<Long> idList) {
        // 批量删除模型数据API接入
        return modelDataApiMapper.deleteBatchIds(idList);
    }

    @Override
    public ModelDataApiDO getModelDataApiById(Long id) {
        return modelDataApiMapper.selectById(id);
    }

    @Override
    public List<ModelDataApiDO> getModelDataApiList() {
        return modelDataApiMapper.selectList();
    }

    @Override
    public Map<Long, ModelDataApiDO> getModelDataApiMap() {
        List<ModelDataApiDO> modelDataApiList = modelDataApiMapper.selectList().stream()
                .filter(api -> !Boolean.FALSE.equals(api.getValidFlag()))
                .filter(api -> !Boolean.TRUE.equals(api.getDelFlag()))
                .collect(Collectors.toList());
        return modelDataApiList.stream()
                .collect(Collectors.toMap(
                        ModelDataApiDO::getId,
                        modelDataApiDO -> modelDataApiDO,
                        // 保留已存在的值
                        (existing, replacement) -> existing
                ));
    }


        /**
         * 导入模型数据API接入数据
         *
         * @param importExcelList 模型数据API接入数据列表
         * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
         * @param operName 操作用户
         * @return 结果
         */
        @Override
        public String importModelDataApi(List<ModelDataApiRespVO> importExcelList, boolean isUpdateSupport, String operName) {
            if (StringUtils.isNull(importExcelList) || importExcelList.size() == 0) {
                throw new ServiceException("导入数据不能为空！");
            }

            int successNum = 0;
            int failureNum = 0;
            List<String> successMessages = new ArrayList<>();
            List<String> failureMessages = new ArrayList<>();

            for (ModelDataApiRespVO respVO : importExcelList) {
                try {
                    ModelDataApiDO modelDataApiDO = BeanUtils.toBean(respVO, ModelDataApiDO.class);
                    Long modelDataApiId = respVO.getId();
                    if (isUpdateSupport) {
                        if (modelDataApiId != null) {
                            ModelDataApiDO existingModelDataApi = modelDataApiMapper.selectById(modelDataApiId);
                            if (existingModelDataApi != null) {
                                modelDataApiMapper.updateById(modelDataApiDO);
                                successNum++;
                                successMessages.add("数据更新成功，ID为 " + modelDataApiId + " 的模型数据API接入记录。");
                            } else {
                                failureNum++;
                                failureMessages.add("数据更新失败，ID为 " + modelDataApiId + " 的模型数据API接入记录不存在。");
                            }
                        } else {
                            failureNum++;
                            failureMessages.add("数据更新失败，某条记录的ID不存在。");
                        }
                    } else {
                        QueryWrapper<ModelDataApiDO> queryWrapper = new QueryWrapper<>();
                        queryWrapper.eq("id", modelDataApiId);
                        ModelDataApiDO existingModelDataApi = modelDataApiMapper.selectOne(queryWrapper);
                        if (existingModelDataApi == null) {
                            modelDataApiMapper.insert(modelDataApiDO);
                            successNum++;
                            successMessages.add("数据插入成功，ID为 " + modelDataApiId + " 的模型数据API接入记录。");
                        } else {
                            failureNum++;
                            failureMessages.add("数据插入失败，ID为 " + modelDataApiId + " 的模型数据API接入记录已存在。");
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
