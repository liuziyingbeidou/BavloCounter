<%@ page language="java" import="java.util.*,com.bavlo.weixin.qiye.util.Constants" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="viewport"
	content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<title>款式单</title>
<script language="javascript" type="text/javascript"
	src="${ctx}/resources/js/jquery-1.8.3.min.js"></script>
<link type='text/css' rel='stylesheet'
	href='${ctx}/resources/css/style.css' media='all' />
<link type='text/css' rel='stylesheet'
	href='${ctx}/resources/css/bootstrap.css' media='all' />
<script src="${ctx}/resources/js/top.js"></script>
<script src="${ctx}/resources/js/hide.js"></script>
<!--必要样式-->
<!--<link rel="stylesheet" href="${ctx}/resources/css/photoswipe.css">-->
<link rel="stylesheet" href="${ctx}/resources/css/default-skin.css">
<link rel="stylesheet"
	href="/counter/resources/jquery.multiDialog/css/jquery-ui-1.10.3.custom.css">
<script
	src="/counter/resources/jquery.multiDialog/js/jquery/jquery-ui-1.10.3.custom.js"></script>
<!--	
<script src="${ctx}/resources/js/photoswipe.min.js"></script>
<script src="${ctx}/resources/js/photoswipe-ui-default.min.js"></script>
<script src="${ctx}/resources/js/photoswipefromdom.js"></script>
-->
<script src="/counter/resources/js/bavlo-dialog.js"></script>
<script src="${ctx}/resources/js/bavlo-initdata.js"></script>
<script src="${ctx}/resources/js/bavlo-event.js"></script>

<!-- 定义JS -->
<script src="${ctx}/resources/js/bavlo-initdata.js"></script>
<script src="${ctx}/resources/js/bavlo-event.js"></script>

<!-- 弹框 -->
<!-- jQuery & jQuery UI files (needed)--> 
<link rel="stylesheet" href="/counter/resources/jquery.multiDialog/css/jquery-ui-1.10.3.custom.css">
<script src="/counter/resources/jquery.multiDialog/js/jquery/jquery-ui-1.10.3.custom.js"></script> 
<!-- MultiDialog files (needed) --> 
<link rel="stylesheet" href="/counter/resources/jquery.multiDialog/css/jquery.multiDialog.css"> 
<script src="/counter/resources/jquery.multiDialog/js/jquery.ui.dialog.extended-1.0.2.js"></script> 
<script src="/counter/resources/jquery.multiDialog/js/jquery.multiDialog.js"></script> 
<script src="/counter/resources/js/bavlo-dialog.js"></script>
  
<link href="/counter/resources/Downloadr/facebox/facebox.css" media="screen" rel="stylesheet" type="text/css"/>	
<script src="/counter/resources/Downloadr/facebox/facebox.js" type="text/javascript"></script>
<link href="/counter/resources/Downloadr/downloadr/downloadr.css" media="screen" rel="stylesheet" type="text/css"/>
<script src="/counter/resources/Downloadr/downloadr/jqbrowser.js" type="text/javascript"></script>
<script src="/counter/resources/Downloadr/downloadr/downloadr.js" type="text/javascript"></script>

