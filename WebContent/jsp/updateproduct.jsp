<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ibm.supplierportal.model.Catgroup"%>
<%@page import="com.ibm.supplierportal.model.Store"%>
<%@page import="java.util.List"%>

<%-- 
<%@ taglib uri="http://ckfinder.com" prefix="ckfinder" %>
 --%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 这个是商品编辑页面 -->

<%@page import="java.util.List"%>
<%@page import="java.net.URLDecoder"%><html>

<%
     //在这里用java给longdesc解码看看
     Object tempLongDescObj = request.getAttribute("longdesc");
     String longDesc = "";
     if(tempLongDescObj != null) {
     	longDesc = (String)tempLongDescObj;
     	String data = longDesc;
		  try {
		     StringBuffer tempBuffer = new StringBuffer();
		     int incrementor = 0;
		     int dataLength = data.length();
		     while (incrementor < dataLength) {
		        char charecterAt = data.charAt(incrementor);
		        if (charecterAt == '%') {
		           tempBuffer.append("<percentage>");
		        } else if (charecterAt == '+') {
		           tempBuffer.append("<plus>");
		        } else {
		           tempBuffer.append(charecterAt);
		        }
		        incrementor++;
		     }
		     data = tempBuffer.toString();
		     data = URLDecoder.decode(data, "utf-8");
		     data = data.replaceAll("<percentage>", "%");
		     data = data.replaceAll("<plus>", "+");
		  } catch (Exception e) {
		     e.printStackTrace();
		  }
     	longDesc = data;
     }
     
     //给渠道属性解码
     Object tempQudaoObj = request.getAttribute("qudao");
     String qudaoStr = "";
     if(tempQudaoObj != null) {
     	qudaoStr = (String)tempQudaoObj;
     	qudaoStr = URLDecoder.decode(qudaoStr, "UTF-8");
     }
     pageContext.setAttribute("qudaoStr", qudaoStr);
 %>
<head>
<base href="<%=basePath%>"/>
<link href="images/skin.css" rel="stylesheet" type="text/css" />
<link href="css/upload.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" rel="stylesheet" />
<link href="ckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="js/jquery-1.6.1.min.js"></script>
<script language="JavaScript" type="text/javascript" src="<%=basePath%>ckeditor/ckeditor.js"></script>
<script language="JavaScript" type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script language="JavaScript" type="text/javascript" src="js/jquery.json-2.3.js"></script>
<script language="JavaScript" type="text/javascript" src="ckfinder/ckfinder.js"></script>
<script language="JavaScript" type="text/javascript" src="js/ajaxfileupload.js"></script>
<script language="JavaScript" type="text/javascript" src="js/jquery.blockUI.js"></script>
<script language="JavaScript" type="text/javascript" src="js/jquery-powerFloat.js"></script>
<script language="JavaScript" type="text/javascript" src="js/uploadproduct.js"></script>

<!--[if IE 6]>
<script src="js/DD_belatedPNG.js"></script>
<script>
  DD_belatedPNG.fix('.del');
</script>
<![endif]-->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript">
	var skucolors = '${skuColors}';
	var skus = '${skus}';
	//var longdesc = '${Product.longdesc}';
	var productJsonStr = '${ProductJson}';
	var productJsonObj = eval("("+productJsonStr+")");
	var catentryBelongCatgroupJsonStr = '${catentryBelongCatgroupJson}';
	var catentryBelongCatgroupJson = eval("("+catentryBelongCatgroupJsonStr+")");
	var catentryId = '${catentryId}';
	var prodDescAttrsJsonStr = '${prodDescAttrsJson}';
	var prodDescAttrsJson = eval("("+prodDescAttrsJsonStr+")");
	var displaySalesCatgroupsJsonStr = '${displaySalesCatgroupsJson}';
	var displaySalesCatgroupsJson = eval("("+displaySalesCatgroupsJsonStr+")");
	var qudao = '<%=qudaoStr%>';
	var isSyncTaobaoInventory = '${isSyncTaobaoInventory}';
	var chuchuangPartnumber = '${Product.partnumber}';
</script>
<script language="JavaScript" type="text/javascript" src="<%=basePath%>js/updateproduct.js"></script>
</head>

