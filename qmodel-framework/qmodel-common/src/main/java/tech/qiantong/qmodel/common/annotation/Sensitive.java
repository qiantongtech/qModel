package tech.qiantong.qmodel.common.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import com.fasterxml.jackson.annotation.JacksonAnnotationsInside;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import tech.qiantong.qmodel.common.config.serializer.SensitiveJsonSerializer;
import tech.qiantong.qmodel.common.enums.DesensitizedType;

/**
 * 数据脱敏注解
 *
 * @author anivia
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
@JacksonAnnotationsInside
@JsonSerialize(using = SensitiveJsonSerializer.class)
public @interface Sensitive
{
    DesensitizedType desensitizedType();
}
