package com.oa.utils;

public interface Constant {

	String GROUP_ID = "com.oa";

	/**
	 * 项目根路径
	 */
	String PROJECT_PATH = "com/oa";

	/**
	 * 操作文件的根路径
	 */
	String ROOT_PATH = "D:/javaFile/oa/";

	/**
	 * 操纵文件的临时文件夹
	 */
	String TEMP_PATH = "D:/javaFile/oa/utils/temp/";

	/**
	 * 项目二进制文件根路径
	 */
	String BINARY_PATH = "target/classes/com/oa";

	/**
	 * 定义事务状态常量
	 */
	Integer AFFAIR_NORMAL = 0;

	Integer AFFAIR_REVOKE = 1;

	Integer AFFAIR_DONE = 2;

	/**
	 * 定义项目ip、port
	 */
	String IP_PORT = "localhost:8089";
}
