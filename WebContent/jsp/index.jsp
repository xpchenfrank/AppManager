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
	<title>客房管理系统</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    
    <link href="css/bootstrap.css" rel="stylesheet" media="screen">
    <script src="js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
		
		function showRentWindow(id, name , price, deposit) {
			
			$("#roomNameJS").text(name);
			$("#roomIdJS").val(id);
			$("#roomPriceJS").val(price);
			$("#roomDepositJS").val(deposit);
			$("#roomDaysJS").val("1");
			$("#roomReceivePriceJS").val(price);
			$("#roomReceiveDepositJS").val(deposit);
			
			//$("#roomSinglePriceJS").val(price);
			
			//让日租房的checkbox变成false
			$("#hourlyRoom").removeAttr("checked");
			//初始化界面状态
			$(".dailyRoomCls").css("display", "");
			$(".hourlyRoomCls").css("display", "none");
			
			$('#myModal').modal({
				  keyboard: false
			})
		}
		
		function showUnrentWindow(id, name , price, deposit, receivePrice, receiveDeposit, comments, roomDays) {
			
			$("#unrentRoomNameJS").text(name);
			$("#unrentRoomIdJS").val(id);
			$("#unrentRoomPriceJS").val(price);
			$("#unrentRoomDepositJS").val(deposit);
			$("#unrentRoomDaysJS").val(roomDays);
			//$("#unrentRoomSinglePriceJS").val(price);
			$("#unrentRoomReceivePriceJS").val(receivePrice);	
			$("#unrentRoomReceiveDepositJS").val(receiveDeposit);
			$("#unrentRoomReturnMoneyJS").val(receiveDeposit);
			$("#unrentRoomCommentsJS").val(comments);
			
			
			//初始化下这些元素，以防之前已经变成续租的窗口了
            $("#unrentRoomDayDiv").css("display", "");
            $("#rerentRoomDayDiv").css("display", "none");
            
            //把原来是readonly的字段变成可编辑
            $("#unrentRoomReceivePriceJS").attr('readonly', 'readonly');
            $("#unrentRoomReceiveDepositJS").attr('readonly', 'readonly');
            
            //隐藏退房时候的特殊字段
            $("#unrentRoomReturnMoneyDiv").css("display", "");
            
            //隐藏退房 和 续房按钮， 显示确认续房按钮
            $("#unrentRoomBtn").css("display", "");
            $("#rerentRoomBtn").css("display", "");
            $("#confirmRentRoomBtn").css("display", "none");
			
			$('#unRent').modal({
				  keyboard: false
			})			
			
		}
		
		//租房时间变化后，改变实付房钱的默认值
		function changeDays(thisObj) {
			var newPrice = thisObj.value * $("#roomPriceJS").val();
			$("#roomReceivePriceJS").val(newPrice);
		}
		
	    //房间的单价变化后，改变实付房钱的默认值
        function changeRoomPrice(thisObj) {
            var newPrice = thisObj.value * $("#roomDaysJS").val();
            $("#roomReceivePriceJS").val(newPrice);
        }
		
		//获取弹出框中的所有属性，拼成json，转发后台
		function rentRoom() {
			
			//先检查付的房钱和押金不能为空
			var receivePrice = $("#roomReceivePriceJS").val();
			var receiveDeposit = $("#roomReceiveDepositJS").val();
			
			if(receivePrice == "" || receivePrice <= 0) {
				alert("请输入实付房钱");
				return;
			}
			
			if(receiveDeposit == "" || receiveDeposit <= 0) {
				alert("请输入实付押金");
				return;
			}
			
			var roomId = $("#roomIdJS").val();
			var roomPrice = $("#roomPriceJS").val();
		    var roomDeposit = $("#roomDepositJS").val();
		    var roomDays = $("#roomDaysJS").val();
		    var roomHours = $("#roomHoursJS").val();
		    var comments = $("#roomCommentsJS").val();
		    
		    //判断是否是钟点房，钟点房后台有其他处理
		    var isHourlyRoom = false;
		    if($("#hourlyRoom").attr("checked")) {
		    	isHourlyRoom = true;
            } else {
            	isHourlyRoom = false;
            }
		    
		    var aRent = {};
		    
		    aRent.roomId = roomId;
		    aRent.roomPrice = roomPrice;
		    aRent.roomDeposit = roomDeposit;
		    aRent.roomDays = roomDays;
		    aRent.receivePrice = receivePrice;
		    aRent.receiveDeposit = receiveDeposit;
		    aRent.isHourlyRoom = isHourlyRoom;
		    aRent.roomHours = roomHours;
		    aRent.comments = comments;
		    
		    var aRentJsonStr = $.toJSON(aRent);
		    aRentJsonStr = encodeURI(aRentJsonStr, "UTF-8");

			$.ajax( {
				type : "POST",
				url : ctxRoot + 'lj/roomCtrl/rentRooms',
				data: "rentRoom=" + aRentJsonStr,
				dataType: "json",
				ifModified: true,
				success : function(data) {
			   		alert("订房成功");
			   		$('#myModal').modal('hide');
			   		window.location.reload();
				},
				error : function(data) {
					
				}
		     });
		}
		
		function unrentRoom() {
			
			/* 理论上这段代码用不到
			//先检查付的房钱和押金不能为空
			var receivePrice = $("#roomReceivePriceJS").val();
			var receiveDeposit = $("#roomReceiveDepositJS").val();
			
			if(receivePrice == "" || receivePrice <= 0) {
				alert("请输入实付房钱");
			}
			
			if(receiveDeposit == "" || receiveDeposit <= 0) {
				alert("请输入实付押金");
			}
			*/
			
			var roomId = $("#unrentRoomIdJS").val();
			var roomPrice = $("#roomPriceJS").val();
		    var roomDeposit = $("#roomDepositJS").val();
		    var roomDays = $("#roomDaysJS").val();
		    var returnMoney = $("#unrentRoomReturnMoneyJS").val();
		    var comments = $("#unrentRoomCommentsJS").val();
		    
		    var aRent = {};
		    
		    aRent.roomId = roomId;
		    aRent.roomPrice = roomPrice;
		    aRent.roomDeposit = roomDeposit;
		    aRent.roomDays = roomDays;
		    aRent.returnMoney = returnMoney;
		    aRent.comments = comments;
		    /*
		    aRent.receivePrice = receivePrice;
		    aRent.receiveDeposit = receiveDeposit;
		    */
		    
		    var aRentJsonStr = $.toJSON(aRent);
		    aRentJsonStr = encodeURI(aRentJsonStr, "UTF-8");

			$.ajax( {
				type : "POST",
				url : ctxRoot + 'lj/roomCtrl/unrentRooms',
				data: "rentRoom=" + aRentJsonStr,
				dataType: "json",
				ifModified: true,
				success : function(data) {
			   		alert("退房成功");
			   		$('#unRent').modal('hide');
			   		window.location.reload();
				},
				error : function(data) {
					
				}
		   });
		}
		
		//显示续租的相关UI
		function showRerentRoom() {
			
			//显示续房天数字段并隐藏原来的租房天数
			$("#unrentRoomDayDiv").css("display", "none");
			$("#rerentRoomDayDiv").css("display", "");
			
			//把原来是readonly的字段变成可编辑
			$("#unrentRoomReceivePriceJS").removeAttr('readonly');
			$("#unrentRoomReceiveDepositJS").removeAttr('readonly');
			
			//隐藏退房时候的特殊字段
			$("#unrentRoomReturnMoneyDiv").css("display", "none");
			
			//隐藏退房 和 续房按钮， 显示确认续房按钮
			$("#unrentRoomBtn").css("display", "none");
			$("#rerentRoomBtn").css("display", "none");
			$("#confirmRentRoomBtn").css("display", "");
			
			//初始化续租天数为1天， 实收房款为一天的房款
			$("#rerentRoomDaysJS").val(1);
			$("#unrentRoomReceivePriceJS").val($('#unrentRoomPriceJS').val());
			
		}
		
		function confirmRentRoom() {
			
	         //先检查付的房钱和押金不能为空
            var receivePrice = $("#unrentRoomReceivePriceJS").val();
            var receiveDeposit = $("#unrentRoomReceiveDepositJS").val();
            
            if(receivePrice == "" || receivePrice <= 0) {
                alert("请输入实付房钱");
                return;
            }
            
            if(receiveDeposit == "" || receiveDeposit <= 0) {
                alert("请输入实付押金");
                return;
            }
            
            var roomId = $("#unrentRoomIdJS").val();
            var roomPrice = $("#unrentRoomPriceJS").val();
            var roomDeposit = $("#unrentRoomDepositJS").val();
            var roomDays = $("#rerentRoomDaysJS").val();
            var comments = $("#unrentRoomCommentsJS").val();
            
            var aRent = {};
            
            aRent.roomId = roomId;
            aRent.roomPrice = roomPrice;
            aRent.roomDeposit = roomDeposit;
            aRent.roomDays = roomDays;
            aRent.receivePrice = receivePrice;
            aRent.receiveDeposit = receiveDeposit;
            aRent.isHourlyRoom = false;
            aRent.comments = comments;
            
            var aRentJsonStr = $.toJSON(aRent);
            
            //alert('aRentJsonStr is ' + aRentJsonStr);
            aRentJsonStr = encodeURI(aRentJsonStr, "UTF-8");

            $.ajax( {
                type : "POST",
                url : ctxRoot + 'lj/roomCtrl/rerentRooms',
                data: "rentRoom=" + aRentJsonStr,
                dataType: "json",
                ifModified: true,
                success : function(data) {
                    alert("续租成功");
                    $('#unRent').modal('hide');
                    window.location.reload();
                },
                error : function(data) {
                    
                }
           });
			
		}
		
	    //续租时候改变天数的方法
        function changeDaysForRerent(thisObj) {
            var newPrice = thisObj.value * $("#unrentRoomPriceJS").val();
            $("#unrentRoomReceivePriceJS").val(newPrice);
        }
		
		function roomTypeChange(thisObj) {
			if($(thisObj).attr("checked")) {
				$(".dailyRoomCls").css("display", "none");
				$(".hourlyRoomCls").css("display", "");
			} else {
				$(".dailyRoomCls").css("display", "");
				$(".hourlyRoomCls").css("display", "none");
			}
		}

		
        jQuery(function() {
            
            $("#roomMgr").addClass("active");
            
            var intervalId = window.setInterval("checkRoomEveryHour()", 10000);
            
            //window.open("http://localhost:8080/LjHotel/lj/roomCtrl/showIncome", '', 'left=240,top=150,height=300,width=400,location=no');
            
       });
       
       //每小时运行，检查有没有过期的房间
       function checkRoomEveryHour() {
    	   //alert('checking ');
       }
		
	</script>
    
    <style>
		body {
		  padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
		  fontFamily: "Microsoft YaHei",NSimSun,sans-serif;
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
			background-color: #161616;
			cursor: pointer;
			color: white;
		}
		
		.content {
			line-height: normal;
		}
		
		.content div  {
			line-height: normal;
		}
	</style>
    
    <link href="css/bootstrap.css" rel="stylesheet">

