<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>${pageOrderType}订单 ${ordervo['vorderCode']}</title>
<script language="javascript" type="text/javascript" src="${ctx}/resources/js/jquery-1.9.1.min.js"></script>
<link type='text/css' rel='stylesheet' href='${ctx}/resources/css/style.css' media='all' />
<link type='text/css' rel='stylesheet' href='${ctx}/resources/css/bootstrap.css' media='all' />
<script src="${ctx}/resources/js/top.js"></script>

<!-- 自定义 -->
<script src="${ctx}/resources/js/bavlo-event.js"></script>
<script src="${ctx}/resources/js/bavlo-order.js"></script>
<!-- 弹框 -->
<!-- jQuery & jQuery UI files (needed)--> 
<link rel="stylesheet" href="${ctx}/resources/jquery.multiDialog/css/jquery-ui-1.10.3.custom.css">
<script src="${ctx}/resources/jquery.multiDialog/js/jquery/jquery-ui-1.10.3.custom.js"></script> 
<!-- MultiDialog files (needed) --> 
<link rel="stylesheet" href="${ctx}/resources/jquery.multiDialog/css/jquery.multiDialog.css"> 
<script src="${ctx}/resources/jquery.multiDialog/js/jquery.ui.dialog.extended-1.0.2.js"></script> 
<script src="${ctx}/resources/jquery.multiDialog/js/jquery.multiDialog.js"></script> 
<script src="${ctx}/resources/js/bavlo-dialog.js"></script>
<!-- Loading -->
<script src="${ctx}/resources/showLoading/showLoading.js"></script>
<link type="text/css" rel="stylesheet" href="${ctx}/resources/showLoading/showLoading.css">
<script type="text/javascript">
$(function(){
	//客户
	setValueByFrame("customer","${ordervo['id']}");
	if("${ordervo['vdef1']}" != "" && "${ordervo['vdef1']}" != null){
		$(".cusheader").prop("src","${ordervo['vdef1']}");
		
	}
	//订单清单
	loadOrderList();
	//订单列表
	$(".menu-order").click(function(){
		openURL("${ctx}/order/list.do","订单列表",500,600);
	});
	
	//上传图片
	$(".cptu").click(function(){
		openURL("${ctx}/upload/uppage.do","上传图片",null,370);
	});
	//图片显示
	$(".gem-pic-show").click(function(){
		var mid = $("#orderId").val();
		if(mid == ""){
			if($("#FILE_0").val() == "" || $("#FILE_0").val() == null){
	 			alert("暂未上传图片");
	 		}else{
	 			openURL("${ctx}/upload/shownpic.do?frmId=orderCId","图片展示");
	 		}
		}else{
			openURL("${ctx}/upload/showpic.do?cpath=com.bavlo.counter.model.order.OrderCVO&fkey=orderId&id="+mid,"图片展示",'','',false);
		}
	});
	//订单状态条
	freshOrderState("${ordervo['iorderState']}","${'curRole'}");
	if("${ordervo['FILE_0']}" == null || "${ordervo['FILE_0']}" == ""){
		$(".cp-pic").hide();
	}
	//更新状态
	$("#ssave").click(function(){
		var orderId = $("#orderId").val();
		var ista = $(".ista").val();
		var url = "${ctx}/order/updateState.do";
		$.post(url,{orderId:orderId,ista:ista},function(data){
			alert(data);
			freshOrderState(ista,"${'curRole'}");
		});
	});
	//更新顺丰单号
	$("#csave").click(function(){
		var orderId = $("#orderId").val();
		var cnum = $(".cnum").val();
		var url = "${ctx}/order/updateOrderCNumber.do";
		$.post(url,{orderId:orderId,cnum:cnum},function(data){
			alert(data);
			freshOrderState("4","${'curRole'}");
		});
	});
	//保存上传图片
	$(".psave").click(function(){
		var url = "${ctx}/order/saveOrderCVO.do";
		var orderId = $("#orderId").val();
		var bvo = JSON.stringify($('#orderCId').serializeJson());
		$.post(url,{orderId:orderId,bvo:bvo},function(data){
			alert(data);
			location.reload();
		});
	});
	//进入编辑页
	$(".editOrder").click(function(){
		var url = "${ctx}/order/edit.do?id="+$("#orderId").val();
		window.location = url;
	});
	
	setTimeout("changeDivStyle();", 100); // 0.1秒后展示结果，因为HTML加载顺序，先加载脚本+样式，再加载body内容。所以加个延时
});

