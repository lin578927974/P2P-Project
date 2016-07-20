package com.p2p.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.p2p.beans.sysmodule;
import com.p2p.service.SysmoduleService;

public class SysAccountAction extends ActionSupport implements ServletRequestAware{

	/**
	 * 首页请求，加载菜单
	 *  
	 */
	private static final long serialVersionUID = 1L;
	
	private SysmoduleService sysmoduleService;
	public void setSysmoduleService(SysmoduleService sysmoduleService){
		this.sysmoduleService=sysmoduleService;
	}
	
	private HttpServletRequest request;
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	private Map<String, Object> map;
	public Map<String, Object> getMap(){
		return map;
	}
	
	public String GetTree(){
		try{
			String upcode=request.getParameter("id");
			List<sysmodule> list=sysmoduleService.getSysModule(upcode);
			map=new HashMap<String, Object>();
			map.put("list", list);
			return SUCCESS;
		}catch(Exception ex){
			return ERROR;
		}
	}
	

}
