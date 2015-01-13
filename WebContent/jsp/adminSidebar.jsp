<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


    <script type="text/javascript">
    
	    function clickFirstlevelBar(url) {
	        window.location.href=url;
	    }
	    
	    function selectBar(id) {
	    	
	    }
	    
	    jQuery(function() {
            //$('#uploadSuccessful').modal('hide');
          //var currentPage = '<%=request.getAttribute("currentPage")%>';
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
	    
        
    </script>

    <div class="col-sm-3 col-md-2 sidebar"
        style="top: 49px; padding: 0px 20px 20px 20px;overflow:hidden;">
        <ul class="nav nav-sidebar">
            <li class="active mySidebar dalei" id="appBar"
                    style="padding-left: 20px;cursor: pointer;" onclick="clickFirstlevelBar('am/app/list');"><span><img
                    src="images/iconfont-yingyong.png"
                    style="margin-top: -2px; margin-right: 17px;"></img></span>应用管理</li>
            <li class="mySidebar"><a href="" style="padding-left: 78px;">全部</a></li>
            <li class="mySidebar"><a href="" style="padding-left: 78px;">社交</a></li>
            <li class="mySidebar"><a href="" style="padding-left: 78px;">视频</a></li>
            <li class="mySidebar"><a href="" style="padding-left: 78px;">音乐</a></li>
            <li class="mySidebar"><a href="" style="padding-left: 78px;">生活</a></li>
            <li class="mySidebar"><a href="" style="padding-left: 78px;">阅读</a></li>
            <li class="mySidebar"><a href="" style="padding-left: 78px;">系统</a></li>
            <li class="mySidebar"><a href="" style="padding-left: 78px;">安全</a></li>
        </ul>
        <ul class="nav nav-sidebar">
            <li class="mySidebar dalei" style="olor: #428bca;"><a
                style="padding: 0px 0px 0px 20px;"><span><img
                        src="images/iconfont-changdiguanli.png"
                        style="margin-top: -2px; margin-right: 17px;"></img></span>网点管理</a></li>
        </ul>
        <ul class="nav nav-sidebar">
            <li class="mySidebar dalei" style="color: #428bca;" id="userBar" onclick="clickFirstlevelBar('am/user/list');"><a
                style="padding: 0px 0px 0px 20px;"><span><img
                        src="images/iconfont-neibuguanli.png"
                        style="margin-top: -2px; margin-right: 17px;"></img></span>用户管理</a></li>
        </ul>
        <ul class="nav nav-sidebar">
            <li class="mySidebar dalei" style="color: #428bca;"><a
                style="padding: 0px 0px 0px 20px;"><span><img
                        src="images/iconfont-reportMg.png"
                        style="margin-top: -2px; margin-right: 17px;"></img></span>数据统计</a></li>
        </ul>
    </div>
