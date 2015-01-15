//这个方法是放在input的onchange方法上的  用于上传商品的橱窗图
//suffix用来标记图片命名时候的A,B,C
function uploadAppIcon(targetFileInputId) {

	var filepath = $("#" + targetFileInputId).val();
	var re = /(\\+)/g;
	var filename = filepath.replace(re, "#");
	var one = filename.split("#");
	var two = one[one.length - 1];
	var three = two.split(".");
	var last = three[three.length - 1];
	var tp = "jpg,gif,bmp,png,JPG,GIF,BMP,PNG";
	var rs = tp.indexOf(last);

	if (rs != -1) {
		ajaxUploadProduct(targetFileInputId);
		return true;

	} else {
		alert("只能够上传jpg/gif/png/bmp格式的图片");
		//$('#subbutton').attr("disabled", "disabled");   
		return false;
	}
}

function ajaxUploadProduct(targetFileInputId) {

	//先取一下用户输入的文件名称
	var appFileName = $("#appFileName").val();

	if (appFileName == null || appFileName.length <= 0) {
		alert("请先输入应用文件名称");
		return;
	} else {
		appFileName = Trim(appFileName);
	}

	var appVersion = $("#appVersion").val();

	if (appVersion == null || appVersion.length <= 0) {
		alert("请先输入应用版本号");
		return;
	} else {
		appVersion = Trim(appVersion);
	}
	
	//一旦可以传了就隐藏掉先前的图
	$("#previewDiv").css("display", "none");

	//如果开始了，就把图替换成loading
	//var imgId = "productPic" + suffix;
	//$("#" + imgId).attr("src", "images/loading.gif");

	$.ajaxFileUpload({
		url : 'am/app/uploadAppIcon',
		secureuri : false,
		fileElementId : targetFileInputId,
		type : "POST",
		dataType : 'json',
		data : {
			"appFileName" : appFileName,
			"appVersion" : appVersion
		},
		success : function(data, status) {
			// var url="<%=pageContext.getAttribute("jsAssetsDir")%>"+"/interaction/sungoodspic/small/"+data.fileName;
			$("#previewDiv").css("display", "block");
			$("#previewImg").attr("src", data.path);
			
			$("#iconPath").val(data.path);
			//设置隐藏域里的iconPath
			//alert('1111' + data.iconPath);
			/*
			$("#mask" + suffix).css("display", "none");
			$("#desc" + suffix).css("display", "none");
			$("#del" + suffix).css("display", "block");
			 */
		},
		error : function(data, status, e) {
			alert(e);
		}
	})
	return false;
}

//去掉字符串的头空格（左空格）    
function LTrim(str) {
	var i;
	for (i = 0; i < str.length; i++) {
		if (str.charAt(i) != " ")
			break;
	}
	str = str.substring(i, str.length);
	return str;
}

// 去掉字符串的尾空格（右空格）
function RTrim(str) {
	var i;
	for (i = str.length - 1; i >= 0; i--) {
		if (str.charAt(i) != " ")
			break;
	}
	str = str.substring(0, i + 1);
	return str;
}

// 去掉字符串的头尾空格（左右空格）
function Trim(str) {
	return LTrim(RTrim(str));
}