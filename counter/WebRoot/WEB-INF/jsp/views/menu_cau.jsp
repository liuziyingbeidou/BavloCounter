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
	
	//发送客户 
	var toUser = $("#toUser").val();
	var customId = $("#customId").val();
	$(".sendCM").click(function() {
		sendTMessage(toUser);
	});
	function sendTMessage(toUser){
		 var url = getRootPath()+"/custom/detail.do?id="+customId;
		 $.post("${ctx}/sendTM.do",{toUser:toUser,url:url},function(data){if(data == ""){data = "发送失败!";}alert(data);});
		/* $.ajax({
			 url : '../sendTM.do',
				type : 'POST',
				data :{
					'toUser' : toUser,
					'url': url
				},
				datatype:'text',
				error : function(data) {		
					alert("发送成功");
				}
		 })*/	 	
	}
});
function closeMenu(){
	EditShow_Hidden(ed1);
}
function getRootPath(){
    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
    var curWwwPath=window.document.location.href;
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPaht=curWwwPath.substring(0,pos);
    //获取带"/"的项目名，如：/uimcardprj
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    return(localhostPaht+projectName);
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
     <li style="display: none;" class="menu-send-cust"><a class="sendCM" href="#">发客户</a></li>
     </c:if>
</c:forEach>

