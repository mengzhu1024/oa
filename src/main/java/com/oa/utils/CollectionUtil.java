package com.oa.utils;

import javax.websocket.Session;
import java.io.File;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 集合工具，提供系统需要的集合
 * @author 文龙
 *
 */

public class CollectionUtil {

	/**
	 * 盘符Map
	 */
	public static Map<String, String> diskMap = new HashMap<>();
	
	/**
	 * 控件类型map
	 */
	public static Map<Integer, String> controlTypeMap = new LinkedHashMap<>();
	
	private static DecimalFormat format;
	
	/**
	 * 会话Map
	 */
	public static Map<String, Session> sessionMap = new HashMap<>();
	
	static{
		format = new DecimalFormat();
		format.applyPattern("0.00");
		controlTypeMap.put(1, "单行文本框");
		controlTypeMap.put(2, "多行文本框");
		controlTypeMap.put(3, "下拉菜单");
		controlTypeMap.put(4, "单选按钮");
		controlTypeMap.put(5, "复选框");
		controlTypeMap.put(6, "日期控件");
		controlTypeMap.put(7, "时间控件");
		controlTypeMap.put(8, "日期时间控件");
		controlTypeMap.put(9, "计算控件");
		controlTypeMap.put(10, "会签字段");
		controlTypeMap.put(11, "人员选择框");
		controlTypeMap.put(12, "部门选择框");
	}
	
	public static Map<String, String> getDiskMap() {
		diskMap.clear();
		for (char c = 'A'; c <= 'Z'; c++) {
			String dirName = Constant.ROOT_PATH + c + "/";
			File win = new File(dirName);
			Double compare1 = null;
			if (win.exists()) {
				long total = win.getTotalSpace();
				long free = win.getFreeSpace();
				compare1 = (1 - free * 1.0 / total) * 100;
			}
			dirName = Constant.ROOT_PATH + c + "2/";
			win = new File(dirName);
			Double compare2 = null;
			if (win.exists()) {
				long total = win.getTotalSpace();
				long free = win.getFreeSpace();
				compare2 = (1 - free * 1.0 / total) * 100;
			}
			if(compare1 != null){
				diskMap.put(c+"", format.format(compare1 > compare2? compare1: compare2));
			}			
		}
		return diskMap;
	}
}
