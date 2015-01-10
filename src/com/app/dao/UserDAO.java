package com.app.dao;

import org.springframework.stereotype.Component;

import com.app.model.User;

@Component
public interface UserDAO {
    
    public void insertUser(User aUser);
	
}
