package com.app.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.app.dao.UserDAO;
import com.app.model.Category;
import com.app.util.CXPUtils;

@Controller
@RequestMapping("/user")
public class UserController {

    
    @Autowired
    ServletContext context;
    
    @Autowired
    private UserDAO aUserDAO;
    
    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public String insertUser(Model model) {
        
        /*
        User aUser = new User();
        aUser.setGid("2");
        aUser.setName("wang");
        aUserDAO.insertUser(aUser);
        */
        return "index";
    } 
    
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String showUser(HttpServletRequest req, Model model) {
        
        req.setAttribute("currentPage", "user");
        
        return "manageUser";
    }

}
