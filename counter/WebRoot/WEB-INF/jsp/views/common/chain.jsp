<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>库选宝石</title>
<script language="javascript" type="text/javascript" src="${ctx}/resources/js/jquery-1.9.1.min.js"></script>
<link type='text/css' rel='stylesheet' href='${ctx}/resources/css/style.css' media='all' />
<link type='text/css' rel='stylesheet' href='${ctx}/resources/css/bootstrap.css' media='all' />
<!-- 自定义 -->
	<script src="${ctx}/resources/js/bavlo-event.js"></script>
<!-- 远程数据初始下拉框值 -->
<script src="${ctx}/resources/js/bavlo-initdata.js"></script>
<script type="text/javascript">
//本地webservice
var nativeUrl = "${pageScope.basePath}/counter/webservice/http.do";
$(function(){
	//获取所有金属材质
	//initChainMaterial();
	//获取所有链子类型
	initChainStyle();
	$("#chain-material-id").change(function(){
		initChainSpec("chain-spec-id");
	});
	$("#chain-style-id").change(function(){
		initChainSpec("chain-spec-id");
	});
	//链子弹框
	$(".ok").click(function(){
		var spec =  $("#chain-spec-id").val();
		if(spec == "-1"){
			alert("请选择规格!");
			return ;
		}
		if(isExitsFunction(window.parent.setValueByFrame)){
			var chainItem = "";
			var chainName = $("#chain-material-id").find("option:selected").text()+" "+ $("#chain-style-id").find("option:selected").text()+" "+$("#chain-spec-id").find("option:selected").text();
			var chainCost = $("#chain-spec-id").find("option:selected").val();
			var sid = $("#chain-material-id").find("option:selected").val()+ $("#chain-style-id").find("option:selected").val()+$("#chain-spec-id").find("option:selected").val();
			var json = "{\"vchainName\":\""+chainName+"\",\"nchainCost\":\""+chainCost+"\",\"sid\":\""+sid+"\",\"ichainItem\":\""+chainItem+"\"}";
			window.parent.setValueByFrame("chain","",callbackMuilt(),json);
		}else{
			alert("请在父窗口添加setValueByFrame(type,id,callback,json){处理逻辑}type='chain']");
		}
	});

});

//填充所有金属材质于下拉框
function initChainMaterial(){
	var materialUrl = "http://www.bavlo.com/getAllMetalMaterialType";
	loadSelData(nativeUrl, materialUrl, "chain-material-id", "data[i].id","data[i].metal_type", function() {});	
}

//填充所有链子类型于下拉框
function initChainStyle(){
	var styleUrl = "http://www.bavlo.com/getAllChainStyle";
	loadSelData(nativeUrl, styleUrl, "chain-style-id", "data[i].id","data[i].name_cn", function() {initChainMaterial();});
}

//根据选择链子材质+类型选择链子(chain-spec-id)
function initChainSpec(emName){
	$('#'+emName).empty();
	$('#'+emName).append("<option value='-1'>请选择</option>");
	var chainMaterialId = $("#chain-material-id").val();
	var chainStyleId = $("#chain-style-id").val();
	var styleUrl = "http://www.bavlo.com/getChainList?metalId="+chainMaterialId+"&chainStyleId="+chainStyleId;
	$.get(nativeUrl,{url:styleUrl},function(row){
		var data = row;
		for(var i=0;i<data.length;i++){
			//$('#'+emName).append("<option cost="+data[i].chainCost+" value='"+data[i].id+"'>"+data[i].x+" x "+data[i].y+" x "+data[i].z+"</option>");
			$('#'+emName).append("<option value='"+data[i].chainCost+"'>"+data[i].chainLength +" × "+data[i].y+"</option>");
		}
	});
}
</script>

</head>

<body>
<div id="kxbs">
			<div id='kxs'>
				<div class="kxbs-in">
					<div id="choose">
						<h3>
							链子
						</h3>
						<select name="material" id="chain-material-id">
							<option value="-1">
								请选择
							</option>
						</select>
					</div>
					<div id="choose">
						<select name="type" id="chain-style-id">
							<option value="-1">
								请选择
							</option>
						</select>
					</div>
					<div id="choose">
						<select name="spec" id="chain-spec-id">
							<option value="-1">
								请选择
							</option>
						</select>
					</div>
					<input type="button" name="button" value="OK" class="ok">
				</div>
			</div>
		</div>
</body>
</html>
