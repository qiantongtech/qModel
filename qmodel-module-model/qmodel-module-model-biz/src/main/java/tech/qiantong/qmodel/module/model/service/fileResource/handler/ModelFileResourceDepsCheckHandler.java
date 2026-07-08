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
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import tech.qiantong.qmodel.module.model.dal.dataobject.fileResource.ModelFileResourceDO;
import tech.qiantong.qmodel.module.model.dal.mapper.fileResource.ModelFileResourceMapper;

@Slf4j
@Component
public class ModelFileResourceDepsCheckHandler {

    @Resource
    private ModelFileResourceMapper modelFileResourceMapper;

    private static final Pattern REQUIREMENT_PATTERN = Pattern.compile("^([A-Za-z0-9][A-Za-z0-9._-]*)([><=!~].+)?$");
    private static final Pattern PIP_LIST_PATTERN = Pattern.compile("^([A-Za-z0-9][A-Za-z0-9._-]+)(==.+)?$");

    private static final String STATUS_UNCHECKED = "0";
    private static final String STATUS_CHECKING = "1";
    private static final String STATUS_SUCCESS = "2";
    private static final String STATUS_FAILED = "3";

    @Async("threadPoolTaskExecutor")
    public void checkDependencies(Long fileResourceId) {
        log.info("开始异步检测依赖，fileResourceId: {}", fileResourceId);
        
        try {
            ModelFileResourceDO fileResource = modelFileResourceMapper.selectById(fileResourceId);
            if (fileResource == null) {
                log.warn("文件资源不存在，fileResourceId: {}", fileResourceId);
                return;
            }

            updateStatus(fileResourceId, STATUS_CHECKING);

            String zipFilePath = fileResource.getFilePath();
            if (zipFilePath == null || zipFilePath.isEmpty()) {
                log.warn("文件路径为空，fileResourceId: {}", fileResourceId);
                updateStatus(fileResourceId, STATUS_FAILED);
                return;
            }

            List<String> requirements = parseRequirementsFromZip(zipFilePath);
            if (requirements.isEmpty()) {
                log.warn("requirements.txt为空或不存在，fileResourceId: {}", fileResourceId);
                updateStatus(fileResourceId, STATUS_SUCCESS);
                return;
            }

            Set<String> installedPackages = getInstalledPackages();
            boolean allInstalled = checkAllDependenciesInstalled(requirements, installedPackages);

            if (allInstalled) {
                updateStatus(fileResourceId, STATUS_SUCCESS);
                log.info("依赖检测通过，fileResourceId: {}", fileResourceId);
            } else {
                boolean installSuccess = installMissingDependencies(requirements, installedPackages);
                if (installSuccess) {
                    updateStatus(fileResourceId, STATUS_SUCCESS);
                    log.info("依赖安装成功，fileResourceId: {}", fileResourceId);
                } else {
                    updateStatus(fileResourceId, STATUS_FAILED);
                    log.warn("依赖安装失败，fileResourceId: {}", fileResourceId);
                }
            }

        } catch (Exception e) {
            log.error("依赖检测异常，fileResourceId: {}", fileResourceId, e);
            try {
                updateStatus(fileResourceId, STATUS_FAILED);
            } catch (Exception updateEx) {
                log.error("更新状态失败，fileResourceId: {}", fileResourceId, updateEx);
            }
        }
    }

    private List<String> parseRequirementsFromZip(String zipFilePath) throws IOException {
        List<String> requirements = new ArrayList<>();
        Path zipPath = Paths.get(zipFilePath);
        
        if (!Files.exists(zipPath)) {
            log.warn("ZIP文件不存在: {}", zipFilePath);
            return requirements;
        }

        try (InputStream is = Files.newInputStream(zipPath);
             ZipInputStream zis = new ZipInputStream(is, StandardCharsets.UTF_8)) {
            
            ZipEntry entry;
            while ((entry = zis.getNextEntry()) != null) {
                if (!entry.isDirectory() && entry.getName().endsWith("requirements.txt")) {
                    BufferedReader reader = new BufferedReader(new InputStreamReader(zis, StandardCharsets.UTF_8));
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
                    reader.close();
                    break;
                }
            }
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
        List<String> missingPackages = new ArrayList<>();
        for (String requirement : requirements) {
            String pkgName = extractPackageName(requirement);
            String normalizedName = normalizePackageName(pkgName);
            if (!installedPackages.contains(normalizedName)) {
                missingPackages.add(requirement);
            }
        }

        if (missingPackages.isEmpty()) {
            return true;
        }

        String pythonCmd = getPythonCommand();
        List<String> cmdArgs = new ArrayList<>();
        cmdArgs.add(pythonCmd);
        cmdArgs.add("-m");
        cmdArgs.add("pip");
        cmdArgs.add("install");
        cmdArgs.addAll(missingPackages);

        try {
            ProcessBuilder pb = new ProcessBuilder(cmdArgs);
            setupProcessBuilder(pb);
            
            log.info("开始安装依赖包: {}", missingPackages);
            Process process = pb.start();
            boolean completed = process.waitFor(15, TimeUnit.MINUTES);
            
            if (completed && process.exitValue() == 0) {
                log.info("依赖包安装成功");
                return true;
            } else {
                StringBuilder errorOutput = new StringBuilder();
                BufferedReader errorReader = new BufferedReader(
                        new InputStreamReader(process.getInputStream(), StandardCharsets.UTF_8));
                String line;
                while ((line = errorReader.readLine()) != null) {
                    errorOutput.append(line).append("\n");
                }
                errorReader.close();
                log.error("依赖包安装失败，退出码: {}, 错误信息: {}", process.exitValue(), errorOutput);
                if (!completed) {
                    process.destroyForcibly();
                }
                return false;
            }
        } catch (Exception e) {
            log.error("安装依赖包异常", e);
            return false;
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

    private void updateStatus(Long fileResourceId, String status) {
        ModelFileResourceDO updateObj = new ModelFileResourceDO();
        updateObj.setId(fileResourceId);
        updateObj.setImageBuildStatus(status);
        modelFileResourceMapper.updateById(updateObj);
    }
}
