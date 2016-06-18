package com.p2p.util;

import java.util.Arrays;

/**
 * �����࣬���������֤���ַ���
 * */
public class SecurityCode {
	/*��֤���Ѷȼ���Simpleֻ�������֣�Mediumֻ�������ֺ�СдӢ�ģ�Hard�������ֺʹ�СдӢ��*/
	public enum SecurityCodeLevel{Simple,Medium,Hard};
	
	/**
	 * ����Ĭ����֤�룬4λ�е��Ѷ�
	 * @return String ��֤��
	 * */
	public static String getSecurityCode(){
		return getSecurityCode(4,SecurityCodeLevel.Medium,false);
	}
	
	/**
	 * �������Ⱥ��Ѷ��������֤��
	 * @param length ����
	 * @param level �Ѷȼ���
	 * @param isCanRepeat �Ƿ��ܹ������ظ����ַ������Ϊtrue,����ܳ��֣����Ϊfalse���򲻿��ܳ���
	 * @return String ��֤��
	 * */
	public static String getSecurityCode(int lenght,SecurityCodeLevel level,boolean isCanRepeat){
		int len=lenght;
		char[] codes={'1','2','3','4','5','6','7','8','9',
					 'a','b','c','d','e','f','g','h','i',
			         'j','k','m','n','p','q','r','s','t',
			         'u','v','w','x','y','z','A','B','C',
			         'D','E','F','G','H','I','J','K','L',
			         'M','N','P','Q','R','S','T','U','V',
			         'W','X','Y','Z'};
		//���ݲ�ͬ�ַ���ȡ�ַ�����
		if(level==SecurityCodeLevel.Simple){
			codes=Arrays.copyOfRange(codes, 0, 9);
		}
		if(level==SecurityCodeLevel.Medium){
			codes=Arrays.copyOfRange(codes, 0, 33);
		}
		//�ַ�������
		int n=codes.length;
		if(len>n && isCanRepeat==false){
			throw new RuntimeException(String.format("����SecurityCode.getSecurityCode(%1$s,%2$s,%3$s)�����쳣,��isCanRepeatΪ%3$sʱ���������%1$s���ܴ���%4$s", len,level,isCanRepeat,n));
		}
		//��ų�ȡ�������ַ�
		char[] result=new char[len];
		if(isCanRepeat){
			for(int i=0;i<result.length;i++){
				/*Math.random()�����������0<x<1����*/
				int r=(int)(Math.random()*n);
				result[i]=codes[r];
			}
		}else{
			for(int i=0;i<result.length;i++){
				int r=(int)(Math.random()*n);
				result[i]=codes[r];
				//����ȷ�������ٴγ�ȡ���Ǹ��ַ�����Ϊ�����ַ����벻��ͬ��
				//��ˣ������������е����һ���ַ���дcodes[r],����n��1
				codes[r]=codes[n-1];
				n--;
			}
		}
		return String.valueOf(result);
	}
	
}