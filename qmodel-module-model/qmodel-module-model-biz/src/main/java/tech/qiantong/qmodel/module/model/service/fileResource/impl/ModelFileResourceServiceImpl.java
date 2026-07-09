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

import java.util.*;
import java.util.stream.Collectors;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipEntry;
import java.io.InputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.TypeReference;

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
import tech.qiantong.qmodel.config.PythonConfig;
import tech.qiantong.qmodel.module.model.controller.admin.fileResource.vo.ModelFileResourcePageReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.fileResource.vo.ModelFileResourceRespVO;
import tech.qiantong.qmodel.module.model.controller.admin.fileResource.vo.ModelFileResourceSaveReqVO;
import tech.qiantong.qmodel.module.model.controller.admin.model.vo.ModelSaveReqVO;
import tech.qiantong.qmodel.module.model.dal.dataobject.fileResource.ModelFileResourceDO;
import tech.qiantong.qmodel.module.model.dal.mapper.fileResource.ModelFileResourceMapper;
import tech.qiantong.qmodel.module.model.service.fileResource.IModelFileResourceService;
import tech.qiantong.qmodel.file.util.FileUploadUtil;
import org.dromara.x.file.storage.core.FileInfo;
import tech.qiantong.qmodel.module.model.service.fileResource.handler.ModelFileResourceDepsCheckHandler;


