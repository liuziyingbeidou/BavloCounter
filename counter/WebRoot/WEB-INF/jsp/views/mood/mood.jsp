<%@ page language="java" import="java.util.*,com.bavlo.counter.model.LoginVO" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>虚拟试戴分享效果图</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
   	<script language="javascript" type="text/javascript" src="${ctx}/resources/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${ctx }/resources/bootstrap/js/bootstrap.min.js"></script>
	<link type="text/css" rel="stylesheet" href="${ctx }/resources/bootstrap/css/bootstrap.min.css">
	
	<!-- Loading -->
	<script src="${ctx}/resources/showLoading/showLoading.js"></script>
	<link type="text/css" rel="stylesheet" href="${ctx}/resources/showLoading/showLoading.css">
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
        <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
    body{background:#000000;}
    @media (min-width: 650px){
    .header{
    	padding-top:80px;
    }
    .img-logo{
    	height:100%;
    	width:100%;
    }
    .text-align{
    	text-align:center;
    	color:#FFF;
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
    	padding-top:30px;
    }
    .img-logo{
    	height:100%;
    	width:100%;
    }
    .text-align{
    	text-align:center;
    	color:#FFF;
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
        <img src="${sharePicVO['url'] }" class="img img-logo">
      </div>
      
      <div class="container text-align" role="main">
    	  
      </div>
    </div>
  </body>
</html>