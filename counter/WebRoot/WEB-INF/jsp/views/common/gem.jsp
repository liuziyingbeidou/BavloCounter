<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>库选宝石</title>
<script language="javascript" type="text/javascript"
	src="${ctx}/resources/js/jquery-1.9.1.min.js"></script>
<link type='text/css' rel='stylesheet'
	href='${ctx}/resources/css/style.css' media='all' />
<link type='text/css' rel='stylesheet'
	href='${ctx}/resources/css/bootstrap.css' media='all' />
<!-- 自定义 -->
<script src="${ctx}/resources/js/bavlo-event.js"></script>
<!-- 远程数据初始下拉框值 -->
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
				}, "宝石类型");

		//形状下拉框
		initShapeByType();
		//规格下拉框
		initSpecByTypeShape();
		
		//类型和形状改变
/* 		$("#gemTypeId").change(function() {
			initShapeByType();
		});
		$("#gemShapeId").change(function() {
			initSpecByTypeShape();
		});
 */
		 $("#gemTypeId").bind("change",initShapeByType);
		 $("#gemShapeId").bind("change",initSpecByTypeShape);
		 $("#gemSpecId").bind("change",loadGem);
		 
		//确定 
		$(".ok").click(function(){
			var v=$(".gem_img_sel");
			 if(v.length==0){
				alert("请选择宝石!");
				return ;
			}
			if(isExitsFunction(window.parent.setValueByFrame)){
				var sname = $("gemTypeId").find("option:selected").text()+" "+ $("#gemShapeId").find("option:selected").text()+" "+$("#gemSpecId").find("option:selected").text();
				var sid = $("#gemTypeId").find("option:selected").val()+ $("#gemShapeId").find("option:selected").val()+$("#gemSpecId").find("option:selected").val();
				var json = "{\"sname\":\""+sname+"\",\"sid\":\""+sid+"\"}";
				window.parent.setValueByFrame("gem","",callbackMuilt(),json,v);
			}else{
				alert("请在父窗口添加setValueByFrame(type,id,json){处理逻辑}type='gem']");
			}
		
		});
		
	});
	

	//初始化形状下拉框值
	function initShapeByType() {
		var gemTypeId = $("#gemTypeId").val();

		var shapeUrl = "http://www.bavlo.com/getGemShape?typeId=" + gemTypeId;
		loadSelData(nativeUrl, shapeUrl, "gemShapeId", "data[i].id",
				"data[i].shape_cn", function() {
					$("#gemShapeId").val("${useGemDetail['vshape']}");
				}, "宝石形状");
	}

	//初始化规格下拉框值
	function initSpecByTypeShape() {
		var gemTypeId = $("#gemTypeId").val();
		var gemShapeId = $("#gemShapeId").val();

		var specUrl = "http://www.bavlo.com/getGemCalibrated?typeId="
				+ gemTypeId + "&shapeId=" + gemShapeId;
		loadSelData(nativeUrl, specUrl, "gemSpecId", "data[i].id",
				"data[i].size", function() {
					$("#gemSpecId").val("${useGemDetail['vspec']}");
				}, "宝石规格");
	}

	
	
	function loadGem() {
		var type = $("#gemTypeId").val();
		var shape = $("#gemShapeId").val();
		var calibrated = $("#gemSpecId").val();
		var specUrl = "http://www.bavlo.com/styles/loadGem?typeId="
			+ type + "&shapeId=" + shape + "&calibratedId=" + calibrated;
		loadGemImg(nativeUrl, specUrl);
	}
</script>

</head>

<body>
	<div id="kxbs">
		<div id='kxs'>
			<div class="kxbs-in">
				<div id="choose">
					<h3>库选宝石</h3>
					<select name="gemTypeId" id="gemTypeId">
						<option value="-1">请选择</option>
					</select>
				</div>
				<div id="choose">
					<select name="gemShapeId" id="gemShapeId">
						<option value="-1">请选择</option>
					</select>
				</div>
				<div id="choose">
					<select name="gemSpecId" id="gemSpecId">
						<option value="-1">请选择</option>
					</select>
				</div>
				<div  class="gem_sel_h"></div>
	        	<div class="clear"></div>
				<input type="button" name="button" value="OK" class="ok">
			</div>
		</div>
	</div>
</body>
</html>
