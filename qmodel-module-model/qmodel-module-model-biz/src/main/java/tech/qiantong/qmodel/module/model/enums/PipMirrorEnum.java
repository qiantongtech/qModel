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

package tech.qiantong.qmodel.module.model.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * PIP 镜像源枚举
 * 按优先级排序，当前面的镜像源失败时自动尝试下一个
 *
 * @author qModel
 * @date 2026-07-16
 */
@Getter
@AllArgsConstructor
public enum PipMirrorEnum {

    TSINGHUA("tsinghua", "https://pypi.tuna.tsinghua.edu.cn/simple", "清华镜像", 1),
    ALIYUN("aliyun", "https://mirrors.aliyun.com/pypi/simple", "阿里云镜像", 2),
    HUAWEI("huawei", "https://repo.huaweicloud.com/repository/pypi/simple", "华为云镜像", 3),
    DOUBAN("douban", "https://pypi.douban.com/simple", "豆瓣镜像", 4),
    OFFICIAL("official", "https://pypi.org/simple", "官方源", 5);

    private final String code;
    private final String url;
    private final String desc;
    private final Integer priority;

    public static List<String> getMirrorUrls() {
        return Arrays.stream(values())
                .sorted((a, b) -> a.getPriority().compareTo(b.getPriority()))
                .map(PipMirrorEnum::getUrl)
                .collect(Collectors.toList());
    }

    public static PipMirrorEnum getByCode(String code) {
        for (PipMirrorEnum mirrorEnum : values()) {
            if (mirrorEnum.getCode().equals(code)) {
                return mirrorEnum;
            }
        }
        return null;
    }
}