//加载清单列表
function loadOrderList(){
	var mid = $("#orderId").val();
	var url = "${ctx}/order/getOrderListByMid.do";
	$.get(url,{mid:mid},function(row){
		var data = row;
		if(data != null && data != ""){
			var sumVl = "0";
			for(var i = 0; i < data.length; i++){
				var type = data[i].vsourceType;
				if(type == "dz"){
					var pic = "";
					if(data[i].vpic != "" && data[i].vpic != null){
						pic = "<img style='width:60px;height:60px;' class='bill-pic' src='${ctx}/staticRes/"+data[i].vpic+"'>";
					}else{
						pic = "<img class='bill-pic' src='${ctx}/resources/images/good_01.png'>";
					}
					$("#olist").append("<dd type='dz' onclick='toCustom(\""+data[i].vsourceId+"\")' sid='"+data[i].vsourceId+"' class='"+data[i].vsourceId+" bill'>"+pic+"<b style='cursor:pointer;'>进入款式单</b><span class='list_name bill-name PMC-RL'>"+data[i].nprice+"元</span><a href='javascript:void(0);' style='color:#FFF' class='bill-num close_c order_list_close'>"+data[i].nnumber+"</a></dd>");
					sumVl = accAdd(sumVl,data[i].nprice);
				}/*else if(type == "ch"){
					$("#olist").append("<dd type='ch' sid='"+data[i].vsourceId+"' class='"+data[i].vsourceId+" bill'><span class='list_name bill-name'>"+data[i].vname+"</span><b class='list_price bill-num'>"+data[i].nnumber+"条</b><a href='javascript:rlist("+data[i].vsourceId+")' class='close_c'><img src='${ctx}/resources/images/close.png'></a></dd>");
				}*/
			}
			
			$("#olist").append("<dd type='dz' class='bill'><span class='list_name bill-name PMC-RL'>总价："+sumVl+" 元</span><a href='javascript:void(0);' style='color:#FFF' class='bill-num close_c order_list_close'></a></dd>");
			
			$("#olist").append("<div class='clear'></div>");
			var curRole = "${curRole}";
			if(curRole.indexOf("PMC")>0){
				$(".PMC-RL").hide();
			}
		}
	});
}

/**
 ** 加法函数，用来得到精确的加法结果
 ** 说明：javascript的加法结果会有误差，在两个浮点数相加的时候会比较明显。这个函数返回较为精确的加法结果。
 ** 调用：accAdd(arg1,arg2)
 ** 返回值：arg1加上arg2的精确结果
 **/
function accAdd(arg1, arg2) {
    var r1, r2, m, c;
    try {
        r1 = arg1.toString().split(".")[1].length;
    }catch (e) {
        r1 = 0;
    }
    try {
        r2 = arg2.toString().split(".")[1].length;
    }catch (e) {
        r2 = 0;
    }
    c = Math.abs(r1 - r2);
    m = Math.pow(10, Math.max(r1, r2));
    if (c > 0) {
        var cm = Math.pow(10, c);
        if (r1 > r2) {
            arg1 = Number(arg1.toString().replace(".", ""));
            arg2 = Number(arg2.toString().replace(".", "")) * cm;
        } else {
            arg1 = Number(arg1.toString().replace(".", "")) * cm;
            arg2 = Number(arg2.toString().replace(".", ""));
        }
    } else {
        arg1 = Number(arg1.toString().replace(".", ""));
        arg2 = Number(arg2.toString().replace(".", ""));
    }
    return (arg1 + arg2) / m;
}

