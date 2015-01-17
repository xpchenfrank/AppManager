package com.app.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
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
import com.app.util.CXPUtils;
import com.app.util.FileOperateUtil;
import com.google.gson.JsonObject;

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
    
    public static final int PAGE_SIZE = 10;
    
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addApp(HttpServletRequest request, Model model) throws Exception {
        
        request.setAttribute("currentPage", "app");
        
        //获取table其他参数
        String appCat = ServletRequestUtils.getStringParameter(request, "appCat");
        String appDisplayName = ServletRequestUtils.getStringParameter(request, "appDisplayName");
        String appFileName = ServletRequestUtils.getStringParameter(request, "appFileName");
        String appShortDesc = ServletRequestUtils.getStringParameter(request, "appShortDesc");
        String appVersion = ServletRequestUtils.getStringParameter(request, "appVersion");
        //String appIcon = ServletRequestUtils.getStringParameter(request, "appIcon");
        //String appFile = ServletRequestUtils.getStringParameter(request, "appFile");
        String[] appTag = ServletRequestUtils.getStringParameters(request, "appTag");
        String iconPath = ServletRequestUtils.getStringParameter(request, "iconPath");
        System.out.println("iconPath is " + iconPath);
        
        //先从request里面获取到两个文件
        MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;
        Map<String, MultipartFile> fileMap = mRequest.getFileMap();
        
        MultipartFile appIcon = fileMap.get("appIcon");
        MultipartFile appFile = fileMap.get("appFile");
		
		//just test
        
        App app = new App();
        app.setDisplayname(appDisplayName);
        app.setFilename(appFileName);
        app.setVersion(appVersion);
        app.setShortDesc(appShortDesc);
        app.setIconPath(iconPath);
        System.out.println("文件大小是 " + appFile.getSize());
        long fileSizeLong = appFile.getSize(); 
        if(fileSizeLong >= 0) {
            double mbSize = fileSizeLong / 1024.0 / 1024.0;
            String fileSize = String.format("%.2f", mbSize) + " MB";
            app.setFileSize(fileSize);
        }
        //app.setFileSize();
        
        //根据category找具体的实体类
        Category aCat = aAppDAO.findCatByName(appCat);
        if(aCat != null) {
            Set<Category> cats = new HashSet<Category>();
            cats.add(aCat);
            app.setCats(cats);
        }
        
        //根据Tag的名字找Tag
        List<Tag> tags = aAppDAO.findTagsByNames(appTag);
        if(tags != null && tags.size() > 0) {
            Set<Tag> tagSet = new HashSet<Tag>();
            for(Tag aTag : tags) {
                tagSet.add(aTag);
            }
            app.setTags(tagSet);
        }
        
        gService.addApp(request, app, appIcon, appFile);
        
        model.addAttribute("uploadSuccessful", "true");
        
        return "redirect:/am/app/add"; 
    }
    
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String editApp(HttpServletRequest request, Model model) throws Exception {
        
        request.setAttribute("currentPage", "app");
        
        //获取table其他参数
        String appCat = ServletRequestUtils.getStringParameter(request, "appCat");
        String appDisplayName = ServletRequestUtils.getStringParameter(request, "appDisplayName");
        String appFileName = ServletRequestUtils.getStringParameter(request, "appFileName");
        String appShortDesc = ServletRequestUtils.getStringParameter(request, "appShortDesc");
        String appVersion = ServletRequestUtils.getStringParameter(request, "appVersion");
        //String appIcon = ServletRequestUtils.getStringParameter(request, "appIcon");
        //String appFile = ServletRequestUtils.getStringParameter(request, "appFile");
        String[] appTag = ServletRequestUtils.getStringParameters(request, "appTag");
        String iconPath = ServletRequestUtils.getStringParameter(request, "iconPath");
        System.out.println("iconPath is " + iconPath);
        
        //先从request里面获取到两个文件
        MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;
        Map<String, MultipartFile> fileMap = mRequest.getFileMap();
        
        MultipartFile appIcon = fileMap.get("appIcon");
        MultipartFile appFile = fileMap.get("appFile");
        
        App app = new App();
        app.setDisplayname(appDisplayName);
        app.setFilename(appFileName);
        app.setVersion(appVersion);
        app.setShortDesc(appShortDesc);
        app.setIconPath(iconPath);
        System.out.println("文件大小是 " + appFile.getSize());
        long fileSizeLong = appFile.getSize(); 
        if(fileSizeLong >= 0) {
            double mbSize = fileSizeLong / 1024.0 / 1024.0;
            String fileSize = String.format("%.2f", mbSize) + " MB";
            app.setFileSize(fileSize);
        }
        //app.setFileSize();
        
        //根据category找具体的实体类
        Category aCat = aAppDAO.findCatByName(appCat);
        if(aCat != null) {
            Set<Category> cats = new HashSet<Category>();
            cats.add(aCat);
            app.setCats(cats);
        }
        
        //根据Tag的名字找Tag
        List<Tag> tags = aAppDAO.findTagsByNames(appTag);
        if(tags != null && tags.size() > 0) {
            Set<Tag> tagSet = new HashSet<Tag>();
            for(Tag aTag : tags) {
                tagSet.add(aTag);
            }
            app.setTags(tagSet);
        }
        
        gService.addApp(request, app, appIcon, appFile);
        
        model.addAttribute("uploadSuccessful", "true");
        
        return "redirect:/am/app/edit"; 
    }
    
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String deleteApp(HttpServletRequest request, Model model, String appId, String sCat) throws Exception {
        
        request.setAttribute("currentPage", "app");
        
        //获取table其他参数
        String appCat = ServletRequestUtils.getStringParameter(request, "appCat");
        String appDisplayName = ServletRequestUtils.getStringParameter(request, "appDisplayName");
        String appFileName = ServletRequestUtils.getStringParameter(request, "appFileName");
        String appShortDesc = ServletRequestUtils.getStringParameter(request, "appShortDesc");
        String appVersion = ServletRequestUtils.getStringParameter(request, "appVersion");
        //String appIcon = ServletRequestUtils.getStringParameter(request, "appIcon");
        //String appFile = ServletRequestUtils.getStringParameter(request, "appFile");
        String[] appTag = ServletRequestUtils.getStringParameters(request, "appTag");
        String iconPath = ServletRequestUtils.getStringParameter(request, "iconPath");
        System.out.println("iconPath is " + iconPath);
        
        aAppDAO.deleteApp(appId);
        model.addAttribute("sCat", URLEncoder.encode(sCat, "UTF-8"));
        
        return "redirect:/am/app/list"; 
    }
    
    @RequestMapping(value = "/uploadAppIcon", method = RequestMethod.POST)
    public String uploadAppIcon(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception {
        
        //获取table其他参数
        String appCat = ServletRequestUtils.getStringParameter(req, "appCat");
        String appDisplayName = ServletRequestUtils.getStringParameter(req, "appDisplayName");
        String appFileName = ServletRequestUtils.getStringParameter(req, "appFileName");
        String appShortDesc = ServletRequestUtils.getStringParameter(req, "appShortDesc");
        String appVersion = ServletRequestUtils.getStringParameter(req, "appVersion");
        String[] appTag = ServletRequestUtils.getStringParameters(req, "appTag");
        
        
        //先从request里面获取到两个文件
        MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) req;
        Map<String, MultipartFile> fileMap = mRequest.getFileMap();
        
        MultipartFile appIcon = fileMap.get("appIcon");
        
        FileOperateUtil.upload(req, appIcon,
                appFileName, "appIcon", appVersion);
        
        //最后要返回json
        resp.addHeader("Pragma", "no-cache");
        resp.setHeader("Cache-Control","no-cache");
        resp.setHeader("Expires", "0");
        resp.setContentType("text/html;charset=UTF-8");
        
        String fileName = FileOperateUtil.renameStoreFileName(appIcon.getOriginalFilename(), appFileName, appVersion);
        
        JsonObject jsonGObj = new JsonObject();
        jsonGObj.addProperty("path", "appIcon/" + fileName);
        System.out.println(jsonGObj.toString());
        
        PrintWriter out;
        try {
            out = resp.getWriter();
            out.print(jsonGObj.toString());
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        return null;
    }
    
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String showAddApp(HttpServletRequest req, Model model, String test, String uploadSuccessful) {
        
        req.setAttribute("currentPage", "app");
        
        if(uploadSuccessful != null && uploadSuccessful.equals("true")) {
            model.addAttribute("uploadSuccessful", "true");
        }
        
        //获取所有可选的类别
        List<Category> cats = aAppDAO.findAllCat();
        
        model.addAttribute("cats", cats);
        
        //获取所有的可选Tag
        List<Tag> tags = aAppDAO.findAllTag();
        
        model.addAttribute("tags", tags);
        
        return "uploadApp";
    }
    
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String showEditApp(HttpServletRequest req, Model model, String test, String uploadSuccessful, String appId) {
        
        req.setAttribute("currentPage", "app");
        
        if(uploadSuccessful != null && uploadSuccessful.equals("true")) {
            model.addAttribute("uploadSuccessful", "true");
        }
        
        //获取所有可选的类别
        List<Category> cats = aAppDAO.findAllCat();
        
        model.addAttribute("cats", cats);
        
        //获取所有的可选Tag
        List<Tag> tags = aAppDAO.findAllTag();
        
        model.addAttribute("tags", tags);
        
        List<Object> apps = aAppDAO.findAppById(appId);
        
        model.addAttribute("app", apps.get(0));
        
        return "editApp";
    }
    
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String showApp(HttpServletRequest req, HttpServletResponse resp, Model model) throws UnsupportedEncodingException {
        
        CXPUtils.setAjaxHeader(req, resp, "html");
        
        //获取所有可选的类别
        List<Category> cats = aAppDAO.findAllCat();
        
        model.addAttribute("cats", cats);
        
        req.setAttribute("currentPage", "app");
        
        List<App> apps = new ArrayList<App>();
        
        System.out.println("req.getParameter('sCat') is " + req.getParameter("sCat"));
        String sCat = req.getParameter("sCat");
        
        if(sCat == null || sCat.trim().length() == 0) {
            sCat = "全部";
        }
        
        if(sCat != null && sCat.trim().length() > 0) {
            sCat = URLDecoder.decode(sCat,"UTF-8");
            System.out.println("sCat is " + sCat);
            if(sCat.equals("全部")) {
                apps = aAppDAO.findAllApp();
            } else {
                apps = aAppDAO.findAppByCat(sCat);     
            }
        }
        
        String currentPageNumStr = req.getParameter("currentPageNum");
        int currentPageNum = 1;
        
        if(currentPageNumStr != null) {
            currentPageNum = Integer.valueOf(currentPageNumStr);
        }
        
        
        //处理分页
        int totalResults = apps.size();
        
        BigDecimal b1 = new BigDecimal(totalResults);
        BigDecimal b2 = new BigDecimal(PAGE_SIZE);
        
        int pageNums = Integer.valueOf((b1.divide(b2, BigDecimal.ROUND_UP)).toString());
        
        int offset = 0;
        if(currentPageNum != 1) {
            offset = (currentPageNum-1)*PAGE_SIZE;
        }
        //分页查询
        if(sCat != null && sCat.trim().length() > 0) {
            if(sCat.equals("全部")) {
                
                apps = aAppDAO.findAllAppPage("lastmodified", "desc", offset, PAGE_SIZE);
            } else {
                apps = aAppDAO.findAppByCatPage(sCat, "lastmodified", "desc", offset, PAGE_SIZE);
            }
        }
        
        List<String> pages = new ArrayList<String>();
        for(int i=0; i<pageNums; i++) {
            pages.add(String.valueOf(i));
        }
        
        model.addAttribute("apps", apps);
        model.addAttribute("sCat", sCat);
        model.addAttribute("pageNums", pages);
        model.addAttribute("currentPageNum", currentPageNum);
        //int 
        /*
        for(Category tempCat : cats) {
            System.out.println(tempCat.getName());
        }
        */
        
        return "admin";
    }
    
    @RequestMapping(value = "/page", method = RequestMethod.GET)
    public String pagination (HttpServletRequest req, HttpServletResponse resp, Model model) throws UnsupportedEncodingException {
        
        CXPUtils.setAjaxHeader(req, resp, "html");
        
        //获取所有可选的类别
        List<Category> cats = aAppDAO.findAllCat();
        
        model.addAttribute("cats", cats);
        
        req.setAttribute("currentPage", "app");
        
        List<App> apps = new ArrayList<App>();
        
        System.out.println("req.getParameter('sCat') is " + req.getParameter("sCat"));
        String sCat = req.getParameter("sCat");
        
        if(sCat == null || sCat.trim().length() == 0) {
            sCat = "全部";
        }
        
        if(sCat != null && sCat.trim().length() > 0) {
            sCat = URLDecoder.decode(sCat,"UTF-8");
            System.out.println("sCat is " + sCat);
            if(sCat.equals("全部")) {
                apps = aAppDAO.findAllApp();
            } else {
                apps = aAppDAO.findAppByCat(sCat);     
            }
        }
        
        String currentPageNumStr = req.getParameter("currentPageNum");
        int currentPageNum = 1;
        
        if(currentPageNumStr != null) {
            currentPageNum = Integer.valueOf(currentPageNumStr);
        }
        
        
        //处理分页
        int totalResults = apps.size();
        
        BigDecimal b1 = new BigDecimal(totalResults);
        BigDecimal b2 = new BigDecimal(PAGE_SIZE);
        
        int pageNums = Integer.valueOf((b1.divide(b2, BigDecimal.ROUND_UP)).toString());
        
        int offset = 0;
        if(currentPageNum != 1) {
            offset = (currentPageNum-1)*PAGE_SIZE;
        }
        //分页查询
        if(sCat != null && sCat.trim().length() > 0) {
            if(sCat.equals("全部")) {
                
                apps = aAppDAO.findAllAppPage("lastmodified", "desc", offset, PAGE_SIZE);
            } else {
                apps = aAppDAO.findAppByCatPage(sCat, "lastmodified", "desc", offset, PAGE_SIZE);
            }
        }
        
        List<String> pages = new ArrayList<String>();
        for(int i=0; i<pageNums; i++) {
            pages.add(String.valueOf(i));
        }
        
        model.addAttribute("apps", apps);
        model.addAttribute("sCat", sCat);
        model.addAttribute("pageNums", pages);
        model.addAttribute("currentPageNum", currentPageNum);
        //int 
        /*
        for(Category tempCat : cats) {
            System.out.println(tempCat.getName());
        }
        */
        
        return "admin";
    }
    
}
