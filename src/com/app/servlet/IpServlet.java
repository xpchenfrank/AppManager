package com.app.servlet;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IpServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        doPost(request, response);  
    }  
  
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
        System.out.println("servlet 已经被调用 ");
        String ip = getRemoteAddress(request);  
        System.out.println("IP 是" + ip);  
        System.out.println("Mac 地址是实现1 " + getMACAddress(ip));  
        System.out.println("Mac 地址是实现2 " + getMac2(ip));
  
        response.setContentType("text/html");  
        PrintWriter out = response.getWriter();  
        out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");  
        out.println("<HTML>");  
        out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
        out.println("  <BODY>");  
        out.print("    This is ");  
        out.print(this.getClass());
        out.println(", using the POST method");  
        out.println("  </BODY>");  
        out.println("</HTML>");  
        out.flush();  
        out.close();  
    }  
  
    public String getRemoteAddress(HttpServletRequest request) {  
        String ip = request.getHeader("x-forwarded-for");  
        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {  
            ip = request.getHeader("Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {  
            ip = request.getHeader("WL-Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {  
            ip = request.getRemoteAddr();  
        }  
        return ip;  
    }  
  
    public String getMACAddress(String ip) {  
        String str = "";  
        String macAddress = "";  
        try {  
            Process p = Runtime.getRuntime().exec("nbtstat -A " + ip);  
            InputStreamReader ir = new InputStreamReader(p.getInputStream());  
            LineNumberReader input = new LineNumberReader(ir);  
            for (int i = 1; i < 100; i++) {  
                str = input.readLine();  
                if (str != null) {  
                    if (str.indexOf("MAC Address") > 1) {  
                        macAddress = str.substring(  
                                str.indexOf("MAC Address") + 14, str.length());  
                        break;  
                    }  
                }  
            }  
        } catch (IOException e) {  
            e.printStackTrace(System.out);  
        }  
        return macAddress;  
    }
    
    public String getMac(String ip){
        String mac = "";
        try {  
        Process p = Runtime.getRuntime().exec("arp -n");  
            InputStreamReader ir = new InputStreamReader(p.getInputStream());  
            LineNumberReader input = new LineNumberReader(ir);  
            p.waitFor();  
            boolean flag = true;  
            String ipStr = "(" + ip + ")";  
            while(flag) {  
                String str = input.readLine();  
                if (str != null) {  
                    if (str.indexOf(ipStr) > 1) {  
                        int temp = str.indexOf("at");  
                        mac = str.substring(  
                        temp + 3, temp + 20);  
                        break;  
                    }  
                } else  
                flag = false;  
            }  
        } catch (IOException e) {  
            e.printStackTrace(System.out);  
        } catch (InterruptedException e) {
            e.printStackTrace(System.out);
        }  
        return mac;  
    }
    
    public String getMac2(String ip){
        String str = "";  
        String macAddress = "";  
        try {  
            Process p = Runtime.getRuntime().exec("nbtstat -A " + ip);  
            InputStreamReader ir = new InputStreamReader(p.getInputStream());  
            LineNumberReader input = new LineNumberReader(ir);  
            for (int i = 1; i < 100; i++) {  
                str = input.readLine();  
                if (str != null) {  
                    if (str.indexOf("MAC Address") > 1) {  
                        macAddress = str.substring(str.indexOf("MAC Address") + 14, str.length());  
                        break;  
                    }  
                }  
            }  
        } catch (IOException e) {  
            e.printStackTrace(System.out);
        }  
        return macAddress;
    } 
    
}
