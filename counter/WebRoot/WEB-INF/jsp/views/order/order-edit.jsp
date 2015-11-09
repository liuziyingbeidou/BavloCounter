<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>${pageOrderType}定单</title>
<script language="javascript" type="text/javascript" src="${ctx}/resources/js/jquery-1.9.1.min.js"></script>
<link type='text/css' rel='stylesheet' href='${ctx}/resources/css/style.css' media='all' />
<link type='text/css' rel='stylesheet' href='${ctx}/resources/css/bootstrap.css' media='all' />
<script src="${ctx}/resources/js/top.js"></script>
<script src="${ctx}/resources/js/hide.js"></script>
<link href="${ctx}/resources/css/orderlist.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/resources/js/showList.js" type="text/javascript"></script>

<!-- 城市联动 -->
<script src="${ctx}/resources/js/area.js"></script>
<script src="${ctx}/resources/js/location.js"></script>
<!-- 日期选择器 -->
<link href="${ctx}/resources/timepicker/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="${ctx}/resources/timepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="${ctx}/resources/timepicker/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/timepicker/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${ctx}/resources/timepicker/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>

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

<!-- 远程数据初始下拉框值 -->
<script src="${ctx}/resources/js/bavlo-initdata.js"></script>
<script type="text/javascript">
$(function(){
	//选择客户
	$(".file").bind("click",function(){
		openURL("${ctx}/customer/list.do","客户列表");
	});
	setValueByFrame("customer","${entityvo['id']}");
	
	//日期选择器
	$("#datetimepicker").datetimepicker({
		format: 'yyyy-mm-dd',
		autoclose:true,
		minView:4,
		todayBtn:true,
		todayHighlight:true,
		forceParse:true,
		language:"zh-CN"
	});
	//城市联动
	showLocation();
	$("#addrSave").click(function(){
		saveAddr();
	});
	$("#orderSave").click(function(){
		saveOrder();
	});
	//链子弹框
	$(".partsGem_btn").click(function(){
		openURL("${ctx}/common/getChainInfo.do","链子");
	});
	//点击"定制单"
	$(".custom_btn").click(function(){
		//{到定制单前预保存订单}
		preSaveToCum();
	});
	//选择下拉框值
	setSelValue();
	//加载交付地址
	initAddr();
	//订单列表
	$(".menu-order").bind("click",function(){
		openURL("${ctx}/order/list.do","订单列表",500,600);
	});
});


//根据addressId显示地址信息
function showAddrInfo(){
	var url = "${ctx}/order/getAddrInfoJsonById.do";
	var aid = $("#addressId").val();
	$.get(url,{id:aid},function(row){
		var data = row;
		if(data != "" && data != null){
			showLocation();
			$("#vprovince").val(data.vprovince);
			$("#vprovince").change();
			$("#vcity").val(data.vcity);
			$("#vcity").change();
			//姓名
			$(".receiverName").val(data.vreceiverName);
			//省
			$(".province").val(data.vprovince);
			//市
			$(".city").val(data.vcity);
			//县
			$(".district").val(data.vdistrict);
			//街道
			$(".street").val(data.vstreet);
			//电话
			$(".phoneCode").val(data.vphoneCode);
			//邮箱
			$(".email").val(data.vemail);
		}
	});
}

//点击选择
function clickSelAddr(id){
	$(".addrlist").each(function(){
		$(this).css({"background":"#444444"});
	});
	$("#"+id).css({"background":"#777"});
	$("#addressId").val(id);
	showAddrInfo();
}

//编辑页遍历选中当前
function traversedSelAddr(iid){
	var addressId = $("#addressId").val();
	$(".addrlist").each(function(){
		var id = $(this).prop("id");
		if(id == addressId){
			$(this).css({"background":"#777"});
			$("#addressId").val(id);
		}else{
			if($("id").val() == ""){
				$("#"+iid).css({"background":"#777"});
				$("#addressId").val(iid);
			}
		}
	});
}