<script type="text/javascript">
$(function(){
	//发送客户显示
	$(".menu-send-cust").show();
	
	var customId = $("#customId").val();
	var orderId = $("#orderId").val();
	
	//没有数据就不展示
	if(orderId == ''){
		$(".orderClass").hide();
	}
	var certificate = "${customDetail.icertificate }";
	if(certificate == 0){
		$(".certificate-has").hide();
	}else if(certificate == 25){
		$(".certificate-not").hide();
	}else if(certificate == ''){
		$(".certificate-has").hide();
		$(".certificate-not").hide();
	}
	var ringSize = "${customDetail.srcringSize }";
	if(ringSize == -1 || ringSize == ''){
		$(".ringSize").hide();
	}
	var styleType = "${customDetail.srcstyleType }";
	if(styleType == -1 || styleType == ''){
		$(".styleType").hide();
	}
	var metalType = "${customDetail.srcmetal }";
	if(metalType == -1 || metalType == ''){
		$(".metalType").hide();
	}
	
	//页面跳转 
	$(".dzd_close").click(function(){
		//跳转到款式单页面 
		if(customId != ""){
			url = "/counter/custom/edit.do?id="+customId;
			window.location = url;
		}
	});
	$("#orderCode").click(function(){
		//跳转到订单页面 
		if(orderId != ""){
			url = "/counter/order/view.do?id="+orderId;
			window.location = url;
		}
	});
	
	//上传起版图片 
	$(".qibantu").bind("click",function(){
	 	$("#filetype").val("pic");
 		openURL("/counter/upload/uppage.do","上传起版图"); 
	 	$("#vtype").val("customSheji");
	 });
	//上传矢量图
	$(".upvh").bind("click",function(){
	 	$("#filetype").val("file");
		openURL("/counter/upload/uppage.do","上传刻字矢量图"); 
		$("#filevalue").val("vengraveVh");
	});
	//上传CAD
	$(".upcad").bind("click",function(){
		$("#filetype").val("file");
 		openURL("/counter/upload/uppage.do","上传CAD文件"); 
 		$("#filevalue").val("vcadFile");
	});
	
	//下载CAD文件回写订单状态
	$(".dlcad").click(function(){
		$.ajax({
			url : "../order/updateState.do",
			type : 'POST',
			data :{
				'orderId' : orderId,
				'ista': "2"
			},
			success : function(data) {		
			},
			error : function(data) {		
			}
		});
	});

	//发送给生产主管 
	$(".sendPMC").click(function(){
		//var text_company = '${shop}';
		//var text_url = getRootPath()+"/custom/detail.do?id="+customId;
		//var url = "${ctx}/sendMassage.do";
		toRoleObj($("#pageAttr").val(),'<%=Constants.PMC_USERID%>',"",$(".tableId").val(),$(".tocustomerId").val());
		
	});
	
	//图片展示
	 //参考图片显示
	 $(".customCankaoShow").bind("click",function(){
		//款式单ID
	 	if("${customDetail['FILE_0']}" == ""){
	 		alert("没有图片!");
	 	}else{
	 		openURL("/counter/upload/showpic.do?cpath=com.bavlo.counter.model.custom.CustomBVO&fkey=customId&ptype=vtype&vtype=customCankao&id="+customId,"图片展示");
	 	}
	 });
	 //设计图片显示
	 $(".customShejiShow").bind("click",function(){
		//款式单ID
	 	if("${customDetail['FILE_1']}" == ""){
	 		alert("没有图片!");
	 	}else{
	 		openURL("/counter/upload/showpic.do?cpath=com.bavlo.counter.model.custom.CustomBVO&fkey=customId&ptype=vtype&vtype=customSheji&id="+customId,"图片展示");
	 	}
	 });
	 
	 var chainJson = '${chainJson}';
	//链子
	if(chainJson != ""){
		add("chain",chainJson);
	}
	 var stockGemJson = '${stockGemJson}';
	//库选石
	if(stockGemJson != ""){
		add("stockGem",stockGemJson)
	}
	$('a[rel*=downloadr]').downloadr();
	
});

//转发页面
function toRoleObj(pageAttr,userid,memo,id,customerId){
	var url = "${ctx}/sendMassage.do";
	$.post(url,{pageAttr:pageAttr,touser:userid,memo:memo,rootPath:getRootPath(),id:id,customerId:customerId},function(data){
		if(data == 0){
			alert("转发成功!");
		}else{
			alert("转发失败!");
		}
	});
}
//增加
function add(type,value){
	var data = JSON.parse(value);
	$.each(data, function (n, v) {
		if(type == "chain"){
			addChain(v);
		} else if(type == "stockGem"){
			addStockGem(v);
		}
	});
}
//增加链子
function addChain(data){
	var i=1;
	for(var c=1;c<100;c++){
		if($(".chain"+c).length==0){
			i=c;
			break;
		}
	}
	var html="";
	
	html+= "<dd class='chainList chain"+i+"'>"+
		   "<div class='cdetail'>"+
		   "<div class='clear'></div>"+
		   "<strong class='chain_name'>"+data.vchainName+"</strong>" +
		   "<b>"+data.ichainItem+"条</b>"+
		   "</div>" +
		   "</dd>";
	
	$(".chain").append(html);
}
//增加库选石
function addStockGem(data){
	var i=1;
	 for(var g=1;g<100;g++){
		 if($(".stockGem"+g).length==0){
			 i=g;
			 break;
		 }
	 }
	 var html="";
		
	 html+= "<dd class='stockGemList stockGem"+i+"'>"+
			"<div class='sgdetail'>"+
			"<span>库选石： </span>"+
			"<img class='stockGem_img' src='"+data.vstockGemImgPath+"' style='border:50px'/><span>"+data.vstockGemName+"</span>"+
			""+"  "+data.istockGemNum+"颗"+
			"<input type='button' value='配' onclick='useGem("+data.id+")' class='ugem CUST-RL CC-RL PM-RL CAD-RL PMC-RL PPS-RL' />"+
			"</div>" +
			"</dd>";
		
	$(".StockGem").append(html);

}
function useGem(stockGemId){
	//跳转到配石单页面 
	if(stockGemId != "" && stockGemId != undefined){
		url = "/counter/useGem/info.do?did="+stockGemId; 
		window.location = url;
	}
}

