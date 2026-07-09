/*
 * Copyright © 2026 Qiantong Technology Co., Ltd.
 * qModel Model Platform(Open Source Edition)
 */

package tech.qiantong.qmodel.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * Python 配置类
 */
@Data
@Configuration
@ConfigurationProperties(prefix = "python")
public class PythonConfig {

    /**
     * Python 版本号
     */
    private String version;
}
