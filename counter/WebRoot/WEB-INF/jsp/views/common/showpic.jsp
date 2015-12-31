<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>图片轮播(支持触屏)</title>

<link type="text/css" href="${ctx}/resources/touchSlider/css/style.css" rel="stylesheet"/>

<script type="text/javascript" src="${ctx}/resources/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/touchSlider/js/jquery.event.drag-1.5.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/touchSlider/js/jquery.touchSlider.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	$(".main_visual").hover(function(){
		$("#btn_prev,#btn_next").fadeIn();
	},function(){
		$("#btn_prev,#btn_next").fadeOut();
	});
	
	$dragBln = false;
	
	$(".main_image").touchSlider({
		flexible : true,
		speed : 200,
		btn_prev : $("#btn_prev"),
		btn_next : $("#btn_next"),
		paging : $(".flicking_con a"),
		counter : function (e){
			$(".flicking_con a").removeClass("on").eq(e.current-1).addClass("on");
		}
	});
	
	$(".main_image").bind("mousedown", function() {
		$dragBln = false;
	});
	
	$(".main_image").bind("dragstart", function() {
		$dragBln = true;
	});
	
	$(".main_image a").click(function(){
		if($dragBln) {
			return false;
		}
	});
	
	timer = setInterval(function(){
		$("#btn_next").click();
	}, 5000);
	
	$(".main_visual").hover(function(){
		clearInterval(timer);
	},function(){
		timer = setInterval(function(){
			$("#btn_next").click();
		},5000);
	});
	
	$(".main_image").bind("touchstart",function(){
		clearInterval(timer);
	}).bind("touchend", function(){
		timer = setInterval(function(){
			$("#btn_next").click();
		}, 5000);
	});
	
});
</script>
</head>
<body>

<div class="main_visual">
	<div class="flicking_con">
		<c:forEach items="${listbvo}" var="bean" varStatus="status">
	      <a href="#">${status.index + 1 }</a>
	    </c:forEach>
	</div>
	<div class="main_image">
		<ul>
		  <c:forEach items="${listbvo}" var="bean">
	      <li><span class="img_"><img  src="${ctx}/staticRes/${bean.vpath}/${bean.vname}" width="330" height="330" /></span></li>
	      </c:forEach>
		</ul>
		<a href="javascript:void(0);" id="btn_prev"></a>
		<a href="javascript:void(0);" id="btn_next"></a>
	</div>
</div>
<!--main_visual end-->
<div style="text-align:center;">

</div>
</body>
</html>