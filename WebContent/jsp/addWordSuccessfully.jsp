<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="/jsp/head.jsp"%>
    <base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Word Clips insert successfully</title>
	
    <style>
        body {
          padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
        }
        
        html, body {
          height: 100%;
        }
        
        .sectionDiv {
          background-color: #F5F5F5;
          border: 1px solid #E3E3E3;
          border-radius: 4px 4px 4px 4px;
          box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05) inset;
        }
    </style>
</head>
<body>

  <jsp:include page="/jsp/pageHeader.jsp"></jsp:include>
  
    <div class="container" style="margin-top: 2%;">
        <div class="row">
	        <div class="span12 sectionDiv" style="height: 300px;">
				 <div style="margin-top: 80px;margin-left:80px;">
				    <h2>发生了如下异常，请和管理员联系</h2>
				    <div>将在<span id="secondSpan">5</span>秒后跳转回新增单词页面，您也可点击<a href="wc/addWord.view">这里</a>直接跳转</div>
				    <div>或点击<a href="wc/search.view">这里</a>返回首页</div>
				    <div id="counter" style="display: none;">5</div>
				 </div>
	        </div>
        </div>
    </div>
  <script type="text/javascript">
  /*
    var key = window.setInterval(function(){redirect()},1000);
    
    function redirect() {
    	
	    var startSecond = $("#secondSpan").text();
	    var startSecondNum = Number(startSecond);
	    startSecondNum = startSecondNum - 1;
    	$("#secondSpan").text(startSecondNum);
    	
    	if(startSecondNum == 0) {
    	   window.clearInterval(key);
    	   window.location = 'wc/addWord.view';
    	}
    	
    }
    */
  </script>
</body>
</html>