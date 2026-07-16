package tech.qiantong.qmodel.module.model.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 调用类型枚举
 */
@Getter
@AllArgsConstructor
public enum InvokeTypeEnum {

    PYTHON("1", "Python调用"),
    API("2", "API调用");

    private final String type;
    private final String description;

}
