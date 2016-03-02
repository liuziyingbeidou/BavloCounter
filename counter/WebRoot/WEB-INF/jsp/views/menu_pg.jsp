<%@ page language="java" import="java.util.*,com.bavlo.counter.model.LoginVO" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	//角色控制标签
	<%
	if(roleList != null){
		if(roleList.size() > 0){
			for(int i = 0; i < roleList.size(); i++){
				String role = roleList.get(i);
				if(role != null){
				%>
				$(".<%=role%>").hide();
				<%
				}
			}
		}else{
			%>
			$(".CUST-RL").hide();
			<%
		}
	}else{
		%>
		$(".CUST-RL").hide();
		<%
	}
	%>
	/* if("${isLogin}"){
		alert("登录超时...随即推出");
		window.close();
		//window.location = "${ctx}/index.do";
	}*/

	//首页
	$(".menu-index").click(function(){
		var url = "${ctx}/index.do";
		window.location = url;
		closeMenu();
	});
	//实物签收单列表
	$(".menu-entity-list").click(function(){
		openURL("${ctx}/entity-sign/list.do","实物签收单列表",470,550);
		closeMenu();
	});
	//宝石签收单列表
	$(".menu-gem-list").click(function(){
		openURL("${ctx}/gem-sign/list.do","宝石签收单列表",470,550);
		closeMenu();
	});
	//订单列表
	$(".menu-order-list").click(function(){
		openURL("${ctx}/order/list.do","订单列表",500,550);
		closeMenu();
	});
	//订单列表(查看)
	$(".menu-order-list-view").click(function(){
		openURL("${ctx}/order/list.do?listType=view","订单列表",500,550);
		closeMenu();
	});
	//选择客户
	$(".menu-customer-list").click(function(){
		openURL("${ctx}/customer/list.do?listType=menu","客户列表",470,550);
		closeMenu();
	});
	//选择定制单
	$(".menu-custom-list").bind("click",function(){
		openURL("${ctx}/custom/getList.do?listType=menu","款式单列表",490,550);
		closeMenu();
	});
	//选择定制单(查看)
	$(".menu-custom-list-view").click(function(){
		openURL("${ctx}/custom/getList.do?listType=view","款式单列表",490,550);
		closeMenu();
	});
	//配石单列表menu-useGem-list
	$(".menu-useGem-list").click(function(){
		openURL("${ctx}/useGem/list.do?listType=menu","配石单列表",470,550);
		closeMenu();
	});
	//重置
	$(".menu-system-close").click(function(){
		$.post("${ctx}/exit.do",function(data){
			if(data == "0"){
				var url = "${ctx}/index.do";
				window.location = url;
			}
		});
	});
});

function closeMenu(){
	$(".bavlo-memu-page").trigger("click");
}
</script>
<li class="menu-index"><a href="javascript:void(0);">首&nbsp;&nbsp;页</a></li>
<c:forEach var="role" items="${roleList}">
     <c:if test="${fn:contains('[N]',role)}">
     <li class="menu-custom-list"><a href="javascript:void(0);">定制单</a></li>
     </c:if>
     <c:if test="${fn:contains('[CC-RL][PM-RL][PMC-RL]',role)}">
     <li class="menu-custom-list-view"><a href="javascript:void(0);">款式单</a></li>
     </c:if>
     <c:if test="${fn:contains('[CC-RL][PM-RL][PMC-RL]',role)}">
     <li class="menu-order-list-view"><a href="javascript:void(0);">订&nbsp;&nbsp;单</a></li>
     </c:if>
     <c:if test="${fn:contains('[CC-RL]',role)}">
     <li class="menu-entity-list"><a href="javascript:void(0);">实物签收单</a></li>
     </c:if>
     <c:if test="${fn:contains('[CC-RL]',role)}">
     <li class="menu-gem-list"><a href="javascript:void(0);">宝石签收单</a></li>
     </c:if>
     <c:if test="${fn:contains('[GB]',role)}">
     <li class="menu-useGem-list"><a href="javascript:void(0);">配石单</a></li>
     </c:if>
     <c:if test="${fn:contains('[N]',role)}">
     <li class="menu-order-list"><a href="javascript:void(0);">订&nbsp;&nbsp;单</a></li>
     </c:if>
     <c:if test="${fn:contains('[CC-RL]',role)}">
     <li class="menu-customer-list"><a href="javascript:void(0);">客&nbsp;&nbsp;户</a></li>
     </c:if>
</c:forEach>
<li class="menu-system-close"><a href="javascript:void(0);">重&nbsp;&nbsp;置</a></li>


