<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
		<script language="javascript" type="text/javascript"
			src="${ctx}/resources/js/jquery-1.8.3.min.js"></script>
		<link type='text/css' rel='stylesheet'
			href='${ctx}/resources/css/style.css' media='all' />
		<link type='text/css' rel='stylesheet'
			href='${ctx}/resources/css/bootstrap.css' media='all' />
		<script src="${ctx}/resources/js/top.js"></script>
		<script src="${ctx}/resources/js/hide.js"></script>

		<script type="text/javascript" src="${ctx}/resources/js/jquery.min.js"></script>
		<link href="${ctx}/resources/css/orderlist.css" rel="stylesheet"
			type="text/css" />
		<script src="${ctx}/resources/js/showList.js" type="text/javascript"></script>
<div class="header">
	<div class="head2">
		<div class="top2">
			<b><a href="javascript:;" onclick="EditShow_Hidden(ed1)"><img
						src="${ctx}/resources/images/plus.png" />
			</a> xxxx单 81812560 </b>
			<font><a href="javascript:;" onclick="Show_Hidden(tr1)"><img
						src="${ctx}/resources/images/plus.png" />
			</a> </font>
		</div>
		<div class="hidden_enent2" id="tr1" style="display: none;">
			<ul>
				<li class="jian">
					<a href="javascript:;" onclick="Show_Hidden(tr1)">一</a>
				</li>
				<li>
					<a href="">定制单</a>
				</li>
				<li>
					<a href="">宝石签收单</a>
				</li>
				<li>
					<a href="">订单</a>
				</li>
				<li>
					<a href="">客户</a>
				</li>
			</ul>
		</div>
		<div class="edit_hidden2" id="ed1" style="display: none;">
			<ul>
				<li class="jian2">
					<a href="javascript:;" onclick="EditShow_Hidden(ed1)">一</a>
				</li>
				<li>
					<a href="">Open</a>
				</li>
				<li>
					<a href="">Save</a>
				</li>
				<li>
					<a href="">Save as</a>
				</li>
				<li>
					<a href="">Print</a>
				</li>
			</ul>
		</div>
		<div class="clear"></div>
	</div>
</div>