//子窗体调用
function setValueByFrame(type,id,callback,json){
	var url;
	if(type == "customer"){
		url = "${ctx}/customer/infoJson.do";
		$.get(url,{id:id},function(data){
			if(data != null){
				if(data.vhendimgurl != ""){
					$(".cusheader").prop("src",data.vhendimgurl);
				}
				$("#customerId").val(data.id);
				//选客户后初始化交付地址
				$("#addressId").val("");
				$("#tbl").empty();
				initAddr();
			}
			if($("#customerId").val()){
				$(".header-loc").show();
			}else{
				$(".header-loc").hide();
			}
			closeMultiDlg();
		});
	}/*else if(type == "chain"){
		var data = JSON.parse(json);
		$("#order-list").append("<dd type='ch' sid='"+data.sid+"' class='"+data.sid+" bill'><span class='list_name bill-name'>"+data.sname+"</span><input class='list_num bill-num' style='width:40px;margin-left:10px;' type='text' value='1' placeholder='条'><b class='list_price bill-price'>"+data.sprice+"</b><a href='javascript:rlist("+data.sid+")' class='close_c'><img src='${ctx}/resources/images/close.png'></a></dd>");
		closeMultiDlg();
	}*/else if(type == "order"){
		url = "${ctx}/order/edit.do?id="+id;//根据id查询订单信息
		window.location = url;
	}else if(type == "order-view"){
		url = "${ctx}/order/view.do?id="+id;//根据id查询订单信息
		window.location = url;
	}else if(type == "signGem"){
		url = "${ctx}/gem-sign/view.do?id="+id;//根据id查询宝石签收单信息
		window.location = url;
	}else if(type == "entity"){
		url = "${ctx}/entity-sign/view.do?id="+id;//根据id查询实物签收单信息
		window.location = url;
	}else if(type == "customer-menu"){
		url = "${ctx}/customer/info.do?id="+id;//根据id查询客户信息
		window.location = url;
	}else if(type == "custom"){
		url = "${ctx}/custom/edit.do?id="+id;//根据id定制单信息
		window.location = url;
	}else if(type == "custom-view"){
		url = "${ctx}/custom/detail.do?id="+id;//根据id显示定制单信息
		window.location = url;
	}else if(type == "useGem"){
		url = "${ctx}/useGem/info.do?id="+id;//根据id显示配石单信息
		window.location = url;
	}

}

//保存 
function CADsave(){
	var id = $('#customId').val();
	var bvo = JSON.stringify($('#customBId').serializeJson());
	var vh = $('#vengraveVh').val();
	var cad = $('#vcadFile').val();
	$.ajax({
		type : "POST",
		url : "update.do",
		data : "id="+id+"&bvo="+bvo+"&vh="+vh+"&cad="+cad,
		async : false,
		cache : false,
		success : function(data) {
			alert("保存成功!");
		},
		error : function(e) {
			alert("保存失败!");
		}
	});
}
</script>
<style type="text/css">
.edit_hidden2 { width:110px; position:relative; top:10px; left:-15px; z-index:9999}
.hidden_enent2 { width:110px; position:relative; top:10px; right:-243px; z-index:9999}
@media screen and (max-width: 1280px) and (min-width: 320px){
.qsd_left ul li {
	height:auto;
}
.edit_hidden2 { width:110px; position:relative; top:10px; left:-15px; z-index:9999}
.hidden_enent2 { width:120px; position:relative; top:10px; right:-243px; z-index:9999}
}
</style>
</head>

