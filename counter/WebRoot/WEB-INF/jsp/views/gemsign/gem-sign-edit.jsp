<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>${pageGemType}宝石签收单</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
		<script src="${ctx}/resources/js/jquery-1.8.3.min.js"></script>
		<link type='text/css' rel='stylesheet' href='${ctx}/resources/css/style.css' media='all' />
		<link type='text/css' rel='stylesheet' href='${ctx}/resources/css/bootstrap.css' media='all' />
		<script src="${ctx}/resources/js/top.js"></script>
		
		<!-- 定义JS -->
		<script src="${ctx}/resources/js/bavlo-initdata.js"></script>
		<script src="${ctx}/resources/js/bavlo-event.js"></script>
		
		<!-- 弹框 -->
		<!-- jQuery & jQuery UI files (needed)--> 
		<link rel="stylesheet" href="/counter/resources/jquery.multiDialog/css/jquery-ui-1.10.3.custom.css">
		<script src="/counter/resources/jquery.multiDialog/js/jquery/jquery-ui-1.10.3.custom.js"></script> 
		<!-- MultiDialog files (needed) --> 
		<link rel="stylesheet" href="/counter/resources/jquery.multiDialog/css/jquery.multiDialog.css"> 
		<script src="/counter/resources/jquery.multiDialog/js/jquery.ui.dialog.extended-1.0.2.js"></script> 
		<script src="/counter/resources/jquery.multiDialog/js/jquery.multiDialog.js"></script> 
		<script src="/counter/resources/js/bavlo-dialog.js"></script>
		<script type="text/javascript">
		//本地webservice
		var nativeUrl = "${pageScope.basePath}/counter/webservice/http.do";
		$(function() {
			//宝石类型下拉框值
			var typeUrl = "http://www.bavlo.com/getAllGemType";
			loadSelData(nativeUrl, typeUrl, "gem-type-id", "data[i].id",
					"data[i].type_cn", function() {
						$("#gem-type-id").val("${gemvo['vtype']}");
					},"选宝石");
			
			//形状下拉框
			initShapeByType();
			//规格下拉框
			initSpecByTypeShape();
	
			//类型和形状改变
			$("#gem-type-id").change(function() {
				initShapeByType();
			});
			$("#gem-shape-id").change(function() {
				initSpecByTypeShape();
			});
			/**
			 *$(document).ajaxStop(function () {setNowSelData(); });
			 **/
			 //上传图片
			 $(".gem-upload").bind("click",function(){
			 		openURL("${ctx}/upload/uppage.do","上传图片");
			 });
			 //图片显示
			 $(".gem-pic-show").bind("click",function(){
			 	var mid = $(".mid").val();
			 	if(mid == ""){
			 		alert("请保存后查看!");
			 	}else{
			 		openURL("${ctx}/upload/showpic.do?id="+mid,"图片展示");
			 	}
			 });
		});
		
		//初始化形状下拉框值
		function initShapeByType() {
			var gemTypeId = $("#gem-type-id").val();
			if (gemTypeId == "-1") {
				gemTypeId = "${gemvo['vtype']}";
			}
			var shapeUrl = "http://www.bavlo.com/getGemShape?typeId="+ gemTypeId;
			loadSelData(nativeUrl, shapeUrl, "gem-shape-id", "data[i].id",
					"data[i].shape_cn", function() {
						$("#gem-shape-id").val("${gemvo['vshape']}");
					},"选形状");
		}
		
		//初始化规格下拉框值
		function initSpecByTypeShape() {
			var gemTypeId = $("#gem-type-id").val();
			var gemShapeId = $("#gem-shape-id").val();
			if (gemTypeId == "-1") {
				gemTypeId = "${gemvo['vtype']}";
			}
			if (gemShapeId == "-1") {
				gemShapeId = "${gemvo['vshape']}";
			}
			var specUrl = "http://www.bavlo.com/getGemCalibrated?typeId="
					+ gemTypeId + "&shapeId=" + gemShapeId;
			loadSelData(nativeUrl, specUrl, "gem-spec-id", "data[i].id",
					"data[i].size", function() {
						$("#gem-spec-id").val("${gemvo['vspec']}");
					},"选规格");
		}
		
		
		//宝石签收单保存
		function save(){
			//价值
	    	clearSuffix("gem-worth","元");
	    	//重量
	    	clearSuffix("gem-weight","克");
	    	//数量
	    	clearSuffix("gem-count","颗");
	    	
			var bvo = JSON.stringify($('#gemfrmBId').serializeJson());
			$.ajax({
			     type : "POST",
			     url : "save.do",
			     data:$('#gemfrmId').serialize()+"&bvo="+bvo,// formid
			     async:false,
			     cache:false,
			     success : function(data) {
			     	 $("#gemid").val(data.id);
			     	 //价值
			    	 initSuffix("gem-worth","元");
			    	 //重量
			    	 initSuffix("gem-weight","克");
			    	 //数量
			    	 initSuffix("gem-count","颗");
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
	<form id="gemfrmId">
	<input id="gemid" class="mid" type="hidden" name="id" value="${gemvo['id']}">
		<div class="header">
			<div class="head">
				<div class="top1">
					<b><a href="javascript:;" onclick="EditShow_Hidden(ed1)"><img
								src="${ctx}/resources/images/plus.png">
					</a> ${pageGemType }宝石签收单81812560 </b>
					<font><a href="javascript:;" onclick="Show_Hidden(tr1)"><img
								src="${ctx}/resources/images/plus.png">
					</a>
					</font>
				</div>
				<div class="hidden_enent" id="tr1" style="display: none;">
					<ul>
						<li class="jian">
							<a href="javascript:;" onclick="Show_Hidden(tr1)">—</a>
						</li>
						<li>
							<a href="">定制单</a>
						</li>
						<li>
							<a href="${ctx}/gem-sign/list.do">宝石签收单</a>
						</li>
						<li>
							<a href="">订单</a>
						</li>
						<li>
							<a href="">客户</a>
						</li>
					</ul>
				</div>
				<div class="edit_hidden" id="ed1" style="display: none;">
					<ul>
						<li class="jian2">
							<a href="javascript:;" onclick="EditShow_Hidden(ed1)">—</a>
						</li>
						<li>
							<a href="">Open</a>
						</li>
						<li>
							<a href="">Save</a>
						</li>
						<li>
							<a href="">Save as</a>
						</li>
						<li>
							<a href="">Print</a>
						</li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
		</div>

		<div class="qsd">
			<div class="qsd_main">
				<div class="qsd_left">
					<ul>
						<li>
							<a href=""><img src="${ctx}/resources/images/customer_01.png">
							</a>
						</li>
						<li>
							<div class="file3">
								<a href="javascript:;"><input type="file" name="file" id="file">
								</a>
							</div>
						</li>
						<li class="camera">
							<a class="gem-upload" href="javascript:;"><img src="${ctx}/resources/images/camera.png"></a>
						</li>
						<div class="clear"></div>
					</ul>
					<div class="clear"></div>
					<dt>
						<a class="gem-pic-show" href="javascript:;">
						<c:choose>
						 <c:when test="${empty gemvo['FILE_0']}">   
						 <img src="${ctx}/resources/images/pic_02.png">
						 </c:when>
						 <c:otherwise>
						 <img src="${ctx}/staticRes/${gemvo['FILE_0']}">
						 </c:otherwise>	
						</c:choose> 
						</a>
					</dt>
				</div>
				<div class="qsd_right">
					<div class="qsd_right_1">
						<select name="vtype" class="qsdr r1" id="gem-type-id">
							<option value="-1">
								 宝石
							</option>
						</select>
						<dt>
							<input type='text' name='nworth' placeholder="元" class="qsdr r2 gem-worth" value="${gemvo['nworth']}">
						</dt>
						<div class="clear"></div>
					</div>
					<div class="qsd_right_1">
						<select name="vshape" class="qsdr r1" id="gem-shape-id">
							<option value="-1">
								 形状
							</option>
						</select>
						<dt>
							<input type='text' name='nweight' placeholder="克" class="qsdr r2 gem-weight" value="${gemvo['nweight']}">
						</dt>
						<div class="clear"></div>
					</div>
					<div class="qsdtt">
						<select name="vspec" class="qsdt" id="gem-spec-id">
							<option value="-1">
								 规格
							</option>
						</select>
					</div>
					<div class="clear"></div>
					<div class="qsdtt">
						<input type='text' name='icount' placeholder="颗" value="${gemvo['icount']}" class="qsdn t3 gem-count">
					</div>
					<div class="qssm-l">
						<textarea name="vmemo" cols="" rows="" class="qssm" placeholder="签收说明">${gemvo['vmemo']}</textarea>
					</div>
					<div class="qs_save">
						<input type="button" name="button" onclick="javascript:save()" value="保存">
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</form>
	<form id="gemfrmBId">
	<input type="hidden" name="filemodel" id="filemodel" value="gemsign">
	<input type="hidden" name="filetype" id="filetype" value="pic">
	<input type="hidden" name="FILE_0" id="FILE_0"></input>
	<input type="hidden" name="FILE_1" id="FILE_1"></input>
	<input type="hidden" name="FILE_2" id="FILE_2"></input>
	<input type="hidden" name="FILE_3" id="FILE_3"></input>
	<input type="hidden" name="FILE_4" id="FILE_4"></input>
	<input type="hidden" name="FILE_5" id="FILE_5"></input>
	<input type="hidden" name="FILE_6" id="FILE_6"></input>
	<input type="hidden" name="FILE_7" id="FILE_7"></input>
	<input type="hidden" name="FILE_8" id="FILE_8"></input>
	</form>
	</body>
</html>
