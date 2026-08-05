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

package tech.qiantong.qmodel.module.model.service.model.impl;

import java.util.*;
import java.util.stream.Collectors;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import javax.annotation.Resource;

import tech.qiantong.qmodel.common.core.domain.model.LoginUser;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.common.utils.StringUtils;
import tech.qiantong.qmodel.common.exception.ServiceException;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.qiantong.qmodel.module.model.controller.admin.config.vo.ModelConfigSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelSaveWithConfigReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.classify.ModelClassifyDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.config.ModelConfigDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.fileResource.ModelFileResourceDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.model.ModelDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.modelAudit.ModelAuditDO;
import tech.qiantong.qmodel.module.model.dal.mapper.config.ModelConfigMapper;
import tech.qiantong.qmodel.module.model.dal.mapper.model.ModelMapper;
import tech.qiantong.qmodel.module.model.dal.mapper.modelAudit.ModelAuditMapper;
import tech.qiantong.qmodel.module.model.enums.ModelAuditStatusEnum;
import tech.qiantong.qmodel.module.model.enums.ModelStatusEnum;
import tech.qiantong.qmodel.module.model.service.classify.IModelClassifyService;
import tech.qiantong.qmodel.module.model.service.config.IModelConfigService;
import tech.qiantong.qmodel.module.model.service.model.IModelService;
import tech.qiantong.qmodel.module.model.service.fileResource.IModelFileResourceService;
import tech.qiantong.qmodel.module.model.enums.AccessTypeEnum;
import tech.qiantong.qmodel.module.model.service.modelAudit.IModelAuditService;

