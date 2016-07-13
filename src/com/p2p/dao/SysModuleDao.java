package com.p2p.dao;

import org.hibernate.HibernateException;

import com.p2p.beans.sysmodule;
import java.util.List;

public interface SysModuleDao {
	public List<sysmodule>  getModule(String id) throws HibernateException;
}
