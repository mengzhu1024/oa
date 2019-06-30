package com.elementchain.utils;

import lombok.extern.slf4j.Slf4j;

import java.lang.reflect.Field;

@Slf4j
public class ReflectUtil {

	//获取字段值
	public static Object getFieldValue(Object obj, String fieldName) {
		Object result = null;
		Field field = getField(obj, fieldName);
		if (field != null) {
			try {
				result = field.get(obj);
			} catch (IllegalArgumentException | IllegalAccessException e) {
				log.error("getFieldValue method error, obj:{}, fieldName:{}, e:", obj, fieldName, e);
			}
		}
		return result;
	}

	//获取字段
	public static Field getField(Object obj, String fieldName) {
		Field field = null;
		for (Class<?> clazz = obj.getClass(); clazz != Object.class; clazz = clazz
				.getSuperclass()) {
			try {
				field = clazz.getDeclaredField(fieldName);
				field.setAccessible(true);
				break;
			} catch (NoSuchFieldException e) {
				// 这里不用做处理，子类没有该字段可能对应的父类有，都没有就返回null。
			}
		}
		return field;
	}

	//设置字段值
	public static void setFieldValue(Object obj, String fieldName, Object fieldValue) {
		Field field = getField(obj, fieldName);
		if (field != null) {
			try {
				field.set(obj, fieldValue);
			} catch (IllegalArgumentException | IllegalAccessException e) {
				log.error("setFieldValue method error, obj:{}, fieldName:{}, fieldValue:{}, e:", obj, fieldName, fieldValue, e);
			}
		}
	}
}
