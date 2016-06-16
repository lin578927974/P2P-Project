package com.p2p.action;

import java.io.ByteArrayInputStream;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.p2p.util.SecurityCode;
import com.p2p.util.SecurityImage;

public class SecurityCodeImageAction extends ActionSupport implements SessionAware {

	private static final long serialVersionUID = 1L;

	private Map<String, Object> session;
	
	private ByteArrayInputStream imageStream;

	public ByteArrayInputStream getImageStream() {
		return imageStream;
	}

	public void setImageStream(ByteArrayInputStream imageStream) {
		this.imageStream = imageStream;
	}
	
	@Override
	public String execute(){
		try{
			//�������Hardģʽ�����Բ����ִ�Сд
			
			//String securityCode = SecurityCode.getSecurityCode(4,SecurityCodeLevel.Hard, false).toLowerCase();
			
			String securityCode=SecurityCode.getSecurityCode();
			imageStream=SecurityImage.getImageAsInputStream(securityCode);
			//����session��
			session.put("SESSION_SECURITY_CODE", securityCode);
			return SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public void setSession(Map<String, Object> session){
		this.session=session;
	}
	
}
