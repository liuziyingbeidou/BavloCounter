<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>编辑定单</title>
<script language="javascript" type="text/javascript" src="${ctx}/resources/js/jquery-1.9.1.min.js"></script>
<link type='text/css' rel='stylesheet' href='${ctx}/resources/css/style.css' media='all' />
<link type='text/css' rel='stylesheet' href='${ctx}/resources/css/bootstrap.css' media='all' />
<script src="${ctx}/resources/js/top.js"></script>

<!-- 自定义 -->
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
$(function(){
	//客户
	setValueByFrame("customer","${ordervo['id']}");
	//订单清单
	loadOrderList();
	//订单列表
	$(".menu-order").bind("click",function(){
		openURL("${ctx}/order/list.do","订单列表",500,600);
	});
	
	//上传图片
	$(".cptu").bind("click",function(){
		openURL("${ctx}/upload/uppage.do","上传图片");
	});
	//图片显示
	$(".gem-pic-show").bind("click",function(){
		var mid = $("#orderId").val();
		if(mid == ""){
			alert("请保存后查看!");
		}else{
			openURL("${ctx}/upload/showpic.do?cpath=com.bavlo.counter.model.order.OrderCVO&fkey=orderId&id="+mid,"图片展示",'','',true);
		}
	});
	
	//更新状态
	$("#ssave").bind("click",function(){
		var orderId = $("#orderId").val();
		var ista = $(".ista").val();
		var url = "${ctx}/order/updateState.do";
		$.post(url,{orderId:orderId,ista:ista},function(data){
			alert(data);
			location.reload();
		});
	});
	//更新顺丰单号
	$("#csave").bind("click",function(){
		var orderId = $("#orderId").val();
		var cnum = $(".cnum").val();
		var url = "${ctx}/order/updateOrderCNumber.do";
		$.post(url,{orderId:orderId,cnum:cnum},function(data){
			alert(data);
			location.reload();
		});
	});
	//保存上传图片
	$(".psave").bind("click",function(){
		var url = "${ctx}/order/saveOrderCVO.do";
		var orderId = $("#orderId").val();
		var bvo = JSON.stringify($('#orderCId').serializeJson());
		$.post(url,{orderId:orderId,bvo:bvo},function(data){
			alert(data);
			location.reload();
		});
	});
});

//加载清单列表
function loadOrderList(){
	var mid = $("#orderId").val();
	var url = "${ctx}/order/getOrderListByMid.do";
	$.get(url,{mid:mid},function(row){
		var data = row;
		if(data != null && data != ""){
			for(var i = 0; i < data.length; i++){
				var type = data[i].vsourceType;
				if(type == "dz"){
					var pic = "";
					if(data[i].vpic != "" && data[i].vpic != null){
						pic = "<img style='width:60px;height:60px;' class='bill-pic' src='${ctx}/staticRes/"+data[i].vpic+"'>";
					}else{
						pic = "<img class='bill-pic' src='${ctx}/resources/images/good_01.png'>";
					}
					$("#olist").append("<dd type='dz' sid='"+data[i].vsourceId+"' class='"+data[i].vsourceId+" bill'>"+pic+"<b class='bill-num'>"+data[i].nnumber+"对</b><a href='javascript:rlist("+data[i].vsourceId+")' class='close_c'><img src='${ctx}/resources/images/close.png'></a></dd>");
				}/*else if(type == "ch"){
					$("#olist").append("<dd type='ch' sid='"+data[i].vsourceId+"' class='"+data[i].vsourceId+" bill'><span class='list_name bill-name'>"+data[i].vname+"</span><b class='list_price bill-num'>"+data[i].nnumber+"条</b><a href='javascript:rlist("+data[i].vsourceId+")' class='close_c'><img src='${ctx}/resources/images/close.png'></a></dd>");
				}*/
			}
			$("#olist").append("<div class='clear'></div>");
		}
	});
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
						initAddr();
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
			}
			/*if(typeof(callback)!=='undefined'){
				callback&&callback;
			}*/
		}
		
