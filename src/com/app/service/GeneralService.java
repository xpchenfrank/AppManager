package com.app.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.app.model.App;

@Component
public interface GeneralService {
	
	public void addApp(HttpServletRequest req, App app, MultipartFile appIcon, MultipartFile appFile) throws Exception;
    
    public void insertNode();
    
    public void updateNode();
    
}
