<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>${pageOrderType}配石单</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="viewport"
	content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<script src="${ctx}/resources/js/jquery-1.8.3.min.js"></script>
<script src="${ctx}/resources/js/top.js"></script>
<script src="${ctx}/resources/js/hide.js"></script>
<link href="${ctx}/resources/css/orderlist.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/resources/js/showList.js" type="text/javascript"></script>
<!--必要样式-->
<link rel='stylesheet' href='${ctx}/resources/css/style.css' media='all' />
<link rel='stylesheet' href='${ctx}/resources/css/bootstrap.css' media='all' />
<link rel="stylesheet" href="${ctx}/resources/css/photoswipe.css" />
<link rel="stylesheet" href="${ctx}/resources/css/default-skin.css" />

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
		loadSelData(nativeUrl, typeUrl, "gemTypeId", "data[i].id",
				"data[i].type_cn", function() {
					$("#gemTypeId").val("${useGemDetail['vtype']}");
				}, "宝石类型");
		
		//形状下拉框
		initShapeByType();
		//规格下拉框
	    //initSpecByTypeShape();

		//类型和形状改变
		$("#gemTypeId").change(function() {
			initShapeByType();
		});
		$("#gemShapeId").change(function() {
			//initSpecByTypeShape();
			//支持手动输入
			var gemShapeId = $("#gemShapeId").val();
			if (gemShapeId == "-2") {
				onchangeShape();
			}
		});
		/**
		 *$(document).ajaxStop(function () {setNowSelData(); });
		 **/
		/* //宝石签收单列表
		 $(".custom_list").bind("click",function(){
		 	openURL("${ctx}/custom/listJson.do","款式单列表");
		 });*/
		 
		if("${useGemDetail['icount']}" != ""){
	 		$("#memo").val("${useGemDetail['icount']}");
	 	}
		
		 //有值后加后缀
		 initFieldSuffix();
		 
		 setSelValue();
	});
	
	//选择下拉框值
	function setSelValue(){
		//宝石类型
		$("#gemTypeId").val("${useGemDetail['vtype']}");
		//宝石形状
		if(isExistOption("gemShapeId","${useGemDetail['vshape']}")){
			$("#gemShapeId").val("${useGemDetail['vshape']}");
		}else{
			if("${useGemDetail['vshape']}" != "" && "${useGemDetail['vshape']}" != null){
				$("#gemShapeId").append("<option selected myem='self' value='${useGemDetail['vshape']}'>${useGemDetail['vshape']}</option>");
			}
		}
	}
	
	//选择自定义时
	function onchangeShape(){
		$('#my-prompt').modal({
	      relatedTarget: this,
	      onConfirm: function(e) {
	      	var $selectSp = $("#gemShapeId");
	      	for(var i = 0; i < $selectSp.find('option').length; i++){
	      		var myem = $("#gemShapeId option:eq("+i+")").attr("myem");
	      		if(myem == "self"){
	      			$("#gemShapeId option:eq("+i+")").remove();
	      		}
	      	}
	      	
	      	$("#gemShapeId").append("<option selected myem='self' value='"+e.data+"'>"+e.data+"</option>");
	      },
	      onCancel: function(e) {
	      }
	    });
	}

	function initFieldSuffix(){
		if($(".useGem-count").val() != ""){
    		//数量
	    	initSuffix("useGem-count","颗");
   		}
	  	if($(".useGem-weight").val() != ""){
    		//重量
    		initSuffix("useGem-weight","克");
   		}
    	if($(".useGem-worth").val() != ""){
    		//价值
    		initSuffix("useGem-worth","元");
   		}
	}

	//初始化input
	$(function initVal() {
		var useGemWorth = "${useGemDetail['nworth']}";
		var useGemWeigth = "${useGemDetail['nweight']}";
		var useGemCount = "${useGemDetail['icount']}";
		
	});

	//初始化形状下拉框值
	function initShapeByType() {
		var gemTypeId = $("#gemTypeId").val();
		if (gemTypeId == "-1") {
			gemTypeId = "${useGemDetail['vtype']}";
		}
		var shapeUrl = "http://www.bavlo.com/getGemShape?typeId=" + gemTypeId;
		loadSelData(nativeUrl, shapeUrl, "gemShapeId", "data[i].id",
				"data[i].shape_cn", function() {
					$("#gemShapeId").val("${useGemDetail['vshape']}");
				}, "宝石形状");
	}

	//初始化规格下拉框值
	/*function initSpecByTypeShape() {
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
				}, "宝石规格");
	}*/

	//宝石签收单保存
	function saveOrUpdate() {
		if(!ckLose("edit_btn","lose-useGem")){
			return;
		}
		 
		if($("#memo").val() == "说明"){
	 		$("#memo").val("");
	 	}
		//重置下拉框到隐藏域
		$("#typeName").val($("#gemTypeId  option:selected").text());
		$("#shapeName").val($("#gemShapeId  option:selected").text());
		
		//数量
    	clearSuffix("useGem-count","颗");
    	//重量
    	clearSuffix("useGem-weight","克");
    	//价值
    	clearSuffix("useGem-worth","元");
		$.ajax({
			type : "POST",
			url : "${ctx}/useGem/saveOrUpdate.do",
			data : $('#useGem').serialize(),// formid
			async : false,
			cache : false,
			success : function(data) {
				$("#gemid").val(data.id);
				alert("保存成功!");
				window.location = "${ctx}/useGem/info.do?id="+data.id;//根据id显示配石单信息
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
					//选客户后初始化交付地址
					$("#addressId").val("");
					$("#tbl").empty();
					initAddr();
				}
				if($("#customerId").val()){
					$(".header-loc").show();
				}else{
					$(".header-loc").hide();
				}
				closeMultiDlg();
			});
		}/*else if(type == "chain"){
			var data = JSON.parse(json);
			$("#order-list").append("<dd type='ch' sid='"+data.sid+"' class='"+data.sid+" bill'><span class='list_name bill-name'>"+data.sname+"</span><input class='list_num bill-num' style='width:40px;margin-left:10px;' type='text' value='1' placeholder='条'><b class='list_price bill-price'>"+data.sprice+"</b><a href='javascript:rlist("+data.sid+")' class='close_c'><img src='${ctx}/resources/images/close.png'></a></dd>");
			closeMultiDlg();
		}*/else if(type == "order"){
			url = "${ctx}/order/edit.do?id="+id;//根据id查询订单信息
			window.location = url;
		}else if(type == "order-view"){
			url = "${ctx}/order/view.do?id="+id;//根据id查询订单信息
			window.location = url;
		}else if(type == "signGem"){
			url = "${ctx}/gem-sign/view.do?id="+id;//根据id查询宝石签收单信息
			window.location = url;
		}else if(type == "entity"){
			url = "${ctx}/entity-sign/view.do?id="+id;//根据id查询实物签收单信息
			window.location = url;
		}else if(type == "customer-menu"){
			url = "${ctx}/customer/info.do?id="+id;//根据id查询客户信息
			window.location = url;
		}else if(type == "custom"){
			url = "${ctx}/custom/edit.do?id="+id;//根据id定制单信息
			window.location = url;
		}else if(type == "custom-view"){
			url = "${ctx}/custom/detail.do?id="+id;//根据id显示定制单信息
			window.location = url;
		}else if(type == "useGem"){
			url = "${ctx}/useGem/info.do?id="+id;//根据id显示配石单信息
			window.location = url;
		}
		/*if(typeof(callback)!=='undefined'){
			callback&&callback;
		}*/
	}
