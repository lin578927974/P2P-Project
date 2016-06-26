package com.p2p.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * MD5加密
 * */
public class Security {
	/**
	 * @param str待加密字符串
	 * @return 返回32位小写MD5加密
	 * */
	public static String parseStrToMd5L32(String str){
		String reString=null;
		try{
			MessageDigest md5=MessageDigest.getInstance("MD5");
			byte[] bytes=md5.digest(str.getBytes());
			StringBuffer stringBuffer=new StringBuffer();
			for(byte b:bytes){
				int bt=b&0xff;
				if(bt<16){
					stringBuffer.append(0);
				}
				stringBuffer.append(Integer.toHexString(bt));
			}
			reString=stringBuffer.toString();
		}catch(NoSuchAlgorithmException e){
			e.printStackTrace();
		}
		return reString;
	}
	
	/**
	 * @param str待加密字符串
	 * @return 返回32位大写MD5字符串
	 * */
	public static String pareStrToMd5U32(String str){
		String reString=parseStrToMd5L32(str);
		if(reString!=null){
			reString=reString.toUpperCase();
		}
		return reString;
	}
	
	/**
	 * @param str
	 * @return 返回16位小写Md5加密字符串
	 * */
	public static String pareStrToMd5L16(String str){
		String reString=parseStrToMd5L32(str);
		if(reString!=null){
			reString=reString.substring(8, 24);
		}
		return reString;
	}
	
	/**
	 * @return 返回16位大写Md5加密字符串
	 * */
	public static String pareStrToMd5U16(String str){
		String reString=pareStrToMd5L16(str);
		if(reString!=null){
			reString=reString.toUpperCase();
		}
		return reString;
	}
	
}
