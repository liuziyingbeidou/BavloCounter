<%@ page language="java" import="java.util.*,com.bavlo.counter.model.LoginVO" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
Object info = request.getSession().getAttribute("loginInfo");
List<String> roleList = null;
if(info != null){
	LoginVO loginVO = (LoginVO)info;
	roleList = loginVO.getRole();
}
%>
<c:set var="roleList" value="<%=roleList %>"/>
<script type="text/javascript">
$(function(){
	//选择角色列表
	$(".role-list").bind("click",function(){
		var role = $(this).attr("bv-role");
		var title = $(this).attr("bv-title");
		openURL("${ctx}/qy/list.do?listType=menu&role="+role,title+"列表",465,510);
		closeMenu();
	});
});
function closeMenu(){
	EditShow_Hidden(ed1);
}
</script>
<!--
<li><a href="">Open</a></li>
<li><a href="">Save</a></li>
<li><a href="">Save as</a></li>
<li><a href="">Print</a></li>
-->
<c:forEach var="role" items="${roleList}">
     <c:if test="${fn:contains('[CUST-RL][PM-RL][PMC-RL]',role)}">
     <li class="role-list" bv-role="CC" bv-title="定制顾问"><a href="#">发定制顾问</a></li>
     </c:if>
     <c:if test="${fn:contains('[PM-RL]',role)}">
     <li class="role-list" bv-role="CAD" bv-title="起版师"><a href="#">发起版师</a></li>
     </c:if>
     <c:if test="${fn:contains('[CC-RL][CAD-RL]',role)}">
     <li class="role-list" bv-role="PM" bv-title="产品经理"><a href="#">发产品经理</a></li>
     </c:if>
     <c:if test="${fn:contains('[PMC-RL]',role)}">
     <li class="role-list" bv-role="GB" bv-title="配石员"><a href="#">发配石员</a></li>
     </c:if>
     <c:if test="${fn:contains('[PMC-RL]',role)}">
     <li class="role-list" bv-role="PPS" bv-title="工厂跟单员"><a href="#">发工厂跟单员</a></li>
     </c:if>
     <c:if test="${fn:contains('[CC-RL][GB-RL][PPS-RL]',role)}">
     <li class="role-list" bv-role="PMC" bv-title="生产主管"><a href="#">发生产主管</a></li>
     </c:if>
     <c:if test="${fn:contains('[CC-RL]',role)}">
     <li><a class="sendCM" href="#">发客户</a></li>
     </c:if>
</c:forEach>

