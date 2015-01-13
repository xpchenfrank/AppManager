package com.app.controller;

import java.util.HashSet;
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

/**
 * ������������ɳ�ʼ�����ݵ���  ����git���������� �ٴβ���  �ٴβ���GIT����
 * 
 * http://localhost:8080/AppManager/am/init/createCat
 * http://localhost:8080/AppManager/am/init/createTag
 *
 * 2015-1-10
 *
 */
@Controller
@RequestMapping("/init")
public class InitController {

    
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
    
    @RequestMapping(value = "/createCat", method = RequestMethod.GET)
    public String createCategories(Model model) {
        
        String[] categories = {"�罻", "��Ƶ", "�Ķ�", "����", "����", "ϵͳ", "��ȫ"};
        
        for(String tempStr : categories) {
            aAppDAO.upsertCat(tempStr);
        }
        
        return null;
    }
    
    @RequestMapping(value = "/createTag", method = RequestMethod.GET)
    public String createTags(Model model) {
        
        String[] tags = {"����", "�Ƽ�", "��Ʒ", "�߸�˧", "�׸���"};
        
        for(String tempStr : tags) {
            aAppDAO.upsertTag(tempStr);
        }
        
        return null;
    }
    
}
