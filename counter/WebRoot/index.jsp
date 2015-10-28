<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    
    1、<a href="${ctx}/gem-sign/add.do">宝石签收单新增</a>
       <a href="${ctx}/gem-sign/list.do">宝石签收单列表</a>
    <br>   
    2、<a href="${ctx}/entity-sign/add.do">实物签收单新增</a>
       <a href="${ctx}/entity-sign/list.do">实物签收单列表</a>
    <br>   
    3、<a href="${ctx}/customer/info.do">客户</a>
    <br>
    4、<a href="${ctx}/useGem/info.do">配石单</a>
    <br>
    5、<a href="${ctx}/order/add.do">订单新增</a>
</body>
</html>