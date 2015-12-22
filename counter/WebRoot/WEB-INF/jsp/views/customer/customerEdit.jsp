<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
		<META HTTP-EQUIV="expires" CONTENT="0">
		<title>编辑客户</title>
<!--必要样式-->
<link rel='stylesheet' href='${ctx}/resources/css/style.css' media='all' />
<link rel='stylesheet' href='${ctx}/resources/css/bootstrap.css' media='all' />
<link rel="stylesheet" href="${ctx}/resources/css/photoswipe.css" />
<link rel="stylesheet" href="${ctx}/resources/css/default-skin.css" />

<script src="${ctx}/resources/js/jquery-1.8.3.min.js"></script>
<script src="${ctx}/resources/js/top.js"></script>
<script src="${ctx}/resources/js/hide.js"></script>

<link href="${ctx}/resources/css/orderlist.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/resources/js/showList.js" type="text/javascript"></script>
<script src="${ctx}/resources/cityselect/area_cus.js"></script>
<script src="${ctx}/resources/js/bavlo-initdata.js"></script>
<!-- 自定义event	 -->
<script src="${ctx}/resources/js/bavlo-event.js"></script>
<!-- 弹框 -->
<!-- jQuery & jQuery UI files (needed)--> 
<link rel="stylesheet" href="${ctx}/resources/jquery.multiDialog/css/jquery-ui-1.10.3.custom.css" />
<script src="${ctx}/resources/jquery.multiDialog/js/jquery/jquery-ui-1.10.3.custom.js"></script> 
<!-- MultiDialog files (needed) --> 
<link rel="stylesheet" href="${ctx}/resources/jquery.multiDialog/css/jquery.multiDialog.css" /> 
<script src="${ctx}/resources/jquery.multiDialog/js/jquery.ui.dialog.extended-1.0.2.js"></script> 
<script src="${ctx}/resources/jquery.multiDialog/js/jquery.multiDialog.js"></script> 
<script src="${ctx}/resources/js/bavlo-dialog.js"></script>
		<script type="text/javascript">
		var s=["vprovince","vcity","vdistrict"];//三个select的name
		var opt0 = ["省份","城市","区县"];//初始值
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
/*				if (customerName == "") {
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
				}*/
				//城市联动
				change(0);
				$("#vprovince").bind("change",function(){
					change(1);
				});
				$("#vcity").bind("change",function(){
					change(2);
				});
				if (customerId != "") {
					/*$("#vprovince").val(customerProvince);
					$("#vprovince").change();
					$("#vcity").val(customerCity);
					$("#vcity").change();
					$("#vdistrict").val(customerDistricte);*/
					$("#vprovince").val(customerProvince);
					$("#vprovince").change();
					$("#vcity").val(customerCity);
					$("#vcity").change();
					$("#vprovince").val(customerProvince);
					$("#vcity").val(customerCity);
					$("#vdistrict").val(customerDistricte);
					$("#vsex").val(customerSex);
					$("#vlanguage").val(customerLanguage);
					$("#vgroup").val(customerGroup);
				}
				
				$(".customer-edit").click(function(){
					openURL("${ctx}/customer/list.do?listType=menu","客户列表",470,535);
				});
			});
			// 保存
			function saveOrUpdate() {
				if(!ckLose("edit_btn","lose-cus")){
					return;
				}
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
			
		//子窗体调用
		function setValueByFrame(type,id,callback,json){
			var url;
			if(type == "customer"){
				url = "${ctx}/customer/infoJson.do";
				$.get(url,{id:id},function(data){
					if(data != null){
						if(data.vhendimgurl != ""){
							$(".cusheader").prop("src",data.vhendimgurl);
						}
						$("#customerId").val(data.id);
					}
					closeMultiDlg();
				});
			}else if(type == "chain"){
				var data = JSON.parse(json);
				$("#order-list").append("<dd type='ch' sid='"+data.sid+"' class='"+data.sid+" bill'><span class='list_name bill-name'>"+data.sname+"</span><input class='list_num bill-num' style='width:40px;margin-left:10px;' type='text' value='1' placeholder='条'><b class='list_price bill-price'>"+data.sprice+"</b><a href='javascript:rlist("+data.sid+")' class='close_c'><img src='${ctx}/resources/images/close.png'></a></dd>");
				closeMultiDlg();
			}else if(type == "order"){
				url = "${ctx}/order/edit.do?id="+id;//根据id查询订单信息
				window.location = url;
			}else if(type == "order-view"){
				url = "${ctx}/order/view.do?id="+id;//根据id查询订单信息
				window.location = url;
			}else if(type == "gem"){
				url = "${ctx}/gem-sign/view.do?id="+id;//根据id查询宝石信息
				window.location = url;
			}else if(type == "entity"){
				url = "${ctx}/entity-sign/view.do?id="+id;//根据id查询实物信息
				window.location = url;
			}else if(type == "customer-menu"){
				url = "${ctx}/customer/info.do?id="+id;//根据id查询客户信息
				window.location = url;
			}else if(type == "custom"){
				url = "${ctx}/custom/edit.do?id="+id;//根据id款式单信息
				window.location = url;
			}else if(type == "custom-view"){
				url = "${ctx}/custom/detail.do?id="+id;//根据id显示款式单信息
				window.location = url;
			}
		}
		</script>
		<style type="text/css">
		.edit_hidden2 { width:110px; position:relative; top:10px; left:-15px; z-index:9999}
		.hidden_enent2 { width:110px; position:relative; top:10px; right:-243px; z-index:9999}
		</style>
	</head>

	<body>
		<form id="customer">
		<input type="hidden" id="pageAttr" value="CUST"/>
		<input type="hidden" name='vserviceCode' value="${customerDetail.vserviceCode }" />
<header class="demo-bar">
	<h1>
		${pageOrderType}客户
			<c:choose>
						 <c:when test="${empty customerDetail['vcustomerCode']}">   
						 ${number }
						 <input type="hidden" id="orderCode" name="vcustomerCode" value="${number }" />
						 </c:when>
						 <c:otherwise>
						 ${customerDetail['vcustomerCode']}
						 <input type="hidden" id="orderCode" name="vcustomerCode" value="${customerDetail['vcustomerCode']}" />
						 </c:otherwise>	
			</c:choose> 
	</h1>
</header>
<jsp:include page="../header.jsp"></jsp:include>
<div class="header" style="display:none;">
	<div class="head2">
		<div class="top2">
			<b><a href="#" onclick="EditShow_Hidden(ed1)"><img
						src="${ctx}/resources/images/plus.png" />
			</a> ${pageOrderType}客户
			<c:choose>
						 <c:when test="${empty customerDetail['vcustomerCode']}">   
						 ${number }
						 <input type="hidden" id="orderCode" name="vcustomerCode" value="${number }" />
						 </c:when>
						 <c:otherwise>
						 ${customerDetail['vcustomerCode']}
						 <input type="hidden" id="orderCode" name="vcustomerCode" value="${customerDetail['vcustomerCode']}" />
						 </c:otherwise>	
			</c:choose> 
			</b>
			<font><a href="javascript:;" onclick="Show_Hidden(tr1)"><img
						src="${ctx}/resources/images/plus.png" />
			</a> </font>
		</div>
		<div class="hidden_enent2" id="tr1" style="display: none;">
			<ul>
				<li class="jian">
					<a href="javascript:;" onclick="Show_Hidden(tr1)">一</a>
				</li>
				<jsp:include page="../menu_pg.jsp"></jsp:include>
			</ul>
		</div>
		<div class="edit_hidden2" id="ed1" style="display: none;">
			<ul>
				<li class="jian2">
					<a href="javascript:;" onclick="EditShow_Hidden(ed1)">一</a>
				</li>
				<jsp:include page="../menu_cau.jsp"></jsp:include>
			</ul>
		</div>
		<div class="clear"></div>
	</div>
</div>
			<div class="edit_main">
				<div class="edit_left">
					<ul>
						<li>
							<a href="#"><img
									src="${ctx}/resources/images/customer_01.png" /> </a>
						</li>
						<li class="customer-edit">
							<a href="#"><img
									src="${ctx}/resources/images/customer_02.png" /> </a>
						</li>
						<li class="focus">
							最后关注
							<br />
							${customerDetail.vsubscribeTime }
						</li>
						<div class="clear"></div>
					</ul>
					<div class="edit_btn">
						<div class="edit_1">
							<input type="hidden" id='customerid' class="tableId tocustomerId" name='id'
								value="${customerDetail.id }" />
							<input type='text' id='vname' name='vname'
								value="${customerDetail.vname }"
								placeholder="姓名" class="edit_2 edit_1_name bl-ck-null lose-cus" />
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
								placeholder="手机" class="edit_2 edit_1_name bl-ck-null lose-cus" />
							<input type='text' id='vemail' name='vemail'
								value="${customerDetail.vemail}"
								placeholder="邮箱" class="edit_2 edit_1_sex" />
							<div class="clear"></div>
						</div>
						<div class="edit_1">
							<input type='text' id='vnickname' name='vnickname'
								value="${customerDetail.vnickname}"
								placeholder="昵称" class="edit_2 edit_1_name" />
							<select id="vprovince" name="vprovince"
								class="edit_2 edit_1_area_son"></select>
							<div class="clear"></div>
						</div>
						<div class="edit_1">
							<select id="vcity" name="vcity" class="edit_2 edit_1_area lose-cus"></select>
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