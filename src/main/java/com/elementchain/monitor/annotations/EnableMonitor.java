package com.elementchain.monitor.annotations;

import com.elementchain.base.enums.OperateEnum;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author huwenlong
 * @date 2019/4/11 9:51
 */
@Target(value={ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface EnableMonitor {
    /**
     * 需要记录日志的操作
     */
    OperateEnum[] logEnums();
}