<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">上传商品</div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="images/mail_rightbg.gif"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9">
    <table width="100%" height="138" cellspacing="0" cellpadding="0" border="0">
      <tbody><tr>
        <td valign="top" height="13">&nbsp;</td>
      </tr>
      <tr>
        <td valign="top">
        <table width="98%" cellspacing="0" cellpadding="0" border="0" align="center">
          <tbody>        
          <tr>
            <td><table width="100%" height="31" cellspacing="0" cellpadding="0" border="0" class="nowtable">
              <tbody><tr>
                <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;选择商品主目录</td>
              </tr>
            </tbody></table></td>
          </tr>
          <tr>
            <td><table width="100%" cellspacing="0" cellpadding="0" border="0">
              <tbody>
              <tr>
					<td class="spans"  colspan="4" style="background-color: #F2F2F2; line-height: 49px;" >
					<div class="spans_0">
						
						<span>所属店铺: <br/>
							<select id="storeSelect" class="select" onchange="changeStore(this.value)">
								
							</select>
						</span> 
						
						<span id="firstMasterCatgroup">一级目录:<br/>
							<select id="firstMasterCatgroupSelect" class="select" onchange="showSecondMaterCatgroup(this.value)">
								<option value=\"-99\">请选择</option>
							</select>
						</span>
						
					// 下面的可能是多余的
							</select>
						</span>
						</div>
					</td>
              </tr> 
              <tr>
				 <td width="100%" style="line-height: 49px; padding-left: 30px; padding-top: 10px;"  align="left" colspan=3>
				 <div class="spans_0">
				 
				 	<span style="font-size:13px;">您当前选择的主目录是:<span id="resultSpan">${catentryBelongCatgroup.name}</span><input type="hidden" id="resultInput" value="${catentryBelongCatgroup.catgroupId}"></input></span>  
				
				 </div> </td>
              </tr>
               <tr>
				 <td width="100%" height="81"   align="center" colspan=3> 
				 	<input style="font-size:13px; display:none;" type="button" value="确认主目录后点击进入商品信息填写页" id="selectMasterCatalog" class="inputbutton" />            	
				 </td>
              </tr>
              <tr class="">
                <td height="30" align="right" class="left_txt2" colspan="4"><table width="100%" height="31" cellspacing="0" cellpadding="0" border="0" class="nowtable">
                  <tbody><tr>
                    <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;商品基础信息</td>
                  </tr>
                </tbody></table></td>
              </tr>
              <tr class="">
                <td height="30" class="left_txt2" colspan="4">
                <table class="table00" width="100%" height="99" cellspacing="0" cellpadding="0" border="0">
                  <tbody>
	              <tr>
	                <td width="20%" height="30" bgcolor="#f2f2f2" align="right" class="left_txt2">货号(商家编码)：</td>
	                <td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
	                <td width="32%" height="30" bgcolor="#f2f2f2"><input type="text" size="30" id="partnumberInput" name="title" onblur="checkPartnumberUnique(this)" value="${Product.partnumber}"/></td>
	                <td width="45%" height="30" bgcolor="#f2f2f2" class="left_txt" style="color: red;">货号关系图片命名，修改后图片需重传</td>
	              </tr>
	              <tr>
	                <td height="30" align="right" class="left_txt2">商品名称：</td>
	                <td>&nbsp;</td>
	                <td height="30"><input type="text" size="30" id="prodName" value="${Product.name}"/></td>
	                <td height="30" class="left_txt">商品的名称</td>
	              </tr>
	              <tr>
	                <td height="30" bgcolor="#f2f2f2" align="right" class="left_txt2">商品短描述：</td>
	                <td bgcolor="#f2f2f2">&nbsp;</td>
	                <td height="30" bgcolor="#f2f2f2"><input type="text" size="50" id="shortDesc" name="logo" value="${Product.shortdesc}"/></td>
	                <td height="30" bgcolor="#f2f2f2" class="left_txt">商品的短描述</td>
	              </tr>
	              <tr>
	                <td height="30" align="right" class="left_txt2">关键字：</td>
	                <td>&nbsp;</td>
	                <td height="30"><input type="text" size="50" id="keyword" value="${Product.keyword}"/></td>
	                <td height="30" class="left_txt">用于seo优化</td>
	              </tr>
	              <tr>
	                <td height="30" bgcolor="#f2f2f2" align="right" class="left_txt2">吊牌价：</td>
	                <td bgcolor="#f2f2f2">&nbsp;</td>
	                <td height="30" bgcolor="#f2f2f2"><input type="text" size="30" id="prodListPriceDouble" value="${Product.listprice}"/></td>
	                <td height="30" bgcolor="#f2f2f2" class="left_txt">商品的吊牌价</td>
	              </tr>
	              <tr>
	                <td height="30" align="right" class="left_txt2">销售价：</td>
	                <td>&nbsp;</td>
	                <td height="30"><input type="text" size="30"  id="offerpriceInput" value="${Product.offerprice}" onblur="offerpriceChange(this)" /></td>
	                <td height="30" class="left_txt">商品的销售价</td>
	              </tr>
	              <tr style="display: none;">
	                <td height="30" align="right" class="left_txt2" colspan="1" >商品所属销售目录： </td>
	                <td bgcolor="#f2f2f2">&nbsp;</td>
	                <td height="30" bgcolor="#f2f2f2" id="selectSalesCatgroupTd" >
	                	<!-- 这里出来什么样的销售目录是根据 xstorecatgroup 查的 -->
	                	<select id="salesCatalogS1" onchange="clickSalesCatalog1(this.value)">
	                		
	                	</select>
	                	
	                	<select id="salesCatalogS2"  style="display: none">
	                		
	                	</select>
						
						<input type="button" value="添加" id="addSalesCatalog" class="inputbutton" style="display: none" onclick="addSalesCatalog()"/>
						
	                 </td>
	                 <td height="30" bgcolor="#f2f2f2" class="left_txt">销售目录请保持和商品主目录一致，方便前台筛选</td>
	              </tr>
	              <tr style="display: none;">
	                <td height="30" bgcolor="#F7F8F9" align="right" class="left_txt2"></td>
	                <td bgcolor="#f2f2f2">&nbsp;</td>
	                <td height="30" bgcolor="#F7F8F9" >
	                <div id="salesCatalogDisplayArea" >
	                </div>
	                </td>
	                <td height="30" bgcolor="#F7F8F9" class="left_txt"></td>
	              </tr>
	              
                  <tr>
                    <td  height="30" align="right" class="left_txt2" colspan="4">
	                    <table width="100%" height="31" cellspacing="0" cellpadding="0" border="0" class="nowtable">
	                      <tbody>
	                      <tr>
	                        <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;商品属性</td>
	                      </tr>
	                    </tbody></table>
                    </td>
                  </tr>
                </tbody></table></td>
              </tr>
              <tr class="">
                <td height="30" class="left_txt" colspan="4">
                <table width="100%" height="99" cellspacing="0" cellpadding="0" border="0" class="checkipt">
                  <tbody>
                  <tr>
	                <td width="20%" height="30" bgcolor="#f2f2f2" align="right" class="left_txt2">品牌：</td>
	                <td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
	                <td colspan="2">
		                <input type="radio" class="brandRadio" name="brand" value="Hodo"/>Hodo&nbsp;&nbsp;
		                <input type="radio" class="brandRadio" name="brand" value="HodoHome"/>HodoHome&nbsp;&nbsp;
		                <input type="radio" class="brandRadio" name="brand" value="Hongdou"/>Hongdou&nbsp;&nbsp;
		                <input type="radio" class="brandRadio" name="brand" value="Hongdouqing"/>Hongdouqing&nbsp;&nbsp;
		                <input type="radio" class="brandRadio" name="brand" value="Hongdoushu"/>Hongdoushu&nbsp;&nbsp;
		                <input type="radio" class="brandRadio" name="brand" value="Xiangsi"/>Xiangsi&nbsp;&nbsp;
	                </td>
	              </tr>
				  <tr>
	                <td width="20%" height="30" bgcolor="#f2f2f2" align="right" class="left_txt2"></td>
	                <td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
	                <td colspan="2">
		                <input type="radio" class="brandRadio" name="brand" value="Xiangsiniao"/>Xiangsiniao&nbsp;&nbsp;
		                <input type="radio" class="brandRadio" name="brand" value="Xiangsidou"/>Xiangsidou&nbsp;&nbsp;
		                <input type="radio" class="brandRadio" name="brand" value="Nanguo"/>Nanguo&nbsp;&nbsp;
		                <input type="radio" class="brandRadio" name="brand" value="Zuo"/>Zuo&nbsp;&nbsp;
		                <input type="radio" class="brandRadio" name="brand" value="ID.FIX"/>ID.FIX&nbsp;&nbsp;
		                <input type="radio" class="brandRadio" name="brand" value="IDF"/>IDF&nbsp;&nbsp;
	                </td>
	              </tr>
	              <tr>
	                <td width="20%" height="30" bgcolor="#f2f2f2" align="right" class="left_txt2">商品渠道类型：</td>
	                <td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
	                <td colspan="2">
		                <input type="radio" class="qudaoRadio" name="qudaoRadio" value="线上专供"/>线上专供&nbsp;&nbsp;
		                <input type="radio" class="qudaoRadio" name="qudaoRadio" value="门店同步"/>门店同步&nbsp;&nbsp;
	                </td>
	              </tr>
	              <!-- 
	              <tr>
	                <td width="20%" height="30" bgcolor="#f2f2f2" align="right" class="left_txt2">袖长：</td>
	                <td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
	                <td colspan="2"><input type="checkbox" />长袖&nbsp;&nbsp;<input type="checkbox" />中袖&nbsp;&nbsp;<input type="checkbox" />短袖&nbsp;&nbsp;</td>
	              </tr>
	              <tr>
	                <td height="30" bgcolor="#F7F8F9" align="right" class="left_txt2">样式：</td>
	                <td bgcolor="#F7F8F9">&nbsp;</td>
	                <td colspan="2"><input type="checkbox" />英伦&nbsp;&nbsp;<input type="checkbox" />复古&nbsp;&nbsp;<input type="checkbox" />流行&nbsp;&nbsp;</td>
	              </tr>
	              <tr>
	                <td height="30" bgcolor="#f2f2f2" align="right" class="left_txt2">款型：</td>
	                <td bgcolor="#f2f2f2">&nbsp;</td>
	                <td colspan="2"><input type="checkbox" />长款&nbsp;&nbsp;<input type="checkbox" />中款&nbsp;&nbsp;<input type="checkbox" />短款&nbsp;&nbsp;<input type="checkbox" />风衣&nbsp;&nbsp;</td>
	              </tr>
	               -->
                  <tr id="insertAttrTrBeforeThis">
                    <td  height="30" align="right" class="left_txt2" colspan="4">
	                    <table width="100%" height="31" cellspacing="0" cellpadding="0" border="0" class="nowtable">
	                      <tbody>
	                      <tr>
	                        <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;SKU属性</td>
	                      </tr>
	                    </tbody></table>
                    </td>
                  </tr>
                  
				<tr>
	                <td height="30" class="left_txt2" colspan="4"><table width="100%" height="30" cellspacing="0" cellpadding="0" border="0">
	                  <tbody>
		              <tr>
		                <td width="20%" height="30" bgcolor="#f2f2f2" align="right" class="left_txt2">颜色：</td>
		                <td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
		                <td width="32%" height="30" bgcolor="#f2f2f2"><input type="button" value="添加" id="addColor" class="inputbutton"/></td>
		                <td width="45%" height="30" bgcolor="#f2f2f2" class="left_txt"></td>
		              </tr>
		              <form enctype="multipart/form-data" action="../PortalUpdateColorPic" method="POST" name="colorForm">
		                  <input type="hidden" id="colorFormPartnumber" name="colorFormPartnumber" />
		                  <input type="hidden" id="colorFormCatentryId" name="colorFormCatentryId" />
		                  <input type="hidden" id="ckeditorValue" name="ckeditorValue" />
			              <tr class="color_tr">
			                <td height="30" align="right" class="left_txt2"></td>
			                <td>&nbsp;</td>
			                <td colspan="3" style="vertical-align: middle">
			                
			               <span style="float:left;margin-top:16px;"> 色系:</span>
			               <DIV style=" margin-top:16px;BORDER-BOTTOM: #dce0e1 1px solid; BORDER-LEFT: #dce0e1 1px solid; PADDING-BOTTOM: 1px; PADDING-LEFT: 2px; WIDTH: 90px; PADDING-RIGHT: 1px; BACKGROUND: white; FLOAT: left; BORDER-TOP: #dce0e1 1px solid; CURSOR: pointer; BORDER-RIGHT: #dce0e1 1px solid; PADDING-TOP: 1px" 