</script>
<style type="text/css">
@media screen and (max-width: 1280px) and (min-width: 320px){
	.qsdr3 {
	    height: 60px;
	    line-height: 60px;
	    width: 30%;
	    padding-left: 10px;
	    background: #ddd;
	    color: #616161;
	    font-size: 16px;
	}
}

.qsdr3 {
    height: 40px;
    line-height: 40px;
    width: 28%;
    padding-left: 10px;
    background: #ddd;
    color: #616161;
    font-size: 16px;
}
.muiltx{
	color:#FFF;
	padding:4px;
}
.qsd_right_2 {
    width: 315px;
}
.mytipclass {
    font-style:italic;
    color:red;
}
.qsd_left ul{
	margin-top:0px;
}
</style>
</head>

<body>
	<form id="useGem">
		<input type="hidden" id="pageAttr" value="DEPLOY"/>
<header class="demo-bar">
	<h1>
		${pageOrderType}配石单
			<c:choose>
				 <c:when test="${empty useGemDetail['vnumber']}">   
				 ${number }
				 <input type="hidden" id="vnumber" name="vnumber" value="${number }">
				 </c:when>
				 <c:otherwise>
				 ${ordervo['vnumber']}
				 <input type="hidden" id="vnumber" name="vnumber" value="${useGemDetail['vnumber']}">
				 </c:otherwise>	
			</c:choose> 
	</h1>
