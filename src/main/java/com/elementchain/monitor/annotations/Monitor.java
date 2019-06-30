package com.elementchain.monitor.annotations;

import com.elementchain.monitor.enums.Level;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author huwenlong
 * @date 2019/4/11 9:51
 */
@Target(value={ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface Monitor {

    Level level();

    String[] paramNames();
}