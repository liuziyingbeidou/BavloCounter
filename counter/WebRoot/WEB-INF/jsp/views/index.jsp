<%@ page language="java" import="java.util.*,com.bavlo.counter.model.LoginVO" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<%
Object info = request.getSession().getAttribute("loginInfo");
List<String> roleList = null;
boolean lgSt = false;
if(info != null){
	LoginVO loginVO = (LoginVO)info;
	roleList = loginVO.getRole();
}
 %>
<c:set var="roleList" value="<%=roleList %>"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>宝珑订单系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
   	<script language="javascript" type="text/javascript" src="${ctx}/resources/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${ctx }/resources/bootstrap/js/bootstrap.min.js"></script>
	<link type="text/css" rel="stylesheet" href="${ctx }/resources/bootstrap/css/bootstrap.min.css">
	<script type="text/javascript" src="${ctx }/resources/js/bavlo-initdata.js"></script>
	<!-- Loading -->
	<script src="${ctx}/resources/showLoading/showLoading.js"></script>
	<link type="text/css" rel="stylesheet" href="${ctx}/resources/showLoading/showLoading.css">
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
        <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
    var uri = "http://192.168.1.115:8888/bavlo";
    //本地webservice
	var nativeUrl = "${pageScope.basePath}/counter/webservice/http.do";
    $(function(){
		$(".add-order").click(function(){
			startMask();
			url = "${ctx}/order/add.do";//订单新增页
			window.location = url;
		});
		/*$(".add-custom").click(function(){
			url = "${ctx}/order/view.do?id="+id;//款式单新增页
			window.location = url;
		});*/
		$(".add-customer").click(function(){
			startMask();
			url = "${ctx}/customer/info.do";//客户新增页
			window.location = url;
		});
		$(".add-gemsign").click(function(){
			startMask();
			url = "${ctx}/gem-sign/add.do";//宝石签收单新增页
			window.location = url;
		});
		$(".add-entysign").click(function(){
			startMask();
			url = "${ctx}/entity-sign/add.do";//实物签收单新增页
			window.location = url;
		});
		$(".mgr-old-counter").click(function(){//电子柜台后台
			startMask();
			var userid = "${uvo['muserId']}";
			if(userid == null || userid == "" || userid == undefined){
				alert("对不起,您没有权限访问!");
			}else{
				var url = uri+"/agentWeb/manage?UserId="+userid;
				window.location = url;
			}
		});
		$(".old-counter").click(function(){//电子柜台
			startMask();
			var userid = "${uvo['userId']}";userid="shijianfeng";
			if(userid == null || userid == "" || userid == undefined){
				alert("对不起,您没有权限访问!");
			}else{
				var url = uri+"/agentWeb/weChatLogin?UserId="+userid;alert(url);
				window.location = url;
			}
		});
		//重置
		$(".menu-system-close").bind("click",function(){
			startMask();
			$.post("${ctx}/exit.do",function(data){
				if(data == "0"){
					var url = "${ctx}/index.do";
					window.location = url;
				}
			});
		});
    });
</script>
    <style type="text/css">
    body{background:#000000;}
    @media (min-width: 650px){
    .header{
    	height:500px;
    	padding-top:150px;
    }
    .img-logo{
    	height:150px;
    	width:150px;
    }
    .text-align{
    	text-align:center;
    }
    .btn-default{
    	color:#F0F0F0;
    	background-color:#5B5B5B;
    }
    #ss{
    	align-text:center;
    }
    }
    @media (max-width: 650px){
    .header{
    	height:350px;
    	padding-top:100px;
    }
    .img-logo{
    	height:150px;
    	width:150px;
    }
    .text-align{
    	text-align:center;
    }
    .btn-default{
    	color:#F0F0F0;
    	background-color:#5B5B5B;
    	width:170px;
    	margin-top:7px;
    }
    #ss{
    	align-text:center;
    }
    }
    </style>
  </head>
  <body>
    <div class="container">

      <div class="container header text-align">
        <img src="${ctx }/resources/images/LOGO.png" alt="宝珑电子柜台系统" class="img img-logo">
      </div>
      
      <div class="container text-align" role="main">
      		<c:forEach var="role" items="${roleList}">
		     <c:if test="${fn:contains('[CC-RL][PPS-RL]',role)}">
		     <button type="button" class="btn btn-default .btn-lg add-order">订&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单</button>
		     </c:if>
		     <c:if test="${fn:contains('[CC-RL]',role)}">
		     <button type="button" class="btn btn-default .btn-lg add-customer">客&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;户</button>
		     </c:if>
		     <c:if test="${fn:contains('[CC-RL]',role)}">
		      <button type="button" class="btn btn-default .btn-lg add-gemsign">宝石签收单</button>
		     </c:if>
		     <c:if test="${fn:contains('[CC-RL]',role)}">
		     <button type="button" class="btn btn-default .btn-lg add-entysign">实物签收单</button>
		     </c:if>
		     <c:if test="${fn:contains('[CC-RL]',role)}">
		     <button type="button" class="btn btn-default .btn-lg old-counter">电子柜台</button>
		     </c:if>
		     </c:forEach>
            <!--<button type="button" class="btn btn-default .btn-lg add-custom">定&nbsp;&nbsp;制&nbsp;&nbsp;单</button>-->
            <!--<button type="button" class="btn btn-default .btn-lg">配&nbsp;&nbsp;石&nbsp;&nbsp;单</button>-->
			<c:if test="${empty uvo['muserId'] && uvo['userId'] == uvo['muserId']}">
			<button type="button" class="btn btn-default .btn-lg mgr-old-counter">电子柜台后台</button>
			</c:if>
			<button type="button" class="btn btn-default .btn-lg menu-system-close">重置</button>
      </div><!--/.nav-collapse -->

    </div> <!-- /container -->
  </body>
</html>