id="markSelectBox1" class="markSelectBox">
								<DIV 
								style="TEXT-ALIGN: center; WIDTH: 16px; FLOAT: right; HEIGHT: 18px; OVERFLOW: hidden" 
								class=attbg><IMG style="MARGIN: 3px 0pt 0pt" align=absMiddle 
								src="images/webqqshow_on.gif"> 
								</DIV>
								<DIV style="LINE-HEIGHT: 16px; PADDING-LEFT: 3px !important; HEIGHT: 18px" 
								id="markSelectTo1" class="markSelectTo"><span class='color' style='background-color:#000000'></span><em>黑色</em></DIV>
							</DIV>
								
								<!-- 供选择的内容 -->
								<DIV style="POSITION: absolute; DISPLAY: none" class=qmpanel_shadow>
									<DIV class=menu_base>
									<DIV class="menu_bd bd">
									<DIV class=menu_item><span class='color' style='background-color:#000000'></span><em>黑色</em></DIV>
									<DIV class=menu_item><span class='color' style='background-color:#FFFFFF'></span><em>白色</em></DIV>
									<DIV class=menu_item><span class='color' style='background-color:#CCCCCC'></span><em>灰色</em></DIV>
									<DIV class=menu_item><span class='color' style='background-color:#FFC0CB'></span><em>粉色</em></DIV>
									<DIV class=menu_item><span class='color' style='background-color:#CC0001'></span><em>红色</em></DIV>
									<DIV class=menu_item><span class='color' style='background-color:yellow'></span><em>黄色</em></DIV>
									<DIV class=menu_item><span class='color' style='background-color:#3566FF'></span><em>蓝色</em></DIV>
									<DIV class=menu_item><span class='color' style='background-color:#31C932'></span><em>绿色</em></DIV>
									<DIV class=menu_item><span class='color' style='background-color:#C0B08C'></span><em>杏色</em></DIV>
									<DIV class=menu_item><span class='color' style='background-color:#CC33FF'></span><em>紫色</em></DIV>
									<DIV class=menu_item><span class='color' style='background: url("images/se_other.gif") no-repeat scroll 0 0 transparent;'></span><em>花色</em></DIV>
									<DIV class=menu_item><span class='color' style='background-color:#804000'></span><em>棕色</em></DIV>
									<!-- 
									<DIV style="MARGIN-TOP: 5px; BACKGROUND: #ccc; PADDING-TOP: 1px"></DIV>
									 -->
									</DIV>
									</DIV>
									
								</DIV>
								&nbsp;<span style="vertical-align: middle; padding-top: 4px;color:#f00">*</span><input type="hidden" name="colorAttrvalId_1" class="colorAttrvalIdInput" id="colorAttrvalId_1"/><span style="vertical-align: middle; padding-top: 4px;">&nbsp;&nbsp;颜色</span><input style="margin-top: 4px;" type="text" size="24" class="colorValue"  id="colorInput1" />&nbsp;&nbsp;<span style="margin-top: 7px;">颜色图片：</span><span class="imgspan"><img width="45" height="45" src="images/weishangchuan.jpg" id="color_img_1"/></span><input type="file" value="上传颜色图片"  ID="filename" NAME="colorPic_1"/><span>仅当需要修改图片的时候再上传图片</span>
				                
				            </td>
			              </tr>
			              <tr class="color_tr"  style="display:none;"  id="color_tr_2">
			                <td height="30" align="right" class="left_txt2"></td>
			                <td>&nbsp;</td>
			                <td colspan="3" style="vertical-align: middle">
				               <span style="float:left;margin-top:16px;"> 色系:</span>
				               <DIV style=" margin-top:16px;BORDER-BOTTOM: #dce0e1 1px solid; BORDER-LEFT: #dce0e1 1px solid; PADDING-BOTTOM: 1px; PADDING-LEFT: 2px; WIDTH: 90px; PADDING-RIGHT: 1px; BACKGROUND: white; FLOAT: left; BORDER-TOP: #dce0e1 1px solid; CURSOR: pointer; BORDER-RIGHT: #dce0e1 1px solid; PADDING-TOP: 1px" 
	id="markSelectBox2" class="markSelectBox">
									<DIV 
									style="TEXT-ALIGN: center; WIDTH: 16px; FLOAT: right; HEIGHT: 18px; OVERFLOW: hidden" 
									class=attbg><IMG style="MARGIN: 3px 0pt 0pt" align=absMiddle 
									src="images/webqqshow_on.gif"> 
									</DIV>
									<DIV style="LINE-HEIGHT: 16px; PADDING-LEFT: 3px !important; HEIGHT: 18px" 
									id="markSelectTo2" class="markSelectTo"><span class='color' style='background-color:#000000'></span><em>黑色</em></DIV>
								</DIV>
								&nbsp;<span style="vertical-align: middle; padding-top: 4px;color:#f00">*</span><input type="hidden" name="colorAttrvalId_2" class="colorAttrvalIdInput" id="colorAttrvalId_2"/><span style="vertical-align: middle; padding-top: 4px;">&nbsp;&nbsp;颜色</span><input style="margin-top: 7px;" type="text" size="24" class="colorValue"  id="colorInput2" />&nbsp;&nbsp;<span style="margin-top: 7px;">颜色图片：</span><span class="imgspan"><img width="45" height="45" src="images/weishangchuan.jpg" id="color_img_2"/></span><input type="file" value="上传颜色图片"  ID="filename" NAME="colorPic_2"/><span>仅当需要修改图片的时候再上传图片</span>
								
				            </td>
			              </tr>
			              <tr class="color_tr" style="display:none;" id="color_tr_3">
			                <td height="30" align="right" class="left_txt2"></td>
			                <td>&nbsp;</td>
			                <td colspan="3" style="vertical-align: middle">
			                <span style="float:left;margin-top:16px;"> 色系:</span>
								<DIV style=" margin-top:16px;BORDER-BOTTOM: #dce0e1 1px solid; BORDER-LEFT: #dce0e1 1px solid; PADDING-BOTTOM: 1px; PADDING-LEFT: 2px; WIDTH: 90px; PADDING-RIGHT: 1px; BACKGROUND: white; FLOAT: left; BORDER-TOP: #dce0e1 1px solid; CURSOR: pointer; BORDER-RIGHT: #dce0e1 1px solid; PADDING-TOP: 1px" 
	id="markSelectBox3" class="markSelectBox">
									<DIV 
									style="TEXT-ALIGN: center; WIDTH: 16px; FLOAT: right; HEIGHT: 18px; OVERFLOW: hidden" 
									class=attbg><IMG style="MARGIN: 3px 0pt 0pt" align=absMiddle 
									src="images/webqqshow_on.gif"> 
									</DIV>
									<DIV style="LINE-HEIGHT: 16px; PADDING-LEFT: 3px !important; HEIGHT: 18px" 
									id="markSelectTo3" class="markSelectTo"><span class='color' style='background-color:#000000'></span><em>黑色</em></DIV>
								</DIV>
								&nbsp;<span style="vertical-align: middle; padding-top: 4px;color:#f00">*</span><input type="hidden" name="colorAttrvalId_3" class="colorAttrvalIdInput" id="colorAttrvalId_3"/><span style="vertical-align: middle; padding-top: 4px;">&nbsp;&nbsp;颜色</span><input style="margin-top: 7px;" type="text" size="24" class="colorValue"  id="colorInput3" />&nbsp;&nbsp;<span style="margin-top: 7px;">颜色图片：</span><span class="imgspan"><img width="45" height="45" src="images/weishangchuan.jpg" id="color_img_3"/></span><input type="file" value="上传颜色图片"  ID="filename" NAME="colorPic_3"/><span>仅当需要修改图片的时候再上传图片</span>
								
				            </td>
			              </tr>
			              <tr class="color_tr" style="display:none;" id="color_tr_4">
			                <td height="30" align="right" class="left_txt2"></td>
			                <td>&nbsp;</td>
			                <td colspan="3" style="vertical-align: middle">
			                	<span style="float:left;margin-top:16px;"> 色系:</span>
				               <DIV style=" margin-top:16px;BORDER-BOTTOM: #dce0e1 1px solid; BORDER-LEFT: #dce0e1 1px solid; PADDING-BOTTOM: 1px; PADDING-LEFT: 2px; WIDTH: 90px; PADDING-RIGHT: 1px; BACKGROUND: white; FLOAT: left; BORDER-TOP: #dce0e1 1px solid; CURSOR: pointer; BORDER-RIGHT: #dce0e1 1px solid; PADDING-TOP: 1px" 
	id="markSelectBox4" class="markSelectBox">
									<DIV 
									style="TEXT-ALIGN: center; WIDTH: 16px; FLOAT: right; HEIGHT: 18px; OVERFLOW: hidden" 
									class=attbg><IMG style="MARGIN: 3px 0pt 0pt" align=absMiddle 
									src="images/webqqshow_on.gif"> 
									</DIV>
									<DIV style="LINE-HEIGHT: 16px; PADDING-LEFT: 3px !important; HEIGHT: 18px" 
									id="markSelectTo4" class="markSelectTo"><span class='color' style='background-color:#000000'></span><em>黑色</em></DIV>
								</DIV>&nbsp;<span style="vertical-align: middle; padding-top: 4px;color:#f00">*</span><input type="hidden" name="colorAttrvalId_4" class="colorAttrvalIdInput" id="colorAttrvalId_4"/><span style="vertical-align: middle; padding-top: 4px;">&nbsp;&nbsp;颜色</span><input style="margin-top: 7px;" type="text" size="24" class="colorValue"  id="colorInput4" />&nbsp;&nbsp;<span style="margin-top: 7px;">颜色图片：</span><span class="imgspan"><img width="45" height="45" src="images/weishangchuan.jpg" id="color_img_4"/></span><input type="file" value="上传颜色图片"  ID="filename" NAME="colorPic_4"/><span>仅当需要修改图片的时候再上传图片</span>
								
				            </td>
			              </tr>
			              <tr class="color_tr" style="display:none;" id="color_tr_5">
			                <td height="30" align="right" class="left_txt2"></td>
			                <td>&nbsp;</td>
			                <td colspan="3" style="vertical-align: middle">
			                <span style="float:left;margin-top:16px;"> 色系:</span>
				               <DIV style=" margin-top:16px;BORDER-BOTTOM: #dce0e1 1px solid; BORDER-LEFT: #dce0e1 1px solid; PADDING-BOTTOM: 1px; PADDING-LEFT: 2px; WIDTH: 90px; PADDING-RIGHT: 1px; BACKGROUND: white; FLOAT: left; BORDER-TOP: #dce0e1 1px solid; CURSOR: pointer; BORDER-RIGHT: #dce0e1 1px solid; PADDING-TOP: 1px" 
	id="markSelectBox5" class="markSelectBox">
									<DIV 
									style="TEXT-ALIGN: center; WIDTH: 16px; FLOAT: right; HEIGHT: 18px; OVERFLOW: hidden" 
									class=attbg><IMG style="MARGIN: 3px 0pt 0pt" align=absMiddle 
									src="images/webqqshow_on.gif"> 
									</DIV>
									<DIV style="LINE-HEIGHT: 16px; PADDING-LEFT: 3px !important; HEIGHT: 18px" 
									id="markSelectTo5" class="markSelectTo"><span class='color' style='background-color:#000000'></span><em>黑色</em></DIV>
								</DIV>&nbsp;<span style="vertical-align: middle; padding-top: 4px;color:#f00">*</span><input type="hidden" name="colorAttrvalId_5" class="colorAttrvalIdInput" id="colorAttrvalId_5"/><span style="vertical-align: middle; padding-top: 4px;">&nbsp;&nbsp;颜色</span><input style="margin-top: 7px;" type="text" size="24" class="colorValue"  id="colorInput5" />&nbsp;&nbsp;<span style="margin-top: 7px;">颜色图片：</span><span class="imgspan"><img width="45" height="45" src="images/weishangchuan.jpg" id="color_img_5"/></span><input type="file" value="上传颜色图片"  ID="filename" NAME="colorPic_5"/><span>仅当需要修改图片的时候再上传图片</span>
								
				            </td>
			              </tr>
						  <tr class="color_tr" style="display:none;" id="color_tr_6">
			                <td height="30" align="right" class="left_txt2"></td>
			                <td>&nbsp;</td>
			                <td colspan="3" style="vertical-align: middle">
			                <span style="float:left;margin-top:16px;"> 色系:</span>
				               <DIV style=" margin-top:16px;BORDER-BOTTOM: #dce0e1 1px solid; BORDER-LEFT: #dce0e1 1px solid; PADDING-BOTTOM: 1px; PADDING-LEFT: 2px; WIDTH: 90px; PADDING-RIGHT: 1px; BACKGROUND: white; FLOAT: left; BORDER-TOP: #dce0e1 1px solid; CURSOR: pointer; BORDER-RIGHT: #dce0e1 1px solid; PADDING-TOP: 1px" 
	id="markSelectBox6" class="markSelectBox">
									<DIV 
									style="TEXT-ALIGN: center; WIDTH: 16px; FLOAT: right; HEIGHT: 18px; OVERFLOW: hidden" 
									class=attbg><IMG style="MARGIN: 3px 0pt 0pt" align=absMiddle 
									src="images/webqqshow_on.gif"> 
									</DIV>
									<DIV style="LINE-HEIGHT: 16px; PADDING-LEFT: 3px !important; HEIGHT: 18px" 
									id="markSelectTo6" class="markSelectTo"><span class='color' style='background-color:#000000'></span><em>黑色</em></DIV>
								</DIV>&nbsp;<span style="vertical-align: middle; padding-top: 4px;color:#f00">*</span><input type="hidden" name="colorAttrvalId_6" class="colorAttrvalIdInput" id="colorAttrvalId_5"/><span style="vertical-align: middle; padding-top: 4px;">&nbsp;&nbsp;颜色</span><input style="margin-top: 7px;" type="text" size="24" class="colorValue"  id="colorInput6" />&nbsp;&nbsp;<span style="margin-top: 7px;">颜色图片：</span><span class="imgspan"><img width="45" height="45" src="images/weishangchuan.jpg" id="color_img_6"/></span><input type="file" value="上传颜色图片"  ID="filename" NAME="colorPic_6"/><span>仅当需要修改图片的时候再上传图片</span>
								
				            </td>
			              </tr>
						  <tr class="color_tr" style="display:none;" id="color_tr_7">
			                <td height="30" align="right" class="left_txt2"></td>
			                <td>&nbsp;</td>
			                <td colspan="3" style="vertical-align: middle">
			                <span style="float:left;margin-top:16px;"> 色系:</span>
				               <DIV style=" margin-top:16px;BORDER-BOTTOM: #dce0e1 1px solid; BORDER-LEFT: #dce0e1 1px solid; PADDING-BOTTOM: 1px; PADDING-LEFT: 2px; WIDTH: 90px; PADDING-RIGHT: 1px; BACKGROUND: white; FLOAT: left; BORDER-TOP: #dce0e1 1px solid; CURSOR: pointer; BORDER-RIGHT: #dce0e1 1px solid; PADDING-TOP: 1px" 
	id="markSelectBox7" class="markSelectBox">
									<DIV 
									style="TEXT-ALIGN: center; WIDTH: 16px; FLOAT: right; HEIGHT: 18px; OVERFLOW: hidden" 
									class=attbg><IMG style="MARGIN: 3px 0pt 0pt" align=absMiddle 
									src="images/webqqshow_on.gif"> 
									</DIV>
									<DIV style="LINE-HEIGHT: 16px; PADDING-LEFT: 3px !important; HEIGHT: 18px" 
									id="markSelectTo7" class="markSelectTo"><span class='color' style='background-color:#000000'></span><em>黑色</em></DIV>
								</DIV>&nbsp;<span style="vertical-align: middle; padding-top: 4px;color:#f00">*</span><input type="hidden" name="colorAttrvalId_7" class="colorAttrvalIdInput" id="colorAttrvalId_7"/><span style="vertical-align: middle; padding-top: 4px;">&nbsp;&nbsp;颜色</span><input style="margin-top: 7px;" type="text" size="24" class="colorValue"  id="colorInput7" />&nbsp;&nbsp;<span style="margin-top: 7px;">颜色图片：</span><span class="imgspan"><img width="45" height="45" src="images/weishangchuan.jpg" id="color_img_7"/></span><input type="file" value="上传颜色图片"  ID="filename" NAME="colorPic_5"/><span>仅当需要修改图片的时候再上传图片</span>
								
				            </td>
			              </tr>
					      <tr class="color_tr" style="display:none;" id="color_tr_8">
			                <td height="30" align="right" class="left_txt2"></td>
			                <td>&nbsp;</td>
			                <td colspan="3" style="vertical-align: middle">
			                <span style="float:left;margin-top:16px;"> 色系:</span>
				               <DIV style=" margin-top:16px;BORDER-BOTTOM: #dce0e1 1px solid; BORDER-LEFT: #dce0e1 1px solid; PADDING-BOTTOM: 1px; PADDING-LEFT: 2px; WIDTH: 90px; PADDING-RIGHT: 1px; BACKGROUND: white; FLOAT: left; BORDER-TOP: #dce0e1 1px solid; CURSOR: pointer; BORDER-RIGHT: #dce0e1 1px solid; PADDING-TOP: 1px" 
	id="markSelectBox8" class="markSelectBox">
									<DIV 
									style="TEXT-ALIGN: center; WIDTH: 16px; FLOAT: right; HEIGHT: 18px; OVERFLOW: hidden" 
									class=attbg><IMG style="MARGIN: 3px 0pt 0pt" align=absMiddle 
									src="images/webqqshow_on.gif"> 
									</DIV>
									<DIV style="LINE-HEIGHT: 16px; PADDING-LEFT: 3px !important; HEIGHT: 18px" 
									id="markSelectTo8" class="markSelectTo"><span class='color' style='background-color:#000000'></span><em>黑色</em></DIV>
								</DIV>&nbsp;<span style="vertical-align: middle; padding-top: 4px;color:#f00">*</span><input type="hidden" name="colorAttrvalId_8" class="colorAttrvalIdInput" id="colorAttrvalId_8"/><span style="vertical-align: middle; padding-top: 4px;">&nbsp;&nbsp;颜色</span><input style="margin-top: 7px;" type="text" size="24" class="colorValue"  id="colorInput8" />&nbsp;&nbsp;<span style="margin-top: 7px;">颜色图片：</span><span class="imgspan"><img width="45" height="45" src="images/weishangchuan.jpg" id="color_img_8"/></span><input type="file" value="上传颜色图片"  ID="filename" NAME="colorPic_5"/><span>仅当需要修改图片的时候再上传图片</span>
								
				            </td>
			              </tr>
						  <tr class="color_tr" style="display:none;" id="color_tr_9">
			                <td height="30" align="right" class="left_txt2"></td>
			                <td>&nbsp;</td>
			                <td colspan="3" style="vertical-align: middle">
			                <span style="float:left;margin-top:16px;"> 色系:</span>
				               <DIV style=" margin-top:16px;BORDER-BOTTOM: #dce0e1 1px solid; BORDER-LEFT: #dce0e1 1px solid; PADDING-BOTTOM: 1px; PADDING-LEFT: 2px; WIDTH: 90px; PADDING-RIGHT: 1px; BACKGROUND: white; FLOAT: left; BORDER-TOP: #dce0e1 1px solid; CURSOR: pointer; BORDER-RIGHT: #dce0e1 1px solid; PADDING-TOP: 1px" 
	id="markSelectBox9" class="markSelectBox">
									<DIV 
									style="TEXT-ALIGN: center; WIDTH: 16px; FLOAT: right; HEIGHT: 18px; OVERFLOW: hidden" 
									class=attbg><IMG style="MARGIN: 3px 0pt 0pt" align=absMiddle 
									src="images/webqqshow_on.gif"> 
									</DIV>
									<DIV style="LINE-HEIGHT: 16px; PADDING-LEFT: 3px !important; HEIGHT: 18px" 
									id="markSelectTo9" class="markSelectTo"><span class='color' style='background-color:#000000'></span><em>黑色</em></DIV>
								</DIV>&nbsp;<span style="vertical-align: middle; padding-top: 4px;color:#f00">*</span><input type="hidden" name="colorAttrvalId_9" class="colorAttrvalIdInput" id="colorAttrvalId_9"/><span style="vertical-align: middle; padding-top: 4px;">&nbsp;&nbsp;颜色</span><input style="margin-top: 7px;" type="text" size="24" class="colorValue"  id="colorInput9" />&nbsp;&nbsp;<span style="margin-top: 7px;">颜色图片：</span><span class="imgspan"><img width="45" height="45" src="images/weishangchuan.jpg" id="color_img_9"/></span><input type="file" value="上传颜色图片"  ID="filename" NAME="colorPic_5"/><span>仅当需要修改图片的时候再上传图片</span>
								
				            </td>
			              </tr>
						  <tr class="color_tr" style="display:none;" id="color_tr_10">
			                <td height="30" align="right" class="left_txt2"></td>
			                <td>&nbsp;</td>
			                <td colspan="3" style="vertical-align: middle">
			                <span style="float:left;margin-top:16px;"> 色系:</span>
				               <DIV style=" margin-top:16px;BORDER-BOTTOM: #dce0e1 1px solid; BORDER-LEFT: #dce0e1 1px solid; PADDING-BOTTOM: 1px; PADDING-LEFT: 2px; WIDTH: 90px; PADDING-RIGHT: 1px; BACKGROUND: white; FLOAT: left; BORDER-TOP: #dce0e1 1px solid; CURSOR: pointer; BORDER-RIGHT: #dce0e1 1px solid; PADDING-TOP: 1px" 
	id="markSelectBox10" class="markSelectBox">
									<DIV 
									style="TEXT-ALIGN: center; WIDTH: 16px; FLOAT: right; HEIGHT: 18px; OVERFLOW: hidden" 
									class=attbg><IMG style="MARGIN: 3px 0pt 0pt" align=absMiddle 
									src="images/webqqshow_on.gif"> 
									</DIV>
									<DIV style="LINE-HEIGHT: 16px; PADDING-LEFT: 3px !important; HEIGHT: 18px" 
									id="markSelectTo10" class="markSelectTo"><span class='color' style='background-color:#000000'></span><em>黑色</em></DIV>
								</DIV>&nbsp;<span style="vertical-align: middle; padding-top: 4px;color:#f00">*</span><input type="hidden" name="colorAttrvalId_10" class="colorAttrvalIdInput" id="colorAttrvalId_10"/><span style="vertical-align: middle; padding-top: 4px;">&nbsp;&nbsp;颜色</span><input style="margin-top: 7px;" type="text" size="24" class="colorValue"  id="colorInput10" />&nbsp;&nbsp;<span style="margin-top: 7px;">颜色图片：</span><span class="imgspan"><img width="45" height="45" src="images/weishangchuan.jpg" id="color_img_10"/></span><input type="file" value="上传颜色图片"  ID="filename" NAME="colorPic_5"/><span>仅当需要修改图片的时候再上传图片</span>
								
				            </td>
			              </tr>
			              <tr id="addSize_tr">
			                <td height="30" bgcolor="#f2f2f2" align="right" class="left_txt2">建议的规范尺码值：</td>
			                <td bgcolor="#f2f2f2">&nbsp;</td>
			                <td height="30" bgcolor="#f2f2f2"></td>
			                <td height="30" bgcolor="#f2f2f2" class="left_txt"></td>
			              </tr>
		              </form>
		              <%-- 
		              <tr class="size_tr">
		                <td height="30" align="right" class="left_txt2">建议的规范尺码值：</td>
		                <td>&nbsp;</td>
		                <td colspan="3">
		                	
		                	
		                	<c:forEach var="size" items="${skuSizes}">
								<input class="sizeCheckBox" type="checkbox" checked />
			                	<span class="sizeSpan" id="sizeSpan1">${size.value}</span>
			                	<input class="sizeInput" style="display: none;width: 50px;" >&nbsp;&nbsp;
							</c:forEach>
							
			                
		                </td>
		              </tr>
		              --%>
		              <tr class="size_tr">
		                <td height="30" align="right" class="left_txt2">服饰类：</td>
		                <td>&nbsp;</td>
		                <td colspan="3">
			                <span class="sizeSpan" id="sizeSpan1">155</span>
			                <input class="sizeInput" style="display: none;width: 50px;" >&nbsp;&nbsp;
			                
			                <span class="sizeSpan" id="sizeSpan2">160</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                <span class="sizeSpan" id="sizeSpan2">165</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">170</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">175</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">180</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">185</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">190</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
		                </td>
		              </tr>
		              <tr class="size_tr">
		                <td height="30" align="right" class="left_txt2"></td>
		                <td>&nbsp;</td>
		                <td colspan="3">
			                
			                <span class="sizeSpan" id="sizeSpan2">XS</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">S</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">M</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">L</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">XL</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">XXL</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">XXXL</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">XXXXL</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
		                </td>
		              </tr>
		              <tr class="size_tr">
		                <td height="30" align="right" class="left_txt2"></td>
		                <td>&nbsp;</td>
		                <td colspan="3">
			                
			                <span class="sizeSpan" id="sizeSpan2">29</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">30</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">31</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">32</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">33</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">34</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">35</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">36</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                <span class="sizeSpan" id="sizeSpan2">37</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">38</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">39</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">40</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">41</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">42</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">43</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">44</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
		                </td>
		              </tr>
		              <tr class="size_tr">
		                <td height="30" align="right" class="left_txt2"></td>
		                <td>&nbsp;</td>
		                <td colspan="3">
			                
			                <span class="sizeSpan" id="sizeSpan2">100</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">105</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">110</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">115</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">120</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">125</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
		                </td>
		              </tr>
		              <tr class="size_tr">
		                <td height="30" align="right" class="left_txt2">童装类</td>
		                <td>&nbsp;</td>
		                <td colspan="3">
			                
			                <span class="sizeSpan" id="sizeSpan2">110/60</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">120/55</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">130/60</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">135/65</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">140/70</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">缺码</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
		                </td>
		              </tr>
					  <tr class="size_tr">
		                <td height="30" align="right" class="left_txt2">文胸类</td>
		                <td>&nbsp;</td>
		                <td colspan="3">
			                
			                <span class="sizeSpan" id="sizeSpan2">A杯</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">B杯</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">C杯</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">D杯</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">E杯</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
		                </td>
		              </tr>
		              <tr class="size_tr">
		                <td height="30" align="right" class="left_txt2">家纺类</td>
		                <td>&nbsp;</td>
		                <td colspan="3">
			                
			                <span class="sizeSpan" id="sizeSpan2">1.5m</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">1.8m</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">2m</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			             
		                </td>
		              </tr>
					  <tr class="size_tr">
		                <td height="30" align="right" class="left_txt2"></td>
		                <td>&nbsp;</td>
		                <td colspan="3">
			                
			                <span class="sizeSpan" id="sizeSpan2">150*200</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">160*210</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">180*200</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">200*230</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">220*240</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			             
		                </td>
		              </tr>
		              <tr class="size_tr">
		                <td height="30" align="right" class="left_txt2"></td>
		                <td>&nbsp;</td>
		                <td colspan="3">
			                
			                <span class="sizeSpan" id="sizeSpan2">填充物1斤</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">填充物2斤</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">填充物3斤</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">填充物4斤</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">220*240</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
		                </td>
		              </tr>
		              <tr class="size_tr">
		                <td height="30" align="right" class="left_txt2"></td>
		                <td>&nbsp;</td>
		                <td colspan="3">
			                
			                <span class="sizeSpan" id="sizeSpan2">48*74</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
			                
			                
			                <span class="sizeSpan" id="sizeSpan2">45*75</span>
			                <input class="sizeInput" style="display: none;width: 50px;">&nbsp;&nbsp;
		                </td>
		              </tr>
	                  <tr class="skuConfig  display_none">
	                    <td  height="30" align="right" class="left_txt2" colspan="4">
		                    <table width="100%" height="31" cellspacing="0" cellpadding="0" border="0" class="nowtable">
		                      <tbody>
		                      <tr>
		                        <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;sku配置&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;总库存:<span id="totalInventory">0</span></td>
		                      </tr>
		                    </tbody></table>
	                    </td>
	                  </tr>
	                </tbody></table></td>
	              </tr>
	              
	              
	              <tr>
	                <td height="30" class="left_txt2" colspan="4">
	                <table width="100%" height="auto" cellspacing="0" cellpadding="0" border="0">
	                  <tbody>
	                  <tr>
	                  	<td>
	                  		<input style="margin-left: 145px;margin-top: 5px;" type="button" id="addSkuButtong" value="添加sku" onclick="addSkuButton()" class="inputbutton" />
	                  	</td>
	                  </tr>
		              <tr class="skuConfig"  id="skutable_tr">
		              	<td align="center">
		              			<table class="skutable"  id="skutable" cellspacing="0" cellpadding="0" border="0">
		              				<tr id="skutableTitleTr">
		              					<th bgcolor="#f2f2f2">是否上架</th>
										<th bgcolor="#f2f2f2">色系</th>
		              					<th bgcolor="#f2f2f2">颜色</th>
										<th bgcolor="#f2f2f2">尺码</th>
		              					<th bgcolor="#f2f2f2">条形码</th>
		              					<th bgcolor="#f2f2f2">价格</th>
		              					<th bgcolor="#f2f2f2">总库存数量</th>
		              					<th bgcolor="#f2f2f2">占用库存数量(仅显示)</th>
		              				</tr>
		              				
		              				<!-- 
		              				<tr style="display: none">
		              					<td bgcolor="#f2f2f2"><input type="text" size="24"  value="XXXXX-3"></input></td>
		              					<td bgcolor="#f2f2f2"><input type="text" size="24" ></input></td>
		              					<td bgcolor="#f2f2f2"><input type="text" size="24" ></input></td>
		              					<td bgcolor="#f2f2f2">紫色</td>
		              					<td bgcolor="#f2f2f2">M</td>
		              				</tr>
		              				 -->
		              			</table>
		              	</td>
		              </tr>
					  <tr class="skuConfig  display_none">
					  <td colspan="4">
					  <p style="padding-left: 101px;">
					  	<c:choose>
					  		<c:when test="${isSyncTaobaoInventory}">
					  			<input id="isSyncTaobaoCheckbox" type="checkbox" checked="checked" onchange="isSyncTaobao(this)" />&nbsp;&nbsp;是否和淘宝同步库存
					  		</c:when>
					  		<c:otherwise>
					  			<input id="isSyncTaobaoCheckbox" type="checkbox" onchange="isSyncTaobao(this)" />&nbsp;&nbsp;是否和淘宝同步库存
					  		</c:otherwise>
					  	</c:choose>
					  	<span style="color: red">(若要和淘宝同步，请在货号处填写和淘宝相同的商家编码)</span>
					  </p>
					  
					  	<c:choose>
					  		<c:when test="${isSyncTaobaoInventory}">
					  			 <p id="syncTaobaoP" style="padding-left: 101px;">选择与哪家淘宝店同步<select name="togb" id="syncTaobaoSelect">
				  				 <c:forEach var="taobaoStore" items="${taobaoStoreNames}">
								 <option value="${taobaoStore.storeId}">${taobaoStore.storeName}</option>
							</c:forEach>
					  </select></p>
					  		</c:when>
					  		<c:otherwise>
					  			 <p id="syncTaobaoP" style="padding-left: 101px;display: none;">选择与哪家淘宝店同步<select name="togb" id="syncTaobaoSelect">
				  				 <c:forEach var="taobaoStore" items="${taobaoStoreNames}">
								 	<option value="${taobaoStore.storeId}">${taobaoStore.storeName}</option>
							     </c:forEach>
					  </select></p>
					  		</c:otherwise>
					  	</c:choose>
					 </td>
					  </tr>
		               <tr>
	                    <td  height="30" align="right" class="left_txt2" colspan="4">
		                    <table width="100%" height="20" cellspacing="0" cellpadding="0" border="0" class="nowtable">
		                      <tbody>
		                      <tr>
		                        <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;商品图片 (请上传800*800像素或以上的图，且最好是正方形的不然会变形或模糊)</td>
		                      </tr>
		                    </tbody></table>
	                    </td>
	                  </tr>
	                </tbody></table></td>
	              </tr>
	              
	              <tr>
	                <td height="30" class="left_txt2" colspan="4"><table width="100%" height="99" cellspacing="0" cellpadding="0" border="0">
	                  <tbody>
		              <tr>
                           <td colspan="4">
									<ul class="pm-pwrap" id="J_PanelLocalList">
									  <li class="pm-item">
									  <div id="delA" class="del" style="cursor:pointer;" onclick="deleteProductPic('A')"></div>
									    <div class="examp"> 
									    	<img src="" alt="" id="productPicA" style="vertical-align: middle;" width="82" height="82"/>
									    	<span id="maskA" class="mask"></span> <span id="descA" class="desc"> 请上传<br />橱窗图1 </span> 
									    </div>
									    <div class="pm-box"></div>
									    <div class="pm-itemcont">
									      <div class="preview"> </div>
									      <span class="upload">
									      	<a href="javascript:void(0);" style="cursor:pointer;" >
										      	<!-- <input class="fileuploadInput" type="file" value="上传颜色图片" onchange="javascript:uploadPic('filename');" ID="filename" NAME="filename"/></a> -->
										      	<input style="cursor:pointer;"  type="file" onchange="javascript:uploadProduct('productPic1', 'A');"  id="productPic1" name="productPic1" />
									      	</a> 
									      </span>
									      <input type="hidden" value="" name="picUrl1" class="J_PicUrl" />
									      <input type="hidden" value="1" name="image_pos" />
									    </div>
									    <div class="pm-loading">
									      <div class="pm-loading-inner"> <img src="http://img03.taobaocdn.com/tps/i3/T1jBamXj4fXXXXXXXX-16-16.gif" alt="" />上传中</div>
									    </div>
									  </li>
									  
									  <li class="pm-item ">
									  <div id="delB" class="del" style="cursor:pointer;" onclick="deleteProductPic('B')"></div>
									    <div class="examp"> 
									    	<img src="" alt="" id="productPicB" style="vertical-align: middle;" width="82" height="82"/>
									    	<span id="maskB" class="mask"></span> <span id="descB" class="desc"> 请上传<br />橱窗图2 </span> 
									    </div>
									    <div class="pm-box"></div>
									    <div class="pm-itemcont">
									      <div class="preview"> </div>
									      <span class="upload">
									      	<a href="javascript:void(0);" style="cursor:pointer;" >
										      	<!-- <input class="fileuploadInput" type="file" value="上传颜色图片" onchange="javascript:uploadPic('filename');" ID="filename" NAME="filename"/></a> -->
										      	<input style="cursor:pointer;"  type="file" onchange="javascript:uploadProduct('productPic2', 'B');"  id="productPic2" name="productPic2" />
									      	</a> 
									      </span>
									      <input type="hidden" value="" name="picUrl1" class="J_PicUrl" />
									      <input type="hidden" value="1" name="image_pos" />
									    </div>
									    <div class="pm-loading">
									      <div class="pm-loading-inner"> <img src="http://img03.taobaocdn.com/tps/i3/T1jBamXj4fXXXXXXXX-16-16.gif" alt="" />上传中</div>
									    </div>
									  </li>
									  <li class="pm-item ">
									   <div id="delC" class="del" style="cursor:pointer;" onclick="deleteProductPic('C')"></div>
									    <div class="examp"> 
									    	<img src="" alt="" id="productPicC" style="vertical-align: middle;" width="82" height="82"/>
									    	<span id="maskC" class="mask"></span> <span id="descC" class="desc"> 请上传<br />橱窗图3 </span> 
									    </div>
									    <div class="pm-box"></div>
									    <div class="pm-itemcont">
									      <div class="preview"> </div>
									      <span class="upload">
									      	<a href="javascript:void(0);" style="cursor:pointer;" >
										      	<!-- <input class="fileuploadInput" type="file" value="上传颜色图片" onchange="javascript:uploadPic('filename');" ID="filename" NAME="filename"/></a> -->
										      	<input style="cursor:pointer;"  type="file" onchange="javascript:uploadProduct('productPic3', 'C');"  id="productPic3" name="productPic3" />
									      	</a> 
									      </span>
									      <input type="hidden" value="" name="picUrl1" class="J_PicUrl" />
									      <input type="hidden" value="1" name="image_pos" />
									    </div>
									    <div class="pm-loading">
									      <div class="pm-loading-inner"> <img src="http://img03.taobaocdn.com/tps/i3/T1jBamXj4fXXXXXXXX-16-16.gif" alt="" />上传中</div>
									    </div>
									  </li>
									  <li class="pm-item ">
									    <div id="delD" class="del" style="cursor:pointer;" onclick="deleteProductPic('D')"></div>
									    <div class="examp"> 
									    	<img src="" alt="" id="productPicD" style="vertical-align: middle;" width="82" height="82"/>
									    	<span id="maskD" class="mask"></span> <span id="descD" class="desc"> 请上传<br />橱窗图4 </span> 
									    </div>
									    <div class="pm-box"></div>
									    <div class="pm-itemcont">
									      <div class="preview"> </div>
									      <span class="upload">
									      	<a href="javascript:void(0);" style="cursor:pointer;" >
										      	<!-- <input class="fileuploadInput" type="file" value="上传颜色图片" onchange="javascript:uploadPic('filename');" ID="filename" NAME="filename"/></a> -->
										      	<input style="cursor:pointer;"  type="file" onchange="javascript:uploadProduct('productPic4', 'D');"  id="productPic4" name="productPic4" />
									      	</a> 
									      </span>
									      <input type="hidden" value="" name="picUrl1" class="J_PicUrl" />
									      <input type="hidden" value="1" name="image_pos" />
									    </div>
									    <div class="pm-loading">
									      <div class="pm-loading-inner"> <img src="http://img03.taobaocdn.com/tps/i3/T1jBamXj4fXXXXXXXX-16-16.gif" alt="" />上传中</div>
									    </div>
									  </li>
									  <li class="pm-item ">
									   	<div id="delE" class="del" style="cursor:pointer;" onclick="deleteProductPic('E')"></div>
									    <div class="examp"> 
									    	<img src="" alt="" id="productPicE" style="vertical-align: middle;" width="82" height="82"/>
									    	<span id="maskE" class="mask"></span> <span id="descE" class="desc"> 请上传<br />橱窗图5 </span> 
									    </div>
									    <div class="pm-box"></div>
									    <div class="pm-itemcont">
									      <div class="preview"> </div>
									      <span class="upload">
									      	<a href="javascript:void(0);" style="cursor:pointer;" >
										      	<!-- <input class="fileuploadInput" type="file" value="上传颜色图片" onchange="javascript:uploadPic('filename');" ID="filename" NAME="filename"/></a> -->
										      	<input style="cursor:pointer;"  type="file" onchange="javascript:uploadProduct('productPic5', 'E');"  id="productPic5" name="productPic5" />
									      	</a> 
									      </span>
									      <input type="hidden" value="" name="picUrl1" class="J_PicUrl" />
									      <input type="hidden" value="1" name="image_pos" />
									    </div>
									    <div class="pm-loading">
									      <div class="pm-loading-inner"> <img src="http://img03.taobaocdn.com/tps/i3/T1jBamXj4fXXXXXXXX-16-16.gif" alt="" />上传中</div>
									    </div>
									  </li>
									</ul>
							</td>
		              </tr>
		              <tr>
	                    <td  height="30" align="right" class="left_txt2" colspan="4">
		                    <table width="100%" height="31" cellspacing="0" cellpadding="0" border="0" class="nowtable">
		                      <tbody>
		                      <tr>
		                        <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;详情描述</td>
		                      </tr>
		                    </tbody></table>
	                    </td>
	                  </tr>
	                </tbody></table></td>
	              </tr>
	              
	              <tr>
	                <td height="30" class="left_txt2" colspan="4"><table width="100%" height="99" cellspacing="0" cellpadding="0" border="0">
	                  <tbody>
		              <tr>
		              	<td>
			              	<textarea id="ckeditorTextarea" name="ckeditorTextarea"><%=longDesc %></textarea>
		              	</td>
		              </tr>
	                </tbody></table></td>
	              </tr>
	              
                </tbody></table></td>
                </tr>
                
                <tr >
					<td colspan="4">
						<table width="100%" height="31" cellspacing="0" cellpadding="0" border="0" class="nowtable">
		                  <tbody><tr>
		                    <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;商品修改时间</td>
		                  </tr>
						  <tr>
			                <td  width="30%"  height="30" bgcolor="#f2f2f2" align="right" class="left_txt2">商品最后修改时间：</td>
			                <td bgcolor="#f2f2f2">&nbsp;</td>
			                <td height="30" bgcolor="#f2f2f2" id="lastmodified">${Product.lastupdateTime}</td>
			                <td height="30" bgcolor="#f2f2f2" class="left_txt">商品最后一次修改的时间</td>
			              </tr>
						  <tr>
			                <td width="30%"  height="30" bgcolor="#F7F8F9" align="right" class="left_txt2">商品最后上架时间：</td>
			                <td bgcolor="#F7F8F9">&nbsp;</td>
			                <td height="30" bgcolor="#F7F8F9" id="lastpublishtime">${Product.lastpublishTime}</td>
			                <td height="30" bgcolor="#F7F8F9" class="left_txt">商品最后一次上架的时间</td>
			              </tr>
			              <tr>
			                <td width="30%"  height="30" bgcolor="#F7F8F9" align="right" class="left_txt2">商品最后下架时间：</td>
			                <td bgcolor="#F7F8F9">&nbsp;</td>
			                <td height="30" bgcolor="#F7F8F9" id="lastunpublishtime">${Product.lastunpublishTime}</td>
			                <td height="30" bgcolor="#F7F8F9" class="left_txt">商品最后一次下架的时间</td>
			              </tr>
		                </tbody></table>
					</td>
				</tr>
				
				<tr class="">
					<td colspan="4">
						<table width="100%" height="31" cellspacing="0" cellpadding="0" border="0" class="nowtable">
		                  <tbody><tr>
		                    <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;上下架控制</td>
		                  </tr>
						  <tr>
			                <td width="30%" height="30" bgcolor="#f2f2f2" align="right" class="left_txt2">商品是否上架：</td>
			                <td bgcolor="#f2f2f2">&nbsp;</td>
			                <td height="30" bgcolor="#f2f2f2">
			                	<c:choose>
									<c:when test="${Product.published==1}">
										<input type="checkbox" id="isPublish" checked/>
									</c:when>
									<c:otherwise>
										<input type="checkbox" id="isPublish"/>
									</c:otherwise>
								</c:choose>
			                </td>
			                <td height="30" bgcolor="#f2f2f2" class="left_txt">决定商品是否上架，是否对用户显示</td>
			              </tr>
						  <tr>
			                <td height="30" bgcolor="#F7F8F9" align="right" class="left_txt2">商品是否可购买：</td>
			                <td bgcolor="#F7F8F9">&nbsp;</td>
			                <td height="30" bgcolor="#F7F8F9">
			                	<c:choose>
									<c:when test="${Product.buyable==1}">
										<input type="checkbox" id="isbuyable" checked/>
									</c:when>
									<c:otherwise>
										<input type="checkbox" id="isbuyable"/>
									</c:otherwise>
								</c:choose>
			                	
			                </td>
			                <td height="30" bgcolor="#F7F8F9" class="left_txt">该属性决定商品是否可以购买</td>
			              </tr>
		                </tbody></table>
					</td>
				</tr>
				
				
            </tbody></table></td>
          </tr>
        </tbody></table>
		
          <table width="98%" cellspacing="0" cellpadding="0" border="0" align="center">
            <tbody>
            
            <tr>
              <td height="30" colspan="3">&nbsp;</td>
            </tr>
            <tr class="">
            	<td align="center">
            		<input class="uploadproductButton" style="width: 90px; padding: 0px;" type="button"  value="保存" id="updateProductButton" onclick="updateProductButton()"/>
            		<!-- <input class="uploadproductButton" style="width: 90px; padding: 0px;"  type="button"  value="取消" id="" onclick="uploadProductButton()"/>  -->
            	</td>
            <!-- 
              <td width="50%" height="30" align="right"><input type="submit" name="B1" value="上传商品"></td>
              <td width="6%" height="30" align="right">&nbsp;</td>
              
              <td width="44%" height="30"><input type="reset" name="B12" value="返回"></td>
               -->
            </tr>
            <tr>
              <td height="30" colspan="3" align="center"><div id="loading"><img id="loadimage" src="images/056.gif" /></div></td>
            </tr>
            <tr class="hidden_before_select display_none">
				<td colspan="4" style="display: none;" id="errorMsgTd">
					<h1 class="nowtable left_bt2" >&nbsp;&nbsp;&nbsp;&nbsp;错误信息</h1>
					<div id="errorTableTitleTr" style="line-height:21px; color:#f00; text-indent:1em" >
					</div>
					<!-- <table width="100%"  cellspacing="0" cellpadding="0" border="0" class="nowtable" id="errorTable">
	                  <tbody><tr>
	                    <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;错误信息</td>
	                  </tr>
					  <tr>
		                <td id="errorTableTitleTr" style="line-height:21px; color:#f00; text-indent:1em"  bgcolor="#f2f2f2" align="left">1111</td>
		              </tr>
					   
	                </tbody></table> -->
				</td>
				</tr>
          </tbody></table></td>
      </tr>
    </tbody></table>		
	</td>
    <td background="images/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td valign="bottom" background="images/mail_leftbg.gif"><img src="images/buttom_left2.gif" width="17" height="17" /></td>
    <td background="images/buttom_bgs.gif"><img src="images/buttom_bgs.gif" width="17" height="17" /></td>
    <td valign="bottom" background="images/mail_rightbg.gif"><img src="images/buttom_right2.gif" width="16" height="17" /></td>
  </tr>
</table>

</body>
</html>