@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class ModelServiceImpl extends ServiceImpl<ModelMapper, ModelDO> implements IModelService {
    @Resource
    private ModelMapper modelMapper;
    @Resource
    private IModelFileResourceService modelFileResourceService;

    @Resource
    private IModelClassifyService modelClassifyService;

    @Resource
    private ModelConfigMapper modelConfigMapper;

    @Resource
    private IModelConfigService modelConfigService;
    @Resource
    private ModelAuditMapper modelAuditMapper;

    @Override
    public PageResult<ModelDO> getModelPage(ModelPageReqVO pageReqVO) {
        return modelMapper.selectPage(pageReqVO);
    }

    @Override
    public Long createModel(ModelSaveReqVO createReqVO) {



        ModelDO modelDO = BeanUtils.toBean(createReqVO, ModelDO.class);
        modelMapper.insert(modelDO);
        Long modelId = modelDO.getId();

        if (AccessTypeEnum.PYTHON.getType().equals(createReqVO.getAccessType())) {
            if (StringUtils.isEmpty(createReqVO.getFilePath())) {
                throw new ServiceException("Python类型模型必须上传文件");
            }
            modelFileResourceService.saveFileResourceFromModel(createReqVO, modelId);
        }

        return modelId;
    }

    @Override
    public int updateModel(ModelSaveReqVO updateReqVO) {


        ModelDO updateObj = BeanUtils.toBean(updateReqVO, ModelDO.class);
        modelMapper.updateById(updateObj);
        Long modelId = updateReqVO.getId();

        if (AccessTypeEnum.PYTHON.getType().equals(updateReqVO.getAccessType())) {
            modelFileResourceService.saveFileResourceFromModel(updateReqVO, modelId);
        }

        return 1;
    }

    @Override
    public int removeModel(Collection<Long> idList) {
        if (CollectionUtil.isEmpty(idList)) {
            return 0;
        }
        List<ModelDO> modelList = modelMapper.selectBatchIds(idList);
        for (ModelDO model : modelList) {
            if (AccessTypeEnum.PYTHON.getType().equals(model.getAccessType())) {
                ModelFileResourceDO fileResource = modelFileResourceService.getOne(
                        new QueryWrapper<ModelFileResourceDO>().eq("model_id", model.getId())
                );
                if (fileResource != null) {
                    modelFileResourceService.removeModelFileResource(Collections.singletonList(fileResource.getId()));
                }
            } else if (AccessTypeEnum.API.getType().equals(model.getAccessType())) {
                ModelConfigDO config = modelConfigMapper.selectOne(
                        new QueryWrapper<ModelConfigDO>().eq("model_id", model.getId())
                );
                if (config != null) {
                    modelConfigService.removeModelConfig(Collections.singletonList(config.getId()));
                }
            }
        }
        return modelMapper.deleteBatchIds(idList);
    }

    @Override
    public ModelRespVO getModelById(Long id) {
        ModelDO modelDO = modelMapper.selectById(id);
        if(ObjectUtil.isNotNull(modelDO)){
            if(AccessTypeEnum.PYTHON.getType().equals(modelDO.getAccessType())){
                ModelFileResourceDO one = modelFileResourceService.getOne(new QueryWrapper<ModelFileResourceDO>()
                        .eq("model_id",id));
                modelDO.setModelFileResourceRespVO(one);
            }
            if(modelDO.getClassifyId() != null){
                ModelClassifyDO classifyDO = modelClassifyService.getModelClassifyById(modelDO.getClassifyId());
                if(classifyDO != null){
                    modelDO.setClassifyName(classifyDO.getName());
                }
            }
        }

        ModelRespVO modelRespVO = BeanUtils.toBean(modelDO, ModelRespVO.class);
        modelRespVO.setModelConfig(modelConfigService.getByModelId(id));
        return modelRespVO;
    }

    /**
     * 获得模型基础信息详情
     *
     * @param modelCode 模型基础编码
     * @return 模型基础信息
     */
    @Override
    public ModelRespVO getModelByCode(String modelCode) {
        LambdaQueryWrapper<ModelDO> queryWrapper = Wrappers.lambdaQuery(ModelDO.class)
                .eq(ModelDO::getCode, modelCode);
        List<ModelDO> entityList = super.list(queryWrapper);
        if (CollUtil.isEmpty(entityList)){
            throw new ServiceException("模型不存在");
        }
        ModelDO modelDO = entityList.get(0);
        if(ObjectUtil.isNotNull(modelDO)){
            if(AccessTypeEnum.PYTHON.getType().equals(modelDO.getAccessType())){
                ModelFileResourceDO one = modelFileResourceService.getOne(new QueryWrapper<ModelFileResourceDO>()
                        .eq("model_id",modelDO.getId()));
                modelDO.setModelFileResourceRespVO(one);
            }
            if(modelDO.getClassifyId() != null){
                ModelClassifyDO classifyDO = modelClassifyService.getModelClassifyById(modelDO.getClassifyId());
                if(classifyDO != null){
                    modelDO.setClassifyName(classifyDO.getName());
                }
            }
        }

        ModelRespVO modelRespVO = BeanUtils.toBean(modelDO, ModelRespVO.class);
        modelRespVO.setModelConfig(modelConfigService.getByModelId(modelDO.getId()));
        return modelRespVO;
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
                        (existing, replacement) -> existing
                ));
    }

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

    @Override
    public void updateModelStatus(Long id, String status) {

        ModelDO updateObj = new ModelDO();
        updateObj.setId(id);
        updateObj.setStatus(status);
        modelMapper.updateById(updateObj);
    }

    /**
     * 发布模型
     *
     * @param id 模型基础信息编号
     * @param applyReason 申请原因
     * @param currentUser 当前用户
     * @return 是否成功
     */
    @Override
    public Boolean publishModel(Long id, String applyReason, LoginUser currentUser) {
        ModelAuditDO auditDO = new ModelAuditDO();
        auditDO.setModelId(id);
        auditDO.setApplyReason(applyReason);
        auditDO.setApplyTime(new Date());
        auditDO.setApplyId(currentUser.getUserId());
        auditDO.setAuditStatus(ModelAuditStatusEnum.WAITING.getStatus());
        modelAuditMapper.insert(auditDO);
        updateModelStatus(id, ModelStatusEnum.AUDITING.getStatus());
        return true;
    }

    @Override
    public Long saveModelWithConfig(ModelSaveWithConfigReqVO saveReqVO) {
        ModelSaveReqVO modelReq = saveReqVO.getModel();
        ModelConfigSaveReqVO configReq = saveReqVO.getConfig();

        if (Objects.equals(AccessTypeEnum.API.getType(), modelReq.getAccessType())){
            modelReq.setStatus(ModelStatusEnum.CUT_IN.getStatus());
        } else if (Objects.equals(AccessTypeEnum.PYTHON.getType(), modelReq.getAccessType())) {
            modelReq.setStatus(ModelStatusEnum.BUILDING.getStatus());
        }
        // 1. 保存模型基础信息
        Long modelId;
        if (modelReq.getId() != null) {
            updateModel(modelReq);
            modelId = modelReq.getId();
        } else {
            modelId = createModel(modelReq);
        }

        // 2. 处理模型配置详情
        if (configReq != null) {
            configReq.setModelId(modelId);
            configReq.setCompanyId(modelReq.getCompanyId());

            ModelConfigDO existingConfig = modelConfigMapper.selectOne(
                    new QueryWrapper<ModelConfigDO>()
                            .eq("model_id", modelId)
                            .eq("del_flag", 0)
            );

            if (existingConfig != null) {
                configReq.setId(existingConfig.getId());
                modelConfigService.updateModelConfig(configReq);
            } else {
                modelConfigService.createModelConfig(configReq);
            }
        }

        return modelId;
    }
}
