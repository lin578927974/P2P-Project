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
 * 工具类，生成验证码图片
 * */
public class SecurityImage {
	public static BufferedImage createImage(String securityCode){
		int codeLength=securityCode.length();
		//字体大小
		int fSize=15;
		int fWidth=fSize+1;
		//图片宽度
		int width=codeLength*fWidth+6;
		//图片高度
		int height=fSize*2+1;
		
		//图片
		BufferedImage image=new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics graphics=image.createGraphics();
		//设置背景色
		graphics.setColor(Color.white);
		//填充背景
		graphics.fillRect(0, 0, width, height);
		//设置边框颜色
		graphics.setColor(Color.LIGHT_GRAY);
		//边框字体样式
		graphics.setFont(new Font("Arial", Font.BOLD, height-2));
		//绘制边框
		graphics.drawRect(0, 0, width-1, height-1);
		
		//绘制噪点
		Random random=new Random();
		//设置噪点颜色
		graphics.setColor(Color.LIGHT_GRAY);
		for(int i=0;i<codeLength*6;i++){
			int x=random.nextInt(width);
			int y=random.nextInt(height);
			//绘制1*1大小的矩形
			graphics.drawRect(x, y, 1, 1);
		}
		//绘制验证码
		int codeY=height-10;
		//设置字体颜色和样式
		graphics.setColor(new Color(19,148,246));
		graphics.setFont(new Font("Georgia", Font.BOLD, fSize));
		for(int i=0;i<codeLength;i++){
			graphics.drawString(String.valueOf(securityCode.charAt(i)),i*16+5,codeY);
		}
		//关闭资源
		graphics.dispose();
		return image;
	}
	
	/**
	 * 返回验证码图片的流格式
	 * @param securityCode 验证码
	 * @return ByteArrayInputStream
	 * */
	public static ByteArrayInputStream getImageAsInputStream(String securityCode){
		BufferedImage image=createImage(securityCode);
		return convertImageToStream(image);
	}
	
	/**
	 * 将BufferedImage转换成ByteArrayInputStream
	 * @param image图片
	 * @return ByteArrayInputStream流
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
