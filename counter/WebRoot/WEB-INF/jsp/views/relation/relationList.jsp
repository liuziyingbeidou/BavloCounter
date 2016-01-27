<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>我的列表</title>
	<script type="text/javascript" src="${ctx}/resources/js/jquery.min.js"></script>
	<link href="${ctx}/resources/css/orderlist-r.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	$(function() {
		/* $(".search").keyup(function() {
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
		})(); */
		initData();

	});

	function initData() {
		$("#juheweb").empty();
		var relationJson = '${relationJson}';
		if(relationJson != ""){
			var data = JSON.parse(relationJson);
			$("#juheweb").append("<li><h4><span class='first'>FROM</span><span class='second'>类型</span><span class='three'>编号</span></h4></li>");
			for(var i = 0; i < data.length; i++){
				$("#juheweb").append("<a href='"+data[i].vurl+"' ><li><h4><span class='first'>"+data[i].vfromUser+"</span><span class='second'>"+data[i].vpageType+"</span><span class='three'>"+data[i].vpageCode+"</span></h4></li></a>");
			}
			/* $.each(data, function() {
				$("#juheweb").append("<li><h4><b>"+data.vpage_type+"</b><a href='#'>"+data.vpage_code+"</a><span><a href='"+data.vurl+"' >选择</a></span></h4><div class='clear'></div></li>");
			}); */
		}else{
			$("#juheweb").append("<span style='color:#FFF;'>无信息!</span>");
		}
	}
	//调用父窗体方法
	/* function selHander(id) {
		if (isExitsFunction(window.parent.setValueByFrame)) {
			window.parent.setValueByFrame("relation", id,callbackMuilt());
		} else {
			alert("请在父窗口添加setValueByFrame(type,id){处理逻辑}type='useGem'");
		}
	} */
</script>

<style>
@media screen and (max-width: 1280px) and (min-width: 320px){
	.operate ul li{
		width: 100% !important;
	}
	.operate ul li h4{
		background:none;
	}
}
.first{
	width:33%;
}
.second{
	width:33%;
}
.three{
	width:33%;
}
}
.main1 .left-sider{
	width: 100%;
	overflow-y:hidden;
	height:100% !important;
}
body{
	text-align:center;
	font-family:"Microsoft yahei";
}
.orderlist {
    width: 100%;
    position: inherit;
    left: 0%;
    margin: 0 auto;
    background: #3b3b3b;
}
.operate ul li{
	width: 100%;
}
.operate ul li h4{
	background:none !important;
}
.operate ul li {display:inline-block; margin-bottom:10px; width:100%; position: relative; right:10px;}
.operate ul li h4 { cursor:pointer;text-decoration:none; font-size:26px; color:#f8f8f8; line-height:43px; font-weight:normal; }
.operate ul li h4 span { float:left;}
.operate ul li h4 span a { text-decoration:none !important;}
.operate ul li h4 a { text-decoration:underline;}
.operate ul li h4 b {font-weight:normal;}
.operate ul li.noline { border-bottom:none; }
.operate ul li h4:hover { color:#8caf00; text-decoration:underline; }
.operate ul li .on a { color:#8caf00; font-weight:bold; }
.operate ul li a:hover { color:#8caf00; text-decoration:underline; }
</style>
</head>

<body>
<div class="orderlist">
	<div class="order-main">
		<div class="main1 content">
			<div class="operate">
				<ul id="juheweb">
				</ul>
			</div>
		</div>
	</div>
</div>
</body>
</html>
	