<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- 
    <link rel="icon" href="http://v3.bootcss.com/favicon.ico">
     -->

	 <%@ include file="/jsp/head.jsp"  %>
    <base href="<%=basePath%>">
    
    <title>城市生活应用管理平台</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <!-- 
    <script src="./Dashboard Template for Bootstrap_files/ie-emulation-modes-warning.js"></script>
     -->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- 
    <link rel="stylesheet" href="css/mybase.css"/>
     -->
     <link rel="stylesheet" href="css/admin.css"/>
     
    <style>
	    body 
	    {
			padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
			font-family: "Microsoft YaHei",NSimSun,sans-serif;
	    }
	    
	    .tabFont {
	        font-size: 26px;
	        font-family: "Microsoft YaHei",NSimSun,sans-serif;
	    }
	    
	    .tableExample {
		    position: relative;
			//padding: 10px 15px 15px;
			margin: 0 -15px 15px;
			border-color: #e5e5e5 #eee #eee;
			border-style: solid;
			border-width: 1px 0;
			-webkit-box-shadow: inset 0 3px 6px rgba(0,0,0,.05);
			box-shadow: inset 0 3px 6px rgba(0,0,0,.05);
	    }
	    
	    .mytab {
		    color: #555;
			cursor: default;
			background-color: #fff;
			border: 1px solid #ddd;
			border-radius: 5px 5px 0px 0px;
			border-bottom-color: transparent;
			margin: 0px 10px 0px 10px;
	    }
	    
	    .myacitve {
            color: #fff;
            cursor: default;
            background-color: #428BCA;
            border: 1px solid #ddd;
            border-radius: 5px 5px 0px 0px;
            border-bottom-color: transparent;
            margin: 0px 10px 0px 10px;
        }
        
        .mySidebar {
            border-bottom: 1px solid #eee;
            border-top: 1px solid #eee;
        }
        
        .nav-sidebar {
			margin-right: -21px;
			margin-bottom: 0px;
			margin-left: -20px;
		}
		
		.dalei {
		    height: 50px;
		    line-height: 50px;
		    font-size: 20px;
		}
		
		.nav-sidebar > .active > a, .nav-sidebar > .active > a:hover, .nav-sidebar > .active > a:focus {
			color: #fff;
		}
		
    </style>
  </head>

  <body cz-shortcut-listen="true">

    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="./Dashboard Template for Bootstrap_files/Dashboard Template for Bootstrap.html" 
             style="font-size: 27px;padding-left: 19px;color: #fff;">
             <span><img src="images/iconfont-iconfontyingyongjiasu.png" style="margin-top: -2px;margin-right: 10px;"></img></span>城市生活应用管理平台
          </a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="./Dashboard Template for Bootstrap_files/Dashboard Template for Bootstrap.html">首页</a></li>
            <li><a href="./Dashboard Template for Bootstrap_files/Dashboard Template for Bootstrap.html">设置</a></li>
            <li><a href="./Dashboard Template for Bootstrap_files/Dashboard Template for Bootstrap.html">退出</a></li>
          </ul>
          <form class="navbar-form navbar-right">
          <!-- 
            <input type="text" class="form-control" placeholder="Search...">
             -->
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
      <!-- style="background-color: #222222;" -->
        <div class="col-sm-3 col-md-2 sidebar" style="top: 49px;padding: 0px 20px 20px 20px;">
          <ul class="nav nav-sidebar">
            <li class="active mySidebar dalei" style="padding-left: 20px;"><span><img src="images/iconfont-yingyong.png" style="margin-top: -2px;margin-right: 17px;"></img></span>应用管理</li>
            <li class="mySidebar"><a href="" style="padding-left: 78px;">全部</a></li>
            <li class="mySidebar"><a href="" style="padding-left: 78px;">社交</a></li>
            <li class="mySidebar"><a href="" style="padding-left: 78px;">视频</a></li>
            <li class="mySidebar"><a href="" style="padding-left: 78px;">音乐</a></li>
            <li class="mySidebar"><a href="" style="padding-left: 78px;">生活</a></li>
            <li class="mySidebar"><a href="" style="padding-left: 78px;">阅读</a></li>
            <li class="mySidebar"><a href="" style="padding-left: 78px;">系统</a></li>
            <li class="mySidebar"><a href="" style="padding-left: 78px;">安全</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li class="mySidebar dalei" style="olor: #428bca;"><a style="padding: 0px 0px 0px 20px;"><span><img src="images/iconfont-changdiguanli.png" style="margin-top: -2px;margin-right: 17px;"></img></span>网点管理</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li class="mySidebar dalei" style="color: #428bca;"><a style="padding: 0px 0px 0px 20px;"><span><img src="images/iconfont-neibuguanli.png" style="margin-top: -2px;margin-right: 17px;"></img></span>用户管理</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li class="mySidebar dalei" style="color: #428bca;"><a style="padding: 0px 0px 0px 20px;"><span><img src="images/iconfont-reportMg.png" style="margin-top: -2px;margin-right: 17px;"></img></span>数据统计</a></li>
          </ul>          
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        
        	<h1 class="page-header" style="font-size: 20px;margin-left:-15px;">上传应用</h1>
          
	        <form class="form-horizontal" role="form">
				<div class="form-group">
				  <label for="inputEmail3" class="col-sm-2 control-label">应用分类:</label>
				  <div class="col-sm-2">
				  	<select class="form-control col-xs-3">
				           <option>社交</option>
				           <option>1</option>
				           <option>2</option>
				           <option>3</option>
				           <option>4</option>
				           <option>5</option>
				         </select>
				  </div>
				</div>
				
				<div class="row tableLine"></div>
				
				<div class="form-group">
				  <label for="inputEmail3" class="col-sm-2 control-label">应用显示名称:</label>
				  <div class="col-sm-4">
				    <input type="text" class="form-control" id="inputPassword3" placeholder="显示名称是会显示在界面上的名字,例如: 微信"/>
				  </div>
				</div>
				
				<div class="row tableLine"></div>
				
				<div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">应用文件名称:</label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control" id="inputPassword3" placeholder="文件名称是用来在后台存储的,例如: weixin"/>
                  </div>
                </div>
                
                <div class="row tableLine"></div>
                
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">应用版本:</label>
                  <div class="col-sm-2">
                    <input type="text" class="form-control" id="inputPassword3" placeholder="1.0.0"/>
                  </div>
                </div>
                
                <div class="row tableLine"></div>
                
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">应用图标:</label>
                  <div class="col-sm-2">
                    <input type="file" class="form-control" id="icon"/ >
                  </div>
                </div>
                
                <div class="row tableLine"></div>
                
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">应用文件:</label>
                  <div class="col-sm-2">
                    <input type="file" class="form-control" id="icon"/ >
                  </div>
                </div>
                
                <div class="row tableLine"></div>
                
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">应用属性:</label>
                  <div class="col-sm-2">
					<label class="checkbox-inline">
					  <input type="checkbox" id="inlineCheckbox1" value="option1"> 1
					</label>
					<label class="checkbox-inline">
					  <input type="checkbox" id="inlineCheckbox2" value="option2"> 2
					</label>
					<label class="checkbox-inline">
					  <input type="checkbox" id="inlineCheckbox3" value="option3"> 3
					</label>
                  </div>
                </div>
			
			 <div class="form-group"></div>
			 
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <button type="submit" class="btn btn-primary">新建应用</button>
			    </div>
			  </div>
		  </form>
          
          <!-- 
          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDIwMCAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzBEOEZEQiIvPjxnPjx0ZXh0IHg9Ijc1LjUiIHk9IjEwMCIgc3R5bGU9ImZpbGw6I0ZGRkZGRjtmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToxMHB0O2RvbWluYW50LWJhc2VsaW5lOmNlbnRyYWwiPjIwMHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg==" data-holder-rendered="true">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="200x200" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDIwMCAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzM5REJBQyIvPjxnPjx0ZXh0IHg9Ijc1LjUiIHk9IjEwMCIgc3R5bGU9ImZpbGw6IzFFMjkyQztmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToxMHB0O2RvbWluYW50LWJhc2VsaW5lOmNlbnRyYWwiPjIwMHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg==" data-holder-rendered="true">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="200x200" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDIwMCAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzBEOEZEQiIvPjxnPjx0ZXh0IHg9Ijc1LjUiIHk9IjEwMCIgc3R5bGU9ImZpbGw6I0ZGRkZGRjtmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToxMHB0O2RvbWluYW50LWJhc2VsaW5lOmNlbnRyYWwiPjIwMHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg==" data-holder-rendered="true">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="200x200" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDIwMCAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzM5REJBQyIvPjxnPjx0ZXh0IHg9Ijc1LjUiIHk9IjEwMCIgc3R5bGU9ImZpbGw6IzFFMjkyQztmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToxMHB0O2RvbWluYW50LWJhc2VsaW5lOmNlbnRyYWwiPjIwMHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg==" data-holder-rendered="true">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
          </div>

          <h2 class="sub-header">应用管理</h2>
           -->
          <div class="row">
            
          </div>
           
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="./Dashboard Template for Bootstrap_files/jquery.min.js"></script>
    <script src="./Dashboard Template for Bootstrap_files/bootstrap.min.js"></script>
    <script src="./Dashboard Template for Bootstrap_files/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="./Dashboard Template for Bootstrap_files/ie10-viewport-bug-workaround.js"></script>
  

