package com.app.util;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CXPUtils {
    
    /**
     *  设置ajax返回时的头信息
     */
    public static void setAjaxHeader(HttpServletRequest req, HttpServletResponse resp, String type) {
        
        try {
            req.setCharacterEncoding("utf-8");
            resp.addHeader("Pragma", "no-cache");
            resp.setHeader("Cache-Control","no-cache");
            resp.setHeader("Expires", "0");
            if("html".equals(type)) {
                resp.setContentType("text/html;charset=UTF-8");
            } else if("xml".equals(type)) {
                resp.setContentType("text/xml;charset=UTF-8");
            } else if("json".equals(type)) {
                resp.setContentType("application/x-json;charset=UTF-8");
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

}
