package com.app.controller;

import java.util.HashSet;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.app.dao.AppDAO;
import com.app.dao.NodeDAO;
import com.app.dao.UserDAO;
import com.app.model.Category;
import com.app.service.GeneralService;

@Controller
@RequestMapping("/app")
public class AppController {

    
    @Autowired
    ServletContext context;
    
    @Autowired
    private NodeDAO aNodeDAO;
    
    @Autowired
    private AppDAO aAppDAO;
    
    @Autowired
    private UserDAO aUserDAO;
    
    @Autowired
    private GeneralService gService;
    
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addApp(Model model) {
        
    	Category aCat = new Category();
    	aCat.setName("Éç½»");
    	
    	aAppDAO.insertApp("Î¢ÐÅ", "weixin_100", "1.0.0", new HashSet<Category>());
        
        return "index";
    } 
    
}
