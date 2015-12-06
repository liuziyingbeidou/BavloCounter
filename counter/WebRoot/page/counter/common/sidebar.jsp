<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>

<script type="text/javascript" src="${ctx }/resources/js/jquery-1.9.1.min.js"></script>

<!-- sidebar start -->
<div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
  <div class="am-offcanvas-bar admin-offcanvas-bar">
    <ul class="am-list admin-sidebar-list" id="collapase-nav-1">
	  <li  class="am-panel nav-index">
	    <a data-am-collapse="{parent: '#collapase-nav-1'}" href="#/"><i class="am-icon-home am-margin-left-sm"></i> 首页</a>
	  </li>
	
	  <li class="am-panel">
	    <a data-am-collapse="{parent: '#collapase-nav-1', target: '#tool-nav'}">
	        <i class="am-icon-wrench am-margin-left-sm"></i> 工具管理 <i class="am-icon-angle-right am-fr am-margin-right"></i>
	    </a>
	    <ul class="am-list am-collapse admin-sidebar-sub" id="tool-nav">
	        <li class="nav-qrcode"><a href="#/qrcodeMgr"><i class="am-icon-qrcode am-margin-left-sm"></i> 二维码管理 </a></li>
	    </ul>
	  </li>
		
	  <li class="am-panel">
	    <a data-am-collapse="{parent: '#collapase-nav-1', target: '#user-nav'}">
	        <i class="am-icon-users am-margin-left-sm"></i> 人员管理 <i class="am-icon-angle-right am-fr am-margin-right"></i>
	    </a>
	    <ul class="am-list am-collapse admin-sidebar-sub" id="user-nav">
	        <li><a href="#/userAdd"><i class="am-icon-user am-margin-left-sm"></i> 添加人员 </a></li>
	        <li><a href="#/userList/0"><i class="am-icon-user am-margin-left-sm"></i> 人员列表 </a></li>
	    </ul>
	  </li>
	
	  <li class="am-panel">
	    <a data-am-collapse="{parent: '#collapase-nav-1', target: '#company-nav'}">
	        <i class="am-icon-table am-margin-left-sm"></i> 部门管理 <i class="am-icon-angle-right am-fr am-margin-right"></i>
	    </a>
	    <ul class="am-list am-collapse admin-sidebar-sub" id="company-nav">
	        <li><a href="#/companyAdd"><span class="am-icon-table am-margin-left-sm"></span> 添加部门 </a></li>
	        <li><a href="#/companyList/0"><span class="am-icon-table am-margin-left-sm"></span> 部门列表 </a></li>
	    </ul>
	  </li>
	
	  <li class="am-panel">
	    <a data-am-collapse="{parent: '#collapase-nav-1', target: '#role-nav'}">
	        <i class="am-icon-table am-margin-left-sm"></i> 角色管理 <i class="am-icon-angle-right am-fr am-margin-right"></i>
	    </a>
	    <ul class="am-list am-collapse admin-sidebar-sub" id="role-nav">
	        <li><a href="#/roleAdd"><span class="am-icon-table am-margin-left-sm"></span> 添加角色 </a></li>
	        <li><a href="#/roleList/0"><span class="am-icon-table am-margin-left-sm"></span> 角色列表 </a></li>
	    </ul>
	  </li>
	</ul>

    <div class="am-panel am-panel-default admin-sidebar-panel">
      <div class="am-panel-bd">
        <p><span class="am-icon-bookmark"></span> 公告</p>
        <p>时光静好，与君语；细水流年，与君同。—— Bavlo</p>
      </div>
    </div>
  </div>
</div>
<!-- sidebar end -->

<script type="text/javascript">
$(function(){
	//首页nav-index
	$(".nav-index").bind("click",function(){$("#mainIframe").prop("src","${ctx }/page/counter/main.jsp");});
	//二维码管理nav-qrcode
	$(".nav-qrcode").bind("click",function(){$("#mainIframe").prop("src","${ctx }/page/counter/tools/qrcode/qrcode-list.jsp");});
});
</script>