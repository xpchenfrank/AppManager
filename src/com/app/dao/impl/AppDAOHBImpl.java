package com.app.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.app.dao.AppDAO;
import com.app.model.App;
import com.app.model.Category;
import com.app.model.Tag;
import com.app.util.CXPUtils;

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
	public List<App> findAppByCat(String catName) {
		List<App> apps = getHibernateTemplate().find(" from App as app inner join app.cats as cat where cat.name='社交'");
		return apps;
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

	@Override
	public List<Category> findAllCat() {
		List<Category> cats = getHibernateTemplate().find("from Category cat where cat.deleted=false");
		return cats;
	}

	// Start Tag
	@Override
	public Tag upsertTag(String catName) {
		Tag aTag = new Tag();
		aTag.setName(catName);
		aTag.setApps(new HashSet<App>());
		getHibernateTemplate().saveOrUpdate(aTag);
		return aTag;
	}

	@Override
	public List<Tag> findAllTag() {
		List<Tag> tags = getHibernateTemplate().find("from Tag tag where tag.deleted=false");
		return tags;
	}
	// End Tag

	@Override
	public Category findCatByName(String catName) {
		List<Category> catList = getHibernateTemplate().find("from Category cat where cat.deleted=false and cat.name=?", catName);
		if(catList != null && catList.size() > 0) {
			return catList.get(0);
		}
		return null;
	}

	@Override
	public List<Tag> findTagsByNames(String[] tags) {
		
		List<String> tagList = new ArrayList<String> ();
		tagList.add("�Ƽ�");
		tagList.add("��Ʒ");
		
		String[] testArray ={"��Ʒ", "�Ƽ�", "����"}; 
		
		List<Tag> tagsList = getHibernateTemplate().find("from Tag tag where tag.deleted=false and tag.name in " + CXPUtils.toInClause(testArray) );
		
		return tagsList;
		
	}

	
}
