package com.app.dao;

import java.util.Set;

import org.springframework.stereotype.Component;

import com.app.model.Category;

/**
 *  APP DAO 同时放针对 APP 和 Category 的DAO 方法
 */
@Component
public interface AppDAO {
    
    public void insertApp(String displayName, String fileName, String version, Set<Category> cats);
    
    public void findAppByCat (String catName);
    
    public void findAllApp ();
    
}
