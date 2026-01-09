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

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.json.JSONObject;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.common.utils.StringUtils;
import tech.qiantong.qmodel.common.exception.ServiceException;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.qiantong.qmodel.module.model.controller.admin.history.vo.ModelHistorySaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.model.ModelDO;
import tech.qiantong.qmodel.module.model.dal.mapper.model.ModelMapper;
import tech.qiantong.qmodel.module.model.domain.ModelHistory;
import tech.qiantong.qmodel.module.model.domain.ModelOperate;
import tech.qiantong.qmodel.module.model.domain.ModelVersion;

import tech.qiantong.qmodel.module.model.service.IModelOperateService;
import tech.qiantong.qmodel.module.model.service.IModelVersionService;
import tech.qiantong.qmodel.module.model.service.classify.IModelClassifyService;
import tech.qiantong.qmodel.module.model.service.history.IModelHistoryService;
import tech.qiantong.qmodel.module.model.service.model.IModelService;

/**
 * 模型管理Service业务层处理
 *
 * @author qModel
 * @date 2026-01-07
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class ModelServiceImpl extends ServiceImpl<ModelMapper, ModelDO> implements IModelService {
    @Resource
    private ModelMapper modelMapper;

    @Resource
    private IModelClassifyService modelClassifyService;

    @Resource
    private IModelOperateService modelOperateService;

    @Resource
    private IModelVersionService modelVersionService;

    @Resource
    private IModelHistoryService modelHistoryService;



    @Override
    public PageResult<ModelDO> getModelPage(ModelPageReqVO pageReqVO) {
        if(ObjectUtil.isNotNull(pageReqVO.getClassifyId())){
            List<Long> classifyIds = modelClassifyService.getModelClassifyIds(pageReqVO.getClassifyId());
            pageReqVO.setClassifyIds(classifyIds);
        }
        return modelMapper.selectPage(pageReqVO);
    }

    @Override
    public Long createModel(ModelSaveReqVO createReqVO, ModelVersion modelVersion) {
        //设置初始版本
        createReqVO.setVersion("1");
        createReqVO.setUploadStatus(1);
        ModelDO dictType = BeanUtils.toBean(createReqVO, ModelDO.class);
        modelMapper.insert(dictType);
        //设置模型id
        modelVersion.setModelId(createReqVO.getId());
        //设置模型名称
        modelVersion.setModelName(createReqVO.getName());
        //设置接口格式 0 文件， 1 接口
        if (createReqVO.getFormat() == 0) {
            modelVersion.setFileAddress(createReqVO.getUploadFile());
        }
        if (createReqVO.getFormat() == 1) {
            modelVersion.setInterfaceAddress(createReqVO.getUploadInterface());
        }
        //设置状态
        modelVersion.setStatus(createReqVO.getUploadStatus());
        //版本设置
        modelVersion.setVersion(createReqVO.getVersion());
        //数据库插入数据
        modelVersionService.insertModelVersion(modelVersion);
        // 添加操作历史
        if (createReqVO !=null) {
            ModelHistorySaveReqVO modelHistory = new ModelHistorySaveReqVO();
            modelHistory.setModelId(createReqVO.getId());
            modelHistory.setModelName(createReqVO.getName());
            modelHistory.setContext("新增了"+createReqVO.getName());
            modelHistory.setModelVersion(createReqVO.getVersion());
            modelHistory.setStartTime(createReqVO.getCreateTime());
            modelHistoryService.createModelHistory(modelHistory);
            ModelOperate operate = new ModelOperate();
            operate.setCompanyId(createReqVO.getCompanyId());
            operate.setModuleName(createReqVO.getName());
            operate.setContent("新增了"+createReqVO.getName());
            operate.setType(0);
            JSONObject object = new JSONObject();
            object.set("模型名称", createReqVO.getName());
            object.set("模型格式", createReqVO.getFormat() == 0 ? "文件格式" : "接口格式");
            object.set("版本发布说明", modelVersion.getDescription());
            object.set("模型介绍", createReqVO.getRemark() == null ? " -- " : createReqVO.getRemark());
            operate.setRespContent(object.toString());
            modelOperateService.insertModelOperate(operate);
        }
        return dictType.getId();
    }

    @Override
    public int updateModel(ModelSaveReqVO updateReqVO) {

        if (updateReqVO != null) {
            ModelDO originModel = this.getModelById(updateReqVO.getId());
            ModelHistorySaveReqVO modelHistory = new ModelHistorySaveReqVO();
            modelHistory.setModelId(updateReqVO.getId());
            modelHistory.setModelName(updateReqVO.getName());
            modelHistory.setContext("修改了"+updateReqVO.getName()+"基本信息");
            modelHistory.setModelVersion(updateReqVO.getVersion());
            modelHistoryService.createModelHistory(modelHistory);

            ModelOperate operate = new ModelOperate();
            operate.setCompanyId(updateReqVO.getCompanyId());
            operate.setModuleName(updateReqVO.getName());
            operate.setContent("新增了"+updateReqVO.getName());
            operate.setType(1);
            {
                JSONObject object = new JSONObject();
                object.set("模型名称", updateReqVO.getName());
                object.set("模型介绍", updateReqVO.getRemark() == null ? " -- " : updateReqVO.getRemark());
                operate.setRespContent(object.toString());
            }
            {
                JSONObject object = new JSONObject();
                object.set("模型名称", originModel.getName());
                object.set("模型介绍", updateReqVO.getRemark() == null ? " -- " : originModel.getRemark());
                operate.setReqContent(object.toString());
            }
            modelOperateService.insertModelOperate(operate);
        }
        ModelDO updateObj = BeanUtils.toBean(updateReqVO, ModelDO.class);
        return modelMapper.updateById(updateObj);
    }

    @Override
    public int updateModel(ModelSaveReqVO model, ModelVersion modelVersion) {
        //设置模型id
        modelVersion.setModelId(model.getId());
        //设置模型名称
        modelVersion.setModelName(model.getName());
        //设置接口格式 0 文件， 1 接口
        if (model.getFormat() == 0) {
            modelVersion.setFileAddress(model.getUploadFile());
            modelVersion.setInterfaceAddress(null);
        }
        if (model.getFormat() == 1) {
            modelVersion.setInterfaceAddress(model.getInterfaceAddress());
            modelVersion.setFileAddress(null);
        }
        //设置状态
        modelVersion.setStatus(0);
        //版本设置
        int version = Integer.parseInt(model.getVersion()) + 1;
        modelVersion.setVersion(String.valueOf(version));
        //数据库插入数据
        modelVersionService.insertModelVersion(modelVersion);
        model.setVersion(String.valueOf(version));
        model.setUploadStatus(0);
        //接口格式和文件格式转换，清楚另一种的数据
        if (model.getFormat() == 0) {
            model.setUploadInterface(null);
        }
        if (model.getFormat() == 1) {
            model.setUploadFile(null);
        }
        if (model != null) {
            ModelHistorySaveReqVO modelHistory = new ModelHistorySaveReqVO();
            modelHistory.setModelId(model.getId());
            modelHistory.setModelName(model.getName());
            modelHistory.setContext("修改了"+model.getName()+"详细信息");
            modelHistory.setModelVersion(model.getVersion());
            modelHistoryService.createModelHistory(modelHistory);
        }
        ModelDO updateObj = BeanUtils.toBean(model, ModelDO.class);
        return modelMapper.updateById(updateObj);
    }

    @Override
    public int removeModel(Collection<Long> idList) {
        for (Long id : idList) {
            ModelDO model = this.getModelById(id);
            if (model != null) {
                ModelHistorySaveReqVO modelHistory = new ModelHistorySaveReqVO();
                modelHistory.setModelId(model.getId());
                modelHistory.setModelName(model.getName());
                modelHistory.setContext("删除了"+model.getName());
                modelHistory.setModelVersion(model.getVersion());
                modelHistoryService.createModelHistory(modelHistory);
            }
        }
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
    public List<ModelDO> getModelList(ModelPageReqVO model) {

        return null;
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
     * 导入模型管理数据
     *
     * @param importExcelList 模型管理数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName        操作用户
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
                            successMessages.add("数据更新成功，ID为 " + modelId + " 的模型管理记录。");
                        } else {
                            failureNum++;
                            failureMessages.add("数据更新失败，ID为 " + modelId + " 的模型管理记录不存在。");
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
                        successMessages.add("数据插入成功，ID为 " + modelId + " 的模型管理记录。");
                    } else {
                        failureNum++;
                        failureMessages.add("数据插入失败，ID为 " + modelId + " 的模型管理记录已存在。");
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
