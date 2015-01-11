//这个方法是放在input的onchange方法上的  用于上传商品的橱窗图
//suffix用来标记图片命名时候的A,B,C
function uploadProduct(targetFileInputId){
	
    var filepath = document.getElementById(targetFileInputId).value;
    var re = /(\\+)/g;    
    var filename=filepath.replace(re,"#");
    var one=filename.split("#");   
    var two=one[one.length-1];   
    var three=two.split(".");   
    var last=three[three.length-1];   
    var tp ="jpg,gif,bmp,png,JPG,GIF,BMP,PNG";
    var rs=tp.indexOf(last);
   
    if(rs!=-1){
    	ajaxUploadProduct(targetFileInputId, suffix);
     	return true;  
     	
     }else{
     	alert("只能够上传jpg/gif/png/bmp格式的图片");
     //$('#subbutton').attr("disabled", "disabled");   
         return false;
     }
}

function ajaxUploadProduct(targetFileInputId) {  
	
	//先取一下用户输入的商品的partnumber
	var partnumber = $("#partnumberInput").val();
	
	if (partnumber == null || partnumber.length <=0) {
		alert("请先输入商品款号");
		return;
	} else {
		partnumber = Trim(partnumber);
	}
	
	//如果开始了，就把图替换成loading
	var imgId = "productPic" + suffix;
    $("#" + imgId).attr("src", "images/loading.gif");
    $("#mask" + suffix).css("display", "none");
    $("#desc" + suffix).css("display", "none");
    
    $.ajaxFileUpload
    (  
	     { 
	        url: '../PortalUploadPordPic',
	        secureuri: false,  
	        fileElementId: targetFileInputId,
	        type: "POST",
	        dataType: 'json',
	        data:{
	            "partnumber": partnumber,
	            "suffix":  suffix
	        },
	        success: function(data, status) {
	           // var url="<%=pageContext.getAttribute("jsAssetsDir")%>"+"/interaction/sungoodspic/small/"+data.fileName;
	           $("#" + imgId).attr("src", data.path);
	           $("#mask" + suffix).css("display", "none");
	           $("#desc" + suffix).css("display", "none");
	           $("#del" + suffix).css("display", "block");
	        },  
	        error: function(data, status, e) {  
	            alert(e);
	        }
	    }
	)  
	return false;
}