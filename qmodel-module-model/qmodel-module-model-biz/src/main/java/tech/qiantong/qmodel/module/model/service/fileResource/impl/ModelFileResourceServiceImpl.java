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

package tech.qiantong.qmodel.module.model.service.fileResource.impl;

import java.util.Collection;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.util.stream.Collectors;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipEntry;
import java.io.InputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.regex.Pattern;
import org.springframework.transaction.support.TransactionSynchronizationManager;
import org.springframework.transaction.support.TransactionSynchronization;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import javax.annotation.Resource;

import org.springframework.web.multipart.MultipartFile;
import tech.qiantong.qmodel.common.core.page.PageResult;
import tech.qiantong.qmodel.common.utils.object.BeanUtils;
import tech.qiantong.qmodel.common.utils.StringUtils;
import tech.qiantong.qmodel.common.exception.ServiceException;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.qiantong.qmodel.module.model.controller.admin.fileResource.vo.ModelFileResourcePageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.fileResource.vo.ModelFileResourceRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.fileResource.vo.ModelFileResourceSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.fileResource.ModelFileResourceDO;
import tech.qiantong.qmodel.module.model.dal.mapper.fileResource.ModelFileResourceMapper;
import tech.qiantong.qmodel.module.model.service.fileResource.IModelFileResourceService;
/**
 * 模型文件部署Service业务层处理
 *
 * @author anivia
 * @date 2026-07-07
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class ModelFileResourceServiceImpl  extends ServiceImpl<ModelFileResourceMapper,ModelFileResourceDO> implements IModelFileResourceService {
    @Resource
    private ModelFileResourceMapper modelFileResourceMapper;

    @Resource
    private tech.qiantong.qmodel.module.model.service.fileResource.handler.ModelFileResourceDepsCheckHandler depsCheckHandler;

    @Override
    public PageResult<ModelFileResourceDO> getModelFileResourcePage(ModelFileResourcePageReqVO pageReqVO) {
        return modelFileResourceMapper.selectPage(pageReqVO);
    }

    @Override
    public Long createModelFileResource(ModelFileResourceSaveReqVO createReqVO) {
        ModelFileResourceDO dictType = BeanUtils.toBean(createReqVO, ModelFileResourceDO.class);
        dictType.setImageBuildStatus("0");
        modelFileResourceMapper.insert(dictType);
        final Long fileResourceId = dictType.getId();
        TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronization() {
            @Override
            public void afterCommit() {
                depsCheckHandler.checkDependencies(fileResourceId);
            }
        });
        return dictType.getId();
    }

    @Override
    public int updateModelFileResource(ModelFileResourceSaveReqVO updateReqVO) {
        ModelFileResourceDO updateObj = BeanUtils.toBean(updateReqVO, ModelFileResourceDO.class);
        int result = modelFileResourceMapper.updateById(updateObj);
        if (result > 0 && updateObj.getId() != null) {
            final Long fileResourceId = updateObj.getId();
            TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronization() {
                @Override
                public void afterCommit() {
                    depsCheckHandler.checkDependencies(fileResourceId);
                }
            });
        }
        return result;
    }
    @Override
    public int removeModelFileResource(Collection<Long> idList) {
        // 批量删除模型文件部署
        return modelFileResourceMapper.deleteBatchIds(idList);
    }

    @Override
    public ModelFileResourceDO getModelFileResourceById(Long id) {
        return modelFileResourceMapper.selectById(id);
    }

    @Override
    public List<ModelFileResourceDO> getModelFileResourceList() {
        return modelFileResourceMapper.selectList();
    }

    @Override
    public Map<Long, ModelFileResourceDO> getModelFileResourceMap() {
        List<ModelFileResourceDO> modelFileResourceList = modelFileResourceMapper.selectList();
        return modelFileResourceList.stream()
                .collect(Collectors.toMap(
                        ModelFileResourceDO::getId,
                        modelFileResourceDO -> modelFileResourceDO,
                        // 保留已存在的值
                        (existing, replacement) -> existing
                ));
    }


        /**
         * 导入模型文件部署数据
         *
         * @param importExcelList 模型文件部署数据列表
         * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
         * @param operName 操作用户
         * @return 结果
         */
        @Override
        public String importModelFileResource(List<ModelFileResourceRespVO> importExcelList, boolean isUpdateSupport, String operName) {
            if (StringUtils.isNull(importExcelList) || importExcelList.size() == 0) {
                throw new ServiceException("导入数据不能为空！");
            }

            int successNum = 0;
            int failureNum = 0;
            List<String> successMessages = new ArrayList<>();
            List<String> failureMessages = new ArrayList<>();

            for (ModelFileResourceRespVO respVO : importExcelList) {
                try {
                    ModelFileResourceDO modelFileResourceDO = BeanUtils.toBean(respVO, ModelFileResourceDO.class);
                    Long modelFileResourceId = respVO.getId();
                    if (isUpdateSupport) {
                        if (modelFileResourceId != null) {
                            ModelFileResourceDO existingModelFileResource = modelFileResourceMapper.selectById(modelFileResourceId);
                            if (existingModelFileResource != null) {
                                modelFileResourceMapper.updateById(modelFileResourceDO);
                                successNum++;
                                successMessages.add("数据更新成功，ID为 " + modelFileResourceId + " 的模型文件部署记录。");
                            } else {
                                failureNum++;
                                failureMessages.add("数据更新失败，ID为 " + modelFileResourceId + " 的模型文件部署记录不存在。");
                            }
                        } else {
                            failureNum++;
                            failureMessages.add("数据更新失败，某条记录的ID不存在。");
                        }
                    } else {
                        QueryWrapper<ModelFileResourceDO> queryWrapper = new QueryWrapper<>();
                        queryWrapper.eq("id", modelFileResourceId);
                        ModelFileResourceDO existingModelFileResource = modelFileResourceMapper.selectOne(queryWrapper);
                        if (existingModelFileResource == null) {
                            modelFileResourceMapper.insert(modelFileResourceDO);
                            successNum++;
                            successMessages.add("数据插入成功，ID为 " + modelFileResourceId + " 的模型文件部署记录。");
                        } else {
                            failureNum++;
                            failureMessages.add("数据插入失败，ID为 " + modelFileResourceId + " 的模型文件部署记录已存在。");
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
    public Map<String, Object> checkZipFile(MultipartFile file) {
        Map<String, Object> result = new HashMap<>();
        List<String> errors = new ArrayList<>();
        boolean pass = true;

        String fileName = file.getOriginalFilename();
        if (fileName == null || !fileName.toLowerCase().endsWith(".zip")) {
            errors.add("文件类型错误，仅支持ZIP格式");
            pass = false;
            result.put("pass", pass);
            result.put("errors", errors);
            return result;
        }

        boolean hasMainPy = false;
        boolean hasRequirementsTxt = false;
        boolean hasPredictFunction = false;
        ZipInputStream zipInputStream = null;

        try {
            InputStream inputStream = file.getInputStream();
            zipInputStream = new ZipInputStream(inputStream);
            ZipEntry entry;
            Pattern predictPattern = Pattern.compile("\\s*def\\s+predict\\s*\\(");

            while ((entry = zipInputStream.getNextEntry()) != null) {
                String entryName = entry.getName();
                if (!entry.isDirectory()) {
                    if (entryName.endsWith("main.py")) {
                        hasMainPy = true;
                        // 直接读取内容到字节数组，避免关闭底层流
                        byte[] content = new byte[(int) entry.getSize()];
                        zipInputStream.read(content);
                        String contentStr = new String(content, StandardCharsets.UTF_8);
                        if (predictPattern.matcher(contentStr).find()) {
                            hasPredictFunction = true;
                        }
                    } else if (entryName.endsWith("requirements.txt")) {
                        hasRequirementsTxt = true;
                    }
                }
            }
        } catch (Exception e) {
            log.error("检测ZIP文件失败", e);
            errors.add("ZIP文件解析失败：" + e.getMessage());
            pass = false;
        } finally {
            if (zipInputStream != null) {
                try {
                    zipInputStream.close();
                } catch (Exception e) {
                    log.error("关闭ZipInputStream失败", e);
                }
            }
        }

        if (!hasMainPy) {
            errors.add("压缩包内缺少main.py文件");
            pass = false;
        }
        if (!hasRequirementsTxt) {
            errors.add("压缩包内缺少requirements.txt文件");
            pass = false;
        }
        if (hasMainPy && !hasPredictFunction) {
            errors.add("main.py中缺少predict函数定义");
            pass = false;
        }

        result.put("pass", pass);
        result.put("errors", errors);
        result.put("mainPy", hasMainPy);
        result.put("requirementsTxt", hasRequirementsTxt);
        result.put("predictFunction", hasPredictFunction);
        return result;
    }

        @Override
        public void triggerDepsCheck(Long fileResourceId) {
            depsCheckHandler.checkDependencies(fileResourceId);
        }
}
