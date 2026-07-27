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

package tech.qiantong.qmodel.module.model.service.interfaceAddress.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.exception.ServiceException;
import tech.qiantong.qmodel.common.utils.StringUtils;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.vo.ModelInterfaceAddressPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.vo.ModelInterfaceAddressRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.interfaceAddress.vo.ModelInterfaceAddressSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.interfaceAddress.ModelInterfaceAddressDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.version.ModelVersionDO;
import tech.qiantong.qmodel.module.model.dal.mapper.interfaceAddress.ModelInterfaceAddressMapper;
import tech.qiantong.qmodel.module.model.service.interfaceAddress.IModelInterfaceAddressService;
import tech.qiantong.qmodel.module.model.service.version.IModelVersionService;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
/**
 * 接口地址Service业务层处理
 *
 * @author qModel
 * @date 2026-01-09
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class ModelInterfaceAddressServiceImpl  extends ServiceImpl<ModelInterfaceAddressMapper,ModelInterfaceAddressDO> implements IModelInterfaceAddressService {
    @Resource
    private ModelInterfaceAddressMapper modelInterfaceAddressMapper;

    @Resource
    private IModelVersionService modelVersionService;

    @Override
    public PageResult<ModelInterfaceAddressDO> getModelInterfaceAddressPage(ModelInterfaceAddressPageReqVO pageReqVO) {
        return modelInterfaceAddressMapper.selectPage(pageReqVO);
    }

    @Override
    public PageResult<ModelInterfaceAddressRespVO> getModelInterfaceAddressPageWithVersion(ModelInterfaceAddressPageReqVO pageReqVO) {
        PageResult<ModelInterfaceAddressDO> page = modelInterfaceAddressMapper.selectPage(pageReqVO);
        List<ModelInterfaceAddressDO> list = page.getList();

        ModelVersionDO modelVersionReconstitution = new ModelVersionDO();
        List<Long> ids = new ArrayList<>();
        for (ModelInterfaceAddressDO interfaceAddress : list) {
            ids.add(interfaceAddress.getVersionId());
        }
        Map<String, Object> params = new HashMap<>();
        params.put("ids", ids);
        modelVersionReconstitution.setParams(params);
        List<ModelVersionDO> modelVersionReconstitutions = modelVersionService.selectModelVersionList(modelVersionReconstitution);
        for (ModelInterfaceAddressDO interfaceAddress : list) {
            for (ModelVersionDO versionReconstitution : modelVersionReconstitutions) {
                if (interfaceAddress.getVersionId().equals(versionReconstitution.getId())) {
                    interfaceAddress.setVersion(versionReconstitution.getVersion());
                    interfaceAddress.setDescription(versionReconstitution.getDescription());
                }
            }
        }

        return BeanUtils.toBean(page, ModelInterfaceAddressRespVO.class);
    }

    @Override
    public Long createModelInterfaceAddress(ModelInterfaceAddressSaveReqVO createReqVO) {
        ModelInterfaceAddressDO dictType = BeanUtils.toBean(createReqVO, ModelInterfaceAddressDO.class);
        modelInterfaceAddressMapper.insert(dictType);
        return dictType.getId();
    }

    @Override
    public int updateModelInterfaceAddress(ModelInterfaceAddressSaveReqVO updateReqVO) {
        // 相关校验

        // 更新接口地址
        ModelInterfaceAddressDO updateObj = BeanUtils.toBean(updateReqVO, ModelInterfaceAddressDO.class);
        return modelInterfaceAddressMapper.updateById(updateObj);
    }
    @Override
    public int removeModelInterfaceAddress(Collection<Long> idList) {
        // 批量删除接口地址
        return modelInterfaceAddressMapper.deleteBatchIds(idList);
    }

    @Override
    public ModelInterfaceAddressDO getModelInterfaceAddressById(Long id) {
        return modelInterfaceAddressMapper.selectById(id);
    }

    @Override
    public List<ModelInterfaceAddressDO> getModelInterfaceAddressList() {
        return modelInterfaceAddressMapper.selectList();
    }

    @Override
    public Map<Long, ModelInterfaceAddressDO> getModelInterfaceAddressMap() {
        List<ModelInterfaceAddressDO> modelInterfaceAddressList = modelInterfaceAddressMapper.selectList();
        return modelInterfaceAddressList.stream()
                .collect(Collectors.toMap(
                        ModelInterfaceAddressDO::getId,
                        modelInterfaceAddressDO -> modelInterfaceAddressDO,
                        // 保留已存在的值
                        (existing, replacement) -> existing
                ));
    }


        /**
         * 导入接口地址数据
         *
         * @param importExcelList 接口地址数据列表
         * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
         * @param operName 操作用户
         * @return 结果
         */
        @Override
        public String importModelInterfaceAddress(List<ModelInterfaceAddressRespVO> importExcelList, boolean isUpdateSupport, String operName) {
            if (StringUtils.isNull(importExcelList) || importExcelList.size() == 0) {
                throw new ServiceException("导入数据不能为空！");
            }

            int successNum = 0;
            int failureNum = 0;
            List<String> successMessages = new ArrayList<>();
            List<String> failureMessages = new ArrayList<>();

            for (ModelInterfaceAddressRespVO respVO : importExcelList) {
                try {
                    ModelInterfaceAddressDO modelInterfaceAddressDO = BeanUtils.toBean(respVO, ModelInterfaceAddressDO.class);
                    Long modelInterfaceAddressId = respVO.getId();
                    if (isUpdateSupport) {
                        if (modelInterfaceAddressId != null) {
                            ModelInterfaceAddressDO existingModelInterfaceAddress = modelInterfaceAddressMapper.selectById(modelInterfaceAddressId);
                            if (existingModelInterfaceAddress != null) {
                                modelInterfaceAddressMapper.updateById(modelInterfaceAddressDO);
                                successNum++;
                                successMessages.add("数据更新成功，ID为 " + modelInterfaceAddressId + " 的接口地址记录。");
                            } else {
                                failureNum++;
                                failureMessages.add("数据更新失败，ID为 " + modelInterfaceAddressId + " 的接口地址记录不存在。");
                            }
                        } else {
                            failureNum++;
                            failureMessages.add("数据更新失败，某条记录的ID不存在。");
                        }
                    } else {
                        QueryWrapper<ModelInterfaceAddressDO> queryWrapper = new QueryWrapper<>();
                        queryWrapper.eq("id", modelInterfaceAddressId);
                        ModelInterfaceAddressDO existingModelInterfaceAddress = modelInterfaceAddressMapper.selectOne(queryWrapper);
                        if (existingModelInterfaceAddress == null) {
                            modelInterfaceAddressMapper.insert(modelInterfaceAddressDO);
                            successNum++;
                            successMessages.add("数据插入成功，ID为 " + modelInterfaceAddressId + " 的接口地址记录。");
                        } else {
                            failureNum++;
                            failureMessages.add("数据插入失败，ID为 " + modelInterfaceAddressId + " 的接口地址记录已存在。");
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
