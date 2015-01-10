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
		
		.roomOnDiv {
			border: 1px black solid;
			height: 60px;
			line-height: 60px;
			background-color: #25C555;
			cursor: pointer;
		}
	</style>
    
    <link href="css/bootstrap-responsive.css" rel="stylesheet">

</head>

<body>
    
    <jsp:include page="/jsp/pageHeader.jsp"></jsp:include>
    
    <div style="height: 10%; min-height: 30px; max-height: 60px;">
    </div>
    
    <div class="container">
	    <div class="row text-center" style="margin-top: 10px;">
	        <div class="span2">
	        	<div class="roomOnDiv">201</div>
	        </div>
	        <div class="span2">
	        	<div class="roomOnDiv">202</div>
	        </div>
	        <div class="span2">
	        	<div class="roomOnDiv">203</div>
	        </div>
	        <div class="span2">
	        	<div class="roomOnDiv">204</div>
	        </div>
	        <div class="span2">
	        	<div class="roomOnDiv">205</div>
	        </div>
            <div class="span2">
            	<div class="roomOnDiv">205</div>
            </div>
	    </div>
	    
	     <div class="row text-center" style="margin-top: 10px;">
	        <div class="span2">
	        	<div class="roomOnDiv">201</div>
	        </div>
	        <div class="span2">
	        	<div class="roomOnDiv">202</div>
	        </div>
	        <div class="span2">
	        	<div class="roomOnDiv">203</div>
	        </div>
	        <div class="span2">
	        	<div class="roomOnDiv">204</div>
	        </div>
	        <div class="span2">
	        	<div class="roomOnDiv">205</div>
	        </div>
            <div class="span2">
            	<div class="roomOnDiv">205</div>
            </div>
	    </div>
	    
	    <div class="row text-center" style="margin-top: 10px;">
	        <div class="span2">
	        	<div class="roomOnDiv">201</div>
	        </div>
	        <div class="span2">
	        	<div class="roomOnDiv">202</div>
	        </div>
	        <div class="span2">
	        	<div class="roomOnDiv">203</div>
	        </div>
	        <div class="span2">
	        	<div class="roomOnDiv">204</div>
	        </div>
	        <div class="span2">
	        	<div class="roomOnDiv">205</div>
	        </div>
            <div class="span2">
            	<div class="roomOnDiv">205</div>
            </div>
	    </div>
	    
	    <div class="row text-center" style="margin-top: 10px;">
	        <div class="span2">
	        	<div class="roomOnDiv">201</div>
	        </div>
	        <div class="span2">
	        	<div class="roomOnDiv">202</div>
	        </div>
	        <div class="span2">
	        	<div class="roomOnDiv">203</div>
	        </div>
	        <div class="span2">
	        	<div class="roomOnDiv">204</div>
	        </div>
	        <div class="span2">
	        	<div class="roomOnDiv">205</div>
	        </div>
            <div class="span2">
            	<div class="roomOnDiv">205</div>
            </div>
	    </div>
	    
	    <div class="row text-center" style="margin-top: 10px;">
	        <div class="span2">
	        	<div class="roomOnDiv">201</div>
	        </div>
	        <div class="span2">
	        	<div class="roomOnDiv">202</div>
	        </div>
	        <div class="span2">
	        	<div class="roomOnDiv">203</div>
	        </div>
	        <div class="span2">
	        	<div class="roomOnDiv">204</div>
	        </div>

	    </div>
	    
    </div>
    
</body>
</html>