<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>实物签收单列表</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<script type="text/javascript" src="${ctx}/resources/js/jquery.min.js"></script>
	<script src="${ctx}/resources/js/top.js"></script>
	<link href="${ctx}/resources/css/style.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/resources/css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/resources/css/orderlist.css" rel="stylesheet" type="text/css" />
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
		$(".add-entysign").click(function(){
			url = "${ctx}/entity-sign/add.do";//实物签收单新增页
			window.parent.location = url;
			window.parent.closeMultiDlg();
		});
	});
	
	function initData(){
		$("#juheweb").empty();
		var url = "${ctx}/entity-sign/listJson.do";
		$.post(url,{content:$(".search").val()},function(row){
			var data = row;
			for(var i = 0; i < data.length; i++){
				var pic = "";
				if(data[i].vdef3 != "" && data[i].vdef3 != null){
					pic = "src='${ctx}/staticRes/"+data[i].vdef2+"/min/"+data[i].vdef3+"'";
				}else{
					pic = "src='${ctx}/resources/images/good_01.png'";
				}
				$("#juheweb").append("<li><h4><img style='width:60px;height:60px;' "+pic+"><b>"+data[i].vnumber+"</b><span><a href='#' onclick='selHander("+data[i].id+")'>选择</a></span></h4><div class='clear'></div></li>");
			}
		});
	}
	//调用父窗体方法
	function selHander(id){
		if(isExitsFunction(window.parent.setValueByFrame)){
			window.parent.setValueByFrame("entity",id,callbackMuilt());
		}else{
			alert("请在父窗口添加setValueByFrame(type,id,callback){处理逻辑}type='entity'");
		}
	}
	</script>
	</head>

<body>
<div id="orderlist">
  <div class="orderlist">
    <div class="order-main">
		<div class="search-1">
			<form action='' method='post'>
				<input type='text' name='search' class="search" placeholder="输入编号">
				<span class="add-entysign" style="color:#FFFFFF;cursor: pointer;">&nbsp;+</span>
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
