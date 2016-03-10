<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>太赞了！看我的<c:if test="${sharePicVO['kId']!=-1}">试戴</c:if><c:if test="${sharePicVO['kId']==-1}">趣照</c:if>效果...</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="看看我选的款式！也可分享给好友哦！">
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
  		font-color:#777;
  		font-size:1.4rem
  	}
  	.tx-con-en{
  		font-color:#777;
  		font-size:1.0rem
  	}
  	.am-figure-default img{
  		border: 0px solid #eee;
  	}
  	.bottom{
  		text-align: center;
  	}
  	.am-img-responsive {
    display: inherit;
    max-width: 100%;
    height: auto;
    }
    .cons{
    	text-align: left;
    	font-size:1.2rem
    }
    .cons ul{
    	padding-left: 50px;
    	list-style-type: none;
    }
    .cons ul li{
    	
    }
  	</style>
  </head>
  
  <body>
    <figure data-am-widget="figure" class="am am-figure am-figure-default "   data-am-figure="{  pureview: 'true' }">
      <img src="${sharePicVO['url'] }" data-rel="${sharePicVO['url'] }" alt="虚拟试戴效果图"/>
          <figcaption class="am-figure-capition-btm">
          		<br>
          		<c:if test="${sharePicVO['kId']!=-1}">
             	<a href="http://m.bavlo.com/mobile/detail.html?si=${sharePicVO['kId'] }"><span class="tx-filed">查看款式详情&nbsp; </span></a>
          		<br><br>
          		</c:if>
          		<span class="tx-con cons">
					<ul>
						<li>. 珠宝DIY 定制（3D DIY）</li>
						<li>. 设计有创意的珠宝（Idea Design）</li>
						<li>. 来图来石定制（Personalized Jewelry ）</li>
						<li>. 彩色宝石（Gemstone）</li>
						<li>. GIA钻石（GIA Diamond）</li>
					</ul>
				</span>
          		<span class="tx-con">北京市海淀区远大路世纪金源购物中心<br>贵友大厦一层 宝珑珠宝定制中心</span><br>
          		<span class="tx-con">TEL: 010-88866632</span>
          		<!--<br><br><br>
          		<a href="http://m.bavlo.com"><img src="${ctx }/resources/images/LOGO_BM.png" border: 0; width="240" height="240" class="am-img-responsive" alt=""/></a>
          		<br>
          		<span class="tx-con">领先的珠宝定制品牌</span><br>
          		<span class="tx-con">BAVLO JEWELRY DESIGN STUDIO</span>
          --></figcaption>
          
    </figure>
  	<div data-am-sticky class="bottom">
	  <br>
		<a href="http://m.bavlo.com"><img src="${ctx }/resources/images/LOGO_BM.png" border: 0; width="120" height="120" class="am-img-responsive" alt=""/></a>
		<br><br><br>
	</div>
		
	<div data-am-sticky class="bottom">
		<span class="tx-con">领先的珠宝定制品牌</span><br>
		<span class="tx-con-en">BAVLO JEWELRY DESIGN STUDIO</span>
	</div>
  </body>
</html>
