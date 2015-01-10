<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<!-- 这个就是每个页面上面的页头 那条黑色的东西 -->
<head>
	<%@ include file="/jsp/head.jsp"%>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>wordclips</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href="css/bootstrap.css" rel="stylesheet" media="screen">
    <script src="js/bootstrap.min.js"></script>
    
    <link href="css/bootstrap-responsive.css" rel="stylesheet">  

</head>
<body>

     <div class="navbar navbar-inverse navbar-fixed-top" id="nav_title" >
        <div class="navbar-inner">
            <div class="container">
         
                <!-- .btn-navbar is used as the toggle for collapsed navbar content -->
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                </a>
                
                <!-- Be sure to leave the brand out there if you want it shown -->
                <a class="brand" style="color: #FFF" href="lj/roomCtrl/getRooms">客房管理</a>
              
                <!--  
                <ul class="nav pull-right">
                    <li>
                      <a href="wc/search.view">登陆</a>
                    </li>
                    <li><a href="wc/addWord.view">注册</a></li>
                </ul>
                 -->
                
                <!-- Everything you want hidden at 940px or less, place within here -->
                <div class="nav-collapse collapse">
                  <!-- .nav, .navbar-search, .navbar-form, etc -->
                    <ul class="nav">
                    	<!-- class="active" -->
                        <li id="roomMgr">
                          <a href="lj/roomCtrl/getRooms">客房管理</a>
                        </li>
                        <li  id="changePrice"><a href="lj/roomCtrl/getRoomsForChangePrice">基础房价修改</a></li>
                        <li  id="income"><a href="lj/roomCtrl/showIncome">收入统计</a></li>
                    </ul>
                    
                </div>
         
            </div>
        </div>
    </div>

</body>
</html>