function initAddr(){
	var url = "${ctx}/order/getAddrListJson.do";
	$.get(url,{customerId:$("#customerId").val()},function(row){
		var data = row;
		//默认地址id
		var iid;
		if(data != "" && data != null){
			for(var i = 0; i < data.length; i++){
				var name = data[i].vreceiverName +" "+ data[i].vphoneCode+" "+data[i].vprovince+" "+data[i].vcity+" "+data[i].vstreet;
				insert_row(data[i].id,name);
				if(data[i].bisDefault == "Y"){
					iid = data[i].id;
				}
			}
			$(".add_dizhi").show();
		}else{
			$("#tbl").empty();
			$(".add_dizhi").hide();
		}
		traversedSelAddr(iid);
		//显示地址详细信息
		showAddrInfo();
	});
}

//选择下拉框值
function setSelValue(){
	//发票类型
	$(".invoice").val("${ordervo['bisinvoice']}");
	//发票内容
	$(".invoiceContent").val("${ordervo['vinvoiceContent']}");
	//预算价值
	$(".budget").val("${ordervo['vbudget']}");
	//交付方式
	$(".deliveryWay").val("${ordervo['vdeliveryWay']}");
}

//校验
function check(){
	
	//客户ID
	var customerId = $("#customerId").val();
	
	if(customerId == ""){
		alert("请选择客户...");
		return true;
	}
	
	return false;
}

//保存地址
function saveAddr(){
	
	if(check()){
		return ;
	}
	
	//姓名
	var receiverName = $(".receiverName").val();
	//省
	var province = $(".province").val();
	//市
	var city = $(".city").val();
	//县
	var district = $(".district").val();
	//街道
	var street = $(".street").val();
	//电话
	var phoneCode = $(".phoneCode").val();
	//邮箱
	var email = $(".email").val();
	var addressId = $("#addressId").val();
	$.post(
		"saveAddr.do", 
		{ id:addressId,customerId:customerId,vreceiverName: receiverName,vprovince:province,vcity:city,vdistrict:district,vstreet:street,vphoneCode:phoneCode,vemail:email }, 
		function (text, status) { 
			alert("保存成功!");
			if($("#addressId").val() == ""){
				insert_row(text.id,text.val);
			}
			$("#addressId").val(text.id);
		}
	);
}

//定制单保存回调此方法，添加到清单中
function loadCumById(cumId){
	//根据定制单ID获取定制单信息{edit:需要提供返回默认图的信息}
	var url = "${ctx}/order/getCumById.do";
	$.get(url,{id:cumId},function(data){
		data = JSON.parse("{\"id\":\"1\",\"nprice\":\"23\"}");
		$("#order-list").append("<dd type='dz' sid='"+data.id+"' class='"+data.id+" bill'><img class='bill-pic' src='${ctx}/resources/images/good_01.png'><input class='bill-num' type='text' placehoder='对' value='1'><b class='bill-price'>"+data.nprice+"元</b><a href='javascript:rlist("+data.id+")' class='close_c'><img src='${ctx}/resources/images/close.png'></a></dd>");
	});
}

//到定制单前预保存订单
function preSaveToCum(){
	if(check()){
		return ;
	}
	var id = $("#orderId").val();
	var customerId = $("#customerId").val();
	if(id == ""){
		var url = "save.do";
		var state = $("#orderState").val();
		$.post(url,{customerId:customerId,iorderState:state},function(data){
			$("#orderId").val(data.id);
			window.open("${ctx}/custom/info.do?orderId="+data.id+"&customerId="+customerId); 
		});
	}else{
		//打开定制单
		window.open("${ctx}/custom/info.do?orderId="+id+"&customerId="+customerId); 
	}
}

//保存订单
function saveOrder(){

	if(check()){
		return ;
	}
	
	//报价
    clearSuffix("order-quotedPrice","元");
    //已付
    clearSuffix("order-payment","元");
    //未付
    clearSuffix("order-nonPayment","元");
    //尾款实收
    clearSuffix("order-tailPaid","元");
    
    //清单数据
    var orderListJson = getOrderListInfo();
    
	$.ajax({
			type : "POST",
			     url : "save.do",
			     data:$('#orderFrmId').serialize()+"&list="+orderListJson,// formid
			     async:false,
			     cache:false,
			     success : function(data) {
			     	 $("#orderId").val(data.id);
			     	 alert("保存成功!");
			     },
			     error : function(e) {
			     	alert("保存失败!");
			     }
		    });
		    //有值加后缀
			initFieldSuffix();
}

