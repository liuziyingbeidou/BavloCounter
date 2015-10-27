<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="expires" content="0"/>
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
		<meta http-equiv="description" content="This is my page"/>
		<link href="${ctx}/resources/css/orderlist.css" rel="stylesheet"
			type="text/css" />
		<script src="${ctx}/resources/js/showList.js" type="text/javascript"></script>
			<script src="${ctx}/resources/js/jquery-1.8.3.min.js"></script>
			<script src="${ctx}/resources/js/area.js"></script>
			<script src="${ctx}/resources/js/location.js"></script>
			<script src="${ctx}/resources/js/bavlo-initdata.js"></script>
			<script type="text/javascript">
			$(document).ready(function() {
				showLocation();
			});
			$(function initVal() {
				var customerName = "${customerDetail.vname}";
				var customerNickname = "${customerDetail.vnickname}";
				var customerEmail = "${customerDetail.vemail}";
				var customerPhone = "${customerDetail.vphoneCode}";
				if (customerName == "") {
					$("#vname").val("姓名");
				}
				if (customerNickname == "") {
					$("#vnickname").val("昵称");
				}
				if (customerEmail == "") {
					$("#vemail").val("邮箱");
				}
				if (customerPhone == "") {
					$("#vphoneCode").val("手机");
				}
			});
		</script>
	</head>

	<body>
		<form id="customer" action="saveOrUpdate.do" method="post">
			<jsp:include page="../header.jsp"></jsp:include>
			<jsp:include page="customerList.jsp"></jsp:include>
			<div class="edit_main">
				<div class="edit_left">
					<ul>
						<li>
							<a href="javascript:;" onclick="Pic2Show_Hidden(pic2)"><img
									src="${ctx}/resources/images/customer_01.png" /> </a>
						</li>
						<li>
							<a href="javascript:;" onclick="Pic2Show_Hidden(pic2)"><img
									src="${ctx}/resources/images/customer_02.png" /> </a>
						</li>
						<li class="focus">
							最后关注
							<br />
							2015-09-22
						</li>
						<div class="clear"></div>
					</ul>
					<div class="edit_btn">
						<div class="edit_1">
							<input type="hidden" id='id' name='id'
								value="${customerDetail.id }" />
							<input type='text' id='vname' name='vname'
								value="${customerDetail.vname }"
								onfocus="if(value =='姓名'){value =''}"
								onblur="if(value ==''){value='姓名'}'}" class="edit_2 edit_1_name" />
							<select name="vsex" class="edit_2 edit_1_area_son">
								<option>
									女
								</option>
								<option>
									男
								</option>
							</select>
							<div class="clear"></div>
						</div>
						<div class="edit_1">
							<input type='text' id='vphoneCode' name='vphoneCode'
								value="${customerDetail.vphoneCode}"
								onfocus="if(value=='手机'){value=''}"
								onblur="if(value==''){value='手机'}'}" class="edit_2 edit_1_name" />
							<input type='text' id='vemail' name='vemail'
								value="${customerDetail.vemail}"
								onfocus="if(value=='邮箱'){value=''}"
								onblur="if(value==''){value='邮箱'}'}" class="edit_2 edit_1_sex" />
							<div class="clear"></div>
						</div>
						<div class="edit_1">
							<input type='text' id='vnickname' name='vnickname'
								value="${customerDetail.vnickname}"
								onfocus="if(value =='昵称'){value =''}"
								onblur="if(value ==''){value='昵称'}'}" class="edit_2 edit_1_name" />
							<select id="vprovince" name="vprovince"
								class="edit_2 edit_1_area_son"></select>
							<div class="clear"></div>
						</div>
						<div class="edit_1">
							<select id="vcity" name="vcity" class="edit_2 edit_1_area"></select>
							<select id="vdistrict" name="vdistrict"
								class="edit_2 edit_1_area_son"></select>
							<input type="hidden" name="location_id" />
							<div class="clear"></div>
						</div>
						<div class="edit_1">
							<select name="select" class="edit_2 edit_1_area">
								<option>
									zh_CN
								</option>
								<option>
									en_US
								</option>
							</select>
							<select name="vgroup" class="edit_2 edit_1_area_son">
								<option>
									无分组
								</option>
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