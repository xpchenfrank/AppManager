package com.app.dao;

import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.app.model.App;
import com.app.model.Category;
import com.app.model.Tag;

@Component
public interface AppDAO {
    
    public void insertApp(String displayName, String fileName, String version, Set<Category> cats);
    
    public void insertApp(App anApp);
    
    public List<App> findAppByCat (String catName);
    
    public List<App> findAppByCatPage (String catName, String orderByColumn, String order, int offset, int length);
    
    public String getFindAllAppQuery (String orderByColumn, String order);
    
    public List<App> findAllApp ();
    
    public List<App> findAllAppPage ();
    
    // Category Start
    public Category findCatByName(String catName);
    
    public Category upsertCat(String catName);
    
    
    public Category upsertCat(String catName, Set<App> apps);
    
    public List<Category> findAllCat ();
    
    // Category End
    
   // Tag Start
    
    public Tag upsertTag(String catName);
    
    public List<Tag> findAllTag ();
    
    public List<Tag> findTagsByNames (String[] tags);
    
    // Tag End
    
}
