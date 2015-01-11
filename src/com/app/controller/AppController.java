package com.app.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.app.dao.AppDAO;
import com.app.dao.NodeDAO;
import com.app.dao.UserDAO;
import com.app.model.App;
import com.app.model.Category;
import com.app.model.Tag;
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
    
    @RequestMapping(value = "/addApp", method = RequestMethod.GET)
    public String addApp(Model model) {
        
    	Category aCat = new Category();
    	aCat.setName("社交");
    	
    	Set<Category> cats = new HashSet<Category>();
    	cats.add(aCat);
    	
    	App app1 = new App();
    	app1.setDisplayname("微信");
    	app1.setFilename("weixin_101");
    	app1.setVersion("1.0.1");
    	app1.setCats(cats);
    	
    	App app2 = new App();
    	app2.setDisplayname("QQ");
    	app2.setFilename("qq_100");
    	app2.setVersion("1.0.0");
    	app2.setCats(cats);
    	
    	gService.insertApp(app1);
    	gService.insertApp(app2);
        
        return "index";
    }
    
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String showAddApp(Model model) {
    	
    	//获取所有可选的类别
    	List<Category> cats = aAppDAO.findAllCat();
    	
    	model.addAttribute("cats", cats);
    	
    	//获取所有的可选Tag
    	List<Tag> tags = aAppDAO.findAllTag();
    	
    	model.addAttribute("tags", tags);
    	
    	return "uploadApp";
    }
    
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String showApp(Model model) {
    	
    	//获取所有可选的类别
    	List<Category> cats = aAppDAO.findAllCat();
    	
    	model.addAttribute("cats", cats);
    	
    	/*
    	for(Category tempCat : cats) {
    		System.out.println(tempCat.getName());
    	}
    	*/
    	
    	return "admin";
    }
    
}