</head>

<body>
    
    <jsp:include page="/jsp/pageHeader.jsp"></jsp:include>
    
    <div style="height: 10%; min-height: 30px; max-height: 60px;">
    </div>
    
     <div class="container">
     	<div class="row text-center" style="margin-top: 10px;">
     	        <div class="span3" ></div>
			    <div class="span2"  style="line-height: 30px;">
			    	<div style="margin-bottom:0px;margin-top:0px;height:30px; width:60px; background-color: #24A6A6; line-height: 30px;float:left;"></div>
			    	<div style="display: inline-block;line-height: 30px;font-weight:bold;">空房</div>
			    </div>
			    <div class="span2" >
			    	<div style="margin-bottom:0px;margin-top:0px;height:30px; width:60px; background-color: #D6AA64; line-height: 30px;float:left;"></div>
			    	<div style="display: inline-block;line-height: 30px;font-weight:bold;">已租</div>
			    </div>
			    <div class="span2" >
			    	<div style="margin-bottom:0px;margin-top:0px;height:30px; width:60px; background-color: #161616; line-height: 30px;float:left;"></div>
			    	<div style="display: inline-block;line-height: 30px;font-weight:bold;">过期</div>
			    </div>
			    <div class="span3" ></div>
     	</div>
     </div>
    
    <div class="container">
    
        <%-- ${room.name}   +++ ${status.count}  --%>
        
        <c:forEach items="${roomInfoList}" var="room" varStatus="status">
            
            <c:if test="${(status.count-1) % 4 ==0}">
			       <div class="row text-center" style="margin-top: 10px;">
			</c:if>
			
            	<c:choose>
					<c:when test="${room.isRent == 1}">
			            <div class="span3" onclick="showUnrentWindow(${room.roomId},'${room.name}', ${room.price}, ${room.deposit}, ${room.receivePrice},${room.receiveDeposit},'${room.comments}', '${room.roomDays}')">
						<c:choose>
							<c:when test="${room.isDelayed}">
								<div class="roomDelayDiv">
							</c:when>
							<c:otherwise>
					        	<div class="roomOffDiv">
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<div class="span3" onclick="showRentWindow(${room.roomId},'${room.name}', ${room.price}, ${room.deposit})">
			        	<div class="roomOnDiv">
					</c:otherwise>
				</c:choose>
	        	    <div class="content">
		            	<div style="margin-top: 5px; margin-bottom: 5px;">${room.name}</div>
		            	<div style="text-align:left;margin-left:10px;">房价: ${room.price}</div>
		            	<div style="text-align:left;margin-left:10px;">押金: ${room.deposit}</div>
		            	<div id="endDateDiv" style="text-align:left;margin-left:10px;">到期时间: <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${room.endDate}" /></div>
	            	</div>
	        	</div>
	        </div>	
	       
		    <c:if test="${status.count > 0 and status.count % 4==0}">
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
			    	<!-- 
			    	<input type="hidden"  id="roomSinglePriceJS" name="roomSinglePriceJS"></input>
			    	 -->
			    	
					<div class="control-group">
						<label class="control-label" for="inputEmail">房间名:</label>
						<div class="controls">
							<span class="viewNode" id="roomNameJS" name="roomNameJS"></span>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label" >是否钟点房:</label>
						<div class="controls">
							<input type="checkbox" name="hourlyRoom"  id="hourlyRoom" onchange="roomTypeChange(this)" />
						</div>
					</div>
					
					<div class="control-group  hourlyRoomCls"  style="display: none;">
	                    <label class="control-label" for="inputEmail">入住时间:</label>
	                    <div class="controls">
	                    	<input id="roomHoursJS" name="roomHoursJS" type="text"  value="1" /> 小时
	                    </div>
	                </div>
					
	                <div class="control-group dailyRoomCls">
	                    <label class="control-label" for="inputEmail">入住天数:</label>
	                    <div class="controls">
	                    	<input id="roomDaysJS" name="roomDaysJS" type="text"  value="1"  onkeyup="changeDays(this)"/>
	                    </div>
	                </div>
	                
					<div class="control-group dailyRoomCls">
	                    <label class="control-label" for="inputEmail">单天房间价:</label>
	                    <div class="controls">
	                        <input id="roomPriceJS" name="roomPriceJS" type="text" required onblur="changeRoomPrice(this)" readonly="readonly"><em style="color: red;">*</em>
	                    </div>
	                </div>
					
	                <div class="control-group dailyRoomCls">
	                    <label class="control-label" for="inputEmail">押金:</label>
	                    <div class="controls">
	                         <input id="roomDepositJS" name="roomDepositJS" type="text" readonly="readonly"/><em style="color: red;" >*</em>
	                    </div>
	                </div>
	                
	                <div class="control-group">
	                    <label class="control-label" for="inputEmail">实付房钱:</label>
	                    <div class="controls">
	                        <input id="roomReceivePriceJS" name="roomReceivePriceJS" type="text" required><em style="color: red;">*</em>
	                    </div>
	                </div>
					
	                <div class="control-group">
	                    <label class="control-label" for="inputEmail">实付押金:</label>
	                    <div class="controls">
	                         <input id="roomReceiveDepositJS" name="roomReceiveDepositJS" type="text" /><em style="color: red;">*</em>
	                    </div>
	                </div>
	                
	                <div class="control-group">
                        <label class="control-label" for="inputEmail">备注:</label>
                        <div class="controls">
                             <textarea id="roomCommentsJS" name="roomCommentsJS" placeholder="如果有特殊打折的情况，需要说明的话请在这里输入"></textarea>
                        </div>
                    </div>
	                
				</fieldset>
			</form>
		  </div>
		  <div class="modal-footer">
		    <button class="btn btn-primary"  onclick="rentRoom()">订房</button>
		    <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
		  </div>
		</div>  
		
		<!-- 退房的弹出框 -->
		<div id="unRent" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-header">
		    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		    <h3 id="myModalLabel">房间详情</h3>
		  </div>
		  <div class="modal-body">
			<form class="form-horizontal" id="addWordForm" action="wc/itemCtrl/addItem" method="post">
				<fieldset>
				
			    	<input type="hidden"  id="unrentRoomIdJS" name="roomIdJS"></input>
			    	<!-- 
			    	<input type="hidden"  id="unrentRoomSinglePriceJS" name="roomSinglePriceJS"></input>
			    	 -->
			    	
					<div class="control-group">
						<label class="control-label" for="inputEmail">房间名:</label>
						<div class="controls">
							<span class="viewNode" id="unrentRoomNameJS" name="roomNameJS"></span>
						</div>
					</div>
					
	                <div class="control-group" id="unrentRoomDayDiv">
	                    <label class="control-label" for="inputEmail">入住天数:</label>
	                    <div class="controls">
	                    	<input id="unrentRoomDaysJS" name="unrentRoomDaysJS" type="text"  value="1"  readonly="readonly" />
	                    </div>
	                </div>
	                
	                <div class="control-group" id="rerentRoomDayDiv" style="display: none;">
                        <label class="control-label" >续房天数:</label>
                        <div class="controls">
                            <input id="rerentRoomDaysJS" name="rerentRoomDaysJS" type="text"  value="1"  onkeyup="changeDaysForRerent(this)" />
                        </div>
                    </div>
	                
					<div class="control-group">
	                    <label class="control-label" for="inputEmail">单天房间价:</label>
	                    <div class="controls">
	                        <input id="unrentRoomPriceJS" name="unrentRoomPriceJS" type="text" required readonly="readonly"/><em style="color: red;">*</em>
	                    </div>
	                </div>
					
	                <div class="control-group">
	                    <label class="control-label" for="inputEmail">押金:</label>
	                    <div class="controls">
	                         <input id="unrentRoomDepositJS" name="unrentRoomDepositJS" type="text" readonly="readonly"/><em style="color: red;">*</em>
	                    </div>
	                </div>
	                
	                <div class="control-group">
	                    <label class="control-label" for="inputEmail">实付房钱:</label>
	                    <div class="controls">
	                        <input id="unrentRoomReceivePriceJS" name="unrentRoomReceivePriceJS" type="text" value="0" required readonly="readonly"/><em style="color: red;">*</em>
	                    </div>
	                </div>
					
	                <div class="control-group">
	                    <label class="control-label" for="inputEmail">实付押金:</label>
	                    <div class="controls">
	                         <input id="unrentRoomReceiveDepositJS" name="unrentRoomReceiveDepositJS" type="text" value="0" readonly="readonly"/><em style="color: red;">*</em>
	                    </div>
	                </div>
	                
	                <div class="control-group" id="unrentRoomReturnMoneyDiv">
	                    <label class="control-label" >退还金额:</label>
	                    <div class="controls">
	                         <input id="unrentRoomReturnMoneyJS" name="unrentRoomReturnMoneyJS" type="text" value="0" /><em style="color: red;">*</em>
	                    </div>
	                </div>
	                
	                <div class="control-group">
                        <label class="control-label" for="inputEmail">备注:</label>
                        <div class="controls">
                             <textarea id="unrentRoomCommentsJS" name="unrentRoomCommentsJS" placeholder="如果有特殊打折的情况，需要说明的话请在这里输入"></textarea>
                        </div>
                    </div>
	                
				</fieldset>
			</form>
		  </div>
		  <div class="modal-footer">
		    <button class="btn btn-primary"  onclick="unrentRoom()" id="unrentRoomBtn">退房</button>
		    <button class="btn btn-primary"  onclick="showRerentRoom()" id="rerentRoomBtn">续房</button>
		    <button class="btn btn-primary" style="display: none;" onclick="confirmRentRoom()" id="confirmRentRoomBtn">确认续房</button>
		    <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
		  </div>
		</div>
        
    </div>
    
</body>
</html>