</header>
<jsp:include page="../header.jsp"></jsp:include>
<div class="header" style="display:none;">
	<div class="head2">
		<div class="top2">
			<b><a href="javascript:;" onclick="EditShow_Hidden(ed1)"><img
						src="${ctx}/resources/images/plus.png" />
			</a>${pageOrderType}配石单
			<c:choose>
				 <c:when test="${empty useGemDetail['vnumber']}">   
				 ${number }
				 <input type="hidden" id="vnumber" name="vnumber" value="${number }">
				 </c:when>
				 <c:otherwise>
				 ${ordervo['vnumber']}
				 <input type="hidden" id="vnumber" name="vnumber" value="${useGemDetail['vnumber']}">
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
		<input id="gemid" type="hidden" name="id" class="tableId"
			value="${useGemDetail['id']}">
		<input id="customdId" type="hidden" name="customdId" class="customdId"
			value="
			<c:choose>
					 <c:when test="${empty useGemDetail['customdId']}">   
					 ${customDVO['id'] }
					 </c:when>
					 <c:otherwise>
					 ${useGemDetail['customdId']}
					 </c:otherwise>	
			</c:choose> 
			">
		<div class="qsd">
			<div class="qsd_main">
				<div class="qsd_left">
					<div class="peishi">
						<img src="${customDVO['vstockGemImgPath'] }">
						<ul>
							<li>名称：${customDVO['vstockGemName'] }</li>
							<li>形状：${customDVO['vstockGemShape'] }</li>
							<li>重量：${customDVO['nstockGemWeight'] }</li>
							<li>颜色：${customDVO['vstockGemColor'] }</li>
							<li>净度：${customDVO['vstockGemClarity'] }</li>
							<li>规格：${customDVO['vstockGemSize'] }</li>
							<li>参考价：${customDVO['nstockGemCost'] }</li>
							<li>数量：${customDVO['istockGemNum'] }</li>
							<div class="clear"></div>
						</ul>
						<dt>
							款式单号： <a href="${ctx }/custom/detail.do?id=${customDVO['vdef2']}" class="custom_list">${customDVO['vdef1']}</a>
						</dt>
					</div>
				</div>
				<div class="qsd_right edit_btn">
					<div class="qsd_right_1">
						<select name="vtype" class="qsdr r1 bl-ck-null lose-useGem" id="gemTypeId">
							<option value="-1">请选择</option>
						</select>
						<input type="hidden" name="vtypeName" id="typeName" value="${useGemDetail['vtypeName'] }">
						<dt>
							<input type='text' id='nworth' name='nworth' class="qsdr r2 useGem-worth bl-ck-null lose-useGem"
								value="${useGemDetail['nworth']}" placeholder="价值（元）">
						</dt>
						<div class="clear"></div>
					</div>
					<div class="qsd_right_1">
						<select name="vshape" class="qsdr r1 bl-ck-null lose-useGem" id="gemShapeId">
							<option value="-1">请选择</option>
						</select>
						<input type="hidden" name="vshapeName" id="shapeName" value="${useGemDetail['vshapeName'] }">
						<dt>
							<input type='text' id='nweight' name='nweight' class="qsdr r2 useGem-weight bl-ck-null lose-useGem"
								value="${useGemDetail['nweight']}" placeholder="重量（克）">
						</dt>
						<div class="clear"></div>
					</div>
					<div class="qsdtt">
						<input type='text' id='vspec' name='vspec' value="${useGemDetail['vspec']}" placeholder="规格x" class="qsdr3 r1 useGem-spec bl-ck-null lose-useGem"><span class="muiltx">X</span>
						<input type='text' id='vspec2' name='vspec2' value="${useGemDetail['vspec2']}" placeholder="规格y" class="qsdr3 r3 useGem-spec2 bl-ck-null lose-useGem"><span class="muiltx">X</span>
						<input type='text' id='vspec3' name='vspec3' value="${useGemDetail['vspec3']}" placeholder="规格z" class="qsdr3 useGem-spec3 bl-ck-null lose-useGem">
					</div>
					<div class="clear"></div>
					<div class="qsdtt">
						<input type='text' id='icount' name='icount'
							value="${useGemDetail['icount']}" placeholder="数量（颗）" class="qsdn t3 useGem-count bl-ck-null lose-useGem">
					</div>
					<div class="qssm-l">
						<textarea id="memo" name="vmemo" cols="" rows="" class="qssm"
						onfocus="if(value =='说明'){value =''}" onblur="if(value ==''){value='说明'}" >说明</textarea>
					</div>
					<div class="qs_save">
						<input type="button" name="button"
							onclick="javascript:saveOrUpdate()" value="保存">
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</form>
	<div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt">
	  <div class="am-modal-dialog">
	    <div class="am-modal-hd">Bavlo Counter</div>
	    <div class="am-modal-bd">
	     请输入:
	      <input type="text" class="am-modal-prompt-input">
	    </div>
	    <div class="am-modal-footer">
	      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
	      <span class="am-modal-btn" data-am-modal-confirm>提交</span>
	    </div>
	  </div>
	</div>
	<script type="text/javascript">
	$(function(){
		
	});
	</script>
</body>
</html>
