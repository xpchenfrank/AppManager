<%@ page contentType="text/html; charset=UTF-8" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<SCRIPT type="text/javascript" src="<%=basePath%>js/jquery-1.7.2.min.js"></SCRIPT>
<SCRIPT type="text/javascript" src="<%=basePath%>js/jquery.json-2.3.js"></SCRIPT>
<script>
var ctxRoot = '<%=basePath%>';
var webRoot = '<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()%>';
</script>