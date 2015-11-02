<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>配石单列表</title>
<script language="javascript" type="text/javascript"
	src="${ctx}/resources/js/jquery-1.8.3.min.js"></script>
<script src="${ctx}/resources/js/top.js"></script>
<link href="${ctx}/resources/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="${ctx}/resources/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<link href="${ctx}/resources/css/orderlist.css" rel="stylesheet"
	type="text/css" />
<script src="${ctx}/resources/js/showList.js" type="text/javascript"></script>
</head>

<body>
	<!--配石单列表弹窗-->
	<div class="orderlist" id='pic2'>
		<div class="order-main">
			<div class="order-list">
				配石单列表 
			</div>
			<div class="search-1">
				<input type='text' name='search' class="search" value="搜索"
					onfocus="if(value =='搜索'){value =''}"
					onblur="if(value ==''){value='搜索'}" />
			</div>
			<div class="">
				<div class="main1 content">
					<div class="left-sider">
						<div class="operate">
							<ul id="juheweb">
								<c:forEach var="useGemList" items="${useGemList }">
									<li>
										<h4>
											<img src="${ctx}/resources/images/customer_01.png" /> <b>${useGemList.vtype }</b><a
												href="">${useGemList.vshape
														}</a><span><a
												href="${ctx}/useGem/info.do?id=${useGemList.id}">选择</a> </span>
										</h4>
										<div class="list-item none">
											<dl>
												<dd>
													<img src="${ctx}/resources/images/good_01.png" />
												</dd>
												<dd>
													<img src="${ctx}/resources/images/good_02.png" />
												</dd>
												<dd>
													<img src="${ctx}/resources/images/good_03.png" />
												</dd>
											</dl>
											<div class="clear"></div>
											<dt>
												报价： <b>36700元</b> 已付： <b>10000元</b> 未付： <b>26700元</b> 实收：—
											</dt>
										</div>
										<div class="clear"></div>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--配石单列表弹窗END-->
</body>
</html>