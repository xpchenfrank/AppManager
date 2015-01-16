<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- 
    <link rel="icon" href="http://v3.bootcss.com/favicon.ico">
     -->

	<%@ include file="/jsp/head.jsp"%>
	<base href="<%=basePath%>">

    <title>城市生活应用管理平台</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">
    <link href="css/admin.css" rel="stylesheet">

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
    
    <script language="JavaScript" type="text/javascript"
        src="js/bootstrap.js"></script>
        
    <script type="text/javascript">
    
        var deleteAppId;
	    function deleteApp(id) {
			$('#deleteWindow').modal({
			       keyboard: false
			   });
			$('#deleteWindow').modal('show');
			deleteAppId = id;
	    }
	    
	    function confirmDel() {
	    	$('#deleteWindow').modal('hide');
	    	window.location.href='<%=basePath%>am/app/delete?sCat=${sCat}&appId=' + deleteAppId;
	    }
    /*
        jQuery(function() {
           
          var currentPage = '${currentPage}';
          //移除所有大类的.active
          $(".dalei").removeClass("active");
          
          if(currentPage == 'app') {
              $("#appBar").addClass("active");
              
          } else if (currentPage == 'user') {
              $("#userBar").addClass("active");
              //$("#userBar").html("<span><img src='images/iconfont-changdiguanli.png' style='margin-top: -2px; margin-right: 17px;color:black;'></img></span>网点管理");
              $("#userBar").html("网点管理");
          }
          
        });
      */  
    </script>
  </head>

  <body cz-shortcut-listen="true">

    <%@ include file="/jsp/adminHeader.jsp"%>
    
    <div class="container-fluid">
        <div class="row">
            <%@ include file="/jsp/adminSidebar.jsp"%>
            
	        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	        
	          <h1 class="page-header" style="font-size: 20px;margin-left:-15px;">应用管理</h1>
	          
			<div class="row">
			
			  <div class="col-xs-2">
			   <button type="submit" class="btn btn-primary" onclick="window.location.href='<%=basePath%>am/app/add'"><img src="images/iconfont-xinjian.png" style="margin-top: -3px;margin-right: 6px;"></img>上传应用</button>
	          </div>
			  
			  <div class="col-xs-2" style="margin-left: -20px;">
			    <select class="form-control col-xs-3" name="appCat">
	              <c:forEach items="${cats}" var="cat" varStatus="status">
                      <option>${cat.name}</option>
                  </c:forEach>
	            </select>
			  </div>
			  <div class="col-xs-3">
			    <input type="text" class="form-control" placeholder="请输入关键字" name="keyword"/>
			  </div>
			  <div class="col-xs-4">
			    <button type="submit" class="btn btn-default" onclick="window.location.href='<%=basePath%>am/app/search';">查询</button>
			  </div>
	           
	        </div>
	          
	        <div class="tableExample" style="margin-top: 10px;">
	        
	         <div class="table-responsive ">
	              <table class="table table-striped">
	                <thead>
	                  <tr >
	                    <th width="20px" style="border-right: 1px solid #eee;height:40px;line-height:40px;"></th>
	                    <th style="border-right: 1px solid #eee;height:40px;line-height:40px;text-align:left;">应用名称</th>
	                    <th style="border-right: 1px solid #eee;height:40px;line-height:40px;width:110px;text-align:center;">应用分类</th>
	                    <th style="border-right: 1px solid #eee;height:40px;line-height:40px;width:110px;text-align:center;">版本型号</th>
	                    <th style="border-right: 1px solid #eee;height:40px;line-height:40px;width:110px;text-align:center;">应用大小</th>
	                    <th style="border-right: 1px solid #eee;height:40px;line-height:40px;width:200px;text-align:center;">操作</th>
	                  </tr>
	                </thead>
	                <tbody>
		                <c:forEach items="${apps}" var="app" varStatus="obj">  
						  <c:if test="${obj.count%2 == '0'}">  
							  <tr >
		                        <td style="border-right: 1px solid #eee;height:40px;line-height:40px;">${obj.count}</td>
		                        <td style="border-right: 1px solid #eee;height:40px;line-height:40px;">
		                            <span><img src="${app[0].iconPath}" style="width:40px;height:40px;line-height:40px;margin-right: 20px;"></img></span>${app[0].displayname}
		                        </td>
		                        <td style="border-right: 1px solid #eee;height:40px;line-height:40px;text-align:center;">${app[1].name}</td>
		                        <td style="border-right: 1px solid #eee;height:40px;line-height:40px;text-align:center;">${app[0].version}</td>
		                        <td style="border-right: 1px solid #eee;height:40px;line-height:40px;text-align:center;">${app[0].fileSize}</td>
		                        <td style="height:40px;line-height:40px;text-align:center;">
		                             <a class="optIcon" 
		                             href="javascript:void(0);"
                                       onclick="window.location.href='<%=basePath%>am/app/edit?appId=${app[0].id}';">
		                                 <img src="images/iconfont-xiugai.png"></img>
		                             </a>
		                             
		                             &nbsp;&nbsp;&nbsp;
		                             
		                             <a class="optIcon" 
		                             href="javascript:void(0);"
                                       onclick="deleteApp(${app[0].id});">
		                                 <img src="images/iconfont-shanchu.png"></img>
		                             </a>
		                             
		                             &nbsp;&nbsp;&nbsp;
		                             <a class="optIcon" 
		                             href="javascript:void(0);"
                                       onclick="window.location.href='<%=basePath%>am/app/edit?appId=${app[0].id}';">
		                                 <img src="images/iconfont-chaxuntongji.png"></img>
		                             </a>
		                        </td>
		                      </tr>
						  </c:if>  
						  <c:if test="${obj.count%2 != '0'}">  
							 <tr >
		                        <td style="border-right: 1px solid #eee;height:40px;line-height:40px;">${obj.count}</td>
		                        <td style="border-right: 1px solid #eee;height:40px;line-height:40px;">
		                            <span><img src="${app[0].iconPath}" style="width:40px;height:40px;line-height:40px;margin-right: 20px;"></img></span>${app[0].displayname}
		                        </td>
		                        <td style="border-right: 1px solid #eee;height:40px;line-height:40px;text-align:center;">${app[1].name}</td>
		                        <td style="border-right: 1px solid #eee;height:40px;line-height:40px;text-align:center;">${app[0].version}</td>
		                        <td style="border-right: 1px solid #eee;height:40px;line-height:40px;text-align:center;">${app[0].fileSize}</td>
		                        <td style="height:40px;line-height:40px;text-align:center;">
		                             <a class="optIcon" data-change-event-name="property&amp;test&amp;属性.0"
		                               href="javascript:void(0);"
                                       onclick="window.location.href='<%=basePath%>am/app/edit?appId=${app[0].id}';">
		                                 <img src="images/iconfont-xiugai.png"></img>
		                             </a>
		                             
		                             &nbsp;&nbsp;&nbsp;
		                             
		                             <a class="optIcon" 
		                             href="javascript:void(0);"
                                       onclick="deleteApp(${app[0].id});">
		                                 <img src="images/iconfont-shanchu.png"></img>
		                             </a>
		                             
		                             &nbsp;&nbsp;&nbsp;
		                             <a class="optIcon" 
		                             href="javascript:void(0);"
                                       onclick="window.location.href='<%=basePath%>am/app/edit?appId=${app[0].id}';">
		                                 <img src="images/iconfont-chaxuntongji.png"></img>
		                             </a>
		                        </td>
		                      </tr>  
						  </c:if>  
						</c:forEach>
	                </tbody>
	              </table>
	            </div>          
	        </div>   <!--  table 的封装 -->
	        
	          <!-- 分页区域 -->
		    <div class="row">
				<div class="mistat-pagination" style="float: right;margin-right: 50px;">
				    <div
				        class="dataTables_paginate fg-buttonset ui-buttonset fg-buttonset-multi ui-buttonset-multi paging_full_numbers">
				            <a
				            class="pageButton"
				            id="DataTables_Table_0_first"
				            href="javascript:void(0);"
				            onclick="window.location.href=encodeURI('<%=basePath%>am/app/page?sCat=${sCat}&currentPageNum=1');">首页</a>
				            <!-- 
				            <a class="pageButton"
				            tabindex="0" id="DataTables_Table_0_previous">上一页</a>
				             -->
				            <span>
				                <c:forEach items="${pageNums}" var="app" varStatus="obj">
				                    <a href="javascript:void(0);"
                                       onclick="window.location.href=encodeURI('<%=basePath%>am/app/page?sCat=${sCat}&currentPageNum=${obj.count}');" 
				                      <c:if test="${currentPageNum == obj.count}">
				                        class="pageButton pageNum"
				                      </c:if>
				                      <c:if test="${currentPageNum != obj.count}">
                                        class="pageButton"
                                      </c:if>
				                     >${obj.count}</a>
				                </c:forEach>
				            </span>
				            <!-- 
				            <a class="pageButton"
				            tabindex="0" id="DataTables_Table_0_next">下一页</a>
				             -->
				            <a class="pageButton"
				            tabindex="0" id="DataTables_Table_0_last"
				            href="javascript:void(0);"
				            onclick="window.location.href=encodeURI('<%=basePath%>am/app/page?sCat=${sCat}&currentPageNum=${fn:length(pageNums)}');">尾页</a>
				    </div>
				</div>  
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
  
     <!-- 模态对话框 -->
    <div id="deleteWindow" class="modal fade"
        tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                      <h4 class="modal-title" id="mySmallModalLabel">确定要删除吗</h4>
                    </div>
                    <div class="modal-body" style="text-align: center;">
                         <button type="button" class="btn btn-primary"  onclick="confirmDel();">确认</button>
                         <button type="button" class="btn btn-primary"  onclick="$('#deleteWindow').modal('hide');">取消</button>
                    </div>
                  </div>
        </div>
    </div>

