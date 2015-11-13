<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<script type="text/javascript">
$(function(){
	//实物签收单列表
	$(".menu-entity-list").bind("click",function(){
		openURL("${ctx}/entity-sign/list.do","实物签收单列表");
	});
	//宝石签收单列表
	$(".menu-gem-list").bind("click",function(){
		openURL("${ctx}/gem-sign/list.do","宝石签收单列表");
	});
	//订单列表
	$(".menu-order-list").bind("click",function(){
		openURL("${ctx}/order/list.do","订单列表",500,600);
	});
	//订单列表(查看)
	$(".menu-order-list-view").bind("click",function(){
		openURL("${ctx}/order/list.do?listType=view","订单列表",500,600);
	});
	//选择客户
	$(".menu-customer-list").bind("click",function(){
		openURL("${ctx}/customer/list.do?listType=menu","客户列表");
	});
});
</script>

<li><a href="#">定制单</a></li>
<li class="menu-entity-list"><a href="#">实物签收单</a></li>
<li class="menu-gem-list"><a href="#">宝石签收单</a></li>
<li class="menu-order-list"><a href="#">订单</a></li>
<li class="menu-order-list-view"><a href="#">查看订单</a></li>
<li class="menu-customer-list"><a href="#">客户</a></li>




