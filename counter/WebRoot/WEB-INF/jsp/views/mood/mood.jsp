<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>虚拟试戴效果图</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
  	<link rel="stylesheet" href="${ctx }/page/counter/assets/css/amazeui.min.css"/>
  	<link rel="stylesheet" href="${ctx }/page/counter/assets/css/admin.css">
  	<script type="text/javascript" src="${ctx }/resources/js/jquery-1.8.3.min.js"></script>
  	<script type="text/javascript" src="${ctx }/page/counter/assets/js/amazeui.min.js"></script>
  	<style type="text/css">
  	.tx-filed{
  		font-size:18px;
  		height:20px;
  		line-height: 20px;
  		padding-top:5px;
  	}
  	.tx-con{
  		font-weight: bold;
  	}
  	</style>
  </head>
  
  <body>
    <figure data-am-widget="figure" class="am am-figure am-figure-default "   data-am-figure="{  pureview: 'true' }">
      <img src="${sharePicVO['url'] }" data-rel="${sharePicVO['url'] }" alt="虚拟试戴效果图"/>
          <figcaption class="am-figure-capition-btm">
             	<a href="http://m.bavlo.com/mobile/detail.html?si=${sharePicVO['kId'] }"><span class="tx-filed">查看款式详情&nbsp; </span></a>
          		<br><br><br>
          		<img src="${ctx }/resources/images/LOGO_BM.png" class="am-img-responsive" alt=""/>
          		<span class="tx-con">领先的珠宝定制品牌</span>
          </figcaption>
          
    </figure>
  
  </body>
</html>
