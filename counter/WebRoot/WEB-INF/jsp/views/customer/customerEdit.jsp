<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>编辑客户</title>
<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.8.3.min.js"></script>
<link type='text/css' rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/style.css' media='all' />
<link type='text/css' rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/bootstrap.css' media='all' />
<script src="${pageContext.request.contextPath}/resources/js/top.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/hide.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/orderlist.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/resources/js/showList.js" type="text/javascript"></script>
</head>

<body>
<form id="customer" action="saveOrUpdate.do" method="post">
<div class="header">
	<div class="head2">
		<div class="top2">
			<b><a href="javascript:;" onclick="EditShow_Hidden(ed1)"><img src="${pageContext.request.contextPath}/resources/images/plus.png" /></a> 编辑客户 81812560 </b>
			<font><a href="javascript:;" onclick="Show_Hidden(tr1)"><img src="${pageContext.request.contextPath}/resources/images/plus.png" /></a></font>
		</div>
		<div class="hidden_enent2" id="tr1" style="display:none;">
			<ul>
				<li class="jian"><a href="javascript:;" onclick="Show_Hidden(tr1)">一</a></li>
				<li><a href="">定制单</a></li>
				<li><a href="">宝石签收单</a></li>
				<li><a href="">订单</a></li>
				<li><a href="">客户</a></li>
			</ul>
		</div>
		<div class="edit_hidden2" id="ed1" style="display:none;">
			<ul>
				<li class="jian2"><a href="javascript:;" onclick="EditShow_Hidden(ed1)">一</a></li>
				<li><a href="">Open</a></li>
				<li><a href="">Save</a></li>
				<li><a href="">Save as</a></li>
				<li><a href="">Print</a></li>			
			</ul>
		</div>
		<div class="clear"></div>
	</div>
</div>
<!--订单列表弹窗-->
	  <div class="orderlist" id='pic2' style=' display:none;'>
		<div class="order-main">
			<div class="order-list">订单列表 <a href="javascript:;" onclick="Pic2Show_Hidden(pic2)">X</a></div>
			<div class="search-1">
						<form action='' method='post'>
							<input type='text' name='search' class="search" value="搜索" onfocus="if(value =='搜索'){value =''}" onblur="if(value ==''){value='搜索'}"/>
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
												<img src="${pageContext.request.contextPath}/resources/images/customer_01.png"/>
												<b>${customerData.vname }</b><a href="">${customerData.vphoneCode }</a><span><a href="">选择</a>
												</span>
											</h4>
											<div class="list-item none">
												<dl>
													<dd>
														<img src="${pageContext.request.contextPath}/resources/images/good_01.png"/>
													</dd>
													<dd>
														<img src="${pageContext.request.contextPath}/resources/images/good_02.png"/>
													</dd>
													<dd>
														<img src="${pageContext.request.contextPath}/resources/images/good_03.png"/>
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
	  <!--订单列表弹窗END-->
<div class="edit_main">
    <div class="edit_left">
      <ul>
        <li><a href="javascript:;" onclick="Pic2Show_Hidden(pic2)"><img src="${pageContext.request.contextPath}/resources/images/customer_01.png" /></a></li>
        <li><a href="../customer/getList.do"><img src="${pageContext.request.contextPath}/resources/images/customer_02.png" /></a></li>
        <li class="focus">最后关注<br/>2015-09-22</li>
        <div class="clear"></div>
      </ul>
      <div class="edit_btn">
        <div class="edit_1">
          <input type='text' name='vname' value="姓名" onfocus="if(value =='姓名'){value =''}" onblur="if(value ==''){value='姓名'}" class="edit_2 edit_1_name" />
          <select name="vsex" class="edit_2 edit_1_area_son">
            <option>女</option>
            <option>男</option>
          </select>
          <div class="clear"></div>
        </div>
        <div class="edit_1">
          <input type='text' name='vphoneCode' value="手机" onfocus="if(value =='手机'){value =''}" onblur="if(value ==''){value='手机'}" class="edit_2 edit_1_name" />
          <input type='text' name='vemail' value="邮箱" onfocus="if(value =='邮箱'){value =''}" onblur="if(value ==''){value='邮箱'}" class="edit_2 edit_1_sex" />
          <div class="clear"></div>
        </div>
        <div class="edit_1">
          <input type='text' name='vnickname' value="昵称" onfocus="if(value =='昵称'){value =''}" onblur="if(value ==''){value='昵称'}" class="edit_2 edit_1_name" />
          <select name="vcountry" class="edit_2 edit_1_area_son">
            <option>中国</option>
          </select>
          <div class="clear"></div>
        </div>
        <div class="edit_1">
          <select name="vprovince" class="edit_2 edit_1_area">
            <option>北京</option>
            <option>天津</option>
          </select>
          <select name="vdistrict" class="edit_2 edit_1_area_son">
            <option>海淀</option>
          </select>
          <div class="clear"></div>
        </div>
        <div class="edit_1">
          <select name="select" class="edit_2 edit_1_area">
            <option>zh_CN</option>
            <option>en_US</option>
          </select>
          <select name="vgroup" class="edit_2 edit_1_area_son">
            <option>无分组</option>
          </select>
          <div class="clear"></div>
        </div>
        <div class="edit_save">
          <input type='submit' name='' value='保存' class="" />
        </div>
      </div>
    </div>
</div>
</form>
</body>
</html>