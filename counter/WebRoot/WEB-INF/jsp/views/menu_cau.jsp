<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
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
<li class="role-list" bv-role="CAD" bv-title="起版师"><a href="#">发起版师</a></li>
<li class="role-list" bv-role="PPS" bv-title="供应链"><a href="#">发供应链</a></li>
<li><a class="sendCM" href="#">发客户</a></li>
