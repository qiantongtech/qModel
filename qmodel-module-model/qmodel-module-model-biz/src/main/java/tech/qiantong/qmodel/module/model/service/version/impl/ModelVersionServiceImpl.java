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

package tech.qiantong.qmodel.module.model.service.version.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.exception.ServiceException;
import tech.qiantong.qmodel.common.utils.StringUtils;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.module.model.controller.admin.version.vo.ModelVersionPageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.version.vo.ModelVersionRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.version.vo.ModelVersionSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.version.ModelVersionDO;
import tech.qiantong.qmodel.module.model.dal.mapper.version.ModelVersionMapper;
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
    public int updateModelVersion(ModelVersionSaveReqVO updateReqVO) {
        // 相关校验

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
}
