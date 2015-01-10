<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="/jsp/head.jsp"  %>
    <base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>客房管理系统</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    
    <link href="css/bootstrap.css" rel="stylesheet" media="screen">
    <script src="js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
		
		function showChangePriceWindow(id, name , price, deposit) {
			
			$("#roomNameJS").val(name);
			$("#roomIdJS").val(id);
			$("#roomPriceJS").val(price);
			$("#roomDepositJS").val(deposit);
			$("#roomSinglePriceJS").val(price);
			
			$('#myModal').modal({
				  keyboard: false
			})
		}
		
		//获取弹出框中的所有属性，拼成json，转发后台
		function changePrice() {
			
			var roomId = $("#roomIdJS").val();
			var roomName = $("#roomNameJS").val();
			var roomPrice = $("#roomPriceJS").val();
		    var roomDeposit = $("#roomDepositJS").val();
		    
		    var aRent = {};
		    
		    aRent.roomId = roomId;
		    aRent.roomPrice = roomPrice;
		    aRent.roomDeposit = roomDeposit;
		    aRent.roomName = roomName;
		    
		    var aRentJsonStr = $.toJSON(aRent);
		    aRentJsonStr = encodeURI(aRentJsonStr, "UTF-8");

			$.ajax( {
				type : "POST",
				url : ctxRoot + 'lj/roomCtrl/changePrice',
				data: "rentRoom=" + aRentJsonStr,
				dataType: "json",
				ifModified: true,
				success : function(data) {
			   		alert("修改房间信息成功");
			   		$('#myModal').modal('hide');
			   		window.location.reload();
				},
				error : function(data) {
					
				}
		   });
		}
		
        jQuery(function() {
            
            $("#changePrice").addClass("active");
            
       });
		
	</script>
    
    <style>
		body {
		  padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
		}
		
		html, body {
		  height: 100%;
		}
		
		.roomOnDiv {
			border: 1px black solid;
			height: 20%;
			line-height: 20%;
			background-color: #24A6A6;
			cursor: pointer;
			color: white;
		}
		
		.roomOnDiv  #endDateDiv  {
			display: none;
		}
		
		.roomOffDiv {
			border: 1px black solid;
			height: 20%;
			line-height: 20%;
			background-color: #D6AA64;
			cursor: pointer;
			color: black;
		}
		
		.roomDelayDiv {
			border: 1px black solid;
			height: 20%;
			line-height: 20%;
			background-color: red;
			cursor: pointer;
			color: black;
		}
		
		.content {
			line-height: normal;
		}
		
		.content div  {
			line-height: normal;
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
			    <div style="font-size: 417%;margin-bottom: 50px;color:black;">基础房价修改</div>
     	</div>
     </div>
     
    <div class="container">
    
        <%-- ${room.name}   +++ ${status.count}  --%>
        
        <c:forEach items="${roomInfoList}" var="room" varStatus="status">
            
            <c:if test="${(status.count-1) % 2 ==0}">
			        <div class="row text-center" style="margin-top: 10px;">
					<div class="span2">
					</div>
			</c:if>
			
			<div class="span4" onclick="showChangePriceWindow(${room.roomId},'${room.name}', ${room.price}, ${room.deposit})">
				<div class="roomOnDiv">
	        	    <div class="content">
		            	<div style="margin-top: 5px; margin-bottom: 5px;">${room.name}</div>
		            	<div style="text-align:left;margin-left:10px;">房价: ${room.price}</div>
		            	<div style="text-align:left;margin-left:10px;">押金: ${room.deposit}</div>
		            	<div id="endDateDiv" style="text-align:left;margin-left:10px;">到期时间: ${room.endDate}</div>
	            	</div>
	        	</div>
	        </div>	
	       
		    <c:if test="${status.count > 0 and status.count % 2==0}">
		        <div class="span2">
			    </div>
				</div>
			</c:if>
	        
        </c:forEach>
  
		<!-- 租房的弹出框 -->
		<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-header">
		    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		    <h3 id="myModalLabel">房间详情</h3>
		  </div>
		  <div class="modal-body">
			<form class="form-horizontal" id="addWordForm" action="wc/itemCtrl/addItem" method="post">
				<fieldset>
				
			    	<input type="hidden"  id="roomIdJS" name="roomIdJS"></input>
			    	<input type="hidden"  id="roomSinglePriceJS" name="roomSinglePriceJS"></input>
			    	
					<div class="control-group">
						<label class="control-label" for="inputEmail">房间名:</label>
						<div class="controls">
							<input id="roomNameJS" name="roomNameJS" type="text" required><em style="color: red;">*</em>
						</div>
					</div>
					
					<div class="control-group">
	                    <label class="control-label" for="inputEmail">房间价:</label>
	                    <div class="controls">
	                        <input id="roomPriceJS" name="roomPriceJS" type="text" required><em style="color: red;">*</em>
	                    </div>
	                </div>
					
	                <div class="control-group">
	                    <label class="control-label" for="inputEmail">押金:</label>
	                    <div class="controls">
	                         <input id="roomDepositJS" name="roomDepositJS" type="text"/><em style="color: red;">*</em>
	                    </div>
	                </div>
	                
				</fieldset>
			</form>
		  </div>
		  <div class="modal-footer">
		    <button class="btn btn-primary"  onclick="changePrice()">修改房间信息</button>
		    <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
		  </div>
		</div>  
		
    </div>
    
</body>
</html>