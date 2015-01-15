package com.app.service.impl;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import com.app.dao.AppDAO;
import com.app.dao.NodeDAO;
import com.app.dao.UserDAO;
import com.app.model.App;
import com.app.model.Category;
import com.app.model.Node;
import com.app.model.User;
import com.app.service.GeneralService;
import com.app.util.FileOperateUtil;

public class GeneralServiceHBImpl implements GeneralService {

    @Autowired
    private NodeDAO aNodeDAO;
    
    @Autowired
    private UserDAO aUserDAO;
    
    @Autowired
    private AppDAO aAppDAO;

    @Override
    public void insertNode() {
        
        User user2 = new User();
        user2.setGid(4);
        user2.setName("xu");
        aUserDAO.insertUser(user2);
        
        User aUser = new User();
        aUser.setGid(5);
        aUser.setName("shen");
        
        Node aNode = new Node();
        aNode.setName("中山路营业厅");
        Set<User> users = new HashSet<User>();
        users.add(aUser);
        aNode.setUsers(users);
        
        aUserDAO.insertUser(aUser);
        aNodeDAO.insertNode(aNode);
        
        /*
        User user3 = new User();
        user3.setGid(2);
        user3.setName("xu");
        aUserDAO.insertUser(user3);
        */
        
    }

    @Override
    public void updateNode() {
        
    }

    @Override
    public void addApp(HttpServletRequest req, App app, MultipartFile appIcon, MultipartFile appFile) throws Exception {
        
        //上传图标
        FileOperateUtil.upload(req, appIcon,
                app.getFilename(), "appIcon", app.getVersion());
        
        //上传app安装文件
        FileOperateUtil.upload(req, appFile,
                app.getFilename(), "appFile", app.getVersion());
                
        aAppDAO.insertApp(app);
        
    }
}
