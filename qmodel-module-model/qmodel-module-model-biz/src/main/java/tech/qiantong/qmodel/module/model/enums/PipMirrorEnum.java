/*
 * Copyright © 2025-present Jiangsu Qiantong Technology Co., Ltd.
 *  
 * This file is part of qModel Module Platform (Open Source Edition).
 *  
 * qModel is licensed under Apache License 2.0 with additional qModel terms.
 * You may use qModel for commercial purposes, but you may not remove, hide,
 * modify, or replace the qModel logo, copyright notices, license notices,
 * or attribution information without a separate commercial license.
 *  
 * White-label use, OEM distribution, rebranding, or presenting qModel as
 * another product requires separate commercial authorization from
 * Jiangsu Qiantong Technology Co., Ltd.
 *  
 * Business License: `https://qmodel.tech/`
 * See the LICENSE file in the project root for full license information.
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
