package com.elementchain.cache.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
/**
 * @author jiguang.qi
 * @date 2019/4/6 22:12
 * 缓存总开关
 */
@Target(value={ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface EnableCache {
	/**
	 * 键
	 * @return
	 */
	String key();

	/**
	 * 过期时间
	 * @return
	 */
	long expire();
}
