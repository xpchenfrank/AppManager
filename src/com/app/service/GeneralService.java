package com.app.service;

import org.springframework.stereotype.Component;

import com.app.model.App;

@Component
public interface GeneralService {
    
    public void insertNode();
    
    public void updateNode();
    
    public void insertApp(App anApp);
    
}