<div id="global-zeroclipboard-html-bridge" class="global-zeroclipboard-container" title="" style="position: absolute; left: 0px; top: -9999px; width: 15px; height: 15px; z-index: 999999999;" data-original-title="Copy to clipboard">      <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" id="global-zeroclipboard-flash-bridge" width="100%" height="100%">         <param name="movie" value="/assets/flash/ZeroClipboard.swf?noCache=1420680315753">         <param name="allowScriptAccess" value="sameDomain">         <param name="scale" value="exactfit">         <param name="loop" value="false">         <param name="menu" value="false">         <param name="quality" value="best">         <param name="bgcolor" value="#ffffff">         <param name="wmode" value="transparent">         <param name="flashvars" value="trustedOrigins=v3.bootcss.com%2C%2F%2Fv3.bootcss.com%2Chttp%3A%2F%2Fv3.bootcss.com">         <embed src="/assets/flash/ZeroClipboard.swf?noCache=1420680315753" loop="false" menu="false" quality="best" bgcolor="#ffffff" width="100%" height="100%" name="global-zeroclipboard-flash-bridge" allowscriptaccess="sameDomain" allowfullscreen="false" type="application/x-shockwave-flash" wmode="transparent" pluginspage="http://www.macromedia.com/go/getflashplayer" flashvars="trustedOrigins=v3.bootcss.com%2C%2F%2Fv3.bootcss.com%2Chttp%3A%2F%2Fv3.bootcss.com" scale="exactfit">                </object></div><svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" viewBox="0 0 200 200" preserveAspectRatio="none" style="visibility: hidden; position: absolute; top: -100%; left: -100%;"><defs></defs><text x="0" y="10" style="font-weight:bold;font-size:10pt;font-family:Arial, Helvetica, Open Sans, sans-serif;dominant-baseline:middle">200x200</text></svg></body></html>