<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="${ctx}/resources/css/photoswipe.css">
<link rel="stylesheet" href="${ctx}/resources/css/default-skin.css">
<link rel="stylesheet"
	href="/counter/resources/jquery.multiDialog/css/jquery-ui-1.10.3.custom.css">
<script
	src="/counter/resources/jquery.multiDialog/js/jquery/jquery-ui-1.10.3.custom.js"></script>
<script src="${ctx}/resources/js/photoswipe.min.js"></script>
<script src="${ctx}/resources/js/photoswipe-ui-default.min.js"></script>
<script src="${ctx}/resources/js/photoswipefromdom.js"></script>
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
<script type="text/javascript">
$(function(){
	
	var customId = $("#customId").val();
	
	if("${customDetail.icertificate }" != 0){
		
	}
	
	$(".dzd_close").click(function(){
		//跳转到款式单页面 
		if(customId != ""){
			url = "/counter/custom/edit.do?id="+customId;
			window.location = url;
		}
	});
	//下载CAD文件
	$(".dlcad").click(function(){
		var vcadFile = $("#vcadFile").val();
		var url = "${ctx}/file/download.do";
		$.ajax({
			url : url,
			type : 'POST',
			data :{
				'filePath' : "custom",
				'fileName': vengraveVh
			},
			datatype:'json',
			success : function(data) {		
				alert("下载成功");
			},
			error : function(data) {		
				alert("下载失败");
			}
		})	
	});
	//下载矢量图文件
	$(".dlvh").click(function(){
		var vengraveVh = $("#vengraveVh").val();
		var url = "${ctx}/file/download.do";
		 $.ajax({
			 	url : url,
				type : 'POST',
				data :{
					'filePath' : "custom",
					'fileName': vengraveVh
				},
				datatype:'json',
				success : function(data) {		
					alert("下载成功");
				},
				error : function(data) {		
					alert("下载失败");
				}
		 })	
	});
	
	//图片展示
	 //参考图片显示
	 $(".customCankaoShow").bind("click",function(){
		//款式单ID
	 	if(customId == "" || customId == undefined){
	 		alert("请保存后查看!");
	 	}else{
	 		openURL("/counter/upload/showpic.do?cpath=com.bavlo.counter.model.custom.CustomBVO&fkey=customId&ptype=vtype&vtype=customCankao&id="+customId,"图片展示");
	 	}
	 });
	 //设计图片显示
	 $(".customShejiShow").bind("click",function(){
		//款式单ID
	 	if(customId == "" || customId == undefined){
	 		alert("请保存后查看!");
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
				"<span>库选石： </span><img class='stockGem_img' src='"+data.vstockGemImgPath+"' style='border:50px'/><span>"+data.vstockGemName+"</span>"+
				""+"  "+data.istockGemNum+"颗"+
				"</div>" +
				"</dd>";
			
		$(".StockGem").append(html);

	}
	
});
</script>
</head>

<body>
	<form id="custom">
		<input type="hidden" id='toUser' value='${openid}' />
		<input type="hidden" id='customId' value='${customDetail.id}' />
		<input type="hidden" id='vengraveVh' name='vengraveVh' value="${customDetail['vengraveVh'] }" />
		<input type="hidden" id='vcadFile' name='vcadFile' value="${customDetail['vcadFile'] }" />
	<input type="hidden" id="pageAttr" value="STYLE"/>
		<div class="header">
			<div class="head1">
				<div class="top">
					<b><a href="#" onclick="EditShow_Hidden(ed1)"><img
							src="${ctx}/resources/images/plus.png" /> </a>
						款式单${customDetail.vcustomCode }</b> <font><a
						href="javascript:;" onclick="Show_Hidden(tr1)"><img
							src="${ctx}/resources/images/plus.png" /> </a> </font>
				</div>
				<div class="hidden_enent2" id="tr1" style="display: none;">
					<ul>
						<li class="jian"><a href="#" onclick="Show_Hidden(tr1)">一</a>
						</li>
						<jsp:include page="../menu_pg.jsp"></jsp:include>
					</ul>
				</div>
				<div class="edit_hidden1" id="ed1" style="display: none;">
					<ul>
						<li class="jian2"><a href="#" onclick="EditShow_Hidden(ed1)">一</a>
						</li>
						<jsp:include page="../menu_cau.jsp"></jsp:include>
						</li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="all">
			<div class="main">
				<div class="mainleft">
					<div class="cankao">
					<h2><a href="javascript:;" style="color:#fff" class="cankaotu">+ 参考图</a></h2>
					<div class="pro">
						<b><a href="javascript:;" onclick="PicShow_Hidden(pic)">显示</a></b>
						<div class="demo" id='pic'>
							<b><a href="javascript:;" onclick="PicShow_Hidden(pic)">隐藏</a></b>
							<!--<b class="hide">隐藏</b>-->
							<div class="my-gallery">
								<volist name="list" id="list"> <figure> 
								<a class="customCankaoShow" href="javascript:void();">
									<c:choose>
										<c:when test="${empty customDetail['FILE_0']}">   
											<img src="${ctx}/resources/images/zb_03.png">
										</c:when>
										<c:otherwise>
											<img src="${ctx}/staticRes/${customDetail['FILE_0']}">
										</c:otherwise>
									</c:choose> 
								</a>
								</figcaption> </figure> </volist>

							</div>
						</div>
					</div>
				</div>
				<div class="sheji">
					<h2><a href="javascript:;" style="color:#fff" class="qibantu">+ 起版设计图</a></h2>
					<div class="pro">
						<!--<img src="images/zb_06.png" />-->
						<b><a href="javascript:;" onclick="Pic1Show_Hidden(pic1)">显示</a></b>
						<div class="demo" id='pic1' >
							<b><a href="javascript:;" onclick="Pic1Show_Hidden(pic1)">隐藏</a></b>
							<!--<b class="hide">隐藏</b>-->
							<div class="my-gallery">
								<volist name="list" id="list"> <figure>
								<a class="customShejiShow" href="javascript:void();">
									<c:choose>
										<c:when test="${empty customDetail['FILE_1']}">   
											<img src="${ctx}/resources/images/zb_03.png">
										</c:when>
										<c:otherwise>
											<img src="${ctx}/staticRes/${customDetail['FILE_1']}">
										</c:otherwise>
									</c:choose> 
								</a>
								</figcaption> </figure> </volist>

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
							<dd>
								订单号 <a class="orderCode" href="#" style="color: #ccc">${orderVO.vorderCode }</a>
							</dd>
							<dd>
								报价： <b>${customDetail.nprice }元</b>
							</dd>
							<dd>类型：${customDetail.srcstyleType }</dd>
							<dd>手寸：${customDetail.srcringSize }</dd>
							<dd>金属：${customDetail.srcmetal }</dd>
							<dd class="StockGem"></dd>
							<dd>
								<div class="kzs"></div>
							</dd>
							<dd>刻字：${customDetail.vengrave }</dd>
							<dd>表面工艺：${customDetail.vrequirementB }</dd>
							<dd>鉴定证书：${customDetail.icertificate }</dd>
							<dd>定制说明：${customDetail.vrequirement }</dd>
						</dl>
					</div>
				</div>
				<div class="mainrig">
          <div class="dzd_right">
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
	            <div class="clear"></div>
	            <div class="dzd_right_btm d1 CUST-RL CUST-RL">
	              <span class="gf" ><a class="dlcad" href="#">下载CAD</a> </span>
	              <b><a class="dlvh" href="#">下载矢量图</a></b>
	              <div class="clear"></div>
	            </div>
	            <div class="dzd_right_btm CUST-RL PPS-RL">
	              <input type='text' class="gf" value=''>
	              <b><a href="">通知QC</a></b>
	              <div class="clear"></div>
							<input type="button" value="进入编辑页" class="dzd_close" />
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</form>
</body>
</html>