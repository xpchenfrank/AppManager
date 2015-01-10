package com.app.dao.impl;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.app.dao.NodeDAO;
import com.app.model.Node;
import com.app.model.User;

public class NodeDAOHBImpl extends HibernateDaoSupport implements NodeDAO {

    @Override
    public void insertNode(Node aNode) {
        getHibernateTemplate().persist(aNode);
    }

    @Override
    public void updateNode(User aUser, Node aNode) {
        // TODO Auto-generated method stub
        
    }
    
}
