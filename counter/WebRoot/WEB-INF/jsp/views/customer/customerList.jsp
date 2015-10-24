<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!--订单列表弹窗-->
			<div class="orderlist" id='pic2' style='display: none;'>
				<div class="order-main">
					<div class="order-list">
						订单列表
						<a href="javascript:;" onclick="Pic2Show_Hidden(pic2)">X</a>
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
										<c:forEach var="customerList" items="${customerList }">
											<li>
												<h4>
													<img
														src="${ctx}/resources/images/customer_01.png" />
													<b>${customerList.vname }</b><a href="">${customerList.vphoneCode
														}</a><span><a href="${ctx}/customer/info.do?id=${customerList.id}">选择</a> </span>
												</h4>
												<div class="list-item none">
													<dl>
														<dd>
															<img
																src="${ctx}/resources/images/good_01.png" />
														</dd>
														<dd>
															<img
																src="${ctx}/resources/images/good_02.png" />
														</dd>
														<dd>
															<img
																src="${ctx}/resources/images/good_03.png" />
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
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--订单列表弹窗END-->