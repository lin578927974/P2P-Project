package com.p2p.serviceImpl;

import com.p2p.beans.sysadmin;
import com.p2p.dao.SysAdminDao;
import com.p2p.service.SysAdminService;

public class SysAdminServiceImpl implements SysAdminService {
	private SysAdminDao sysAdminDao;
	
	
	public void setsysAdminDao(SysAdminDao dao) {
		this.sysAdminDao = dao;
	}

	@Override
	public sysadmin loginSysAdmin(sysadmin sysadmin) {
		sysadmin model=sysAdminDao.getBean(sysadmin);
		if(model!=null){
			return model;
		}
		return null;
	}
}
