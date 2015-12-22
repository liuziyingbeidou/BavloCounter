<%@ page language="java" import="java.util.*,com.bavlo.counter.model.LoginVO" pageEncoding="utf-8"%>

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
      </div>
		<div class="radius-circle">
	        抱歉,您没有权限查看!</div>
    </div>
  </body>
</html>