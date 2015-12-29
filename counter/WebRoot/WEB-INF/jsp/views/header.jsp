<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!-- amazeui -->
<link rel="stylesheet" href="${ctx }/resources/amazeui/css/amazeui.min.css"/>
<link rel="stylesheet" href="${ctx }/resources/amazeui/css/amaze.min.css">
<!--<script language="javascript" type="text/javascript" src="${ctx}/resources/js/jquery-1.9.1.min.js"></script>-->
<script type="text/javascript" src="${ctx }/resources/amazeui/js/handlebars.min.js"></script>	
<script type="text/javascript" src="${ctx }/resources/amazeui/js/amazeui.min.js"></script>	

<style type="text/css">
	.am-menu-dropdown3{display:none;}
</style>

<nav data-am-widget="menu" class="am-menu am-menu-dropdown3"
	data-am-menu-collapse>
	<a href="javascript: void(0)" class="am-menu-toggle bavlo-memu-turn"><img
			src="data:image/svg+xml;charset=utf-8,&lt;svg xmlns=&quot;http://www.w3.org/2000/svg&quot; viewBox=&quot;0 0 42 26&quot; fill=&quot;%23fff&quot;&gt;&lt;rect width=&quot;4&quot; height=&quot;4&quot;/&gt;&lt;rect x=&quot;8&quot; y=&quot;1&quot; width=&quot;34&quot; height=&quot;2&quot;/&gt;&lt;rect y=&quot;11&quot; width=&quot;4&quot; height=&quot;4&quot;/&gt;&lt;rect x=&quot;8&quot; y=&quot;12&quot; width=&quot;34&quot; height=&quot;2&quot;/&gt;&lt;rect y=&quot;22&quot; width=&quot;4&quot; height=&quot;4&quot;/&gt;&lt;rect x=&quot;8&quot; y=&quot;23&quot; width=&quot;34&quot; height=&quot;2&quot;/&gt;&lt;/svg&gt;"
			alt="Menu Toggle" />
	</a>
	<ul class="am-menu-nav am-avg-sm-1 am-collapse">
		<jsp:include page="./menu_cau.jsp"></jsp:include>
	</ul>
</nav>
<nav data-am-widget="menu" class="am-menu am-menu-dropdown1"
	data-am-menu-collapse>
	<a href="javascript: void(0)" class="am-menu-toggle bavlo-memu-page"><img
			src="data:image/svg+xml;charset=utf-8,&lt;svg xmlns=&quot;http://www.w3.org/2000/svg&quot; viewBox=&quot;0 0 42 26&quot; fill=&quot;%23fff&quot;&gt;&lt;rect width=&quot;4&quot; height=&quot;4&quot;/&gt;&lt;rect x=&quot;8&quot; y=&quot;1&quot; width=&quot;34&quot; height=&quot;2&quot;/&gt;&lt;rect y=&quot;11&quot; width=&quot;4&quot; height=&quot;4&quot;/&gt;&lt;rect x=&quot;8&quot; y=&quot;12&quot; width=&quot;34&quot; height=&quot;2&quot;/&gt;&lt;rect y=&quot;22&quot; width=&quot;4&quot; height=&quot;4&quot;/&gt;&lt;rect x=&quot;8&quot; y=&quot;23&quot; width=&quot;34&quot; height=&quot;2&quot;/&gt;&lt;/svg&gt;"
			alt="Menu Toggle" />
	</a>
	<ul class="am-menu-nav am-avg-sm-1 am-collapse">
		<jsp:include page="./menu_pg.jsp"></jsp:include>
	</ul>
</nav>

<script type="text/javascript">
$(function(){
	var $pageAttr = $("#pageAttr");
	var pageType = $pageAttr.val();
	if("ORDER" == pageType){
		$(".am-menu-dropdown3").show();
	}
});

</script>