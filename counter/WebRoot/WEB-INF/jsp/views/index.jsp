<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>宝珑订单系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<style type="text/css">
		body{background:#000000;}
	</style>
  </head>
  
  <body>
    <div >
    	<ul>
		<li><a href="#">定制单</a></li>
		<li class="menu-entity-list"><a href="#">实物签收单</a></li>
		<li class="menu-gem-list"><a href="#">宝石签收单</a></li>
		<li class="menu-order-list"><a href="#">订单</a></li>
		<li class="menu-order-list-view"><a href="#">查看订单</a></li>
		<li class="menu-customer-list"><a href="#">客户</a></li>
    	</ul>
    </div>
  </body>
</html>