</script>
<style type="text/css">
.check{background:#444;text-align: left;}
</style>
</head>

<body>
<input type="hidden" name="id" id="orderId" value="${ordervo['id']}">
<input type="hidden" name="iorderState" id="orderState" value="${ordervo['iorderState']}">
<input type="hidden" name="customerId" id="customerId" value="${ordervo['customerId']}">
<div class="header">
	<div class="head1">
		<div class="top">
			<b><a href="#" onclick="EditShow_Hidden(ed1)"><img src="${ctx}/resources/images/plus.png"></a> ${pageOrderType }定单${ordervo['vorderCode']}</b>
			<font><a href="#" onclick="Show_Hidden(tr1)"><img src="${ctx}/resources/images/plus.png"></a></font>
		</div>
		<div class="hidden_enent1" id="tr1" style="display:none;">
			<ul>
				<li class="jian"><a href="#" onclick="Show_Hidden(tr1)">—</a></li>
				<jsp:include page="../menu_pg.jsp"></jsp:include>
			</ul>
		</div>
		<div class="edit_hidden1" id="ed1" style="display:none;">
			<ul>
				<li class="jian2"><a href="#" onclick="EditShow_Hidden(ed1)">—</a></li>
				<jsp:include page="../menu_cau.jsp"></jsp:include>		
			</ul>
		</div>
	</div>
</div>
<div class="all">
	<div class="main">
    <div class="mainleft">
      <div class="customer">
		<div class="cu_pic"><img src="${ctx}/resources/images/customer_01.png"></div>
      </div>
      <div class="gylc">
		<dl class="barbox">
			<dd class="barline">
				<c:choose>
						 <c:when test="${ordervo['iorderState'] == -1}">   
						 <div w="50" style="width: 0%;" class="charts"></div>
						 </c:when>
						 <c:when test="${ordervo['iorderState'] == 0}">   
						 <div w="50" style="width: 10%;" class="charts"></div>
						 </c:when>
						 <c:when test="${ordervo['iorderState'] == 1}">   
						 <div w="50" style="width: 26%;" class="charts"></div>
						 </c:when>
						 <c:when test="${ordervo['iorderState'] == 2}">   
						 <div w="50" style="width: 46%;" class="charts"></div>
						 </c:when>
						 <c:when test="${ordervo['iorderState'] == 3}">   
						 <div w="50" style="width: 66%;" class="charts"></div>
						 </c:when>
						 <c:when test="${ordervo['iorderState'] == 4}">   
						 <div w="50" style="width: 85%;" class="charts"></div>
						 </c:when>
						 <c:when test="${ordervo['iorderState'] == 5}">   
						 <div w="50" style="width: 100%;" class="charts"></div>
						 </c:when>
						 <c:otherwise>
						 <div w="50" style="width: 0%;" class="charts"></div>
						 </c:otherwise>	
			</c:choose> 
			</dd>
		</dl>
        <ul>
          <li>提交</li>
          <li>模具</li>
          <li>工艺</li>
          <li>质检</li>
          <li>快递</li>
          <li>交付</li>
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
        <div class="mainmid">
          <div class="ocheck">            
            <ul>
              <li>交付时间：${ordervo['ddeliverdate']}</li>
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
        <div class="mainrig">
          <div class="repair">
            <select name="" class="repair1 ista">
              <option value="3">质检</option>
              <option value="5">完成</option>
            </select>
            <input id="ssave" type='text' class="resave" value="保存">
            <div class="clear"></div>
          </div>
          <p>
			  <input type="text" name="" class="repair1 cnum" value="" placeholder="顺丰单号">
			  <input id="csave" type='text' class="resave" value="保存">
			  <div class="clear"></div>
		  </p>
		  		<div class="cankao">
					<h2><a href="#" style="color:#fff" class="cankaotu cptu">+ 成品图 </a></h2>
					<div class="pro">
						<div class="demo" id='pic' style='display: ;'>
							<div class="my-gallery">
								<a class="gem-pic-show" href="#">
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
						</div>
					</div>
				</div>
				<p/>
          <div class="close">
            <input type="button" class="psave" name="button" value="保存">
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
</html>

