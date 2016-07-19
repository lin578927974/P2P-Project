package com.p2p.daoImpl;

import java.util.*;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.p2p.beans.sysmodule;
import com.p2p.dao.SysModuleDao;

public class SysModuleDaoImpl implements SysModuleDao {
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory(){
		return sessionFactory;
	}
	@Autowired
	public void setSessionFacroty(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
	}
	private Session getCurrentSession(){
		return sessionFactory.openSession();
	}
	
	public List<sysmodule> getModule(String id) throws HibernateException {
		String hql="from sysmodule u where u.UpCode=:upcode and u.State=1";
		return this.getCurrentSession().createQuery(hql)
				.setString("upcode", id)
				.list();
	}
}
