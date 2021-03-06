package com.p2p.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.p2p.beans.sysadmin;
import com.p2p.service.SysAdminService;
import com.p2p.util.Security;

public class LoginAction extends ActionSupport implements SessionAware,ServletRequestAware {

	private static final long serialVersionUID = 1L;
	
	private SysAdminService sysAdminService;
	public void setSysAdminService(SysAdminService sysAdminService){
		this.sysAdminService=sysAdminService;
	}

	/**
	 * 验证码读取
	 * */
	private Map<String, Object> session;
	
	private Map<String, Object> map;
	
	public Map<String, Object> getMap() {
		return map;
	}

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
	 * 用户登录 execute
	 * */
	public String login(){
		try{
			String servercode=(String)session.get("SESSION_SECURITY_CODE");
			String name=request.getParameter("UserName");
			String pwd=request.getParameter("Password");
			String code=request.getParameter("CheckCode");
			if(!servercode.equals(code)){
				map=new HashMap<String, Object>();			
				map.put("message", "验证码错误");
				map.put("success", false);
				return ERROR;
			}
			sysadmin model=new sysadmin();
			model.setAdminID(name);
			model.setPassword(Security.pareStrToMd5U32(pwd));
			sysadmin info=sysAdminService.loginSysAdmin(model);
			if(info!=null){
				map=new HashMap<String, Object>();			
				map.put("message", "登录成功");
				map.put("success", true);
				return SUCCESS;
			}
		}catch(Exception ex){
			map=new HashMap<String, Object>();			
			map.put("message", "系统异常，请联系管理员");
			map.put("success", false);
			ex.printStackTrace();
			return ERROR;
		}
		map=new HashMap<String, Object>();			
		map.put("message", "账号或密码错误");
		map.put("success", false);
		return ERROR;
	}
	
	
}