/**
 * 模型文件部署Service业务层处理
 *
 * @author anivia
 * @date 2026-07-07
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class ModelFileResourceServiceImpl extends ServiceImpl<ModelFileResourceMapper, ModelFileResourceDO> implements IModelFileResourceService {
    @Resource
    private ModelFileResourceMapper modelFileResourceMapper;

    @Resource
    private ModelFileResourceDepsCheckHandler depsCheckHandler;

    @Resource
    private PythonConfig pythonConfig;

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
     * @param operName        操作用户
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

    /**
     * 检测上传的ZIP文件是否符合模型文件部署的要求
     * @param file 上传的ZIP文件
     * @return
     */
    @Override
    public Map<String, Object> checkZipFile(MultipartFile file) {
        Map<String, Object> result = new HashMap<>();
        List<String> errors = new ArrayList<>();
        boolean pass = true;

        String fileName = file.getOriginalFilename();
        if (fileName == null || !fileName.toLowerCase().endsWith(".zip")) {
            errors.add("文件类型错误，仅支持ZIP格式");
            result.put("pass", false);
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

        if (pass) {
            try {
                FileInfo fileInfo = FileUploadUtil.upload(file, "temp/");
                if (fileInfo != null) {
                    String relativePath = fileInfo.getPath() + fileInfo.getFilename();
                    result.put("filePath", relativePath);
                    log.debug("文件校验通过并上传到临时目录: {}", relativePath);
                } else {
                    errors.add("文件上传失败");
                    result.put("pass", false);
                }
            } catch (Exception e) {
                log.error("上传文件到临时目录失败", e);
                errors.add("文件上传失败：" + e.getMessage());
                result.put("pass", false);
            }
        }

        return result;
    }

    @Override
    public void triggerDepsCheck(Long fileResourceId) {
        depsCheckHandler.checkDependencies(fileResourceId);
    }

    @Override
    public Map<String, Object> getBuildEnvInfo(String filePath) {
        Map<String, Object> result = new HashMap<>();
        List<String> requirements = new ArrayList<>();

        String storagePath = System.getProperty("user.dir") + "/upload/";
        String fullPath = storagePath + filePath;

        try (InputStream is = new FileInputStream(fullPath);
             ZipInputStream zis = new ZipInputStream(is, StandardCharsets.UTF_8)) {

            ZipEntry entry;
            while ((entry = zis.getNextEntry()) != null) {
                if (!entry.isDirectory() && entry.getName().endsWith("requirements.txt")) {
                    BufferedReader reader = new BufferedReader(new InputStreamReader(zis, StandardCharsets.UTF_8));
                    String line;
                    while ((line = reader.readLine()) != null) {
                        line = line.trim();
                        if (!line.isEmpty() && !line.startsWith("#")) {
                            requirements.add(line);
                        }
                    }
                    reader.close();
                    break;
                }
            }
        } catch (Exception e) {
            log.error("读取requirements.txt失败", e);
        }

        result.put("pythonVersion", pythonConfig.getVersion());
        result.put("requirements", requirements);
        return result;
    }

    @Override
    public void saveFileResourceFromModel(ModelSaveReqVO saveReqVO, Long modelId) {
        if (StringUtils.isEmpty(saveReqVO.getFilePath())) {
            log.warn("文件路径为空，跳过文件资源保存，modelId: {}", modelId);
            return;
        }

        ModelFileResourceDO fileResourceDO = new ModelFileResourceDO();
        fileResourceDO.setModelId(modelId);
        fileResourceDO.setFileName(saveReqVO.getFileName());
        fileResourceDO.setFilePath(saveReqVO.getFilePath());
        fileResourceDO.setFileSize(saveReqVO.getFileSize());
        fileResourceDO.setScriptName(StringUtils.isNotEmpty(saveReqVO.getScriptName()) ? saveReqVO.getScriptName() : "main.py");
        fileResourceDO.setResourceType(StringUtils.isNotEmpty(saveReqVO.getResourceType()) ? saveReqVO.getResourceType() : "2");
        fileResourceDO.setModelVersion(saveReqVO.getModelVersion() != null ? saveReqVO.getModelVersion() : 1L);
        fileResourceDO.setImageBuildStatus("1");
        fileResourceDO.setValidFlag(true);

        if (saveReqVO.getFileResourceId() != null) {
            fileResourceDO.setId(saveReqVO.getFileResourceId());
            modelFileResourceMapper.updateById(fileResourceDO);
            log.info("更新文件资源成功，fileResourceId: {}", saveReqVO.getFileResourceId());

            final Long fileResourceId = saveReqVO.getFileResourceId();
            TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronization() {
                @Override
                public void afterCommit() {
                    depsCheckHandler.checkDependencies(fileResourceId);
                }
            });
        } else {
            modelFileResourceMapper.insert(fileResourceDO);
            Long fileResourceId = fileResourceDO.getId();
            log.info("创建文件资源成功，fileResourceId: {}", fileResourceId);

            final Long finalFileResourceId = fileResourceId;
            TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronization() {
                @Override
                public void afterCommit() {
                    depsCheckHandler.checkDependencies(finalFileResourceId);
                }
            });
        }
    }

    @Override
    public String runModelScript(Long modelId, Map<String, Object> inputParam) {
        if (inputParam == null) {
            inputParam = new HashMap<>();
        }

        ModelFileResourceDO fileResourceDO = modelFileResourceMapper.selectOne(
                new QueryWrapper<ModelFileResourceDO>()
                        .eq("model_id", modelId)
                        .eq("del_flag", 0)
                        .last("LIMIT 1")
        );

        if (fileResourceDO == null) {
            throw new ServiceException("模型文件资源不存在，modelId: " + modelId);
        }

        String scriptPath = fileResourceDO.getDockerFilePath();
        if (scriptPath == null || scriptPath.isEmpty()) {
            throw new ServiceException("脚本路径为空，modelId: " + modelId);
        }

        String buildStatus = fileResourceDO.getImageBuildStatus();
        if (!"2".equals(buildStatus)) {
            throw new ServiceException("模型构建状态异常，当前状态: " + buildStatus + "，请等待构建完成后再执行");
        }

        File scriptFile = new File(scriptPath);
        if (!scriptFile.exists()) {
            throw new ServiceException("脚本文件不存在: " + scriptPath);
        }

        File workDir = scriptFile.getParentFile();
        String scriptName = scriptFile.getName();

        String pythonCmd = getPythonCommand();
        String paramJson = JSON.toJSONString(inputParam);

        log.info("开始执行模型脚本，modelId: {}, scriptPath: {}, workDir: {}", modelId, scriptPath, workDir.getAbsolutePath());

        try {
            ProcessBuilder pb = new ProcessBuilder(pythonCmd, scriptName);
            pb.directory(workDir);
            pb.redirectErrorStream(true);

            Map<String, String> env = pb.environment();
            env.put("PYTHONIOENCODING", "utf-8");
            String osName = System.getProperty("os.name").toLowerCase();
            if (!osName.contains("win")) {
                env.put("LANG", "en_US.UTF-8");
            }

            Process process = pb.start();

            try (OutputStream os = process.getOutputStream()) {
                os.write(paramJson.getBytes(StandardCharsets.UTF_8));
                os.flush();
            }

            StringBuilder output = new StringBuilder();
            try (BufferedReader reader = new BufferedReader(
                    new InputStreamReader(process.getInputStream(), StandardCharsets.UTF_8))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    output.append(line).append("\n");
                }
            }

            Long timeout = fileResourceDO.getExecTimeout();
            if (timeout == null || timeout <= 0) {
                timeout = 300L;
            }

            boolean completed = process.waitFor(timeout, TimeUnit.SECONDS);
            if (!completed) {
                process.destroyForcibly();
                throw new ServiceException("脚本执行超时，超时时间: " + timeout + "秒");
            }

            int exitCode = process.exitValue();
            if (exitCode != 0) {
                throw new ServiceException("Python脚本异常退出，退出码：" + exitCode + "，输出日志：" + output);
            }

            log.info("模型脚本执行成功，modelId: {}", modelId);
            return output.toString().trim();

        } catch (ServiceException e) {
            throw e;
        } catch (Exception e) {
            log.error("执行模型脚本失败，modelId: {}", modelId, e);
            throw new ServiceException("执行模型脚本失败：" + e.getMessage());
        }
    }

    private String getPythonCommand() {
        String osName = System.getProperty("os.name").toLowerCase();
        if (osName.contains("win")) {
            return "python";
        } else {
            return "python3";
        }
    }

    @Override
    public String runModelScript(Long modelId, String paramsJson, String fileKeys, List<MultipartFile> files) {
        Map<String, Object> inputParam = new HashMap<>();

        if (StringUtils.isNotBlank(paramsJson)) {
            try {
                inputParam = JSON.parseObject(paramsJson, new TypeReference<Map<String, Object>>() {});
            } catch (Exception e) {
                log.error("参数解析失败: {}", paramsJson, e);
                throw new ServiceException("参数解析失败: " + e.getMessage());
            }
        }

        if (files != null && !files.isEmpty()) {
            List<String> keyList = new ArrayList<>();
            if (StringUtils.isNotBlank(fileKeys)) {
                keyList = Arrays.asList(fileKeys.split(","));
            }

            for (int i = 0; i < files.size(); i++) {
                MultipartFile file = files.get(i);
                String filePath = saveFileToTemp(file);
                String key = (i < keyList.size()) ? keyList.get(i).trim() : file.getOriginalFilename();
                inputParam.put(key, filePath);
            }
        }

        return runModelScript(modelId, inputParam);
    }

    @Override
    public String saveFileToTemp(MultipartFile file) {
        try {
            String tempDir = System.getProperty("user.dir") + "/upload/temp/script/";
            File dir = new File(tempDir);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
            File destFile = new File(tempDir + fileName);
            file.transferTo(destFile);
            String filePath = destFile.getAbsolutePath();
            log.info("文件保存到临时目录成功: {}", filePath);
            return filePath;
        } catch (Exception e) {
            log.error("文件保存失败", e);
            throw new ServiceException("文件保存失败: " + e.getMessage());
        }
    }
}
