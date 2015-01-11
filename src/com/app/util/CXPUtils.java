package com.app.util;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CXPUtils {
    
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
    
    
    public static String toInClause(String[] strArray) {
    	StringBuffer strBuffer = new StringBuffer();
    	strBuffer.append("(");
    	for(String temp : strArray) {
    		strBuffer.append("'"+temp+"'");
    		strBuffer.append(",");
    	}
    	strBuffer.deleteCharAt(strBuffer.lastIndexOf(","));
    	strBuffer.append(")");
    	return strBuffer.toString();
    }
    
    public static void main(String[] args) {
    	String[] testArray ={"Èöµ©·ÉÈ÷", "Ë®µç·Ñ", "Èöµ©·ÉÈ÷"};
    	System.out.println(toInClause(testArray));
	}
    

}
