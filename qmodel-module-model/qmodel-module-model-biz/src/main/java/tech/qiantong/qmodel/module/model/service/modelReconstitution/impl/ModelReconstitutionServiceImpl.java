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

package tech.qiantong.qmodel.module.model.service.modelReconstitution.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.utils.DateUtils;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.vo.ModelReconstitutionPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.vo.ModelReconstitutionRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.modelReconstitution.vo.ModelReconstitutionSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.classify.ModelClassifyDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.modelReconstitution.ModelReconstitutionDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.version.ModelVersionDO;
import tech.qiantong.qmodel.module.model.dal.mapper.modelReconstitution.ModelReconstitutionMapper;
import tech.qiantong.qmodel.module.model.service.classify.IModelClassifyService;
import tech.qiantong.qmodel.module.model.service.modelReconstitution.IModelReconstitutionService;
import tech.qiantong.qmodel.module.model.service.version.IModelVersionService;
import tech.qiantong.qmodel.module.modelReconstitution.domain.ModelReconstitution;

import javax.annotation.Resource;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 模型库重构Service业务层处理
 *
 * @author qModel
 * @date 2026-01-12
 */
@Slf4j
@Service
@Primary
public class ModelReconstitutionServiceImpl  extends ServiceImpl<ModelReconstitutionMapper,ModelReconstitutionDO> implements IModelReconstitutionService {
    @Resource
    private ModelReconstitutionMapper modelReconstitutionMapper;

    @Resource
    private IModelVersionService modelVersionService;

    @Resource
    private IModelClassifyService modelClassifyService;

    @Override
    public PageResult<ModelReconstitutionDO> getModelReconstitutionPage(ModelReconstitutionPageReqVO pageReqVO) {
        //查询所有分类的id
        List<Long> classifyIds = null;
        if(Objects.nonNull(pageReqVO.getClassifyId())){
            classifyIds = modelClassifyService.getModelClassifyIds(pageReqVO.getClassifyId());
            pageReqVO.setClassifyIds(classifyIds);
        }

        PageResult<ModelReconstitutionDO> page = modelReconstitutionMapper.selectPage(pageReqVO);

        List<ModelReconstitutionDO> list = page.getList();
        ModelVersionDO modelVersionReconstitution = new ModelVersionDO();
        List<Long> ids = new ArrayList<>();
        for (ModelReconstitutionDO reconstitution : list) {
            ids.add(reconstitution.getVersionId());
        }
        Map<String,Object> params = new HashMap<>();
        params.put("ids",ids);
        modelVersionReconstitution.setParams(params);
        List<ModelVersionDO> modelVersions = modelVersionService.selectModelVersionList(modelVersionReconstitution);
        for (ModelReconstitutionDO reconstitution : list) {
            if (reconstitution.getVersionId() == null) {
                continue;
            }
            for (ModelVersionDO versionReconstitution : modelVersions) {
                if (reconstitution.getVersionId().equals(versionReconstitution.getId())){
                    reconstitution.setVersion(versionReconstitution.getVersion());
                    reconstitution.setDescription(versionReconstitution.getDescription());
                }
            }
        }
        return page;
    }

    @Override
    public Long createModelReconstitution(ModelReconstitutionSaveReqVO createReqVO) {
        ModelReconstitutionDO dictType = BeanUtils.toBean(createReqVO, ModelReconstitutionDO.class);
        modelReconstitutionMapper.insert(dictType);
        return dictType.getId();
    }

    @Override
    public int updateModelReconstitution(ModelReconstitutionSaveReqVO updateReqVO) {
        // 相关校验

        // 更新模型库重构
        ModelReconstitutionDO updateObj = BeanUtils.toBean(updateReqVO, ModelReconstitutionDO.class);
        return modelReconstitutionMapper.updateById(updateObj);
    }
    @Override
    public int removeModelReconstitution(Collection<Long> idList) {
        // 批量删除模型库重构
        return modelReconstitutionMapper.deleteBatchIds(idList);
    }

    @Override
    public ModelReconstitutionDO getModelReconstitutionById(Long id) {
        return modelReconstitutionMapper.selectById(id);
    }

    @Override
    public List<ModelReconstitutionDO> getModelReconstitutionList() {
        return modelReconstitutionMapper.selectList();
    }

