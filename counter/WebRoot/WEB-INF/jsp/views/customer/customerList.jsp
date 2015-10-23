<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>客户列表</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
		<link rel="stylesheet" type="text/css" href="styles.css">
		-->
		<script src="${pageContext.request.contextPath}/resources/js/top.js"></script>

		<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
		<link href="${pageContext.request.contextPath}/resources/css/orderlist.css" rel="stylesheet" type="text/css" />
		<script src="${pageContext.request.contextPath}/resources/js/showList.js" type="text/javascript"></script>
	</head>

	<body>
		<div id="orderlist">
			<div class="orderlist">
				<div class="order-main">
					<div class="order-list">
						订单列表         	 X
					</div>
					<div class="search-1">
						<form action='' method='post'>
							<input type='text' name='search' class="search" value="搜索" onfocus="if(value =='搜索'){value =''}" onblur="if(value ==''){value='搜索'}">
						</form>
					</div>
					<div class="">
						<div class="main1 content">
							<div class="left-sider">
								<div class="operate">
									<ul id="juheweb">
									<c:forEach var="customerData" items="${customer }">
										<li>
											<h4>
												<img src="${pageContext.request.contextPath}/resources/images/customer_01.png">
												<b>${customerData.vname }</b><a href="">${customerData.vphoneCode }</a><span><a href="">选择</a>
												</span>
											</h4>
											<div class="list-item none">
												<dl>
													<dd>
														<img src="${pageContext.request.contextPath}/resources/images/good_01.png">
													</dd>
													<dd>
														<img src="${pageContext.request.contextPath}/resources/images/good_02.png">
													</dd>
													<dd>
														<img src="${pageContext.request.contextPath}/resources/images/good_03.png">
													</dd>
												</dl>
												<div class="clear"></div>
												<dt>
													报价：
													<b>36700元</b> 已付：
													<b>10000元</b> 未付：
													<b>26700元</b> 实收：—
												</dt>
											</div>
											<div class="clear"></div>
										</li>
										</c:forEach>
									</ul>
									<script type="text/javascript" language="javascript">
	navList(12);
</script>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>