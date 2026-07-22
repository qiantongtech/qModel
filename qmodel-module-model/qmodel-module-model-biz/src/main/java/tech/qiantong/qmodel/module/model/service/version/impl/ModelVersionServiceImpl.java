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

package tech.qiantong.qmodel.module.model.service.version.impl;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.qiantong.qmodel.common.core.domain.AjaxResult;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.exception.ServiceException;
import tech.qiantong.qmodel.common.utils.StringUtils;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.vo.ModelReconstitutionSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.operate.vo.ModelOperateSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.version.vo.ModelVersionPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.version.vo.ModelVersionRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.version.vo.ModelVersionSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.modelReconstitution.ModelReconstitutionDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.version.ModelVersionDO;
import tech.qiantong.qmodel.module.model.dal.mapper.version.ModelVersionMapper;
import tech.qiantong.qmodel.module.model.enums.AccessModeEnum;
import tech.qiantong.qmodel.module.model.enums.StatusEnum;
import tech.qiantong.qmodel.module.model.service.history.IModelHistoryService;
import tech.qiantong.qmodel.module.model.service.modelReconstitution.IModelReconstitutionService;
import tech.qiantong.qmodel.module.model.service.operate.IModelOperateService;
import tech.qiantong.qmodel.module.model.service.version.IModelVersionService;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 版本管理Service业务层处理
 *
 * @author qModel
 * @date 2026-01-09
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class ModelVersionServiceImpl  extends ServiceImpl<ModelVersionMapper,ModelVersionDO> implements IModelVersionService {
    @Resource
    private ModelVersionMapper modelVersionMapper;

    @Resource
    private IModelReconstitutionService modelReconstitutionService;

    @Resource
    private IModelHistoryService modelHistoryService;

    @Resource
    private IModelOperateService modelOperateService;

    @Override
    public PageResult<ModelVersionDO> getModelVersionPage(ModelVersionPageReqVO pageReqVO) {
        return modelVersionMapper.selectPage(pageReqVO);
    }

    /**
     * 查询版本管理列表
     *
     * @param modelVersion 版本管理
     * @return 版本管理
     */
    @Override
    public List<ModelVersionDO> selectModelVersionList(ModelVersionDO modelVersion) {
        modelVersion.setDelFlag(false);
        return modelVersionMapper.selectModelVersionList(modelVersion);
    }

    @Override
    public Long createModelVersion(ModelVersionSaveReqVO createReqVO) {
        ModelVersionDO dictType = BeanUtils.toBean(createReqVO, ModelVersionDO.class);
        modelVersionMapper.insert(dictType);
        return dictType.getId();
    }

    @Override
    public Long createModelVersionWithModelId(ModelVersionSaveReqVO version, Long modelId) {
        // 创建版本记录
        ModelVersionDO versionDO = BeanUtils.toBean(version, ModelVersionDO.class);
        modelVersionMapper.insert(versionDO);

        // 更新模型ID
        if (modelId != null) {
            versionDO.setModelId(modelId);
            modelVersionMapper.updateById(versionDO);
        }

        return versionDO.getId();
    }

    @Override
    public Long createModelVersionWithAttributes(ModelReconstitutionSaveReqVO modelReconstitution, Long userId, String nickName) {
        ModelVersionSaveReqVO version = new ModelVersionSaveReqVO();
        version.setCompanyId(null);
        version.setCreatorId(userId);
        version.setCreateBy(nickName);
        version.setVersion(modelReconstitution.getVersion());
        version.setDescription(modelReconstitution.getDescription());
        version.setStatus(StatusEnum.ENABLED.getValue());
        version.setModelName(modelReconstitution.getName());
        version.setFileAddress(modelReconstitution.getInterfaceorfileAddress());
        version.setInterfaceAddress(modelReconstitution.getInterfaceorfileAddress());
        version.setRunnableFileAddress(modelReconstitution.getRunnableFileAddress());

        // 创建版本记录
        ModelVersionDO versionDO = BeanUtils.toBean(version, ModelVersionDO.class);
        modelVersionMapper.insert(versionDO);

        // 更新模型ID
        if (modelReconstitution.getId() != null) {
            versionDO.setModelId(modelReconstitution.getId());
            modelVersionMapper.updateById(versionDO);
        }

        return versionDO.getId();
    }

    @Override
    public int updateModelVersion(ModelVersionSaveReqVO updateReqVO) {
        // 更新版本管理
        ModelVersionDO updateObj = BeanUtils.toBean(updateReqVO, ModelVersionDO.class);
        return modelVersionMapper.updateById(updateObj);
    }
    @Override
    public int removeModelVersion(Collection<Long> idList) {
        // 批量删除版本管理
        return modelVersionMapper.deleteBatchIds(idList);
    }

    @Override
    public ModelVersionDO getModelVersionById(Long id) {
        return modelVersionMapper.selectById(id);
    }

    @Override
    public List<ModelVersionDO> getModelVersionList() {
        return modelVersionMapper.selectList();
    }

    @Override
    public Map<Long, ModelVersionDO> getModelVersionMap() {
        List<ModelVersionDO> modelVersionList = modelVersionMapper.selectList();
        return modelVersionList.stream()
                .collect(Collectors.toMap(
                        ModelVersionDO::getId,
                        modelVersionDO -> modelVersionDO,
                        // 保留已存在的值
                        (existing, replacement) -> existing
                ));
    }


        /**
         * 导入版本管理数据
         *
         * @param importExcelList 版本管理数据列表
         * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
         * @param operName 操作用户
         * @return 结果
         */
        @Override
        public String importModelVersion(List<ModelVersionRespVO> importExcelList, boolean isUpdateSupport, String operName) {
            if (StringUtils.isNull(importExcelList) || importExcelList.size() == 0) {
                throw new ServiceException("导入数据不能为空！");
            }

            int successNum = 0;
            int failureNum = 0;
            List<String> successMessages = new ArrayList<>();
            List<String> failureMessages = new ArrayList<>();

            for (ModelVersionRespVO respVO : importExcelList) {
                try {
                    ModelVersionDO modelVersionDO = BeanUtils.toBean(respVO, ModelVersionDO.class);
                    Long modelVersionId = respVO.getId();
                    if (isUpdateSupport) {
                        if (modelVersionId != null) {
                            ModelVersionDO existingModelVersion = modelVersionMapper.selectById(modelVersionId);
                            if (existingModelVersion != null) {
                                modelVersionMapper.updateById(modelVersionDO);
                                successNum++;
                                successMessages.add("数据更新成功，ID为 " + modelVersionId + " 的版本管理记录。");
                            } else {
                                failureNum++;
                                failureMessages.add("数据更新失败，ID为 " + modelVersionId + " 的版本管理记录不存在。");
                            }
                        } else {
                            failureNum++;
                            failureMessages.add("数据更新失败，某条记录的ID不存在。");
                        }
                    } else {
                        QueryWrapper<ModelVersionDO> queryWrapper = new QueryWrapper<>();
                        queryWrapper.eq("id", modelVersionId);
                        ModelVersionDO existingModelVersion = modelVersionMapper.selectOne(queryWrapper);
                        if (existingModelVersion == null) {
                            modelVersionMapper.insert(modelVersionDO);
                            successNum++;
                            successMessages.add("数据插入成功，ID为 " + modelVersionId + " 的版本管理记录。");
                        } else {
                            failureNum++;
                            failureMessages.add("数据插入失败，ID为 " + modelVersionId + " 的版本管理记录已存在。");
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
     * 切换版本
     *
     * @param modelVersionRespVO 包含切换版本所需参数
     * @param userId 用户ID
     * @param nickName 用户昵称
     * @return 操作结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult handoffVersion(ModelVersionRespVO modelVersionRespVO, Long userId, String nickName) {
        ModelVersionSaveReqVO version = new ModelVersionSaveReqVO();
        if (modelVersionRespVO.getBeforeVersionId() != null) {
            version.setId(modelVersionRespVO.getBeforeVersionId());
            version.setStatus(StatusEnum.DISABLED.getValue());
            updateModelVersion(version);
        }
        ModelReconstitutionSaveReqVO model = new ModelReconstitutionSaveReqVO();
        model.setId(modelVersionRespVO.getModelId());
        if (modelVersionRespVO.getAfterVersionId() == null) {
            model.setParamByKey("clearVersionId", true);
        } else {
            model.setVersionId(modelVersionRespVO.getAfterVersionId());
            version.setId(modelVersionRespVO.getAfterVersionId());
            version.setStatus(StatusEnum.ENABLED.getValue());
            updateModelVersion(version);
            modelHistoryService.createModelHistory(modelVersionRespVO.getModelId(), modelVersionRespVO.getModelName(), "切换了模型的版本号, 切换到了【" + modelVersionRespVO.getAfterVersion() + "】", modelVersionRespVO.getAfterVersion(), userId, nickName);
        }
        modelReconstitutionService.updateModelReconstitution(model);
        return AjaxResult.success();
    }

    @Override
    public int updateModelVersionWithBusinessLogic(ModelVersionSaveReqVO modelVersion, Long userId, String nickName) {
        ModelReconstitutionDO modelReconstitution = modelReconstitutionService.getModelReconstitutionById(modelVersion.getId());
        if (isActiveStatus(modelVersion)) {
            updateModelReconstitutionWithVersionInfo(modelReconstitution, modelVersion);
            modelReconstitutionService.updateModelReconstitution(BeanUtils.toBean(modelReconstitution, ModelReconstitutionSaveReqVO.class));

            recordHistoryOperation("启用了", modelVersion, userId, nickName, modelReconstitution);
            recordModelOperation("启用", modelVersion, modelReconstitution);
        }
        // 检查是否所有版本都未激活
        boolean allVersionsInactive = areAllVersionsInactive(modelVersion);
        if (allVersionsInactive) {
            // 所有版本都未激活，表示停用当前版本
            modelReconstitutionService.updateModelReconstitution(BeanUtils.toBean(modelReconstitution, ModelReconstitutionSaveReqVO.class));
            recordHistoryOperation("停用了", modelVersion, userId, nickName, modelReconstitution);
            recordModelOperation("停用", modelVersion, modelReconstitution);
        } else if (!isActiveStatus(modelVersion)) {
            // 当前版本未激活且不是所有版本都未激活时，记录修改操作
            recordHistoryOperation("修改了", modelVersion, userId, nickName, modelReconstitution);
        }

        return updateModelVersion(modelVersion);
    }

    /**
     * 检查版本是否为激活状态
     */
    private boolean isActiveStatus(ModelVersionSaveReqVO modelVersion) {
        return modelVersion.getStatus() != null && modelVersion.getStatus().equals(StatusEnum.ENABLED.getValue());
    }

    /**
     * 更新重组模型的版本信息
     */
    private void updateModelReconstitutionWithVersionInfo(ModelReconstitutionDO modelReconstitution, ModelVersionSaveReqVO modelVersion) {
        if (modelReconstitution.getAccessMode() != null) {
            if (AccessModeEnum.API_INTERFACE.getValue().equals(modelReconstitution.getAccessMode())) {
                modelReconstitution.setInterfaceorfileAddress(modelVersion.getInterfaceAddress());
            } else if (AccessModeEnum.FILE.getValue().equals(modelReconstitution.getAccessMode())) {
                modelReconstitution.setInterfaceorfileAddress(modelVersion.getFileAddress());
            }
        }
        modelReconstitution.setVersionId(modelVersion.getId());
        modelReconstitution.setRemark(modelVersion.getRemark());
    }

    /**
     * 检查是否所有版本都处于非激活状态
     */
    private boolean areAllVersionsInactive(ModelVersionSaveReqVO modelVersion) {
        ModelVersionDO queryVersion = new ModelVersionDO();
        queryVersion.setModelId(modelVersion.getModelId());
        List<ModelVersionDO> versionList = selectModelVersionList(queryVersion);
        return versionList.stream().noneMatch(version -> version.getStatus() != null && version.getStatus().equals(StatusEnum.ENABLED.getValue()));
    }

    /**
     * 记录历史操作
     */
    private void recordHistoryOperation(String operationType, ModelVersionSaveReqVO modelVersion,
                                       Long userId, String nickName, ModelReconstitutionDO modelReconstitution) {
        String content = operationType + modelVersion.getModelName() + "【" + modelVersion.getVersion() + "】版本";
        if ("修改了".equals(operationType)) {
            content += "的内容";
        }
        modelHistoryService.createModelHistory(
            modelVersion.getModelId(),
            modelVersion.getModelName(),
            content,
            modelVersion.getVersion(),
            userId,
            nickName
        );
    }

    /**
     * 记录模型操作
     */
    private void recordModelOperation(String operationType, ModelVersionSaveReqVO modelVersion,
                                    ModelReconstitutionDO modelReconstitution) {
        ModelOperateSaveReqVO operate = new ModelOperateSaveReqVO();
        operate.setCompanyId(modelReconstitution.getCompanyId());
        operate.setModuleName(modelReconstitution.getName());
        operate.setContent(operationType + "【" + modelVersion.getVersion() + "】版本");
        operate.setType(2);
        JSONObject object = new JSONObject();
        object.put("模型名称", modelReconstitution.getName());
        object.put("启用版本", modelVersion.getVersion());
        operate.setRespContent(object.toString());

        modelOperateService.createModelOperate(operate);
    }
}
