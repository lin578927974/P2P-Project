package com.p2p.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import com.p2p.beans.sysmodule;
import com.p2p.dao.SysModuleDao;
import com.p2p.service.SysmoduleService;

public class SysmoduleServiceImpl implements SysmoduleService {
	private SysModuleDao sysModuleDao;
	
	public void setsysModuleDao(SysModuleDao sysModuleDao){
		this.sysModuleDao=sysModuleDao;
	}
	
	public List<sysmodule> getSysModule(String id){
		List<sysmodule> list=sysModuleDao.getModule(id);
		return list;
	}
}
