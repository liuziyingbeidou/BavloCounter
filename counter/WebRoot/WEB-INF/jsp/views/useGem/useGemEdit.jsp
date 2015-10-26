<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>编辑配石单</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script src="${ctx}/resources/js/jquery-1.8.3.min.js"></script>
		<!-- 定义JS -->
		<script src="${ctx}/resources/js/bavlo-initdata.js"></script>

		<script type="text/javascript">
	//本地webservice
	var nativeUrl = "${pageScope.basePath}/counter/webservice/http.do";
	$(function() {
		//宝石类型下拉框值
		var typeUrl = "http://www.bavlo.com/getAllGemType";
		loadSelData(nativeUrl, typeUrl, "gemTypeId", "data[i].id",
				"data[i].type_cn", function() {
					$("#gemTypeId").val("${useGemDetail['vtype']}");
				});

		//宝石形状下拉框值
		var shapeUrl = "http://www.bavlo.com/getAllGemShape";
		loadSelData(nativeUrl, shapeUrl, "gemShapeId", "data[i].id",
				"data[i].shape_cn", function() {
					$("#gemShapeId").val("${useGemDetail['vshape']}");
				});

		//规格下拉框
		initSpecByTypeShape();

		//类型和形状改变
		$("#gemTypeId").change(function() {
			initSpecByTypeShape();
		});
		$("#gemShapeId").change(function() {
			initSpecByTypeShape();
		});
		/**
		 *$(document).ajaxStop(function () {setNowSelData(); });
		 **/

	});

	//初始化规格下拉框值
	function initSpecByTypeShape() {
		var gemTypeId = $("#gemTypeId").val();
		var gemShapeId = $("#gemShapeId").val();
		if (gemTypeId == "-1") {
			gemTypeId = "${useGemDetail['vtype']}";
		}
		if (gemShapeId == "-1") {
			gemShapeId = "${useGemDetail['vshape']}";
		}
		var specUrl = "http://www.bavlo.com/getGemCalibrated?typeId="
				+ gemTypeId + "&shapeId=" + gemShapeId;
		loadSelData(nativeUrl, specUrl, "gemSpecId", "data[i].id",
				"data[i].size", function() {
					$("#gemSpecId").val("${useGemDetail['vspec']}");
				});
	}

	//宝石签收单保存
	function save() {
		$.ajax({
			type : "POST",
			url : "save.do",
			data : $('#entityfrmId').serialize(),// formid
			async : false,
			cache : false,
			success : function(data) {
				$("#gemid").val(data.id);
				alert("保存成功!");
			},
			error : function(e) {
				alert("保存失败!");
			}
		});
	}
</script>
<script type="text/javascript">
			function initVal() {
				var useGemWorth = "${useGemDetail['nworth']}";
				var useGemWeigth = "${useGemDetail['nweight']}";
				var useGemCount = "${useGemDetail['icount']}";
				if (useGemWorth == "") {
					$("#nworth").val("价值（元）");
				}
				if (useGemWeigth == "") {
					$("#nweight").val("重量（克拉）");
				}
				if (useGemCount == "") {
					$("#icount").val("数量（颗）");
				}
			}
			window.onload = function() {
				initVal();
			}
</script>
	</head>

	<body>
		<form id="useGem">
			<jsp:include page="../header.jsp"></jsp:include>
			<jsp:include page="useGemList.jsp"></jsp:include>
			<div class="qsd">
				<div class="qsd_main">
					<div class="qsd_left">
						<div class="peishi">
							<img src="${ctx}/resources/images/zb_09.png">
							<ul>
								<li>
									名称：钻石
								</li>
								<li>
									形状：垫形
								</li>
								<li>
									重量：3.35
								</li>
								<li>
									颜色：H
								</li>
								<li>
									净度：IF
								</li>
								<li>
									规格：6.51x6.48x4.69
								</li>
								<li>
									参考价：70元/ct
								</li>
								<li>
									数量：1
								</li>
								<div class="clear"></div>
							</ul>
							<dt>
								定制单号：
								<a href="javascript:;" onclick="Pic2Show_Hidden(pic2)">123123</a>
							</dt>
						</div>
					</div>
					<div class="qsd_right">
						<div class="qsd_right_1">
							<select name="vtype" class="qsdr r1" id="gemTypeId">
								<option value="-1">
									请选择
								</option>
							</select>
							<dt>
								<input type='text' name='nworth' class="qsdr r2"
									value="${useGemDetail['nworth']}"
									onfocus="if(value=='价值（元）'){value=''}"
									onblur="if(value==''){value='价值（元）'}">
							</dt>
							<div class="clear"></div>
						</div>
						<div class="qsd_right_1">
							<select name="vshape" class="qsdr r1" id="gemShapeId">
								<option value="-1">
									请选择
								</option>
							</select>
							<dt>
								<input type='text' name='nweight' class="qsdr r2"
									value="${useGemDetail['nweight']}"
									onfocus="if(value=='重量（克拉）'){value=''}"
									onblur="if(value==''){value='重量（克拉）'}">
							</dt>
							<div class="clear"></div>
						</div>
						<div class="qsdtt">
							<select name="vspec" class="qsdt" id="gemSpecId">
								<option value="-1">
									请选择
								</option>
							</select>
						</div>
						<div class="clear"></div>
						<div class="qsdtt">
							<input type='text' name='icount'
								value="${useGemDetail['icount']}"
								onfocus="if(value=='数量（颗粒）'){value=''}"
								onblur="if(value==''){value='数量（颗）'}" class="qsdn t3">
						</div>
						<div class="qssm-l">
							<textarea name="vmemo" cols="" rows="" class="qssm"
								value="${useGemDetail['vmemo']}"
								onfocus="if(value=='说明：'){value=''}"
								onblur="if(value==''){value='说明：'}">说明：</textarea>
						</div>
						<div class="qs_save">
							<input type="button" name="button" onclick="javascript:save()"
								value="保存">
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</form>
	</body>
</html>
