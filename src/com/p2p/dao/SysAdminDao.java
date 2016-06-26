package com.p2p.dao;
import org.hibernate.HibernateException;

import com.p2p.beans.*;

public interface SysAdminDao {
	public sysadmin getBean(sysadmin sysadmin) throws HibernateException;
}
