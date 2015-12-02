<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<%
//模块
String mod = request.getParameter("mod");
String modName = request.getParameter("modName");
//列表
String lst = request.getParameter("lst");
String lstName = request.getParameter("lstName");
 %>
<script src="${ctx }/resources/js/jquery-1.8.3.min.js"></script>
<link type="image/x-icon" href="${ctx }/favicon.ico" rel="shortcut icon" />
<link href="${ctx }/favicon.ico" rel="bookmark icon" />

<div class="lefter">
    <div class="logo"><a href="http://www.pintuer.com" target="_blank"></a></div>
</div>
<div class="righter nav-navicon" id="admin-nav">
    <div class="mainer">
        <div class="admin-navbar">
            <span class="float-right">
            	<a class="button button-little bg-main" href="#">前台首页</a>
                <a class="button button-little bg-yellow" href="login.jsp">注销登录</a>
            </span>
            <ul class="nav nav-inline admin-nav">
                <li><a href="index.jsp" class="icon-home"> 开始</a>
                    <ul>
                    <li class="active"><a href="system.jsp">系统设置</a></li>
                    <li><a href="content.jsp">内容管理</a></li>
                    <li><a href="#">订单管理</a></li>
                    <li><a href="#">会员管理</a></li>
                    <li><a href="#">文件管理</a></li>
                    <li><a href="#">栏目管理</a></li>
                    </ul>
                </li>
                <li class="system"><a href="system.jsp?mod=system" class="icon-user"> 客户</a>
            		<ul>
            		<li class="set-pub"><a href="index.jsp?mod=system&lst=set-pub&modName=系统&lstName=全局设置">全局设置</a></li>
            		<li class="set-sys active"><a href="index.jsp?mod=system&lst=set-sys&modName=系统&lstName=系统设置">系统设置</a></li>
            		<li><a href="#">会员设置</a></li>
            		<li><a href="#">积分设置</a></li>
            		</ul>
                </li>
                <li class="active"><a href="content.jsp" class="icon-file-text"> 订单</a>
					<ul>
					<li><a href="#">添加内容</a></li>
					<li class="active"><a href="#">内容管理</a></li>
					<li><a href="#">分类设置</a></li>
					<li><a href="#">链接管理</a></li>
					</ul>
                </li>
                <li><a href="#" class="icon-shopping-cart"> 定制单</a></li>
                <li><a href="#" class="icon-user"> 宝石签收单</a></li>
                <li><a href="#" class="icon-cog"> 实物签收单</a></li>
                <li><a href="#" class="icon-th-list"> 配石单</a></li>
            </ul>
        </div>
        <div class="admin-bread">
            <span>您好，admin，欢迎您的光临。</span>
            <ul class="bread">
                <li><a href="index.jsp" class="icon-home"> 开始</a></li>
                <li><a href="<%=mod %>.jsp"><%=modName %></a></li>
                <li><%=lstName %></li>
            </ul>
        </div>
    </div>
</div>

<script type="text/javascript">
$(function(){
	$(".<%=mod%>").addClass("active").siblings().removeClass("active");
	$(".<%=mod%> ul .<%=lst%>").addClass("active").siblings().removeClass("active");
});
</script>