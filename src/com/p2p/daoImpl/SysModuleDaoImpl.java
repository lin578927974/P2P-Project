package com.p2p.daoImpl;

import java.util.*;

import org.hibernate.HibernateException;

import com.p2p.beans.sysmodule;
import com.p2p.dao.SysModuleDao;

public class SysModuleDaoImpl implements SysModuleDao {
	public List<sysmodule> getModule(String id) throws HibernateException {
		List<sysmodule> list=new ArrayList<sysmodule>();
		return list;
	}
}
