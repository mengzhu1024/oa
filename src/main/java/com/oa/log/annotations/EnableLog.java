package com.oa.log.annotations;

import com.elementchain.base.enums.OperateEnum;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author jiguang.qi
 * @date 2019/4/6 21:10
 * 日志总开关，控制BaseService记录日志行为
 */
@Target(value={ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface EnableLog {

    String target();

    OperateEnum[] logEnums();
}