//收集-清单数据
function getOrderListInfo(){
	var listJson = "[";
	$(".bill").each(function(index,domEle){
		var type = $(this).attr("type");
		if(type == "ch"){//链子
			var sid = $(this).attr("sid");
			var sname = $(this).find(".bill-name").text();
			var num = $(this).find(".bill-num").val();
			var price = $(this).find(".bill-price").text();
			listJson+="{\"vsourceType\":\""+type+"\",\"vname\":\""+sname+"\",\"vsourceId\":\""+sid+"\",\"nnumber\":\""+num+"\",\"nprice\":\""+price+"\"},";
		}else if(type == "dz"){
			var sid = $(this).attr("sid");
			var pic = $(this).find(".bill-pic").text();
			var num = $(this).find(".bill-num").val();
			var price = $(this).find(".bill-price").text();
			listJson+="{\"vsourceType\":\""+type+"\",\"vsourceId\":\""+sid+"\",\"nnumber\":\""+num+"\",\"nprice\":\""+price+"\",\"vpic\":\""+pic+"\"},";
		}
	});
	if(listJson.length > 1){
		listJson = listJson.substring(0,listJson.length-1);
	}
	listJson+="]";
	return listJson;
}
		function initFieldSuffix(){
			if($(".order-quotedPrice").val() != ""){
	    		//报价
		    	initSuffix("order-quotedPrice","元");
    		}
		  	if($(".order-payment").val() != ""){
	    		//已付
	    		initSuffix("order-payment","元");
    		}
	    	if($(".order-nonPayment").val() != ""){
	    		//未付
	    		initSuffix("order-nonPayment","元");
    		}
	    	if($(".order-tailPaid").val() != ""){
	    		//尾款实收
	    		initSuffix("order-tailPaid","元");
    		}
		}
//子窗体调用
		function setValueByFrame(type,id,json){
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
						initAddr();
					}
				});
			}else if(type == "chain"){
				var data = JSON.parse(json);
				//$(".partsGem .list_name").text(data.sname);
				//$(".partsGem .list_price").text(data.sprice);
				$("#order-list").append("<dd type='ch' sid='"+data.sid+"' class='"+data.sid+" bill'><span class='list_name bill-name'>"+data.sname+"</span><input class='list_num bill-num' style='width:40px;margin-left:10px;' type='text' value='1' placeholder='条'><b class='list_price bill-price'>"+data.sprice+"</b><a href='javascript:rlist("+data.sid+")' class='close_c'><img src='${ctx}/resources/images/close.png'></a></dd>");
			}else if(type == "order"){
				url = "${ctx}/order/view.do?id="+id;//根据id查询客户信息
				window.location = url;
			}
		}
		
		//删除清单
		function rlist(className){
			$("."+className).remove();
		}