//删除清单
function rlist(className){
	$("."+className).remove();
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
						//initAddr();
					}
					closeMultiDlg();
				});
			}else if(type == "order"){
				url = "${ctx}/order/edit.do?id="+id;//根据id查询客户信息
				window.location = url;
			}else if(type == "order-view"){
				url = "${ctx}/order/view.do?id="+id;//根据id查询客户信息
				window.location = url;
			}else if(type == "signGem"){
				url = "${ctx}/gem-sign/view.do?id="+id;//根据id查询客户信息
				window.location = url;
			}else if(type == "entity"){
				url = "${ctx}/entity-sign/view.do?id="+id;//根据id查询客户信息
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
	//清单→款式单
	function toCustom(customId){
		startMask();
		var url = "${ctx}/custom/detail.do?id="+customId;//根据id显示定制单信息
		window.location = url;
		endMask();
	}
	
	//状态条
	function changeDivStyle(){
		    var o_status = $("#orderState").val();	//获取隐藏框值
			var o_status = 5;
			if(o_status==0){
				$('#create').css('background', '#7dae00');
				$('#createText').css('color', '#DDDDDD');
			}else if(o_status==1){
				$('#check').css('background', '#7dae00');
				$('#checkText').css('color', '#DDDDDD');
			}else if(o_status==2){
				$('#produce').css('background', '#7dae00');
				$('#produceText').css('color', '#DDDDDD');
			}else if(o_status==3){
				$('#delivery').css('background', '#7dae00');
				$('#deliveryText').css('color', '#DDDDDD');
			}else if(o_status>=4){
				$('#received').css('background', '#7dae00');
				$('#receivedText').css('color', '#DDDDDD');
			}else if(o_status>=5){
				$('#fst-jf').css('background', '#7dae00');
				$('#fst-jfText').css('color', '#DDDDDD');
			}
		}
		
		//上传后显示封面
		function showDefaultPic(){
			if($("#FILE_0").val() != null && $("#FILE_0").val() != ""){
				$("#gem-pic-show-id img").attr("src","${ctx}/staticRes/"+$("#filemodel").val()+"/"+$("#FILE_0").val());
			}
		}
</script>
<style type="text/css">
.check{background:#444;text-align: left;}
.barbox{width:315px;}
.st-tj,.st-zb,.st-sc,.st-zj,.st-kd{width:56px;height:15px;background:url('/counter/resources/images/Arrow2.png') no-repeat;}
.st-jf{width:16px;height:15px;background:url('/counter/resources/images/Arrow4.png') no-repeat}
.hidden_enent1 { width:110px; position:absolute; top:10px; right:365px; z-index:9999}
.edit_hidden1 { width:110px; position:absolute; top:10px; left:350px; z-index:9999}
.resave{cursor:pointer;}
.oedit input {
    width: 325px;
    text-align: center;
    font-size: 14px;
    background: #777;
    color: #fff;
    border: none;
    height: 40px;
    line-height: 40px;
    margin-top:4px;
}
.dask{
			z-index:-1;cursor:pointer;width:60px;height:60px;padding:20px 0 0 20px;background:#000;opacity:0.8;position:relative;top:-60px;
		}
.qsd_pic_list ul li{height:60px;}

.bill-pic{cursor: pointer;}
.stepInfo{position:relative;background:#f2f2f2;margin:20px auto 70 auto;}
.stepInfo li{float:left;width:48%;height:0.15em;background:#bbb;}
.stepIco{border-radius:1em;padding:0.03em;background:#bbb;text-align:center;line-height:1.5em;color:#fff; position:absolute;width:1.4em;height:1.4em;}
.stepIco1{top:-0.7em;left:-1%;}
.stepIco2{top:-0.7em;left:19%;}
.stepIco3{top:-0.7em;left:38%;}
.stepIco4{top:-0.7em;left:58%;}
.stepIco5{top:-0.7em;left:76%;}
.stepIco6{top:-0.7em;left:95%;}
.stepText{color:#DDDDDD;margin-top:0.2em;width:4em;text-align:center;margin-left:-1.4em;}
@media screen and (max-width: 1280px) and (min-width: 320px){
.close input{
	height: 40px;
    line-height: 40px;
}
.oedit input {
    width: 100%;
    height: 40px;
    line-height: 40px;
    font-size: 26px;
    }
    .gylc ul li{
    	text-align:left;
    }
}
</style>
</head>

<body>
<input type="hidden" id='toUser' value='${openid}' /> 
<input type="hidden" id="pageAttr" value="ORDER"/>
<input type="hidden" id="pageCode" value="${ordervo['vorderCode']}"/>
<input type="hidden" name="id" id="orderId" class="tableId" value="${ordervo['id']}">
<input type="hidden" name="iorderState" id="orderState" value="${ordervo['iorderState']}">
<input type="hidden" name="customerId" class="tocustomerId" id="customerId" value="${ordervo['customerId']}">
<header class="demo-bar">
	<%-- <h1>
		${pageOrderType}订单 ${ordervo['vorderCode']}
	</h1> --%>
</header>
<jsp:include page="../header.jsp"></jsp:include>

<div class="all">
	<div class="main">
    <div class="mainleft">
      <div class="customer">
		<div class="cu_pic"><img class="cusheader" src="${ctx}/resources/images/customer_01.png"></div>
		<div class="cusheader-info">${ordervo['vdef3']}</div>
      </div>
      <div class="stepInfo">
		<ul>
			<li></li>
			<li></li>
		</ul>
		<div class="stepIco stepIco1" id="create">1
			<div class="stepText" id="createText">提交</div>
		</div>
		<div class="stepIco stepIco2" id="check">2
			<div class="stepText" id="checkText">制版</div>
		</div>
		<div class="stepIco stepIco3" id="produce">3
			<div class="stepText" id="produceText">生产</div>
		</div>
		<div class="stepIco stepIco4" id="delivery">4
			<div class="stepText" id="deliveryText">质检</div>
		</div>
		<div class="stepIco stepIco5" id="received">5
			<div class="stepText" id="receivedText">快递</div>
		</div>
		<div class="stepIco stepIco6" id="fst-jf">6
			<div class="stepText" id="fst-jfText">交付</div>
		</div>
	  </div>
      <div class="gylc" style="display:none;">
		<dl class="barbox">
				<dd class="st-tj"></dd>
				<dd class="st-zb"></dd>
				<dd class="st-sc"></dd>
				<dd class="st-zj"></dd>
				<dd class="st-kd"></dd>
				<dd class="st-jf"></dd>
		</dl>
        <ul>
          <li class="fst-tj">提交</li>
          <li class="fst-zb">制版</li>
          <li class="fst-sc">生产</li>
          <li class="fst-zj">质检</li>
          <li class="fst-kd">快递</li>
          <li class="fst-jf">交付</li>
          <div class="clear"></div>
        </ul>
      </div>
      <div class="list">
        <h3>清单</h3>

        <dl id="olist">
          <!--<dd id="d1" class="mainGem" style="display:block;"><img src="${ctx}/resources/images/good_01.png"><b class="list_num">1</b><a href="javascript:;"  onclick="shwoOrHidden()" class="close_a"><img src="${ctx}/resources/images/close.png"></a></dd>-->
          <!--<dd id="d2" class="mainGem" style="display:block;"><img src="${ctx}/resources/images/good_02.png"><b class="list_num">2</b><a href="javascript:;"  onclick="shwoOrHidden1()" class="close_a1"><img src="${ctx}/resources/images/close.png"></a></dd>-->
          <!--<dd id="d3" class="mainGem" style="display:block;"><img src="${ctx}/resources/images/good_03.png"><b class="list_num">3</b><a href="javascript:;"  onclick="shwoOrHidden2()" class="close_a2"><img src="${ctx}/resources/images/close.png"></a></dd>-->
        </dl>
      </div>
    </div>
        <div class="mainmid PPS-RL CAD-RL GB-RL">
          <div class="ocheck">            
            <ul>
              <li>交付时间：${ordervo['ddeliverdate']} 
              <c:if test="${not empty ordervo['vdef2']}">
		      (还有${ordervo['vdef2']}天) 
		      </c:if>
              
              </li>
              <li>交付方式：${ordervo['vdeliveryWay']}</li>
              <li>交付地址：${ordervo['vaddress']}</li>
              <li>收货人：${ordervo['vrname']}</li>
              <li>联系电话：${ordervo['vtel']}</li>
              <li>E-mail：${ordervo['vmail']}</li>
            </ul>
            <ul>
              <li>发票抬头：${ordervo['vinvoiceTitle']}</li>
              <li>发票类目：${ordervo['vinvoiceContent']}</li>
            </ul>
            <ul>
              <li>订单说明：${ordervo['vordermemo']}</li>
            </ul>
          </div>
        </div>
        <div class="mainrig order-stats-bwrite">
          <div class="repair o-ssave CUST-RL PM-RL PPS-RL CAD-RL GB-RL">
            <select name="" class="repair1 ista">
              <option value="3">质检</option>
              <option value="5">完成</option>
            </select>
            <input id="ssave" type='text' class="resave" value="保存">
            <div class="clear"></div>
          </div>
          <p class="o-csave CAD-RL GB-RL PPS-RL">
			  <input type="text" name="vcourierNumber" class="repair1 cnum" value="${ordervo['vcourierNumber']}" placeholder="顺丰单号">
			  <input id="csave" type='text' class="resave CUST-RL PM-RL PPS-RL CC-RL CAD-RL GB-RL" value="保存">
			  <div class="clear"></div>
		  </p>
		  		<div class="cankao CAD-RL GB-RL PPS-RL">
					<h2>
					<a href="javascript:void(0);" style="color:#fff" class="cankaotu cptu CUST-RL PM-RL PPS-RL CC-RL CAD-RL GB-RL">+ 成品图 </a>
					<a href="javascript:void(0);" style="color:#fff" class="cankaotu PMC-RL">+ 成品图 </a>
					</h2>
					<div class="pro cp-pic">
						<div class="demo" id='pic' style='display: ;'>
							<div class="my-gallery">
								<a id="gem-pic-show-id" class="gem-pic-show" href="javascript:void(0);">
								<c:choose>
								 <c:when test="${empty ordervo['FILE_0']}">   
								 <img src="${ctx}/resources/images/pic_02.png">
								 </c:when>
								 <c:otherwise>
								 <img src="${ctx}/staticRes/${ordervo['FILE_0']}">
								 </c:otherwise>	
								</c:choose> 
								</a>
							</div>
							<div class="qsd_pic_list">
								<ul></ul>
							</div>
						</div>
					</div>
				</div>
			<p/>
          <div class="close CUST-RL PM-RL PPS-RL CC-RL CAD-RL GB-RL">
            <input type="button" class="psave" name="button" value="保存图片">
          </div>
          <div class="oedit CUST-RL CAD-RL PMC-RL GB-RL PPS-RL ">
            <input type="button" class="editOrder" name="button" value="进入编辑页">
          </div>
      </div>
        <div class="clear"></div>
    </div>  
</div>
	<form id="orderCId">
	<input type="hidden" name="filemodel" id="filemodel" value="order">
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
	<script type="text/javascript">
	$(function(){
		//小图列表遮罩
		setMask();
		//删除图片
		delPic();
	});
	//遮罩
	function setMask(){
		$(".qsd_pic_list ul li").hover(
			function () {
				$(this).find(".dask").stop().delay(20).animate({"z-index":"1",opacity:0.8},200);
			 },
			function () {
				$(this).find(".dask").stop().animate({"z-index":"-1",opacity:0},200);
			}
			
		);
	}
	
	//删除图片
	function delPic(){
		$(".qsd_pic_list ul li").bind("click",function(){
			var em = this;
			if(confirm("是否删除?")){
				var fileModel = $("#filemodel").val();
				var fileName = $(this).attr("picn");
			 	var url = "${ctx}/upload/delPic.do";
				$.get(url,{fileModel:fileModel,fileName:fileName},function(){
					var fem = $(em).attr("fem");
					if(fem == "FILE_0"){
						$("#gem-pic-show-id img").prop("src","${ctx}/resources/images/pic_02.png");
						$("#FILE_0").val("");
					}
					
					$(em).remove();
				});
			}
		});
	}
	//上传后显示小图{JS实现}
	function showMinPic(em,value,c){
		if($("#"+em).val() != null && $("#"+em).val() != ""){
			var minPicName = getMinPicByOrg(value);
			var ix = value.indexOf(".");
			var val = value.substring(0,ix);
			var fileModel = $("#filemodel").val();
			$(".qsd_pic_list ul").append("<li id='"+val+"' fem='"+em+"' onmouseout='setMaskT(\""+val+"\")' onmouseover='setMaskO(\""+val+"\")'><img class='list_pic' style='width:60px;height:60px;margin-top:10px;' src='${ctx}/staticRes/"+fileModel+"/min/"+minPicName+"'><div onclick='rmMaskC(\""+value+"\")' class='dask' style='z-index:-1;cursor:pointer;width:60px;height:60px;padding:20px 0 0 20px;background:#000;opacity:0.8;position:relative;top:-60px;' picn='"+value+"'><img src='${ctx}/resources/images/delete_shield_24px.ico'></div></li>");
		}
	}
	
	//移入
	function setMaskO(value){
		$("#"+value).find(".dask").stop().delay(20).animate({"z-index":"1",opacity:0.8},200);
	}
	
	//移出
	function setMaskT(value){
		$("#"+value).find(".dask").stop().animate({"z-index":"-1",opacity:0},200);
	}
	
	//删除小图
	function rmMaskC(value){
		var ix = value.indexOf(".");
		var val = value.substring(0,ix);
		if(confirm("是否删除?")){
			var fileModel = $("#filemodel").val();
			var fileName = value;
		 	var url = "${ctx}/upload/delPic.do";
			$.get(url,{fileModel:fileModel,fileName:fileName},function(){
				var fem = $("#"+val).attr("fem");
				if(fem == "FILE_0"){
					$("#gem-pic-show-id img").prop("src","${ctx}/resources/images/pic_02.png");
					$("#FILE_0").val("");
				}
				$("#"+val).remove();
			});
		}
	}
	//根据原图名称获取小图名称
	function getMinPicByOrg(picName){//20160226_min.jsp
		var newPicName = "";
		if(picName != "" && picName != null){
			var ix = picName.indexOf(".");
			newPicName = picName.substring(0,ix)+"_min"+picName.substring(ix,picName.length);
		}
		
		return newPicName;
	}
	
	//根据原图名称获取小图名称
	function getOrgPicByMin(picName){//20160226_min.jsp
		var newPicName = "";
		if(picName != "" && picName != null){
			var ix = picName.indexOf("_min.");
			newPicName = picName.substring(0,ix)+"."+picName.substring(ix+5,picName.length);
		}
		
		return newPicName;
	}
	//上传完成
	function fnCompleteBtn(){
		
	}
	</script>
</html>

