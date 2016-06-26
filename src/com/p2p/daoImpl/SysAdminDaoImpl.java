package com.p2p.daoImpl;

import com.p2p.beans.*;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.p2p.dao.SysAdminDao;

public class SysAdminDaoImpl implements SysAdminDao {
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory(){
		return sessionFactory;
	}
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
	}
	
	private Session getCurrentSession(){
		return sessionFactory.openSession();
	}
	
	public sysadmin getBean(sysadmin sysadmin) throws HibernateException{
		return (sysadmin) this.getCurrentSession().createQuery("select ").uniqueResult();		
	}
}
