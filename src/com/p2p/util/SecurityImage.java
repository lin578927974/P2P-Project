package com.p2p.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Random;

import com.sun.image.codec.jpeg.ImageFormatException;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

/**
 * �����࣬������֤��ͼƬ
 * */
public class SecurityImage {
	public static BufferedImage createImage(String securityCode){
		int codeLength=securityCode.length();
		//�����С
		int fSize=15;
		int fWidth=fSize+1;
		//ͼƬ���
		int width=codeLength*fWidth+6;
		//ͼƬ�߶�
		int height=fSize*2+1;
		
		//ͼƬ
		BufferedImage image=new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics graphics=image.createGraphics();
		//���ñ���ɫ
		graphics.setColor(Color.white);
		//��䱳��
		graphics.fillRect(0, 0, width, height);
		//���ñ߿���ɫ
		graphics.setColor(Color.LIGHT_GRAY);
		//�߿�������ʽ
		graphics.setFont(new Font("Arial", Font.BOLD, height-2));
		//���Ʊ߿�
		graphics.drawRect(0, 0, width-1, height-1);
		
		//�������
		Random random=new Random();
		//���������ɫ
		graphics.setColor(Color.LIGHT_GRAY);
		for(int i=0;i<codeLength*6;i++){
			int x=random.nextInt(width);
			int y=random.nextInt(height);
			//����1*1��С�ľ���
			graphics.drawRect(x, y, 1, 1);
		}
		//������֤��
		int codeY=height-10;
		//����������ɫ����ʽ
		graphics.setColor(new Color(19,148,246));
		graphics.setFont(new Font("Georgia", Font.BOLD, fSize));
		for(int i=0;i<codeLength;i++){
			graphics.drawString(String.valueOf(securityCode.charAt(i)),i*16+5,codeY);
		}
		//�ر���Դ
		graphics.dispose();
		return image;
	}
	
	/**
	 * ������֤��ͼƬ������ʽ
	 * @param securityCode ��֤��
	 * @return ByteArrayInputStream
	 * */
	public static ByteArrayInputStream getImageAsInputStream(String securityCode){
		BufferedImage image=createImage(securityCode);
		return convertImageToStream(image);
	}
	
	/**
	 * ��BufferedImageת����ByteArrayInputStream
	 * @param imageͼƬ
	 * @return ByteArrayInputStream��
	 * */
	public static ByteArrayInputStream convertImageToStream(BufferedImage image){
		ByteArrayInputStream inputStream=null;
		ByteArrayOutputStream byteArrayOutputStream=new ByteArrayOutputStream();
		JPEGImageEncoder jpegImageEncoder=JPEGCodec.createJPEGEncoder(byteArrayOutputStream);
		try{
			jpegImageEncoder.encode(image);
			byte[] bts=byteArrayOutputStream.toByteArray();
			inputStream=new ByteArrayInputStream(bts);
		}catch(ImageFormatException e){
			e.printStackTrace();
		}catch(IOException e){
			e.printStackTrace();
		}
		return inputStream;
	}
}
