<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
  <head>
    <title>弹框</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!--[if lt IE 9]> 
		<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<!-- jQuery & jQuery UI files (needed)-->
	<link rel="stylesheet" href="${ctx }/resources/jquery.multiDialog/css/jquery-ui-1.10.3.custom.css">
	<script src="${ctx }/resources/jquery.multiDialog/js/jquery/jquery-1.9.1.js"></script>
	<script src="${ctx }/resources/jquery.multiDialog/js/jquery/jquery-ui-1.10.3.custom.js"></script>
	<!-- MultiDialog files (needed) -->
	<link rel="stylesheet" href="${ctx }/resources/jquery.multiDialog/css/jquery.multiDialog.css">
	<script src="${ctx }/resources/jquery.multiDialog/js/jquery.ui.dialog.extended-1.0.2.js"></script>
	<script src="${ctx }/resources/jquery.multiDialog/js/jquery.multiDialog.js"></script>
	<script src="${ctx }/resources/js/bavlo-dialog.js"></script>
	
	<!-- 自定义 -->
	<script type="text/javascript">
	$(function() {
		$("#api-button").click( function(){
			openURL("index.jsp","弹框");
		});
	});
	
	</script>
  </head>
  
  <body>
	<br>
    <button id="api-button">弹框</button>
    <xmp>
1、  引入JS：
    <!--[if lt IE 9]> 
	<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<!-- jQuery & jQuery UI files (needed)-->
	<link rel="stylesheet" href="${ctx }/resources/jquery.multiDialog/css/jquery-ui-1.10.3.custom.css">
	<script src="${ctx }/resources/jquery.multiDialog/js/jquery/jquery-1.9.1.js"></script>
	<script src="${ctx }/resources/jquery.multiDialog/js/jquery/jquery-ui-1.10.3.custom.js"></script>
	<!-- MultiDialog files (needed) -->
	<link rel="stylesheet" href="${ctx }/resources/jquery.multiDialog/css/jquery.multiDialog.css">
	<script src="${ctx }/resources/jquery.multiDialog/js/jquery.ui.dialog.extended-1.0.2.js"></script>
	<script src="${ctx }/resources/jquery.multiDialog/js/jquery.multiDialog.js"></script>
	<script src="${ctx }/resources/js/bavlo-dialog.js"></script>
	
2、调用弹框：
	$(function() {
		$("#api-button").click( function(){
			openURL("index.jsp","弹框");//openURL(url, title,width, height )
		});
	});
3、操作父窗口方法：
	$(".test").click(function(){
		var cont = $("#api-button",window.parent.document).text();
		alert("点我的按钮名称："+cont);
	});
    </xmp>
  </body>
</html>
