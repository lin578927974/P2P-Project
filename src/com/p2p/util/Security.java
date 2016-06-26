package com.p2p.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * MD5����
 * */
public class Security {
	/**
	 * @param str�������ַ���
	 * @return ����32λСдMD5����
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
	 * @param str�������ַ���
	 * @return ����32λ��дMD5�ַ���
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
	 * @return ����16λСдMd5�����ַ���
	 * */
	public static String pareStrToMd5L16(String str){
		String reString=parseStrToMd5L32(str);
		if(reString!=null){
			reString=reString.substring(8, 24);
		}
		return reString;
	}
	
	/**
	 * @return ����16λ��дMd5�����ַ���
	 * */
	public static String pareStrToMd5U16(String str){
		String reString=pareStrToMd5L16(str);
		if(reString!=null){
			reString=reString.toUpperCase();
		}
		return reString;
	}
	
}
