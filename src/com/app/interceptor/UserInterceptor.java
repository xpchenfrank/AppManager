package com.app.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class UserInterceptor extends HandlerInterceptorAdapter {
    
    static Logger logger = Logger.getLogger(UserInterceptor.class);

    @Override  
    public void postHandle(HttpServletRequest request,  
            HttpServletResponse response, Object handler,  
            ModelAndView modelAndView) throws Exception {  
          
        super.postHandle(request, response, handler, modelAndView);  
    }
  
    @Override  
    public boolean preHandle(HttpServletRequest request,  
        
    	HttpServletResponse response, Object handler) throws Exception {  
        
        String url = request.getRequestURI();
          
        Cookie[] cookies = request.getCookies();
        if(cookies != null) {
            for(Cookie aCookie : cookies) {

            }
        }
        
        return super.preHandle(request, response, handler);
    }

}
