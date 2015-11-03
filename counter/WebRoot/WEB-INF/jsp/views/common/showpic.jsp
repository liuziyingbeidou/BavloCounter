<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<script type="text/javascript" src="${ctx}/resources/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${ctx}/resources/js/bigpicroll.js"></script>
	<script src="${ctx}/resources/js/bavlo-event.js"></script>
    <link type='text/css' rel='stylesheet' href='${ctx}/resources/css/style.css' media='all' />
	<link type='text/css' rel='stylesheet' href='${ctx}/resources/css/bootstrap.css' media='all' />
	
	<script type="text/javascript">
	//暂时保存后效果
	$(function(){
		/*var id = $(".mid",window.parent.document).val();
		if(id == "" || id ==null || id == undefined){
			var jsonvo = JSON.stringify($("#gemfrmBId",window.parent.document).serializeJson());
			var jsonStr = jQuery.parseJSON(jsonvo);
			var filemodel = jsonStr.filemodel;
			var FILE_0 = jsonStr.FILE_0;
			var FILE_1 = jsonStr.FILE_1;
			var FILE_2 = jsonStr.FILE_2;
			var FILE_3 = jsonStr.FILE_3;
			var FILE_4 = jsonStr.FILE_4;
			var FILE_5 = jsonStr.FILE_5;
			var FILE_6 = jsonStr.FILE_6;
			var FILE_7 = jsonStr.FILE_7;
			var FILE_8 = jsonStr.FILE_8;
			if(FILE_0 != ""){
				insertPicEm(filemodel,FILE_0);
			}
			if(FILE_1 != ""){
				insertPicEm(filemodel,FILE_1);
			}
			if(FILE_2 != ""){
				insertPicEm(filemodel,FILE_2);
			}
			if(FILE_3 != ""){
				insertPicEm(filemodel,FILE_3);
			}
			if(FILE_4 != ""){
				insertPicEm(filemodel,FILE_4);
			}
			if(FILE_5 != ""){
				insertPicEm(filemodel,FILE_5);
			}
			if(FILE_6 != ""){
				insertPicEm(filemodel,FILE_6);
			}
			if(FILE_7 != ""){
				insertPicEm(filemodel,FILE_7);
			}
			if(FILE_8 != ""){
				insertPicEm(filemodel,FILE_8);
			}
		}else{
			var url = $("#picURL",window.parent.document).val();
			$.get(url,{id:id},function(row){
				var data = row;
				for(var i=0;i<data.length;i++){
					
				}
			});
		}
		
		initCSS();*/
	});
	
	function initCSS(){
	 $('.f_out').each(function(){
		  $(this).css({
		  	width:"90%",
			height:"auto",
			margin:"0 auto"
		  });
		  $(".f_out img").css({
		  	width:"100%",
			height:"auto"
		  });
	 });
	}
	function insertPicEm(model,pic){
		/*var newPic = "";
		var index = pic.lastIndexOf(".");
		if(index != -1){
			newPic = pic.substring(0,index) + "_min" + pic.substring(index);
		}*/
		$(".flashlist").append('<div class="f_out"><a href="javascript:void(0);"><img src="${ctx}/staticRes/'+model+'/'+pic+'" width="960" height="639" /></a></div>');
		$(".hander").append('<li class="f_tab opdiv"><a href="javascript:void(0);"></a></li>');
	}
	</script>
</head>

<body>
<div id="upload">
  <div class="hdwrap">
    <div class="hdflash f_list">
      <div class="flashlist">
      <c:forEach items="${listbvo}" var="bean">
      <div class="f_out"><a href="javascript:void(0);" target="_blank">
      <img src="${ctx}/staticRes/${bean.vpath}/${bean.vname}" width="960" height="639" />
      </a></div>
      </c:forEach>
        <!--<div class="f_out"><a href="javascript:void(0);" target="_blank"><img src="${ctx}/staticRes/gemsign/20151102171220543e5gtyv.jpg" width="960" height="639" /></a></div>
        <div class="f_out"><a href="javascript:void(0);" target="_blank"><img src="${ctx}/staticRes/gemsign/20151102171220543e5gtyv.jpg" width="960" height="639" /></a></div>
      --></div>
      <div class="flash_tab">
        <div class="tabs f_tabs" style="width:258px;">
          <ul class="hander">
          <c:forEach items="${listbvo}" var="bean">
          <li class="f_tab opdiv"><a href="javascript:void(0);"></a></li>
          </c:forEach>
          </ul>
        </div>
      </div>
      <script type="text/javascript">
        FeatureList(".f_list", {
          "onclass": "noopdiv",
          "offclass": "opdiv",
          "pause_on_act": "mouseover",
          "interval": 5000,
          "speed": 5
        });
      </script>
    </div>
  </div>
</div>
</body>
</html>