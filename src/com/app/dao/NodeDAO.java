package com.app.dao;

import org.springframework.stereotype.Component;

import com.app.model.Node;
import com.app.model.User;

@Component
public interface NodeDAO {
    
    public void insertNode(Node aNode);
    
    public void updateNode(User aUser, Node aNode);

    
}
