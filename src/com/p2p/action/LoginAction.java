package com.p2p.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class LoginAction extends ActionSupport implements SessionAware,ServletRequestAware {

	private static final long serialVersionUID = 1L;

	/**
	 * 验证码读取
	 * */
	private Map<String, Object> session;
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	
	private HttpServletRequest request;
	public void setServletRequest(HttpServletRequest request){
		this.request=request;
	}
	
	private String username;
	private String userpwd;
	private String validatecode;
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	
	public String getValidatecode() {
		return validatecode;
	}

	public void setValidatecode(String validatecode) {
		this.validatecode = validatecode;
	}

	
	
	/**
	 * 用户登录
	 * */
	public String execute(){
		try{
			String servercode=(String)session.get("SESSION_SECURITY_CODE");
			String name=request.getParameter("UserName");
			String pwd=request.getParameter("Password");
			String code=request.getParameter("CheckCode"); 
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return SUCCESS;
	}
	
	
}
