package com.oa.utils;

import lombok.extern.slf4j.Slf4j;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * MD5加密算法
 * @author 文龙
 */
@Slf4j
public class MD5 {
	/**
	 * 加密算法
	 * @param str 被加密的字符串
	 * @return 加密后生成的字符串
	 */
	public static String encipher(String str) {
		char[] hexDigits = {'0', '1', '2', '3', '4',
				'5', '6', '7', '8', '9',
				'A', 'B', 'C', 'D', 'E', 'F'};
		byte[] btInput = str.getBytes();
		MessageDigest mdInst;
		try {
			mdInst = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			log.error("MessageDigest.getInstance error, e:", e);
			return null;
		}
		mdInst.update(btInput);
		byte[] md = mdInst.digest();
		int j = md.length;
		char str2[] = new char[j * 2];
		int k = 0;
		for (int i = 0; i < j; i++) {
			byte byte0 = md[i];
			str2[k++] = hexDigits[byte0 >>> 4 & 0xf];
			str2[k++] = hexDigits[byte0 & 0xf];
		}
		return new String(str2);
	}
	public static void main(String[] args){
		System.out.println(MD5.encipher("lisizjb123456"));
	}
}
