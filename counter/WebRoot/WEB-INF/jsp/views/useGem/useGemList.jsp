<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>配石单列表</title>
	<script type="text/javascript" src="${ctx}/resources/js/jquery.min.js"></script>
	<script src="${ctx}/resources/js/top.js"></script>
	<link href="${ctx}/resources/css/style.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/resources/css/bootstrap-list.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/resources/css/orderlist.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/resources/js/showList.js" type="text/javascript"></script>
	<!-- 自定义 -->
	<script src="${ctx}/resources/js/bavlo-event.js"></script>
	<!-- Loading -->
	<script src="${ctx}/resources/showLoading/showLoading.js"></script>
	<link type="text/css" rel="stylesheet" href="${ctx}/resources/showLoading/showLoading.css">
<script type="text/javascript">
	$(function() {
		$(".search").keyup(function() {
			delay(function() {
				initData();
			}, 500);
		});

		var delay = (function() {
			var timer = 0;
			return function(callback, ms) {
				clearTimeout(timer);
				timer = setTimeout(callback, ms);
			};
		})();
		initData();

	});

	function initData() {
		startMask();
		$("#juheweb").empty();
		var url = "${ctx}/useGem/listJson.do";
		$.post(url,{content : $(".search").val()},function(row) {
			if(row.length > 0){
				var data = row;
				for(var i = 0; i < data.length; i++){
					var pic = "";
					if(data[i].vstock_gem_img_path != "" && data[i].vstock_gem_img_path != null){
						pic = "src='"+data[i].vstock_gem_img_path+"'";
					}else{
						pic = "src='${ctx}/resources/images/useGem_01.png'";
					}
					$("#juheweb").append("<li><h4><img style='width:60px;height:60px;' "+pic+"><b>"+data[i].vnumber+"</b><a href='#'>"+data[i].vspec+"X"+data[i].vspec2+"X"+data[i].vspec3+"</a><span><a href='#' onclick='selHander("+data[i].id+")'>选择</a></span></h4><div class='clear'></div></li>");
				}
				endMask();
			}else{
				$("#juheweb").append("<span style='color:#FFF;'>无配石单信息!</span>");
				endMask();
			}
		});
	}
	//调用父窗体方法
	function selHander(id) {
		if (isExitsFunction(window.parent.setValueByFrame)) {
			window.parent.setValueByFrame("useGem", id,callbackMuilt());
		} else {
			alert("请在父窗口添加setValueByFrame(type,id){处理逻辑}type='useGem'");
		}
	}
</script>
<style type="text/css">
	@media screen and (max-width: 1280px) and (min-width: 320px){
		.operate ul li h4{background:none!important}
	}
	.orderlist{left:0;width:450px;text-align: center;}
	.order-main{width:450px;}
	.operate ul li{width:auto;}
	.main1 .left-sider{width:465px;}
	.list-item dt{font-size:14px;}
	
	.operate ul li h4 span{float:none;margin-right:0px;text-align: left;}
	
	</style>
</head>

<body>
	<!--配石单列表弹窗-->
<div id="orderlist">
  <div class="orderlist">
    <div class="order-main">
		<div class="search-1">
			<form action='' method='post'>
				<input type='text' name='search' class="search" placeholder="配石单/定制单编号">
			</form>
		</div>
		<div class="">
			<div class="main1 content">
				<div class="left-sider">
				  <div class="operate">
					<ul id="juheweb">
					<!--<c:forEach items="${gemList}" var="bean">
					  <li >
						<h4 ><img style="width:60px;height:60px;" src="${ctx}/staticRes/${bean.vdef2}/min/${bean.vdef3}"><b>${bean.vnumber}</b><span><a href="${ctx}/gem-sign/view.do?id=${bean.id}">选择</a></span></h4>
						<div class="clear"></div>
					  </li>
					  </c:forEach>
					-->
					</ul>
					<script type="text/javascript" language="javascript">
						navList(12);
					</script>
				  </div>
				</div>
			  </div>
		</div>
    </div>
  </div>
</div>
</body>
</html>
	