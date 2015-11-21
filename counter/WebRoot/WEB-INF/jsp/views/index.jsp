<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
        <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
    $(function(){
		$(".add-order").click(function(){
			startMask();
			url = "${ctx}/order/add.do";//订单新增页
			window.location = url;
		});
		/*$(".add-custom").click(function(){
			url = "${ctx}/order/view.do?id="+id;//定制单新增页
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
    });
    /**  
*  页面加载等待页面
*/  
var height = window.screen.height-180;   
var width = window.screen.width;   
 var leftW = 300;   
 if(width>1200){   
    leftW = 500;   
 }else if(width>1000){   
    leftW = 350;   
 }else {   
    leftW = 100;   
 }   
    
 var _html = "<div id='loading' style=\"position:absolute;left:0;width:100%;height:" + height 
 + "px;top:0;background:#E0ECFF;opacity:0.3;filter:alpha(opacity=30);\"><div style=\"position:absolute;  cursor1:wait;left:"+leftW+"px;top:200px;width:auto;height:auto;padding:12px 5px 10px 40px;background:#fff url('${ctx }/resources/images/loading.gif') no-repeat scroll 5px 5px;border:2px solid #ccc;color:#000;\">正在加载，请等待...</div></div>";    
  
 function startMask(){
	$("#ss").html(_html);
 }
 
 function endMask(){
	var _mask = document.getElementById('loading');
    if(_mask!=null){
    	_mask.parentNode.removeChild(_mask);
    }   
 }
    
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
  <div id="ss">
    <div class="container">

      <div class="container header text-align">
        <img src="${ctx }/resources/images/LOGO.png" alt="宝珑电子柜台系统" class="img img-logo">
      </div>
      
      <div class="container text-align" role="main">
            <button type="button" class="btn btn-default .btn-lg add-order">订&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单</button>
            <!--<button type="button" class="btn btn-default .btn-lg add-custom">定&nbsp;&nbsp;制&nbsp;&nbsp;单</button>-->
            <button type="button" class="btn btn-default .btn-lg add-customer">客&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;户</button>
            <button type="button" class="btn btn-default .btn-lg add-gemsign">宝石签收单</button>
            <button type="button" class="btn btn-default .btn-lg add-entysign">实物签收单</button>
            <!--<button type="button" class="btn btn-default .btn-lg">配&nbsp;&nbsp;石&nbsp;&nbsp;单</button>-->
      </div><!--/.nav-collapse -->

    </div> <!-- /container -->
  </div>
  </body>
</html>