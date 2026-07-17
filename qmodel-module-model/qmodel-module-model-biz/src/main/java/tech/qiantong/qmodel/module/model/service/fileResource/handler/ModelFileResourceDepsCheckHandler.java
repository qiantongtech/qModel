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

package tech.qiantong.qmodel.module.model.service.fileResource.handler;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;
import javax.annotation.Resource;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import tech.qiantong.qmodel.common.utils.DateUtils;
import tech.qiantong.qmodel.module.model.dal.dataobject.fileResource.ModelFileResourceDO;
import tech.qiantong.qmodel.module.model.dal.dataobject.model.ModelDO;
import tech.qiantong.qmodel.module.model.dal.mapper.fileResource.ModelFileResourceMapper;
import tech.qiantong.qmodel.module.model.dal.mapper.model.ModelMapper;
import tech.qiantong.qmodel.module.model.enums.ImageBuildStatusEnum;
import tech.qiantong.qmodel.module.model.enums.ModelStatusEnum;
import tech.qiantong.qmodel.module.model.enums.PipMirrorEnum;
import tech.qiantong.qmodel.module.model.service.buildLog.IModelBuildLogService;
import com.alibaba.fastjson.JSON;

@Slf4j
@Component
public class ModelFileResourceDepsCheckHandler {

    @Resource
    private ModelFileResourceMapper modelFileResourceMapper;

    @Resource
    private ModelMapper modelMapper;

    @Resource
    private IModelBuildLogService modelBuildLogService;

    private static final Pattern REQUIREMENT_PATTERN = Pattern.compile("^([A-Za-z0-9][A-Za-z0-9._-]*)([><=!~].+)?$");
    private static final Pattern PIP_LIST_PATTERN = Pattern.compile("^([A-Za-z0-9][A-Za-z0-9._-]+)(==.+)?$");
    private static final String STORAGE_PATH = System.getProperty("user.dir") + "/upload/";

    // pip 镜像源列表
    private static final List<String> PIP_MIRRORS = PipMirrorEnum.getMirrorUrls();

