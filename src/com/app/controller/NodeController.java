package com.app.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.app.dao.NodeDAO;
import com.app.dao.UserDAO;
import com.app.service.GeneralService;

@Controller
@RequestMapping("/node")
public class NodeController {

    
    @Autowired
    ServletContext context;
    
    @Autowired
    private NodeDAO aNodeDAO;
    
    @Autowired
    private UserDAO aUserDAO;
    
    @Autowired
    private GeneralService gService;
    
    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public String insertNode(Model model) {
        
        /*
        User aUser = new User();
        aUser.setGid(3);
        aUser.setName("shen");
        
        Node aNode = new Node();
        aNode.setName("中山路营业厅");
        Set<User> users = new HashSet<User>();
        users.add(aUser);
        aNode.setUsers(users);
        
        aNodeDAO.insertNode(aNode);
        */
        //aUserDAO.insertUser(aUser);
        
        gService.insertNode();
        
        return "index";
    } 
    
}
