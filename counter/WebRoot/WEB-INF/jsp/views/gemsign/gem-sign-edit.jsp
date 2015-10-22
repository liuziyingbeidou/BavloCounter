<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>${pageGemType}宝石签收单</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		
		<script src="${pageContext.request.contextPath}/resources/js/jquery-1.8.3.min.js"></script>
		<link type='text/css' rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/style.css' media='all' />
		<link type='text/css' rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/bootstrap.css' media='all' />
		<script src="${pageContext.request.contextPath}/resources/js/top.js"></script>
		
		<!-- 定义JS -->
		<script src="${pageContext.request.contextPath}/resources/js/bavlo-initdata.js"></script>
		
		<script type="text/javascript">
		//本地webservice
		var nativeUrl = "${pageScope.basePath}/counter/webservice/http.do";
		$(function(){
		
			//宝石类型下拉框值
			var typeUrl = "http://www.bavlo.com/getAllGemType";
			loadSelData(nativeUrl,typeUrl,"gem-type-id","data[i].id","data[i].type_cn");
			
			//宝石形状下拉框值
			var shapeUrl = "http://www.bavlo.com/getAllGemShape";
			loadSelData(nativeUrl,shapeUrl,"gem-shape-id","data[i].id","data[i].shape_cn");
			
			//类型和形状改变
			$("#gem-type-id").change(function(){
				initSpecByTypeShape();
			});
			$("#gem-shape-id").change(function(){
				initSpecByTypeShape();
			});
			
		});
		
		//初始话规格下拉框值
		function initSpecByTypeShape(){
			var gemTypeId = $("#gem-type-id").val();
			var gemShapeId = $("#gem-shape-id").val();
			var specUrl = "http://www.bavlo.com/getGemCalibrated?typeId="+gemTypeId+"&shapeId="+gemShapeId;
			loadSelData(nativeUrl,specUrl,"gem-spec-id","data[i].id","data[i].size");
		}	
		
		
		//宝石签收单保存
		function save(){
			$.ajax({
			     type : "POST",
			     url : "save.do",
			     data:$('#entityId').serialize(),// formid
			     async:false,
			     cache:false,
			     success : function(msg) {
			     	 alert("保存成功!");
			     },
			     error : function(e) {
			     	
			     }
		    });
		}
		</script>
		
	</head>
	<body>
	<form id="entityId" action="saveEntySign.do" method="post">
		<div class="header">
			<div class="head">
				<div class="top1">
					<b><a href="javascript:;" onclick="EditShow_Hidden(ed1)"><img
								src="${pageContext.request.contextPath}/resources/images/plus.png">
					</a> ${pageGemType }宝石签收单81812560 </b>
					<font><a href="javascript:;" onclick="Show_Hidden(tr1)"><img
								src="${pageContext.request.contextPath}/resources/images/plus.png">
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
							<a href="">宝石签收单</a>
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
							<a href=""><img src="${pageContext.request.contextPath}/resources/images/customer_01.png">
							</a>
						</li>
						<li>
							<div class="file3">
								<a href="javascript:;"><input type="file" name="file"
										id="file">
								</a>
							</div>
						</li>
						<li class="camera">
							<a href=""><img src="${pageContext.request.contextPath}/resources/images/camera.png">
							</a>
						</li>
						<div class="clear"></div>
					</ul>
					<div class="clear"></div>
					<dt>
						<img src="${pageContext.request.contextPath}/resources/images/pic_02.png">
					</dt>
				</div>
				<div class="qsd_right">
					<div class="qsd_right_1">
						<select name="vtype" class="qsdr r1" id="gem-type-id">
							<option>
								坦桑石
							</option>
						</select>
						<dt>
							<input type='text' name='nworth' class="qsdr r2" value='25000元'>
						</dt>
						<div class="clear"></div>
					</div>
					<div class="qsd_right_1">
						<select name="vshape" class="qsdr r1" id="gem-shape-id">
							<option>
								垫形
							</option>
						</select>
						<dt>
							<input type='text' name='nweight' class="qsdr r2" value='3035ct'>
						</dt>
						<div class="clear"></div>
					</div>
					<div class="qsdtt">
						<select name="vspec" class="qsdt" id="gem-spec-id">
							<option>
								6.51 x 6.48 x 4.22
							</option>
						</select>
					</div>
					<div class="clear"></div>
					<div class="qsdtt">
						<input type='text' name='icount' value='1颗' class="qsdn t3">
					</div>
					<div class="qssm-l">
						<textarea name="vmemo" cols="" rows="" class="qssm" value="签收说明"
							onfocus="if(this.value=='签收说明'){this.value='';}"
							onblur="if(this.value==''){this.value='签收说明';}"></textarea>
					</div>
					<div class="qs_save">
						<input type="button" name="button" onclick="javascript:save()" value="保存">
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</form>
	</body>
</html>