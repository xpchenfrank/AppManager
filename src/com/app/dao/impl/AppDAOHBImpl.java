package com.app.dao.impl;

import java.util.List;
import java.util.Set;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.app.dao.AppDAO;
import com.app.dao.UserDAO;
import com.app.model.App;
import com.app.model.Category;
import com.app.model.User;

public class AppDAOHBImpl extends HibernateDaoSupport implements AppDAO {

	@Override
	public void insertApp(String displayName, String fileName, String version,
			Set<Category> cats) {
		
		App anApp = new App();
		anApp.setDisplayname("н╒пе");
		anApp.setFilename("weixin");
		anApp.setVersion("1.0.0");
		anApp.setCats(cats);
		getHibernateTemplate().save(anApp);
		
	}

	@Override
	public void findAppByCat(String catName) {
		List<App> rooms = getHibernateTemplate().find(" from AM_APP as app right join Department as department on employee.DepNo=department.ID ");
	}

	@Override
	public void findAllApp() {
		List<App> rooms = getHibernateTemplate().find("from AM_APP");
	}
    
}
