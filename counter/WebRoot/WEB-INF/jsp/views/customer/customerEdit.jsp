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
		<title>编辑客户</title>
		<script type="text/javascript">
			function initVal() {
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
			}
			window.onload = function() {
				initVal();
			}
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
									src="${ctx}/resources/images/customer_01.png" />
							</a>
						</li>
						<li>
							<a href="javascript:;" onclick="Pic2Show_Hidden(pic2)"><img
									src="${ctx}/resources/images/customer_02.png" />
							</a>
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
							<input type="hidden" id='id' name='id' value="${customerDetail.id }" />
							<input type='text' id='vname' name='vname'
								value="${customerDetail.vname }"
								onfocus="if(value =='${customerDetail.vname }'||value =='姓名'){value =''}"
								onblur="if(value ==''){if('${customerDetail.vname }'==''){value='姓名'}else{value='${customerDetail.vname }'}}"
								class="edit_2 edit_1_name" />
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
								onfocus="if(value =='${customerDetail.vphoneCode}'||value =='手机'){value =''}"
								onblur="if(value ==''){if('${customerDetail.vphoneCode }'==''){value='手机'}else{value='${customerDetail.vphoneCode }'}}"
								class="edit_2 edit_1_name" />
							<input type='text' id='vemail' name='vemail'
								value="${customerDetail.vemail}"
								onfocus="if(value =='${customerDetail.vemail}'||value =='邮箱'){value =''}"
								onblur="if(value ==''){if('${customerDetail.vemail }'==''){value='邮箱'}else{value='${customerDetail.vemail }'}}"
								class="edit_2 edit_1_sex" />
							<div class="clear"></div>
						</div>
						<div class="edit_1">
							<input type='text' id='vnickname' name='vnickname'
								value="${customerDetail.vnickname}"
								onfocus="if(value =='${customerDetail.vnickname}'||value =='昵称'){value =''}"
								onblur="if(value ==''){if('${customerDetail.vnickname }'==''){value='昵称'}else{value='${customerDetail.vnickname }'}}"
								class="edit_2 edit_1_name" />
							<select name="vcountry" class="edit_2 edit_1_area_son">
								<option>
									中国
								</option>
							</select>
							<div class="clear"></div>
						</div>
						<div class="edit_1">
							<select name="vprovince" class="edit_2 edit_1_area">
								<option>
									北京
								</option>
								<option>
									天津
								</option>
							</select>
							<select name="vdistrict" class="edit_2 edit_1_area_son">
								<option>
									海淀
								</option>
							</select>
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