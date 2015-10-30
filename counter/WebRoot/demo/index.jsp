<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${ctx }/resources/jquery.multiDialog/js/jquery/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(function(){
	$(".test").click(function(){
		var cont = $("#api-button",window.parent.document).text();
		alert("点我的按钮名称："+cont);
	});
});
</script>
</head>
<body>
    <br>
    8、<button class="test">测试</button>
</body>
</html>