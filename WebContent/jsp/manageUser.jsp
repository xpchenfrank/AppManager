<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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

<%@ include file="/jsp/head.jsp"%>
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
<link rel="stylesheet" href="css/admin.css" />

<style>
body {
	padding-top: 60px;
	/* 60px to make the container go all the way to the bottom of the topbar */
	font-family: "Microsoft YaHei", NSimSun, sans-serif;
}

.tabFont {
	font-size: 26px;
	font-family: "Microsoft YaHei", NSimSun, sans-serif;
}

.tableExample {
	position: relative; //
	padding: 10px 15px 15px;
	margin: 0 -15px 15px;
	border-color: #e5e5e5 #eee #eee;
	border-style: solid;
	border-width: 1px 0;
	-webkit-box-shadow: inset 0 3px 6px rgba(0, 0, 0, .05);
	box-shadow: inset 0 3px 6px rgba(0, 0, 0, .05);
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


.nav-sidebar>.active>a,.nav-sidebar>.active>a:hover,.nav-sidebar>.active>a:focus
	{
	color: #fff;
}
</style>

	<script language="JavaScript" type="text/javascript"
		src="js/ajaxfileupload.js"></script>
	<script language="JavaScript" type="text/javascript"
		src="js/uploadApp.js"></script>
	<script language="JavaScript" type="text/javascript"
	    src="js/bootstrap.js"></script>
	

	<script type="text/javascript">
	
			jQuery(function() {
					//$('#uploadSuccessful').modal('hide');
			      var uploadSuccessful = <%=request.getAttribute("uploadSuccessful")%>;
				  if(uploadSuccessful != null && uploadSuccessful == true) {
					   $('#uploadSuccessful').modal({
	                        keyboard: false
	                    });
					   $('#uploadSuccessful').modal('show');
				  }
			});
			
		
	</script>
</head>

<body cz-shortcut-listen="true">

    <%@ include file="/jsp/adminHeader.jsp"%>
    
	<div class="container-fluid">
		<div class="row">
			<%@ include file="/jsp/adminSidebar.jsp"%>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

				<h1 class="page-header" style="font-size: 20px; margin-left: -15px;">管理用户</h1>

				<form class="form-horizontal" role="form"
					enctype="multipart/form-data"
					action="<c:url value="/am/app/add" />" method="post">

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">应用分类:</label>
						<div class="col-sm-2">
							<select class="form-control col-xs-3" name="appCat">
								<c:forEach items="${cats}" var="cat" varStatus="status">
									<option>${cat.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="row tableLine"></div>

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">应用显示名称:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="appDisplayName"
								name="appDisplayName" placeholder="显示名称是会显示在界面上的名字,例如: 微信" />
						</div>
					</div>

					<div class="row tableLine"></div>

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">应用文件名称:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="appFileName"
								name="appFileName" placeholder="文件名称是用来在后台存储的,建议使用拼音,例如: weixin" />
						</div>
					</div>

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">应用广告语:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="appShortDesc"
								name="appShortDesc" placeholder="" />
						</div>
					</div>

					<div class="row tableLine"></div>

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">应用版本:</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" id="appVersion"
								name="appVersion" placeholder="1.0.0" />
						</div>
					</div>

					<div class="row tableLine"></div>

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">应用图标:</label>
						<div class="col-sm-5">
							<input type="text" class="inputText" name="upfileAppIcon"
								id="upfileAppIcon" readonly> <input type="button"
								class="btn btn-primary" style="margin-top: -3px;" value="选择"
								onclick="pathAppIcon.click()"> <input type="file"
								id="pathAppIcon" style="display: none" name="appIcon"
								onchange="javascript:uploadAppIcon('pathAppIcon');">
						</div>
					</div>

					<div class="form-group" id="previewDiv" style="display: none;">
						<label for="inputEmail3" class="col-sm-2 control-label"></label>
						<div class="col-sm-5">
							<img id="previewImg" src="" style="width: 60px; height: 60px;"></img>
						</div>
					</div>

					<div class="row tableLine"></div>
                    
                    <script type="text/javascript">
    
				        function showRentWindow() {
				            
				            alert("1");
				        }
				        
				    </script>
                    
                    
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label" onclick="showRentWindow();">应用文件:</label>
						<div class="col-sm-5">
							<input type="text" class="inputText" name="upfileAppFile"
								id="upfileAppFile" readonly> <input type="button"
								class="btn btn-primary" style="margin-top: -3px;" value="选择"
								onclick="pathAppFile.click()"> <input type="file"
								id="pathAppFile" style="display: none" name="appFile"
								onchange="upfileAppFile.value=this.value">
						</div>
					</div>

					<div class="row tableLine"></div>

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">应用属性:</label>
						<div class="col-sm-5">
							<c:forEach items="${tags}" var="tag" varStatus="status">
								<label class="checkbox-inline"> <input type="checkbox"
									name="appTag" id="inlineCheckbox1" value="${tag.name}">${tag.name}
								</label>
							</c:forEach>
						</div>
					</div>

					<div class="form-group"></div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-primary">新建应用</button>
						</div>
					</div>
				</form>

				<div class="row"></div>

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
	<script
		src="./Dashboard Template for Bootstrap_files/ie10-viewport-bug-workaround.js"></script>


	<div id="global-zeroclipboard-html-bridge"
		class="global-zeroclipboard-container" title=""
		style="position: absolute; left: 0px; top: -9999px; width: 15px; height: 15px; z-index: 999999999;"
		data-original-title="Copy to clipboard">
		<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
			id="global-zeroclipboard-flash-bridge" width="100%" height="100%">
			<param name="movie"
				value="/assets/flash/ZeroClipboard.swf?noCache=1420680315753">
			<param name="allowScriptAccess" value="sameDomain">
			<param name="scale" value="exactfit">
			<param name="loop" value="false">
			<param name="menu" value="false">
			<param name="quality" value="best">
			<param name="bgcolor" value="#ffffff">
			<param name="wmode" value="transparent">
			<param name="flashvars"
				value="trustedOrigins=v3.bootcss.com%2C%2F%2Fv3.bootcss.com%2Chttp%3A%2F%2Fv3.bootcss.com">
			<embed src="/assets/flash/ZeroClipboard.swf?noCache=1420680315753"
				loop="false" menu="false" quality="best" bgcolor="#ffffff"
				width="100%" height="100%" name="global-zeroclipboard-flash-bridge"
				allowscriptaccess="sameDomain" allowfullscreen="false"
				type="application/x-shockwave-flash" wmode="transparent"
				pluginspage="http://www.macromedia.com/go/getflashplayer"
				flashvars="trustedOrigins=v3.bootcss.com%2C%2F%2Fv3.bootcss.com%2Chttp%3A%2F%2Fv3.bootcss.com"
				scale="exactfit">
		</object>
	</div>
	<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200"
		viewBox="0 0 200 200" preserveAspectRatio="none"
		style="visibility: hidden; position: absolute; top: -100%; left: -100%;">
		<defs></defs>
		<text x="0" y="10"
			style="font-weight:bold;font-size:10pt;font-family:Arial, Helvetica, Open Sans, sans-serif;dominant-baseline:middle">200x200</text></svg>

	<!-- 模态对话框 -->
    <div id="uploadSuccessful" class="modal fade"
        tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                      <h4 class="modal-title" id="mySmallModalLabel">APP上传成功</h4>
                    </div>
                    <div class="modal-body" style="text-align: center;">
                         <button type="button" class="btn btn-primary"  onclick="$('#uploadSuccessful').modal('hide');">确认</button>
                    </div>
                  </div>
        </div>
    </div>
</body>
</html>