<body>
	<form id="custom">
		<input type="hidden" id='toUser' value='${openid}' /> 
		<input type="hidden" class="tableId" id='customId' value='${customDetail.id}' /> 
		<input type="hidden" id='orderId' value="${customDetail['orderId'] }" /> 
		<input type="hidden" id='vengraveVh' value="${customDetail['vengraveVh'] }" /> 
		<input type="hidden" id='vcadFile' value="${customDetail['vcadFile'] }" />
		<input type="hidden" id="pageAttr" value="STYLE" /> 
		<input type="hidden" class="tocustomerId" value="${customDetail['customerId'] }" />
		<input type="hidden" id='vengraveVh' name='vengraveVh' value="${customEdit['vengraveVh'] }" />
		<input type="hidden" id='vcadFile' name='vcadFile' value="${customEdit['vcadFile'] }" />
		<header class="demo-bar">
			<h1>
				款式单${customDetail.vcustomCode }
			</h1>
		</header>
		<jsp:include page="../header.jsp"></jsp:include>

		<div class="all">
			<div class="main">
				<div class="mainleft">
					<div class="cankao">
						<h2>
							<a href="javascript:;" style="color: #fff" class="cankaotu">+
								参考图</a>
						</h2>
						<div class="pro">
							<b><a href="javascript:;" onclick="PicShow_Hidden(pic)">显示</a></b>
							<div class="demo" id='pic'>
								<b><a href="javascript:;" onclick="PicShow_Hidden(pic)">隐藏</a></b>
								<!--<b class="hide">隐藏</b>-->
								<div class="my-gallery">
									<volist name="list" id="list"> <figure> <a
										class="customCankaoShow" href="javascript:void();"> <c:choose>
											<c:when test="${empty customDetail['FILE_0']}">
												<img src="${ctx}/resources/images/zb_03.png">
											</c:when>
											<c:otherwise>
												<img src="${ctx}/staticRes/${customDetail['FILE_0']}">
											</c:otherwise>
										</c:choose>
									</a> </figcaption> </figure> </volist>

								</div>
							</div>
						</div>
					</div>
					<div class="sheji">
						<h2>
							<a href="javascript:;" style="color: #fff" class="qibantu  CUST-RL CC-RL PM-RL PMC-RL GB-RL PPS-RL">+
								起版设计图</a>
							<a href="javascript:;" style="color: #fff">+
								起版设计图</a>
						</h2>
						<div class="pro">
							<!--<img src="images/zb_06.png" />-->
							<b><a href="javascript:;" onclick="Pic1Show_Hidden(pic1)">显示</a></b>
							<div class="demo" id='pic1'>
								<b><a href="javascript:;" onclick="Pic1Show_Hidden(pic1)">隐藏</a></b>
								<!--<b class="hide">隐藏</b>-->
								<div class="my-gallery">
									<volist name="list" id="list"> <figure> <a
										class="customShejiShow" href="javascript:void();"> <c:choose>
											<c:when test="${empty customDetail['FILE_1']}">
												<img src="${ctx}/resources/images/zb_03.png">
											</c:when>
											<c:otherwise>
												<img src="${ctx}/staticRes/${customDetail['FILE_1']}">
											</c:otherwise>
										</c:choose>
									</a> </figcaption> </figure> </volist>

								</div>

								<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
									<div class="pswp__bg"></div>
									<div class="pswp__scroll-wrap">
										<div class="pswp__container">
											<div class="pswp__item"></div>
											<div class="pswp__item"></div>
											<div class="pswp__item"></div>
										</div>
										<div class="pswp__ui pswp__ui--hidden">
											<div class="pswp__top-bar">
												<div class="pswp__counter"></div>
												<button class="pswp__button pswp__button--close"
													title="Close (Esc)"></button>
												<div class="pswp__preloader">
													<div class="pswp__preloader__icn">
														<div class="pswp__preloader__cut">
															<div class="pswp__preloader__donut"></div>
														</div>
													</div>
												</div>
											</div>
											<div
												class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
												<div class="pswp__share-tooltip"></div>
											</div>
											<button class="pswp__button pswp__button--arrow--left"
												title="Previous (arrow left)"></button>
											<button class="pswp__button pswp__button--arrow--right"
												title="Next (arrow right)"></button>
											<div class="pswp__caption">
												<div class="pswp__caption__center"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="mainmid">
					<div class="dzd">
						<dl>
							<dd class='orderClass'>
								订单号 : ${orderVO.vorderCode } 
							</dd>
							<dd>
								<input type="button" value="查看订单"
									id="orderCode"
									class="lookOrder CUST-RL CC-RL PMC-RL PPS-RL" />
							</dd>
							<dd>
								报价： <b>${orderVO.nquotedPrice } 元</b>
							</dd>
							<dd class="styleType">类型：${customDetail.srcstyleType }</dd>
							<dd class="ringSize">手寸：${customDetail.srcringSize }</dd>
							<dd class="metalType">金属：${customDetail.srcmetal }</dd>
							<dd class="StockGem"></dd>
							<dd>
								<div class="kzs"></div>
							</dd>
							<dd>刻字：${customDetail.vengrave }</dd>
							<dd>工艺标签：${customDetail.vcraftTag }</dd>
							<dd>表面工艺：${customDetail.vrequirementB }</dd>
							<dd class="certificate-has">鉴定证书：有</dd>
							<dd class="certificate-not">鉴定证书：无</dd>
							<dd>定制说明：${customDetail.vrequirement }</dd>
						</dl>
					</div>
				</div>
				<div class="mainrig">
					<div class="dzd_right">
						<div>
						<dl class="chain">
							<dd>
								<h3>链子</h3>
							</dd>
						</dl>

						<dl class="mianGem">
							<dd>
								<h3>客主石</h3>
								保价： <b>${customDetail.nmainGemCost }元</b>
							</dd>
						</dl>
						<dl class="partGem">
							<dd>
								<h3>客配石</h3>
								数量： <b>${customDetail.ipartsGemNum }颗</b>
							</dd>
						</dl>
						</div>
						<div class="clear"></div>
						<div
							class="dzd_right_btm d1 CUST-RL CC-RL PM-RL CAD-RL PMC-RL GB-RL">
							<span class="gf"><a class="dlcad"
								href="${ctx}/staticRes/custom/${customDetail['vcadFile'] }"
								rel="downloadr" title="下载CAD文件">下载CAD</a> </span> <b><a
								class="dlvh"
								href="${ctx}/staticRes/custom/${customDetail['vengraveVh'] }"
								rel="downloadr" title="下载矢量图">下载矢量图</a></b>
							<div class="clear"></div>
						</div>
						<div
							class="dzd_right_btm d1 CUST-RL CC-RL PM-RL PMC-RL GB-RL PPS-RL">
							<span class="gf"><a class="upcad" href="#">上传CAD</a>
							</span> <b><a class="upvh" href="#">上传矢量图</a></b>
							<div class="clear"></div>
						</div>
						<div
							class="dzd_right_btm CUST-RL CC-RL PM-RL CAD-RL PMC-RL GB-RL">
							<input type='text' class="gf" value=''> <b><a
								href="#" class="sendPMC">通知PMC</a></b>
							<div class="clear"></div>
						</div>
						<div
							class="dzd_right_btm CUST-RL CAD-RL PMC-RL GB-RL PPS-RL">
							<input type="button" value="进入编辑页" class="dzd_close" />
							<div class="clear"></div>
						</div>
						
						<div
							class="dzd_left_btm CUST-RL CC-RL PM-RL PMC-RL GB-RL PPS-RL">
							<input type="button" onclick="javascript:CADsave()" value="保存" class="dzd_save" />
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</form>
	<form id="customBId">
	<input type="hidden" name="filemodel" id="filemodel" value="custom">
	<input type="hidden" name="filetype" id="filetype" value="pic">
	<input type="hidden" name="FILE_0" id="FILE_0"></input>
	<input type="hidden" name="FILE_1" id="FILE_1"></input>
	<input type="hidden" name="FILE_2" id="FILE_2"></input>
	<input type="hidden" name="FILE_3" id="FILE_3"></input>
	<input type="hidden" name="FILE_4" id="FILE_4"></input>
	<input type="hidden" name="FILE_5" id="FILE_5"></input>
	<input type="hidden" name="FILE_6" id="FILE_6"></input>
	<input type="hidden" name="FILE_7" id="FILE_7"></input>
	<input type="hidden" name="FILE_8" id="FILE_8"></input>
	<input type="hidden" name="filevalue" id="filevalue" value=""></input>
	<input type="hidden" name="vtype" id="vtype" value=""></input>
	</form>
</body>
</html>