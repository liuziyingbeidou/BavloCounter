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

	var jsonvo = JSON.stringify($("#${frmId}",window.parent.document).serializeArray());
	var jsonStr = jQuery.parseJSON(jsonvo);
	if(jsonStr != "" && jsonStr != null){
		var filemodel = $("#filemodel",window.parent.document).val();
		var num = 1;
		for(var i = 0; i < jsonStr.length; i++){
			var nfiled = jsonStr[i].name;
			var vfiled = jsonStr[i].value;
			if(nfiled.indexOf("FILE") != -1){
			 	if(vfiled != "" && vfiled != null){
			 		$(".flicking_con").append("<a href='javascript:void(0);'>"+ num +"</a>");
					$(".main_image ul").append("<li><span class='img_'><img  src='${ctx}/staticRes/"+filemodel+"/"+vfiled+"' width='330' height='330' /></span></li>");
			 		num++;
			 	}
			}
		}
	}

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
(function($){  
        $.fn.serializeJson=function(){  
            var serializeObj={};  
            var array=this.serializeArray();  
            var str=this.serialize();  
            $(array).each(function(){  
                if(serializeObj[this.name]){  
                    if($.isArray(serializeObj[this.name])){  
                        serializeObj[this.name].push(this.value);  
                    }else{  
                        serializeObj[this.name]=[serializeObj[this.name],this.value];  
                    }  
                }else{  
                    serializeObj[this.name]=this.value;   
                }  
            });  
            return serializeObj;  
        };  
    })(jQuery);  

</script>
</head>
<body>

<div class="main_visual">
	<div class="flicking_con">
	    <!--<a href="javascript:void(0);">3</a>-->
	</div>
	<div class="main_image">
		<ul>
	      <!--<li><span class="img_"><img  src="" width="330" height="330" /></span></li>-->
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