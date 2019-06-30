package com.oa.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.parser.Feature;
import com.alibaba.fastjson.serializer.SerializerFeature;
import lombok.extern.slf4j.Slf4j;

import java.util.Collection;
import java.util.Map;

/**
 * 深度复制工具类
 * @author 文龙
 */

@Slf4j
public class DeepCopy {
	/**
	 * 深度复制方法
	 * @param t 被复制的类
	 * @return 复制后的类
	 */
	public static <T> T deepCopy(T t) {
		if(t instanceof Collection || t instanceof Map) {
			return deepCopyByJson2(t);
		}else {
			return deepCopyByJson(t);
		}
	}


	/**
	 * 通过JSON实现深克隆
	 * @param t
	 * @param <T>
	 * @return
	 */
	private static <T> T deepCopyByJson(T t){
		return t == null? null: JSON.parseObject(JSON.toJSONString(t), (Class<T>) t.getClass());
	}

	/**
	 * 通过JSON实现深克隆
	 * @param t
	 * @param <T>
	 * @return
	 */
	private static <T> T deepCopyByJson2(T t){
		return t == null? null: JSON.parseObject(JSON.toJSONString(t,  SerializerFeature.WriteClassName), (Class<T>) t.getClass(), Feature.SupportAutoType);
	}
}
