package com.p2p.daoImpl;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.p2p.dao.BaseDao;

public class SysAdminDao implements BaseDao {
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
	
	public void selectObject(Object object) throws HibernateException{
		this.getCurrentSession().createSQLQuery("select ");
	}
}
