package com.oa.utils;

import org.springframework.util.CollectionUtils;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.UUID;

/**
 * 字符串工具类
 * @author 文龙
 *
 */

public class StringUtil {
	private static ThreadLocal<SimpleDateFormat> localFormat = ThreadLocal.withInitial(SimpleDateFormat::new);

	/**
	 * 得道字符串描述
	 * @param str 被描述的字符串
	 * @param len 返回字符串的长度
	 * @return 描述字符串
	 */
	public static String getStringDesc(String str, int len){
		if(str != null && str.length() > len){
			return str.substring(0, len - 1) + "...";
		}
		return str;
	}

	/**
	 * 根据月份偏移量生成表名
	 * @param offset 偏移的月份
	 * @return 得到的表名
	 */
	public static String generateTableName(Integer offset) {
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH) + 1 + offset;

		//计算跨年后的时间和月份
		if(month > 12){
			year += (month -1)/12;
			month = (month - 1)%12 + 1;
		}else if(month < 1){
			year -= ((-month)/12 + 1);
			month += ((-month)/12 + 1)*12;
		}
		DecimalFormat format = new DecimalFormat();
		format.applyPattern("00");
		return "LOG_" + year + "_" + format.format(month);
	}

	/**
	 * 日期转字符串
	 * @param str 转换格式
	 * @return 日期字符串
	 */
	public static String dateToString(Date date, String str){
		SimpleDateFormat simpleDateFormat = localFormat.get();
		simpleDateFormat.applyPattern(str);
		return simpleDateFormat.format(date);
	}

	/**
	 * 数组转字符串
	 * @param objs 被转换的数组
	 * @param separate 间隔符号
	 * @return 目标字符串
	 */
	public static String arraysToString(Object[] objs, String separate){
		StringBuilder builder = new StringBuilder();
		if(ValidateUtil.isValid(objs)){
			for(Object obj: objs){
				builder.append(obj).append(separate);
			}
		}
		return builder.length() > 0?builder.substring(0, builder.length() - separate.length()): "";
	}

	/**
	 * 集合转字符串
	 * @param collection 被转换的集合
	 * @param separate 间隔符号
	 * @return 目标字符串
	 */
	public static String collectionToString(Collection<?> collection, String separate) {
		StringBuilder builder = new StringBuilder();
		if(!CollectionUtils.isEmpty(collection)){
			for(Object obj: collection){
				builder.append(obj).append(separate);
			}
		}
		return builder.length() > 0?builder.substring(0, builder.length() - separate.length()): "";
	}
	
	/**
	 * 生成没有"-"符号的uuid
	 * @return uuid
	 */
	public static String randomUUID() {
		return UUID.randomUUID().toString().replace("-", "");
	}
}