    @Override
    public Map<Long, ModelReconstitutionDO> getModelReconstitutionMap() {
        List<ModelReconstitutionDO> list = getModelReconstitutionList();
        return list.stream().collect(Collectors.toMap(ModelReconstitutionDO::getId, model -> model));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public String importModelReconstitution(List<ModelReconstitutionRespVO> importExcelList, boolean isUpdateSupport, String operName) {
        if (CollUtil.isEmpty(importExcelList)) {
            throw new IllegalArgumentException("导入模型库重构数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();

        // 这里应该实现导入逻辑，将 ModelReconstitutionRespVO 转换为 ModelReconstitutionDO 并保存
        for (ModelReconstitutionRespVO modelReconstitution : importExcelList) {
            try {
                ModelReconstitutionDO modelReconstitutionDO = BeanUtils.toBean(modelReconstitution, ModelReconstitutionDO.class);
                // 检查是否存在
                ModelReconstitutionDO existModelReconstitution = modelReconstitutionMapper.selectOne(
                        new LambdaQueryWrapper<ModelReconstitutionDO>()
                                .eq(ModelReconstitutionDO::getName, modelReconstitutionDO.getName())
                );
                if (existModelReconstitution == null) {
                    modelReconstitutionDO.setCreateTime(DateUtils.getNowDate());
                    modelReconstitutionMapper.insert(modelReconstitutionDO);
                    successNum++;
                    successMsg.append("<br/>").append(successNum).append("、模型库重构名称：").append(modelReconstitutionDO.getName()).append(" 导入成功");
                } else if (isUpdateSupport) {
                    modelReconstitutionDO.setId(existModelReconstitution.getId());
                    modelReconstitutionDO.setUpdateTime(DateUtils.getNowDate());
                    modelReconstitutionMapper.updateById(modelReconstitutionDO);
                    successNum++;
                    successMsg.append("<br/>").append(successNum).append("、模型库重构名称：").append(modelReconstitutionDO.getName()).append(" 更新成功");
                } else {
                    failureNum++;
                    failureMsg.append("<br/>").append(failureNum).append("、模型库重构名称：").append(modelReconstitutionDO.getName()).append(" 已存在");
                }
            } catch (Exception e) {
                failureNum++;
                String msg = "<br/>" + failureNum + "、模型库重构名称：" + modelReconstitution.getName() + " 导入失败：";
                failureMsg.append(msg).append(e.getMessage());
            }
        }
        if (failureNum > 0) {
            failureMsg.insert(0, "导入失败" + failureNum + "条模型库重构信息，错误原因如下：");
            throw new RuntimeException(failureMsg.toString());
        } else {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条");
        }
        return successMsg.toString();
    }

    @Override
    public ModelReconstitution selectModelReconstitutionById(Long id) {
        ModelReconstitutionDO modelReconstitutionDO = modelReconstitutionMapper.selectById(id);
        return BeanUtils.toBean(modelReconstitutionDO, ModelReconstitution.class);
    }

    @Override
    public List<ModelReconstitution> selectModelReconstitutionList(ModelReconstitution modelReconstitution) {
        ModelReconstitutionDO modelReconstitutionDO = BeanUtils.toBean(modelReconstitution, ModelReconstitutionDO.class);
        List<ModelReconstitutionDO> modelReconstitutionDOList = modelReconstitutionMapper.selectList(
                new LambdaQueryWrapper<ModelReconstitutionDO>()
                        .eq(modelReconstitutionDO.getCompanyId() != null, ModelReconstitutionDO::getCompanyId, modelReconstitutionDO.getCompanyId())
                        .eq(modelReconstitutionDO.getName() != null, ModelReconstitutionDO::getName, modelReconstitutionDO.getName())
                        .eq(modelReconstitutionDO.getClassifyId() != null, ModelReconstitutionDO::getClassifyId, modelReconstitutionDO.getClassifyId())
                        .eq(modelReconstitutionDO.getBuiltin() != null, ModelReconstitutionDO::getBuiltin, modelReconstitutionDO.getBuiltin())
                        .eq(modelReconstitutionDO.getAccessMode() != null, ModelReconstitutionDO::getAccessMode, modelReconstitutionDO.getAccessMode())
                        .eq(modelReconstitutionDO.getRequestMethod() != null, ModelReconstitutionDO::getRequestMethod, modelReconstitutionDO.getRequestMethod())
                        .eq(modelReconstitutionDO.getInterfaceorfileAddress() != null, ModelReconstitutionDO::getInterfaceorfileAddress, modelReconstitutionDO.getInterfaceorfileAddress())
                        .eq(modelReconstitutionDO.getVersionId() != null, ModelReconstitutionDO::getVersionId, modelReconstitutionDO.getVersionId())
                        .eq(modelReconstitutionDO.getWhetherPublish() != null, ModelReconstitutionDO::getWhetherPublish, modelReconstitutionDO.getWhetherPublish())
                        .eq(modelReconstitutionDO.getPublishTime() != null, ModelReconstitutionDO::getPublishTime, modelReconstitutionDO.getPublishTime())
                        .eq(modelReconstitutionDO.getDelFlag() != null, ModelReconstitutionDO::getDelFlag, modelReconstitutionDO.getDelFlag())
        );
        return modelReconstitutionDOList.stream()
                .map(doObj -> BeanUtils.toBean(doObj, ModelReconstitution.class))
                .collect(Collectors.toList());
    }

    @Override
    public int insertModelReconstitution(ModelReconstitution modelReconstitution) {
        ModelReconstitutionDO modelReconstitutionDO = BeanUtils.toBean(modelReconstitution, ModelReconstitutionDO.class);
        modelReconstitutionDO.setCreateTime(DateUtils.getNowDate());
        return modelReconstitutionMapper.insert(modelReconstitutionDO);
    }

    @Override
    public int updateModelReconstitution(ModelReconstitution modelReconstitution) {
        ModelReconstitutionDO modelReconstitutionDO = BeanUtils.toBean(modelReconstitution, ModelReconstitutionDO.class);
        modelReconstitutionDO.setUpdateTime(DateUtils.getNowDate());
        return modelReconstitutionMapper.updateById(modelReconstitutionDO);
    }

    @Override
    public int deleteModelReconstitutionByIds(Long[] ids) {
        return modelReconstitutionMapper.deleteBatchIds(Arrays.asList(ids));
    }

    @Override
    public int deleteModelReconstitutionById(Long id) {
        return modelReconstitutionMapper.deleteById(id);
    }

    @Override
    public int countModelReconstitution() {
        return Math.toIntExact(this.lambdaQuery()
                .eq(ModelReconstitutionDO::getDelFlag, false)
                .count());
    }

    @Override
    public int countLastWeek() {
        return (int) this.lambdaQuery()
                .eq(ModelReconstitutionDO::getDelFlag, false)
                .list().stream()
                .filter(model -> model.getCreateTime().after(DateUtils.getLastWeekStartTime())
                        && model.getCreateTime().before(DateUtils.getLastWeekEndTime())).count();
    }
}