</script>
<style>
.address .addrlist {background:#444444;}
</style>
</head>

<body>
<form id="orderFrmId">
<input type="hidden" name="id" id="orderId" value="${ordervo['id']}">
<input type="hidden" name="iorderState" id="orderState" value="<c:choose>
						 <c:when test="${empty ordervo['iorderState']}">   
						 0
						 </c:when>
						 <c:otherwise>
						 ${ordervo['iorderState']}
						 </c:otherwise>	
					</c:choose> ">
<input type="hidden" name="customerId" id="customerId" value="${ordervo['customerId']}">
<div class="header">
	<div class="head1">
		<div class="top">
			<b><a href="javascript:;" onclick="EditShow_Hidden(ed1)"><img src="${ctx}/resources/images/plus.png"></a> ${pageOrderType}定单
			<c:choose>
						 <c:when test="${empty ordervo['vorderCode']}">   
						 ${number }
						 <input type="hidden" name="vorderCode" value="${number }">
						 </c:when>
						 <c:otherwise>
						 ${ordervo['vorderCode']}
						 <input type="hidden" name="vorderCode" value="${ordervo['vorderCode']}">
						 </c:otherwise>	
					</c:choose> 
			</b>
			<font><a href="javascript:;" onclick="Show_Hidden(tr1)"><img src="${ctx}/resources/images/plus.png"></a></font>
		</div>
		<div class="hidden_enent1" id="tr1" style="display:none;">
			<ul>
				<li class="jian"><a href="javascript:;" onclick="Show_Hidden(tr1)">—</a></li>
				<li><a href="">定制单</a></li>
				<li><a href="">宝石签收单</a></li>
				<li class="menu-order"><a href="javascript:;">订单</a></li>
				<li><a href="">客户</a></li>
			</ul>
		</div>
		<div class="edit_hidden1" id="ed1" style="display:none;">
			<ul>
				<li class="jian2"><a href="javascript:;" onclick="EditShow_Hidden(ed1)">—</a></li>
				<li><a href="">Open</a></li>
				<li><a href="">Save</a></li>
				<li><a href="">Save as</a></li>
				<li><a href="">Print</a></li>			
			</ul>
		</div>
	</div>
</div>
<div class="all">
	<div class="main">
    <div class="mainleft">	
      <div class="customer">
        <ul>
          <li><a href=""><img class="cusheader" src="${ctx}/resources/images/customer_01.png"></a></li>
		  <!--<li class="file"><a href="javascript:;"><input type="file" name="file" id="file"></a></li>-->
		  <li class="file"><a href="javascript:;"><img src="${ctx}/resources/images/customer_02.png"></a></li>
          <div class="clear"></div>
        </ul>
      </div>
      <div class="gylc">
		<dl class="barbox">
			<dd class="barline">
				<div w="50" style="width: 50%;" class="charts"></div>
			</dd>
		</dl>
		<!--<dt><i class="status" style=" width:182px; position:absolute; top:180px; left:105px;"></i></dt>-->
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
        <dl id="order-list">
          <!--<dd class="mainGem" style="display: none"><img src="${ctx}/resources/images/good_01.png"><input type='text' value="1对"><b>6590元</b><a href="javascript:h('mainGem')" class="close_c"><img src="${ctx}/resources/images/close.png"></a></dd>-->
          <!--<dd class="partsGem" uid=""><span class="list_name"></span><input class="list_num" style="width:40px;margin-left:10px;" type='text' value="" placeholder="条"><b class="list_price"></b><a href="javascript:h('partsGem')" class="close_c"><img src="${ctx}/resources/images/close.png"></a></dd>-->
          <!--<dd class="zuanshiGem" style="display: none;"><img src="${ctx}/resources/images/good_03.png"><input type='text' value="1颗"><b>12590元</b><a href="javascript:h('zuanshiGem')" class="close_c"><img src="${ctx}/resources/images/close.png"></a></dd>-->
          <div class="clear"></div>
        </dl>
      </div>
      <div class="list1">
        <dl>
          <!--<dd><a href="javascript:void(0);" class="mainGem_btn">+款式</a></dd>-->
          <dd><a href="javascript:void(0);" class="partsGem_btn">+链子</a></dd>
          <dd><a href="javascript:void(0);" class="custom_btn">+定制单</a></dd>
          <!--<dd><a href="javascript:void(0);" class="zuanshiGem_btn">+钻石</a></dd>-->
		  <div class="clear"></div>
        </dl>
      </div>
	<script language="javascript" type="text/javascript" src="${ctx}/resources/js/add-input.js"></script>
	
    <div class="miaoshu2"><textarea name="vordermemo" cols="" rows="" class="miaoshu" placeholder="订单说明" onfocus="if(this.value=='订单说明'){this.value='';}"  onblur="if(this.value==''){this.value='订单说明';}">${ordervo['vordermemo'] }</textarea></div>
    </div>
        <div class="mainmid">
          <h2>交付地址</h2>
		  <script>
			 var i=0;
			 function insert_row(id,val){
			  i ++;
			  R = tbl.insertRow();
			  C = R.insertCell();
			  C.innerHTML = "<input class='addrlist' value='"+val+"' id='"+id+"' onclick='clickSelAddr("+id+")' readonly>";
			  C = R.insertCell();
			  C.innerHTML = "<a onclick='deleteRow(this,"+id+")' class='address-close'>X</a>";
			 }
			 function deleteRow(obj,aid){
			  alert('确定要删除吗');
			  var delUrl = "${ctx}/order/delAddrById.do";
			  $.get(delUrl,{id:aid},function(){
			  	tbl.deleteRow(obj.parentElement.parentElement.rowIndex);
			  });
			 }
			 function add_addr(){
			 	$(".add_dizhi :input").each(function(){
			 		$(this).val("");
			 	});
			 	$("#addressId").val("");
			 	$("#addrSave").val("Save");
			 	$(".add_dizhi").show();
			 }
		  </script>
          <div class="address">
          	<input type="hidden" name="addressId" value="${ordervo['addressId'] }" id="addressId">
            <table name='tbl' id="tbl"  class="add-address"> 
            
            </table> 
            <!--<p class="new_adr">丁力 清华路17号院29号楼B座1103室...<a href="">X</a></p>-->
            <input type="button" value="+新建地址" onclick="add_addr()" />
          </div>
          <div class="add_dizhi" style="display:none;">
            <div class="save1"><input type='text' name='vreceiverName' class="add name receiverName" value='' placeholder="姓名"></div>
            <p>
            <select name="vprovince" id="vprovince" class="add area1 prov province">
            </select>
            <select name="vcity" id="vcity" class="add area2 city">
            </select>
            </p>
            <select name="vdistrict" id="vdistrict" class="jianding district">
            </select>
            <p>
            <div class="save1"><input type='text' name='vstreet' class="add dizhi street" value='' placeholder="如街道名称，门牌号码，楼层和房间号等信息"></div>
            <p><input type='text' name='vphoneCode' class="add tel phoneCode" value="" placeholder="手机电话"><input type='text' class="add email" name='vemail' value="" placeholder="邮箱"></p>
            <div class="save1"><input type="button" id="addrSave" name="Submit" class="save" value="Save" /></div>
          </div>
          <div class="fapiao">
            <h3>发票</h3>
            <p>
              <select name=bisinvoice class="fp fp1 invoice">
                <option value="N">不开发票</option>
                <option value="Y">开发票</option>
              </select>
              <select name="vinvoiceType" class="fp fp2 invoiceType">
                <option>珠宝首饰</option>
              </select>
            </p>
            <input type='text' name='vinvoiceTitle' value="${ordervo['vinvoiceTitle'] }" placeholder="发票抬头">
          </div>
        </div>
        <div class="mainrig">
          <h2>支付与交付</h2>
          <select name="vbudget" class="jianding budget">
            <option value="1">10001-20000元</option>
            <option value="2">20001-30000元</option>
            <option value="3">30001-40000元</option>
            <option value="4">40001-50000元</option>
          </select>
          <p><input type='text' name="nquotedPrice" class="zf bj order-quotedPrice" value="${ordervo['nquotedPrice'] }" placeholder="报价"><input type='text' name="npayment" class="zf yf order-payment" value="${ordervo['npayment'] }" placeholder="已付"></p>
          <p><input type='text' name="nnonPayment" class="zf bj order-nonPayment" value="${ordervo['nnonPayment'] }" placeholder="未付"><input type='text' name="ntailPaid" class="zf yf order-tailPaid" value="${ordervo['ntailPaid'] }" placeholder="尾收"></p>
          <input type="text" name="ddeliverdate" value="${ordervo['ddeliverdate'] }" id="datetimepicker" class="jianding" placeholder="交付时间" />
          
          <select name="vdeliveryWay" class="jianding deliveryWay">
            <option value="0">来店自取</option>
            <option value="1">邮递</option>
          </select>
          <div class="baocun">
            <input type="button" id="orderSave" name="button" value="保存">
          </div>
      </div>
        <div class="clear"></div>
    </div>
</div>
</form>
	</body>
</html>
