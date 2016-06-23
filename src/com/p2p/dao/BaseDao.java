package com.p2p.dao;

import org.hibernate.HibernateException;

public interface BaseDao {
	//public void saveObject(Object object) throws HibernateException;
	//public void editObject(Object object) throws HibernateException;
	//public void deleteObject(Object object) throws HibernateException;
	public void selectObject(Object object) throws HibernateException;
}
