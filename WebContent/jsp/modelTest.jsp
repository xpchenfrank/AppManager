<!-- 这是使用bootstrap以后的search页面 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="/jsp/head.jsp"  %>
    <base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Word Clips search page</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <script src="js/bootstrap.min.js"></script>
    
    <style>
		body {
		  padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
		}
		
		html, body {
		  height: 100%;
		}
	</style>
	
	<script type="text/javascript">
		
		function onClickDiv() {
			$('#myModal').modal({
				  keyboard: false
			})
		}
	
	</script>
    
    <link href="css/bootstrap-responsive.css" rel="stylesheet">

</head>

<body>
    <!-- Button to trigger modal -->
	<a href="#myModal" role="button" class="btn" data-toggle="modal">查看演示案例</a>
	
	<div data-toggle="modal" onclick="onClickDiv()">test div</div>
	 
	<!-- Modal -->
	<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	    <h3 id="myModalLabel">Modal header</h3>
	  </div>
	  <div class="modal-body">
	    <p>One fine body…</p>
	  </div>
	  <div class="modal-footer">
	    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
	    <button class="btn btn-primary">Save changes</button>
	  </div>
	</div>
    
</body>
</html>