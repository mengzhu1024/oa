package com.oa.utils;

import java.util.Collection;

/**
 * 校验类
 * @author 文龙
 *
 */
public class ValidateUtil {

	/**
	 * 校验数组否有效（数组不为null和对象个数大于0）
	 * @param objs 被校验的集合
	 * @return 校验结果
	 */
	public static boolean isValid(Object[] objs){
		if(objs == null || objs.length == 0){
			return false;
		}
		return true;
	}
}
