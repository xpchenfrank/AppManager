package com.app.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.app.dao.AppDAO;
import com.app.dao.NodeDAO;
import com.app.dao.UserDAO;
import com.app.model.App;
import com.app.model.Category;
import com.app.model.Tag;
import com.app.service.GeneralService;
import com.app.util.FileOperateUtil;

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
    
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addApp(HttpServletRequest request, Model model) throws Exception {
        
    	//先从request里面获取到两个文件
        MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;
        Map<String, MultipartFile> fileMap = mRequest.getFileMap();
        
        MultipartFile appIcon = fileMap.get("appIcon");
        MultipartFile appFile = fileMap.get("appFile");
        
    	App app = new App();
    	app.setDisplayname("QQ");
    	app.setFilename("qq_100");
    	app.setVersion("1.0.0");
        
        gService.addApp(request, app, appIcon, appFile);

        /*
        for (Iterator<Map.Entry<String, MultipartFile>> it = fileMap.entrySet()
                .iterator(); it.hasNext(); i++) {

            Map.Entry<String, MultipartFile> entry = it.next();
            MultipartFile mFile = entry.getValue();

            fileName = mFile.getOriginalFilename();
            
            //重命名文件名到我们想要的名字
            fileName = renameStoreFileName(fileName, storeName, versionNum);
            		
            //上传文件
            BufferedOutputStream outputStream = 
                    new BufferedOutputStream(new FileOutputStream(new File(uploadDir + fileName)));

            FileCopyUtils.copy(mFile.getInputStream(), outputStream);
        */
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
