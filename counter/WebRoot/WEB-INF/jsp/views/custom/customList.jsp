<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>定制单列表</title>
<script language="javascript" type="text/javascript"
	src="${ctx}/resources/js/jquery-1.8.3.min.js"></script>
<script src="${ctx}/resources/js/top.js"></script>
<link href="${ctx}/resources/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="${ctx}/resources/css/bootstrap-list.css" rel="stylesheet"
	type="text/css" />
<link href="${ctx}/resources/css/orderlist.css" rel="stylesheet"
	type="text/css" />
<script src="${ctx}/resources/js/showList.js" type="text/javascript"></script>

	<!-- 自定义 -->
	<script src="${ctx}/resources/js/bavlo-event.js"></script>
	
	<script type="text/javascript">
	$(function(){
		$(".search").keyup(function(){
			 delay(function(){
				 initData();
			 }, 500 );
		});
		
		var delay = (function(){
			 var timer = 0;
			 return function(callback, ms){
				 clearTimeout (timer);
				 timer = setTimeout(callback, ms);
			 };
		})();
		initData();
		
	});
	
	function initData(){
		$("#juheweb").empty();
		var url = "${ctx}/custom/listJson.do";
		$.post(url,{content:$(".search").val()},function(row){
			var data = row;
			for(var i = 0; i < data.length; i++){
				var ht = "<li><h4><img style='width:60px;height:60px;' ";
				var img = "src='${ctx}/resources/images/customer_01.png'";
				if(data[i].vdef1 != ""){
					img = "src='"+data[i].vdef1+"'";
				}
				var ml = "><b>"+data[i].vdef2+"</b><a href='#'>"+data[i].vcustomCode+"</a><span><a href='#' onclick='selHander("+data[i].id+")'>选择</a></span></h4><div class='clear'></div></li>";
				$("#juheweb").append(ht+img+ml);
			}
		});
	}
	//调用父窗体方法
	function selHander(id){
		if(isExitsFunction(window.parent.setValueByFrame)){
			if("${listType}" == "view"){
				//查看
				window.parent.setValueByFrame("custom-view",id,callbackMuilt());
				window.parent.closeMultiDlg();
			}else{
				//编辑
				window.parent.setValueByFrame("custom",id,callbackMuilt());
				window.parent.closeMultiDlg();
			}
		}else{
			alert("请在父窗口添加setValueByFrame(type,id){处理逻辑}type='custom'");
		}
	}
	</script>
	<style type="text/css">
	@media screen and (max-width: 1280px) and (min-width: 320px){
		.operate ul li h4{background:none!important}
	}
	.orderlist{left:0;width:470px;text-align: center;}
	.order-main{width:480px;}
	.operate ul li{width:auto;}
	.main1 .left-sider{width:485px;}
	.list-item dt{font-size:14px;}
	
	.operate ul li h4 span{float:none;margin-right:0px;}
	</style>
</head>

<body>
	<!--定制单列表弹窗-->
	<div class="orderlist" id='pic2'>
		<div class="order-main">
			<div class="search-1">
				<input type='text' name='search' class="search" placeholder="定制单编号/客户名称/手机号" />
			</div>
			<div class="">
				<div class="main1 content">
					<div class="left-sider">
						<div class="operate">
							<ul id="juheweb">
								<%-- <c:forEach var="customList" items="${customList }">
									<li>
										<h4>
											<img src="${ctx}/resources/images/customer_01.png" /> <b>${customList.vname }</b><a
												href="">${customList.vphoneCode
														}</a><span><a
												href="${ctx}/customer/info.do?id=${customList.id}">选择</a>
											</span>
										</h4>
										<div class="list-item none">
											<dl>
												<dd>
													<img src="${ctx}/resources/images/good_01.png" />
												</dd>
												<dd>
													<img src="${ctx}/resources/images/good_02.png" />
												</dd>
												<dd>
													<img src="${ctx}/resources/images/good_03.png" />
												</dd>
											</dl>
											<div class="clear"></div>
											<dt>
												报价： <b>36700元</b> 已付： <b>10000元</b> 未付： <b>26700元</b> 实收：—
											</dt>
										</div>
										<div class="clear"></div>
									</li>
								</c:forEach> --%>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--定制单列表弹窗END-->
</body>
</html>