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
import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson2.JSONObject;
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
import tech.qiantong.qmodel.module.model.controller.admin.fileResource.vo.ModelFileResourceSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.*;
import tech.qiantong.qmodel.module.model.controller.admin.modelVersion.vo.ModelVersionSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.classify.ModelClassifyDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.config.ModelConfigDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.fileResource.ModelFileResourceDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.model.ModelDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.modelAudit.ModelAuditDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.modelVersion.ModelVersionDO;
import tech.qiantong.qmodel.module.model.dal.mapper.config.ModelConfigMapper;
import tech.qiantong.qmodel.module.model.dal.mapper.model.ModelMapper;
import tech.qiantong.qmodel.module.model.dal.mapper.modelAudit.ModelAuditMapper;
import tech.qiantong.qmodel.module.model.enums.ModelAuditStatusEnum;
import tech.qiantong.qmodel.module.model.enums.ModelStatusEnum;
import tech.qiantong.qmodel.module.model.enums.ModelVersionDigestEnum;
import tech.qiantong.qmodel.module.model.service.classify.IModelClassifyService;
import tech.qiantong.qmodel.module.model.service.config.IModelConfigService;
import tech.qiantong.qmodel.module.model.service.model.IModelService;
import tech.qiantong.qmodel.module.model.service.fileResource.IModelFileResourceService;
import tech.qiantong.qmodel.module.model.enums.AccessTypeEnum;
import tech.qiantong.qmodel.module.model.service.modelAudit.IModelAuditService;
import tech.qiantong.qmodel.module.model.service.modelVersion.IModelVersionService;

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
    @Resource
    private IModelVersionService modelVersionService;

    @Override
    public PageResult<ModelDO> getModelPage(ModelPageReqVO pageReqVO) {
        return modelMapper.selectPage(pageReqVO);
    }

    @Override
    public Long createModel(ModelSaveReqVO createReqVO) {
        ModelDO modelDO = BeanUtils.toBean(createReqVO, ModelDO.class);
        modelMapper.insert(modelDO);
        Long modelId = modelDO.getId();

        ModelFileResourceSaveReqVO saveReqVO = BeanUtils.toBean(createReqVO, ModelFileResourceSaveReqVO.class);

        if (AccessTypeEnum.PYTHON.getType().equals(createReqVO.getAccessType())) {
            if (StringUtils.isEmpty(createReqVO.getFilePath())) {
                throw new ServiceException("Python类型模型必须上传文件");
            }
            modelFileResourceService.saveFileResourceFromModel(saveReqVO, modelId);
        }

        return modelId;
    }

    @Override
    public int updateModel(ModelSaveReqVO updateReqVO) {
        ModelDO updateObj = BeanUtils.toBean(updateReqVO, ModelDO.class);
        modelMapper.updateById(updateObj);
        Long modelId = updateReqVO.getId();
        ModelFileResourceSaveReqVO saveReqVO = BeanUtils.toBean(updateReqVO, ModelFileResourceSaveReqVO.class);

        if (AccessTypeEnum.PYTHON.getType().equals(updateReqVO.getAccessType())) {
            modelFileResourceService.saveFileResourceFromModel(saveReqVO, modelId);
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
                ModelFileResourceDO one = modelFileResourceService.getByModel(id, modelDO.getVersion());
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
        modelRespVO.setModelConfig(modelConfigService.getByModelId(id,modelDO.getVersion()));
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
                ModelFileResourceDO one = modelFileResourceService.getByModel(modelDO.getId(), modelDO.getVersion());
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
        modelRespVO.setModelConfig(modelConfigService.getByModelId(modelDO.getId(),modelDO.getVersion()));
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
     * 获得模型详细信息
     *
     * @param id 模型基础信息编号
     * @return 模型基础信息
     */
    @Override
    public ModelVO getModelVOById(Long id, String version) {
        ModelDO modelDO = baseMapper.selectById(id);
        if (Objects.isNull(modelDO)) {
            return null;
        }
        if (StrUtil.isBlank(version)){
            version = modelDO.getVersion();
        }
        ModelVO result = new ModelVO();
        result.setModel(BeanUtils.toBean(modelDO, ModelSaveReqVO.class));

        ModelVersionDO modelVersion = modelVersionService.getModelVersion(id, version);
        result.setModelVersion(BeanUtils.toBean(modelVersion, ModelVersionSaveReqVO.class));
        if (Objects.equals(modelDO.getAccessType(), AccessTypeEnum.API.getType())) {
            ModelConfigDO configDO = modelConfigService.getByModelId(id, version);
            result.setModelConfig(BeanUtils.toBean(configDO, ModelConfigSaveReqVO.class));
        } else if (Objects.equals(modelDO.getAccessType(), AccessTypeEnum.PYTHON.getType())) {
            ModelFileResourceDO fileResourceDO = modelFileResourceService.getByModel(id, version);
            result.setFileResource(BeanUtils.toBean(fileResourceDO, ModelFileResourceSaveReqVO.class));
        }
        return result;
    }


    /**
     * 创建模型
     *
     * @param modelVO 模型VO
     * @return 模型编号
     */
    @Override
    public Long createModelVO(ModelVO modelVO) {
        ModelSaveReqVO model = modelVO.getModel();
        ModelVersionSaveReqVO modelVersion = modelVO.getModelVersion();
        ModelDO modelDO = BeanUtils.toBean(model, ModelDO.class);
        modelDO.setVersion(modelVersion.getModelVersion());
        resetModelStatus(modelDO);
        modelMapper.insert(modelDO);
        Long modelId = modelDO.getId();

        // 保存版本信息
        modelVersion.setModelId(modelId);
        modelVersionService.createModelVersion(modelVersion);
        // 保存配置信息
        if (AccessTypeEnum.API.getType().equals(model.getAccessType())) {
            ModelConfigSaveReqVO configReq = modelVO.getModelConfig();
            configReq.setModelId(modelId);
            configReq.setModelVersion(modelDO.getVersion());
            configReq.setCompanyId(modelDO.getCompanyId());
            modelConfigService.createModelConfig(configReq);
        } else if (AccessTypeEnum.PYTHON.getType().equals(model.getAccessType())) {
            // 保存文件信息
            ModelFileResourceSaveReqVO fileResource = modelVO.getFileResource();
            if (StringUtils.isEmpty(fileResource.getFilePath())) {
                throw new ServiceException("Python类型模型必须上传文件");
            }
            modelFileResourceService.saveFileResourceFromModel(fileResource, modelId);
        }

        return modelId;
    }

    /**
     * 修改模型
     *
     * @param modelVO 模型VO
     * @return 是否成功
     */
    @Override
    public Boolean updateModelVO(ModelVO modelVO) {
        ModelSaveReqVO model = modelVO.getModel();
        ModelDO modelDO = BeanUtils.toBean(model, ModelDO.class);
        resetModelStatus(modelDO);
        modelMapper.updateById(modelDO);
        Long modelId = modelDO.getId();

        if (AccessTypeEnum.API.getType().equals(model.getAccessType())) {
            // 修改模型配置信息
            ModelConfigSaveReqVO configReq = modelVO.getModelConfig();
            modelConfigService.updateModelConfig(configReq);
        } else if (AccessTypeEnum.PYTHON.getType().equals(model.getAccessType())) {
            // 修改模型文件信息
            ModelFileResourceSaveReqVO fileResource = modelVO.getFileResource();
            if (StringUtils.isEmpty(fileResource.getFilePath())) {
                throw new ServiceException("Python类型模型必须上传文件");
            }
            fileResource.setModelVersion(modelDO.getVersion());
            modelFileResourceService.saveFileResourceFromModel(fileResource, modelId);
        }
        return true;
    }

    /**
     * 创建模型版本
     *
     * @param modelVO 模型VO
     * @return 模型编号
     */
    @Override
    public Long createModelVersionVO(ModelVO modelVO) {
        ModelSaveReqVO model = modelVO.getModel();
        ModelVersionSaveReqVO modelVersion = modelVO.getModelVersion();

        // 保存版本信息
        modelVersion.setModelId(model.getId());
        Assert.notBlank(modelVersion.getBaseVersion(), "基础版本不能为空");
//        modelVersion.setDigest(ModelVersionDigestEnum.INIT_VERSION.getChangeMode());
        fillDigest(modelVersion, modelVO);
        modelVersionService.createModelVersion(modelVersion);
        // 保存配置信息
        if (AccessTypeEnum.API.getType().equals(model.getAccessType())) {
            ModelConfigSaveReqVO configReq = modelVO.getModelConfig();
            configReq.setId(null);
            configReq.setModelId(model.getId());
            configReq.setModelVersion(model.getVersion());
            configReq.setCompanyId(model.getCompanyId());
            modelConfigService.createModelConfig(configReq);
        } else if (AccessTypeEnum.PYTHON.getType().equals(model.getAccessType())) {
            // 保存文件信息
            ModelFileResourceSaveReqVO fileResource = modelVO.getFileResource();
            if (StringUtils.isEmpty(fileResource.getFilePath())) {
                throw new ServiceException("Python类型模型必须上传文件");
            }
            fileResource.setId(null);
            fileResource.setModelVersion(model.getVersion());
            modelFileResourceService.saveFileResourceFromModel(fileResource, model.getId());
        }
        return model.getId();
    }

    /**
     * 修改模型版本
     *
     * @param modelVO 模型VO
     * @return 是否成功
     */
    @Override
    public Boolean updateModelVersionVO(ModelVO modelVO) {
        ModelSaveReqVO model = modelVO.getModel();
        ModelVersionSaveReqVO modelVersion = modelVO.getModelVersion();

        // 保存版本信息
        modelVersion.setModelId(model.getId());
        Assert.notBlank(modelVersion.getBaseVersion(), "基础版本不能为空");
        // 保存配置信息
        fillDigest(modelVersion, modelVO);
        modelVersionService.updateModelVersion(modelVersion);
        if (AccessTypeEnum.API.getType().equals(model.getAccessType())) {
            ModelConfigSaveReqVO configReq = modelVO.getModelConfig();
            modelConfigService.updateModelConfig(configReq);
        } else if (AccessTypeEnum.PYTHON.getType().equals(model.getAccessType())) {
            // 保存文件信息
            ModelFileResourceSaveReqVO fileResource = modelVO.getFileResource();
            if (StringUtils.isEmpty(fileResource.getFilePath())) {
                throw new ServiceException("Python类型模型必须上传文件");
            }
            modelFileResourceService.saveFileResourceFromModel(fileResource, model.getId());
        }

        return Boolean.TRUE;
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

    /**
     * 获得模型基础信息详情
     *
     * @param id           模型基础信息编号
     * @param modelVersion 模型版本号
     * @return 模型基础信息
     */
    @Override
    public ModelRespVO getModel(Long id, String modelVersion) {
        ModelDO modelDO = modelMapper.selectById(id);
        if (Objects.isNull(modelDO)) {
            return null;
        }
        ModelRespVO modelRespVO = BeanUtils.toBean(modelDO, ModelRespVO.class);
        if (AccessTypeEnum.PYTHON.getType().equals(modelDO.getAccessType())) {
            LambdaQueryWrapper<ModelFileResourceDO> queryWrapper = Wrappers.lambdaQuery(ModelFileResourceDO.class)
                    .eq(ModelFileResourceDO::getModelId, id)
                    .eq(ModelFileResourceDO::getModelVersion, modelVersion);
            ModelFileResourceDO modelFileResource = modelFileResourceService.getOne(queryWrapper);
            modelRespVO.setModelFileResourceRespVO(modelFileResource);
        } else {

            modelRespVO.setModelConfig(modelConfigService.getByModelId(id, modelVersion));
        }

        if (modelDO.getClassifyId() != null) {
            ModelClassifyDO classifyDO = modelClassifyService.getModelClassifyById(modelDO.getClassifyId());
            if (classifyDO != null) {
                modelDO.setClassifyName(classifyDO.getName());
            }
        }
        return modelRespVO;
    }

    /**
     * 设置默认模型状态
     *
     * @param modelDO 模型DO
     */
    private void resetModelStatus(ModelDO modelDO) {
        if (Objects.equals(AccessTypeEnum.API.getType(), modelDO.getAccessType())) {
            modelDO.setStatus(ModelStatusEnum.CUT_IN.getStatus());
        } else if (Objects.equals(AccessTypeEnum.PYTHON.getType(), modelDO.getAccessType())) {
            modelDO.setStatus(ModelStatusEnum.BUILDING.getStatus());
        }
    }

    /**
     * 填充模型版本的摘要信息
     *
     * @param modelVersionDO 模型版本DO
     * @param currentModel   当前模型
     */
    private void fillDigest(ModelVersionSaveReqVO modelVersionDO, ModelVO currentModel) {
        ModelVO baseModel = this.getModelVOById(modelVersionDO.getModelId(), modelVersionDO.getBaseVersion());
        if (Objects.equals(baseModel, currentModel)){
            modelVersionDO.setDigest(ModelVersionDigestEnum.INIT_VERSION.getChangeMode());
            return;
        }

        List<ModelVersionDigestEnum> digestEnumList = new ArrayList<>();
        digestEnumList.add(ModelVersionDigestEnum.PARAM_CHANGE);
        if(Objects.equals(currentModel.getModel().getAccessType(),AccessTypeEnum.API.getType())){
            digestEnumList.add(ModelVersionDigestEnum.AUTH_CHANGE);
            digestEnumList.add(ModelVersionDigestEnum.ADDRESS_CHANGE);
        }else{
            digestEnumList.add(ModelVersionDigestEnum.FILE_CHANGE);
        }
        String digest = getDigest(baseModel, currentModel, digestEnumList);
        modelVersionDO.setDigest(digest);

    }

    /**
     * 获取模型版本的摘要信息
     *
     * @param baseModel      基础模型
     * @param currentModel   当前模型
     * @param digestEnumList 摘要枚举列表
     * @return 摘要信息
     */
    private String getDigest(ModelVO baseModel, ModelVO currentModel, List<ModelVersionDigestEnum> digestEnumList) {
        List<String> resultList = new ArrayList<>();
        for (ModelVersionDigestEnum digestEnum : digestEnumList){
            JSONObject baseModelJson = new JSONObject();
            JSONObject currentModelJson = new JSONObject();
            if (Objects.equals(digestEnum, ModelVersionDigestEnum.FILE_CHANGE)){
                baseModelJson = JSONObject.from(baseModel.getFileResource());
                currentModelJson = JSONObject.from(currentModel.getFileResource());
            }else if (Objects.equals(digestEnum, ModelVersionDigestEnum.PARAM_CHANGE)){
                if (Objects.equals(baseModel.getModel().getAccessType(), AccessTypeEnum.API.getType())) {
                    baseModelJson = JSONObject.from(baseModel.getModelConfig());
                    currentModelJson = JSONObject.from(currentModel.getModelConfig());
                }else {
                    baseModelJson = JSONObject.from(baseModel.getFileResource());
                    currentModelJson = JSONObject.from(currentModel.getFileResource());
                }
            }else if (Objects.equals(digestEnum, ModelVersionDigestEnum.AUTH_CHANGE)){
                baseModelJson = JSONObject.from(baseModel.getModelConfig());
                currentModelJson = JSONObject.from(currentModel.getModelConfig());
            }else if (Objects.equals(digestEnum, ModelVersionDigestEnum.ADDRESS_CHANGE)){
                baseModelJson = JSONObject.from(baseModel.getModelConfig());
                currentModelJson = JSONObject.from(currentModel.getModelConfig());
            }
            for (String filed : digestEnum.getFiledSet()){
                if (!Objects.equals(baseModelJson.get(filed), currentModelJson.get(filed))){
                    resultList.add(digestEnum.getCode());
                    break;
                }
            }

        }
        return String.join(",", resultList);
    }
}