    @Async("threadPoolTaskExecutor")
    public void checkDependencies(Long fileResourceId) {
        log.info("开始异步检测依赖，fileResourceId: {}", fileResourceId);

        Long buildLogId = null;
        StringBuilder buildLogBuilder = new StringBuilder();
        String requirementsContent = "";
        ModelFileResourceDO fileResource = null;
        try {
            fileResource = modelFileResourceMapper.selectById(fileResourceId);
            if (fileResource == null) {
                log.warn("文件资源不存在，fileResourceId: {}", fileResourceId);
                return;
            }

            buildLogId = modelBuildLogService.createBuildLogStart(
                    fileResourceId,
                    fileResource.getModelId(),
                    fileResource.getFileName(),
                    1
            );
            buildLogBuilder.append("========== 开始依赖检测 ==========\n");
            buildLogBuilder.append("时间: ").append(DateUtils.getTime()).append("\n");
            buildLogBuilder.append("文件资源ID: ").append(fileResourceId).append("\n");
            buildLogBuilder.append("模型ID: ").append(fileResource.getModelId()).append("\n");
            buildLogBuilder.append("文件名: ").append(fileResource.getFileName()).append("\n\n");

            updateStatus(fileResourceId, ImageBuildStatusEnum.CHECKING.getStatus(), null, null);

            String relativePath = fileResource.getFilePath();
            if (relativePath == null || relativePath.isEmpty()) {
                String errorMsg = "文件路径为空";
                log.warn("{}, fileResourceId: {}", errorMsg, fileResourceId);
                buildLogBuilder.append("错误: ").append(errorMsg).append("\n");
                modelBuildLogService.updateBuildLogFailed(buildLogId, errorMsg, null, buildLogBuilder.toString());
                updateStatus(fileResourceId, ImageBuildStatusEnum.FAILED.getStatus(), null, null);
                updateModelStatus(fileResource.getModelId(), ModelStatusEnum.BUILD_FAILED.getStatus());
                return;
            }

            String zipFilePath = STORAGE_PATH + relativePath;
            log.info("ZIP文件完整路径: {}", zipFilePath);

            String extractDir = extractZipToTemp(zipFilePath, fileResourceId);
            if (extractDir == null) {
                String errorMsg = "解压ZIP文件失败";
                log.warn("{}, fileResourceId: {}", errorMsg, fileResourceId);
                buildLogBuilder.append("错误: ").append(errorMsg).append("\n");
                modelBuildLogService.updateBuildLogFailed(buildLogId, errorMsg, null, buildLogBuilder.toString());
                updateStatus(fileResourceId, ImageBuildStatusEnum.FAILED.getStatus(), null, null);
                updateModelStatus(fileResource.getModelId(), ModelStatusEnum.BUILD_FAILED.getStatus());
                return;
            }
//            buildLogBuilder.append("解压目录: ").append(extractDir).append("\n");

            String scriptPath = findMainPyPath(extractDir);
            String depsPath = findRequirementsTxtPath(extractDir);

            log.info("找到入口文件: {}, 依赖文件: {}", scriptPath, depsPath);
            String scriptFileName = scriptPath != null ? Paths.get(scriptPath).getFileName().toString() : "未找到";
            String depsFileName = depsPath != null ? Paths.get(depsPath).getFileName().toString() : "未找到";
            buildLogBuilder.append("入口文件: ").append(scriptFileName).append("\n");
            buildLogBuilder.append("依赖文件: ").append(depsFileName).append("\n\n");

            List<String> requirements = parseRequirements(depsPath);
            if (depsPath != null) {
                requirementsContent = readFileContent(depsPath);
            }

            if (requirements.isEmpty()) {
                log.warn("requirements.txt为空或不存在，fileResourceId: {}", fileResourceId);
                buildLogBuilder.append("requirements.txt为空或不存在，无需安装依赖\n");
                buildLogBuilder.append("========== 依赖检测完成 ==========\n");
                modelBuildLogService.updateBuildLogSuccess(
                        buildLogId,
                        JSON.toJSONString(new ArrayList<>()),
                        JSON.toJSONString(new ArrayList<>()),
                        requirementsContent,
                        buildLogBuilder.toString()
                );
                updateStatus(fileResourceId, ImageBuildStatusEnum.SUCCESS.getStatus(), scriptPath, depsPath);
                return;
            }

            buildLogBuilder.append("检测到依赖包: ").append(requirements.size()).append(" 个\n");
            buildLogBuilder.append("依赖列表: ").append(String.join(", ", requirements)).append("\n\n");

            Set<String> installedPackages = getInstalledPackages();

            int installedCount = 0;
            for (String requirement : requirements) {
                String pkgName = extractPackageName(requirement);
                String normalizedName = normalizePackageName(pkgName);
                if (installedPackages.contains(normalizedName)) {
                    installedCount++;
                }
            }
            buildLogBuilder.append("已安装依赖包数量: ").append(installedCount).append("\n\n");

            boolean allInstalled = checkAllDependenciesInstalled(requirements, installedPackages);

            if (allInstalled) {
                buildLogBuilder.append("========== 依赖检测完成 ==========\n");
                modelBuildLogService.updateBuildLogSuccess(
                        buildLogId,
                        JSON.toJSONString(requirements),
                        JSON.toJSONString(new ArrayList<>()),
                        requirementsContent,
                        buildLogBuilder.toString()
                );
                updateStatus(fileResourceId, ImageBuildStatusEnum.SUCCESS.getStatus(), scriptPath, depsPath);
                updateModelStatus(fileResource.getModelId(), ModelStatusEnum.ENABLED.getStatus());
                log.info("依赖检测通过，fileResourceId: {}", fileResourceId);
            } else {
                buildLogBuilder.append("开始安装缺失的依赖包...\n");
                boolean installSuccess = installMissingDependencies(requirements, installedPackages);
                if (installSuccess) {
                    buildLogBuilder.append("依赖包安装成功\n");
                    buildLogBuilder.append("========== 依赖检测完成 ==========\n");
                    modelBuildLogService.updateBuildLogSuccess(
                            buildLogId,
                            JSON.toJSONString(requirements),
                            JSON.toJSONString(new ArrayList<>()),
                            requirementsContent,
                            buildLogBuilder.toString()
                    );
                    updateStatus(fileResourceId, ImageBuildStatusEnum.SUCCESS.getStatus(), scriptPath, depsPath);
                    updateModelStatus(fileResource.getModelId(), ModelStatusEnum.ENABLED.getStatus());
                    log.info("依赖安装成功，fileResourceId: {}", fileResourceId);
                } else {
                    buildLogBuilder.append("依赖包安装失败\n");
                    buildLogBuilder.append("========== 依赖检测失败 ==========\n");
                    modelBuildLogService.updateBuildLogFailed(
                            buildLogId,
                            "依赖包安装失败",
                            JSON.toJSONString(requirements),
                            buildLogBuilder.toString()
                    );
                    updateStatus(fileResourceId, ImageBuildStatusEnum.FAILED.getStatus(), scriptPath, depsPath);
                    updateModelStatus(fileResource.getModelId(), ModelStatusEnum.BUILD_FAILED.getStatus());
                    log.warn("依赖安装失败，fileResourceId: {}", fileResourceId);
                }
            }

        } catch (Exception e) {
            log.error("依赖检测异常，fileResourceId: {}", fileResourceId, e);
            buildLogBuilder.append("异常: ").append(e.getMessage()).append("\n");
            buildLogBuilder.append("========== 依赖检测异常 ==========\n");
            if (buildLogId != null) {
                modelBuildLogService.updateBuildLogFailed(buildLogId, e.getMessage(), null, buildLogBuilder.toString());
            }
            try {
                updateStatus(fileResourceId, ImageBuildStatusEnum.FAILED.getStatus(), null, null);
                updateModelStatus(fileResource.getModelId(), ModelStatusEnum.BUILD_FAILED.getStatus());
            } catch (Exception updateEx) {
                log.error("更新状态失败，fileResourceId: {}", fileResourceId, updateEx);
            }
        }
    }

