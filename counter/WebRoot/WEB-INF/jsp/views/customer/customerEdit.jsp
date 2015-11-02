<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport"
			content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />

		<title>编辑客户</title>

		<script src="${ctx}/resources/js/jquery-1.8.3.min.js"></script>
		<script src="${ctx}/resources/js/area.js"></script>
		<script src="${ctx}/resources/js/location.js"></script>
		<script src="${ctx}/resources/js/bavlo-initdata.js"></script>
		<script type="text/javascript">
			$(function initVal() {
				var customerId = "${customerDetail.id}";
				var customerName = "${customerDetail.vname}";
				var customerNickname = "${customerDetail.vnickname}";
				var customerEmail = "${customerDetail.vemail}";
				var customerPhone = "${customerDetail.vphoneCode}";
				var customerProvince = "${customerDetail.vprovince}";
				var customerCity = "${customerDetail.vcity}";
				var customerDistricte = "${customerDetail.vdistrict}";
				var customerSex = "${customerDetail.vsex}";
				var customerLanguage = "${customerDetail.vlanguage}";
				var customerGroup = "${customerDetail.vgroup}";
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
				showLocation();
				if (customerId != "") {
					$("#vprovince").val(customerProvince);
					$("#vprovince").change();
					$("#vcity").val(customerCity);
					$("#vcity").change();
					$("#vdistrict").val(customerDistricte);
					$("#vsex").val(customerSex);
					$("#vlanguage").val(customerLanguage);
					$("#vgroup").val(customerGroup);
				}
			});
			// 保存
			function saveOrUpdate() {
				$.ajax({
					type : "POST",
					url : "saveOrUpdate.do",
					data : $('#customer').serialize(),// formid
					async : false,
					cache : false,
					success : function(data) {
						$("#customerid").val(data.id);
						alert("保存成功!");
					},
					error : function(e) {
						alert("保存失败!");
					}
				});
			}
		</script>
	</head>

	<body>
		<form id="customer">
			<jsp:include page="../header.jsp"></jsp:include>
			<div class="edit_main">
				<div class="edit_left">
					<ul>
						<li>
							<a href="getList.do"><img
									src="${ctx}/resources/images/customer_01.png" /> </a>
						</li>
						<li>
							<a href="getList.do"><img
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
							<input type="hidden" id='customerid' name='id'
								value="${customerDetail.id }" />
							<input type='text' id='vname' name='vname'
								value="${customerDetail.vname }"
								onfocus="if(value =='姓名'){value =''}"
								onblur="if(value ==''){value='姓名'}" class="edit_2 edit_1_name" />
							<select id="vsex" name="vsex" class="edit_2 edit_1_area_son">
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
								onblur="if(value==''){value='手机'}" class="edit_2 edit_1_name" />
							<input type='text' id='vemail' name='vemail'
								value="${customerDetail.vemail}"
								onfocus="if(value=='邮箱'){value=''}"
								onblur="if(value==''){value='邮箱'}" class="edit_2 edit_1_sex" />
							<div class="clear"></div>
						</div>
						<div class="edit_1">
							<input type='text' id='vnickname' name='vnickname'
								value="${customerDetail.vnickname}"
								onfocus="if(value =='昵称'){value =''}"
								onblur="if(value ==''){value='昵称'}" class="edit_2 edit_1_name" />
							<select id="vprovince" name="vprovince"
								class="edit_2 edit_1_area_son"></select>
							<div class="clear"></div>
						</div>
						<div class="edit_1">
							<select id="vcity" name="vcity" class="edit_2 edit_1_area"></select>
							<select id="vdistrict" name="vdistrict"
								class="edit_2 edit_1_area_son"></select>
							<div class="clear"></div>
						</div>
						<div class="edit_1">
							<select id="vlanguage" name="vlanguage" class="edit_2 edit_1_area">
								<option>
									zh_CN
								</option>
								<option>
									en_US
								</option>
							</select>
							<select id="vgroup" name="vgroup" class="edit_2 edit_1_area_son">
								<option>
									分组一
								</option>
								<option>
									分组二
								</option>
							</select>
							<div class="clear"></div>
						</div>
						<div class="edit_save">
							<input type="button" name="button" onclick="javascript:saveOrUpdate()"
								value="保存"/>
						</div>
					</div>
				</div>
			</div>
		</form>
	</body>
</html>