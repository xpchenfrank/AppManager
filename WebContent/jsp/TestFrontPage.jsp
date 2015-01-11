<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="/jsp/head.jsp"  %>
    <base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>无线城市 - 畅想无限精彩</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    
    <link href="css/bootstrap.css" rel="stylesheet" media="screen">
    <script src="js/bootstrap.js"></script>
    
    <script type="text/javascript">
    
    jQuery(function() {
            $('#uploadSuccessful').modal({
                keyboard: true
            })
          $('#uploadSuccessful').modal('show');
    });
    
      var uploadSuccessful = <%=request.getAttribute("uploadSuccessful")%>;
      if(uploadSuccessful != null && uploadSuccessful == true) {
    
      }

	</script>
    
    <style>
    /*
        html,body {
            background-color: #F0F0F0;
            height: 100%;
        }*/
		.homeTitle {
            background-color: #83BA04;
        }
        
        .homeColumn {
            height: 44px;
            font-size: 18px;
            color: white;
            text-align: center;
            line-height: 44px;
        }
        
        .homeColumn {
            height: 44px;
            font-size: 18px;
            color: white;
            text-align: center;
            line-height: 44px;
        }
        
        .packageColumn img {
            display: block; width: 100%; height: auto;
        }
        /*
        .packageRow {
            height: 20%;
            border: 1px black solid;
        }
        
        .packageRow div {
            height: 100%;
            border: 1px black solid;
        }
        
        .packageRow div div {
            height: 100%;
            border: 1px black solid;
        }
        */
	</style>

</head>

<body>

    <div id="uploadSuccessful" class="modal fade bs-example-modal-sm"
        tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-sm">
			<div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			          <h4 class="modal-title" id="mySmallModalLabel">APP 上传成功</h4>
			        </div>
			        <div class="modal-body">
			             <button type="button" class="btn btn-primary">确认</button>
			        </div>
			      </div>
        </div>
    </div>
    <div class="container-fluid">
	    <div class="row homeTitle">
		  <div class="col-xs-3 homeColumn">首页</div>
		  <div class="col-xs-3 homeColumn">推荐</div>
		  <div class="col-xs-3 homeColumn">游戏</div>
		  <div class="col-xs-3 homeColumn">分类</div>
		</div>
	</div>
	
	<div class="container-fluid packageRow">
        <div class="row">
          <div class="col-xs-4 packageColumn">
            <img src="images/nanshen.jpg"></img>
          </div>
          <div class="col-xs-4 packageColumn">
            <img src="images/nanshen.jpg"></img>
          </div>
          <div class="col-xs-4 packageColumn">
            <img src="images/nanshen.jpg"></img>
          </div>
        </div>
    </div>
    
    <div class="container-fluid">
	    <ul class="list-inline">
	      <li>
	       <img class="img-responsive" src="images/nanshen.jpg"></img>
	      </li>
	      <li>
           <img class="img-responsive" src="images/nanshen.jpg"></img>
          </li>
          <li>
           <img class="img-responsive" src="images/nanshen.jpg"></img>
          </li>
	    </ul>
    </div>
    
    
    
</body>
</html>