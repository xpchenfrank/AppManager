package com.app.dao.impl;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.app.dao.UserDAO;
import com.app.model.User;

public class UserDAOHBImpl extends HibernateDaoSupport implements UserDAO {

    @Override
    public void insertUser(User aUser) {
        getHibernateTemplate().save(aUser);
    }
	
	
	
	

    
}