    private String readFileContent(String filePath) {
        StringBuilder content = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(
                new InputStreamReader(Files.newInputStream(Paths.get(filePath)), StandardCharsets.UTF_8))) {
            String line;
            while ((line = reader.readLine()) != null) {
                content.append(line).append("\n");
            }
        } catch (Exception e) {
            log.error("读取文件内容失败，路径: {}", filePath, e);
        }
        return content.toString();
    }

    private String extractZipToTemp(String zipFilePath, Long fileResourceId) {
        String extractDir = STORAGE_PATH + "temp/extract/" + fileResourceId + "/";
        Path extractPath = Paths.get(extractDir);

        try {
            if (Files.exists(extractPath)) {
                deleteDirectory(extractPath.toFile());
            }
            Files.createDirectories(extractPath);

            try (InputStream is = Files.newInputStream(Paths.get(zipFilePath));
                 ZipInputStream zis = new ZipInputStream(is, StandardCharsets.UTF_8)) {

                ZipEntry entry;
                while ((entry = zis.getNextEntry()) != null) {
                    Path entryPath = extractPath.resolve(entry.getName()).normalize();

                    if (!entryPath.startsWith(extractPath)) {
                        log.warn("ZIP条目路径超出解压目录: {}", entry.getName());
                        continue;
                    }

                    if (entry.isDirectory()) {
                        Files.createDirectories(entryPath);
                    } else {
                        Files.createDirectories(entryPath.getParent());
                        Files.copy(zis, entryPath);
                    }
                    zis.closeEntry();
                }
            }

            log.info("ZIP文件解压成功，解压目录: {}", extractDir);
            return extractDir;
        } catch (Exception e) {
            log.error("解压ZIP文件失败，fileResourceId: {}", fileResourceId, e);
            return null;
        }
    }

    private void deleteDirectory(File directory) {
        if (directory.exists()) {
            File[] files = directory.listFiles();
            if (files != null) {
                for (File file : files) {
                    if (file.isDirectory()) {
                        deleteDirectory(file);
                    } else {
                        file.delete();
                    }
                }
            }
            directory.delete();
        }
    }

    private String findMainPyPath(String extractDir) {
        Path extractPath = Paths.get(extractDir);
        try {
            return Files.walk(extractPath)
                    .filter(Files::isRegularFile)
                    .filter(p -> p.getFileName().toString().equals("main.py"))
                    .findFirst()
                    .map(p -> p.toAbsolutePath().normalize().toString())
                    .orElse(null);
        } catch (Exception e) {
            log.error("查找main.py失败", e);
            return null;
        }
    }

    private String findRequirementsTxtPath(String extractDir) {
        Path extractPath = Paths.get(extractDir);
        try {
            return Files.walk(extractPath)
                    .filter(Files::isRegularFile)
                    .filter(p -> p.getFileName().toString().equals("requirements.txt"))
                    .findFirst()
                    .map(p -> p.toAbsolutePath().normalize().toString())  // 返回规范化的绝对路径
                    .orElse(null);
        } catch (Exception e) {
            log.error("查找requirements.txt失败", e);
            return null;
        }
    }

    /**
     * 将绝对路径转换为相对于 STORAGE_PATH 的相对路径
     * @param absolutePath 绝对路径
     * @return 相对路径
     */
    private String getRelativePath(String absolutePath) {
        if (absolutePath == null) {
            return null;
        }
        // 移除 STORAGE_PATH 前缀，得到相对路径
        if (absolutePath.startsWith(STORAGE_PATH)) {
            return absolutePath.substring(STORAGE_PATH.length());
        }
        return absolutePath;
    }

    private List<String> parseRequirements(String requirementsPath) {
        List<String> requirements = new ArrayList<>();

        if (requirementsPath == null || requirementsPath.isEmpty()) {
            return requirements;
        }

        try (BufferedReader reader = new BufferedReader(
                new InputStreamReader(Files.newInputStream(Paths.get(requirementsPath)), StandardCharsets.UTF_8))) {
            String line;
            while ((line = reader.readLine()) != null) {
                line = line.trim();
                if (!line.isEmpty() && !line.startsWith("#")) {
                    Matcher matcher = REQUIREMENT_PATTERN.matcher(line);
                    if (matcher.matches()) {
                        requirements.add(line);
                    }
                }
            }
        } catch (Exception e) {
            log.error("读取requirements.txt失败，路径: {}", requirementsPath, e);
        }

        return requirements;
    }

    private Set<String> getInstalledPackages() {
        Set<String> installedPackages = new HashSet<>();
        String pythonCmd = getPythonCommand();

        try {
            ProcessBuilder pb = new ProcessBuilder(pythonCmd, "-m", "pip", "list", "--format=freeze");
            setupProcessBuilder(pb);

            Process process = pb.start();
            boolean completed = process.waitFor(5, TimeUnit.MINUTES);

            if (completed && process.exitValue() == 0) {
                BufferedReader reader = new BufferedReader(
                        new InputStreamReader(process.getInputStream(), StandardCharsets.UTF_8));
                String line;
                while ((line = reader.readLine()) != null) {
                    line = line.trim().toLowerCase();
                    Matcher matcher = PIP_LIST_PATTERN.matcher(line);
                    if (matcher.matches()) {
                        String pkgName = normalizePackageName(matcher.group(1));
                        installedPackages.add(pkgName);
                    }
                }
                reader.close();
            } else {
                log.warn("获取已安装包列表失败");
                if (!completed) {
                    process.destroyForcibly();
                }
            }
        } catch (Exception e) {
            log.error("获取已安装包列表异常", e);
        }
        return installedPackages;
    }

    private boolean checkAllDependenciesInstalled(List<String> requirements, Set<String> installedPackages) {
        for (String requirement : requirements) {
            String pkgName = extractPackageName(requirement);
            String normalizedName = normalizePackageName(pkgName);
            if (!installedPackages.contains(normalizedName)) {
                log.info("缺少依赖包: {}", pkgName);
                return false;
            }
        }
        return true;
    }

    private boolean installMissingDependencies(List<String> requirements, Set<String> installedPackages) {
        // 过滤出需要安装的缺失依赖包
        List<String> missingPackages = requirements.stream()
                .map(this::extractPackageName)
                .map(this::normalizePackageName)
                .filter(pkg -> !installedPackages.contains(pkg))
                .collect(Collectors.toList());

        if (missingPackages.isEmpty()) {
            return true;
        }

        String pythonCmd = getPythonCommand();

        // 依次尝试每个镜像源
        for (int i = 0; i < PIP_MIRRORS.size(); i++) {
            String mirror = PIP_MIRRORS.get(i);
            boolean success = tryInstallWithMirror(pythonCmd, missingPackages, mirror);

            if (success) {
                log.info("使用镜像源 [{}] 安装依赖成功", mirror);
                return true;
            }

            // 如果不是最后一个镜像源，记录日志并尝试下一个
            if (i < PIP_MIRRORS.size() - 1) {
                log.warn("镜像源 [{}] 安装失败，尝试下一个镜像源", mirror);
            }
        }

        // 所有镜像源都失败
        log.error("所有镜像源都无法安装依赖包: {}", missingPackages);
        return false;
    }

    /**
     * 使用指定镜像源尝试安装依赖包
     */
    private boolean tryInstallWithMirror(String pythonCmd, List<String> missingPackages, String mirror) {
        List<String> cmdArgs = new ArrayList<>();
        cmdArgs.add(pythonCmd);
        cmdArgs.add("-m");
        cmdArgs.add("pip");
        cmdArgs.add("install");
        cmdArgs.add("--break-system-packages");
        cmdArgs.add("-v");
        cmdArgs.add("-i");
        cmdArgs.add(mirror);
        cmdArgs.addAll(missingPackages);

        try {
            ProcessBuilder pb = new ProcessBuilder(cmdArgs);
            setupProcessBuilder(pb);

            log.info("使用镜像源 [{}] 安装依赖包: {}", mirror, missingPackages);
            Process process = pb.start();
            boolean completed = process.waitFor(30, TimeUnit.MINUTES);

            if (completed && process.exitValue() == 0) {
                return true;
            } else {
                // 收集错误信息（不抛出异常，继续尝试下一个镜像源）
                StringBuilder errorOutput = new StringBuilder();
                BufferedReader errorReader = new BufferedReader(
                        new InputStreamReader(process.getErrorStream(), StandardCharsets.UTF_8));
                String line;
                while ((line = errorReader.readLine()) != null) {
                    errorOutput.append(line).append("\n");
                }
                errorReader.close();

                if (completed) {
                    log.warn("镜像源 [{}] 安装失败，退出码: {}", mirror, process.exitValue());
                } else {
                    process.destroyForcibly();
                    log.warn("镜像源 [{}] 安装超时", mirror);
                }
                return false;
            }
        } catch (Exception e) {
            log.warn("镜像源 [{}] 安装异常: {}", mirror, e.getMessage());
            return false;
        }
    }

    private String getPythonCommand() {
        return System.getProperty("os.name").toLowerCase().contains("win")
                ? "python"
                : "python3";
    }

    private void setupProcessBuilder(ProcessBuilder pb) {
        Map<String, String> env = pb.environment();
        env.put("PYTHONIOENCODING", "UTF-8");

        String osName = System.getProperty("os.name").toLowerCase();
        if (!osName.contains("win")) {
            env.put("LANG", "en_US.UTF-8");
        }

        pb.redirectErrorStream(true);
    }

    private String extractPackageName(String requirement) {
        Matcher matcher = REQUIREMENT_PATTERN.matcher(requirement);
        if (matcher.matches()) {
            return matcher.group(1);
        }
        return requirement;
    }

    private String normalizePackageName(String name) {
        return name.toLowerCase().replace("-", "_");
    }

    private void updateStatus(Long fileResourceId, String status, String scriptPath, String depsPath) {
        UpdateWrapper<ModelFileResourceDO> wrapper = new UpdateWrapper<>();
        wrapper.eq("id", fileResourceId)
                .set("image_build_status", status)
                .set("update_by", "system")
                .set("updator_id", 1L)
                .set("update_time", new java.util.Date());

        if (scriptPath != null) {
            wrapper.set("docker_file_path", scriptPath);
        }
        if (depsPath != null) {
            wrapper.set("deps_file_path", depsPath);
        }

        modelFileResourceMapper.update(null, wrapper);
    }

    private void updateModelStatus(Long modelId, String status) {
        UpdateWrapper<ModelDO> wrapper = new UpdateWrapper<>();
        wrapper.eq("id", modelId)
                .set("status", status)
                .set("update_by", "system")
                .set("updator_id", 1L)
                .set("update_time", new Date());
        modelMapper.update(null, wrapper);
    }

}
