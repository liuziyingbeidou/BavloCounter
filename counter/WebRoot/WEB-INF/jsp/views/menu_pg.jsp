<%@ page language="java" import="java.util.*,com.bavlo.counter.model.LoginVO" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
Object info = request.getSession().getAttribute("loginInfo");
List<String> roleList = null;
boolean lgSt = false;
if(info != null){
	LoginVO loginVO = (LoginVO)info;
	roleList = loginVO.getRole();
}else{
	lgSt = true;
}
 %>
<c:set var="isLogin" value="<%=lgSt %>"/>
<c:set var="roleList" value="<%=roleList %>"/>
<script type="text/javascript">
$(function(){

	/* if("${isLogin}"){
		alert("登录超时...随即推出");
		window.close();
		//window.location = "${ctx}/index.do";
	}*/

	//首页
	$(".menu-index").bind("click",function(){
		//EditShow_Hidden(ed1);
		var url = "${ctx}/index.do";
		window.location = url;
	});
	//实物签收单列表
	$(".menu-entity-list").bind("click",function(){
		EditShow_Hidden(ed1);
		openURL("${ctx}/entity-sign/list.do","实物签收单列表",470,550);
		closeMenu();
	});
	//宝石签收单列表
	$(".menu-gem-list").bind("click",function(){
		EditShow_Hidden(ed1);
		openURL("${ctx}/gem-sign/list.do","宝石签收单列表",470,550);
		closeMenu();
	});
	//订单列表
	$(".menu-order-list").bind("click",function(){
		EditShow_Hidden(ed1);
		openURL("${ctx}/order/list.do","订单列表",500,550);
		closeMenu();
	});
	//订单列表(查看)
	$(".menu-order-list-view").bind("click",function(){
		EditShow_Hidden(ed1);
		openURL("${ctx}/order/list.do?listType=view","订单列表",500,550);
		closeMenu();
	});
	//选择客户
	$(".menu-customer-list").bind("click",function(){
		EditShow_Hidden(ed1);
		openURL("${ctx}/customer/list.do?listType=menu","客户列表",470,550);
		closeMenu();
	});
	//选择定制单
	$(".menu-custom-list").bind("click",function(){
		EditShow_Hidden(ed1);
		openURL("${ctx}/custom/getList.do?listType=menu","定制单列表",490,550);
		closeMenu();
	});
	//选择定制单(查看)
	$(".menu-custom-list-view").bind("click",function(){
		openURL("${ctx}/custom/getList.do?listType=view","定制单列表",490,550);
		closeMenu();
	});
});

function closeMenu(){
	Show_Hidden(tr1);
}
</script>
<li class="menu-index"><a href="#">首页</a></li>
<c:forEach var="role" items="${roleList}">
     <c:if test="${fn:contains('[CC][PM][PMC][CAD][GB][PPS]',role)}">
     <li class="menu-custom-list"><a href="#">定制单</a></li>
     </c:if>
     <c:if test="${fn:contains('[CUST]',role)}">
     <li class="menu-custom-list-view"><a href="#">查看定制单</a></li>
     </c:if>
     <c:if test="${fn:contains('[CC][PM][PMC][CAD][GB][PPS]',role)}">
     <li class="menu-entity-list"><a href="#">实物签收单</a></li>
     </c:if>
     <c:if test="${fn:contains('[CC][PM][PMC][CAD][GB][PPS]',role)}">
     <li class="menu-gem-list"><a href="#">宝石签收单</a></li>
     </c:if>
     <c:if test="${fn:contains('[CC][PM][PMC][CAD][GB][PPS]',role)}">
     <li class="menu-order-list"><a href="#">订单</a></li>
     </c:if>
     <c:if test="${fn:contains('[CC][CAD][GB][PPS]',role)}">
     <li class="menu-order-list-view"><a href="#">查看订单</a></li>
     </c:if>
     <c:if test="${fn:contains('[CC][PM][PMC][CAD][GB][PPS]',role)}">
     <li class="menu-customer-list"><a href="#">客户</a></li>
     </c:if>
</c:forEach>



