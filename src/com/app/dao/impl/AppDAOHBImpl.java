package com.app.dao.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.app.dao.AppDAO;
import com.app.model.App;
import com.app.model.Category;

public class AppDAOHBImpl extends HibernateDaoSupport implements AppDAO {

	@Override
	public void insertApp(String displayName, String fileName, String version,
			Set<Category> cats) {
		
		App anApp = new App();
		anApp.setDisplayname(displayName);
		anApp.setFilename(fileName);
		anApp.setVersion(version);
		anApp.setCats(cats);
		
		getHibernateTemplate().saveOrUpdateAll(cats);
		
		getHibernateTemplate().saveOrUpdate(anApp);
		
	}
	
	@Override
	public void insertApp(App anApp) {
		
		getHibernateTemplate().saveOrUpdateAll(anApp.getCats());
		
		getHibernateTemplate().saveOrUpdate(anApp);
	}

	@Override
	public void findAppByCat(String catName) {
		List<App> rooms = getHibernateTemplate().find(" from AM_APP as app right join Department as department on employee.DepNo=department.ID ");
	}

	@Override
	public void findAllApp() {
		List<App> rooms = getHibernateTemplate().find("from AM_APP");
	}

	@Override
	public Category upsertCat(String catName, Set<App> apps) {
		Category aCat = new Category();
		aCat.setName(catName);
		aCat.setApps(apps);
		getHibernateTemplate().saveOrUpdate(aCat);
		return aCat;
	}

	@Override
	public Category upsertCat(String catName) {
		return upsertCat(catName, new HashSet<App>());
	}
    
}