<div id="global-zeroclipboard-html-bridge" class="global-zeroclipboard-container" title="" style="position: absolute; left: 0px; top: -9999px; width: 15px; height: 15px; z-index: 999999999;" data-original-title="Copy to clipboard">      <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" id="global-zeroclipboard-flash-bridge" width="100%" height="100%">         <param name="movie" value="/assets/flash/ZeroClipboard.swf?noCache=1420680315753">         <param name="allowScriptAccess" value="sameDomain">         <param name="scale" value="exactfit">         <param name="loop" value="false">         <param name="menu" value="false">         <param name="quality" value="best">         <param name="bgcolor" value="#ffffff">         <param name="wmode" value="transparent">         <param name="flashvars" value="trustedOrigins=v3.bootcss.com%2C%2F%2Fv3.bootcss.com%2Chttp%3A%2F%2Fv3.bootcss.com">         <embed src="/assets/flash/ZeroClipboard.swf?noCache=1420680315753" loop="false" menu="false" quality="best" bgcolor="#ffffff" width="100%" height="100%" name="global-zeroclipboard-flash-bridge" allowscriptaccess="sameDomain" allowfullscreen="false" type="application/x-shockwave-flash" wmode="transparent" pluginspage="http://www.macromedia.com/go/getflashplayer" flashvars="trustedOrigins=v3.bootcss.com%2C%2F%2Fv3.bootcss.com%2Chttp%3A%2F%2Fv3.bootcss.com" scale="exactfit">                </object></div><svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" viewBox="0 0 200 200" preserveAspectRatio="none" style="visibility: hidden; position: absolute; top: -100%; left: -100%;"><defs></defs><text x="0" y="10" style="font-weight:bold;font-size:10pt;font-family:Arial, Helvetica, Open Sans, sans-serif;dominant-baseline:middle">200x200</text></svg></body></html>