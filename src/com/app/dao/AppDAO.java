package com.app.dao;

import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.app.model.App;
import com.app.model.Category;
import com.app.model.Tag;

/**
 *  APP DAO 同时放针对 APP 和 Category 的DAO 方法
 */
@Component
public interface AppDAO {
    
    public void insertApp(String displayName, String fileName, String version, Set<Category> cats);
    
    public void insertApp(App anApp);
    
    public void findAppByCat (String catName);
    
    public void findAllApp ();
    
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
