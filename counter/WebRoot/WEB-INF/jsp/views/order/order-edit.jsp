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
<script type="text/javascript" src="${ctx}/resources/js/cityselect/jquery.cityselect.js"></script>
<!-- 日期选择器 -->
<link href="${ctx}/resources/timepicker/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="${ctx}/resources/timepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="${ctx}/resources/timepicker/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/timepicker/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${ctx}/resources/timepicker/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>

<!-- 远程数据初始下拉框值 -->
<script src="${ctx}/resources/js/bavlo-initdata.js"></script>
<script type="text/javascript">
//本地webservice
var nativeUrl = "${pageScope.basePath}/counter/webservice/http.do";
$(function(){
	//获取所有金属材质
	initChainMaterial();
	//获取所有链子类型
	initChainStyle();
	$("#chain-material-id").change(function(){
		initChainSpec("chain-spec-id");
	});
	$("#chain-style-id").change(function(){
		initChainSpec("chain-spec-id");
	});
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
	$("#city").citySelect({url:"${ctx}/resources/js/cityselect/city.min.js",nodata:"none",required:false}); 
	$("#addrSave").click(function(){
		saveAddr();
	});
	$("#orderSave").click(function(){
		saveOrder();
	});
	//链子弹框
	$(".partsGem_btn").click(function(){
		$("#kxs").show();
	});
	$(".ok").click(function(){
		toOrder();
		KxsShow_Hidden("kxs");
	});
	//选择下拉框值
	setSelValue();
});

//填充所有金属材质于下拉框
function initChainMaterial(){
	var materialUrl = "http://www.bavlo.com/getAllMetalMaterialType";
	loadSelData(nativeUrl, materialUrl, "chain-material-id", "data[i].id","data[i].metal_type", function() {});	
}

//填充所有链子类型于下拉框
function initChainStyle(){
	var styleUrl = "http://www.bavlo.com/getAllChainStyle";
	loadSelData(nativeUrl, styleUrl, "chain-style-id", "data[i].id","data[i].name_cn", function() {});
}

//根据选择链子材质+类型选择链子(chain-spec-id)
function initChainSpec(emName){
	$('#'+emName).empty();
	$('#'+emName).append("<option value='-1'>==请选择==</option>");
	var chainMaterialId = $("#chain-material-id").val();
	var chainStyleId = $("#chain-style-id").val();
	var styleUrl = "http://www.bavlo.com/getChainList?metalId="+chainMaterialId+"&chainStyleId="+chainStyleId;
	$.get(nativeUrl,{url:styleUrl},function(row){
		var data = row;
		for(var i=0;i<data.length;i++){
			$('#'+emName).append("<option cost="+data[i].chainCost+" value='"+data[i].id+"'>"+data[i].x+" x "+data[i].y+" x "+data[i].z+"</option>");
		}
	});
}

//添加链子到清单
function toOrder(){
	$(".partsGem .list_name").text($("#chain-material-id").find("option:selected").text()+" "+ $("#chain-style-id").find("option:selected").text()+" "+$("#chain-spec-id").find("option:selected").text());
	$(".partsGem .list_price").text($("#chain-spec-id").find("option:selected").attr("cost"));
	if($(".partsGem").css("display")=='none'){
		$(".partsGem").show();
	}else{
		$(".partsGem").hide();
		params.inlayPrice=0;
	}
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

//保存地址
function saveAddr(){
	//姓名
	var receiverName = $(".receiverName").val();
	//省
	var province = $(".province").val();
	//市
	var city = $(".city").val();
	//街道
	var street = $(".street").val();
	//电话
	var phoneCode = $(".phoneCode").val();
	//邮箱
	var email = $(".email").val();
	
	$.post(
		"saveAddr.do", 
		{ vreceiverName: receiverName,vprovince:province,vcity:city,vstreet:street,vphoneCode:phoneCode,vemail:email }, 
		function (text, status) { 
			alert("保存成功!");
			$("#addrId").val(text.id);
			insert_row(text.id,text.val);
			$(".add_dizhi").hide();
		}
	);
}
//保存订单
function saveOrder(){

	$.ajax({
			type : "POST",
			     url : "save.do",
			     data:$('#orderFrmId').serialize(),// formid
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
}
</script>
</head>

<body>
<form id="orderFrmId">
<input type="hidden" name="id" id="orderId" value="${ordervo['id']}">
<input type="hidden" name="iorderState" value="${ordervo['iorderState']}">
<div class="header">
	<div class="head1">
		<div class="top">
			<b><a href="javascript:;" onclick="EditShow_Hidden(ed1)"><img src="${ctx}/resources/images/plus.png"></a> ${pageOrderType}定单81812560</b>
			<font><a href="javascript:;" onclick="Show_Hidden(tr1)"><img src="${ctx}/resources/images/plus.png"></a></font>
		</div>
		<div class="hidden_enent1" id="tr1" style="display:none;">
			<ul>
				<li class="jian"><a href="javascript:;" onclick="Show_Hidden(tr1)">—</a></li>
				<li><a href="">定制单</a></li>
				<li><a href="">宝石签收单</a></li>
				<li><a href="">订单</a></li>
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
          <li><a href=""><img src="${ctx}/resources/images/customer_01.png"></a></li>
		  <!--<li class="file"><a href="javascript:;"><input type="file" name="file" id="file"></a></li>-->
		  <li class="file"><a href="javascript:;" onclick="Pic2Show_Hidden(pic2)"><img src="${ctx}/resources/images/customer_02.png"></a></li>
          <div class="clear"></div>
        </ul>
      </div>
	  
	  <!--订单列表弹窗-->
	  <div class="orderlist" id='pic2' style=' display:none;'>
		<div class="order-main">
			<div class="order-list">订单列表 <a href="javascript:;" onclick="Pic2Show_Hidden(pic2)">X</a></div>
			<div class="search-1">
				<form action='' method='post'>
					<input type='text' name='search' class="search" value='搜索'>
				</form>
			</div>
			<div class="">
				<div class="main1 content">
					<div class="left-sider">
					  <div class="operate">
						<ul id="juheweb">
						  <li >
							<h4 ><img src="${ctx}/resources/images/customer_01.png"><b>张丹丹</b><a href="">68664646</a><span><a href="">选择</a></span></h4>
							<div class="list-item none">
							  <dl>
								<dd><img src="${ctx}/resources/images/good_01.png"></dd>
								<dd><img src="${ctx}/resources/images/good_02.png"></dd>
								<dd><img src="${ctx}/resources/images/good_03.png"></dd>
							  </dl>
							  <div class="clear"></div>
							  <dt>报价：<b>36700元</b> 已付：<b>10000元</b> 未付：<b>26700元</b> 实收：— </dt>
							</div>
							<div class="clear"></div>
						  </li>
						</ul>
						<script type="text/javascript" language="javascript">
							navList(12);
						</script>
					  </div>
					</div>
				  </div>
			</div>
		</div>
	  </div>
	  <!--订单列表弹窗END-->
	  
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
        <dl >
          <dd class="mainGem" style="display: none"><img src="${ctx}/resources/images/good_01.png"><input type='text' value="1对"><b>6590元</b><a href="javascript:h('mainGem')" class="close_c"><img src="${ctx}/resources/images/close.png"></a></dd>
          <dd class="partsGem" uid="" style="display: none;"><span class="list_name"></span><input class="list_num" style="width:40px;margin-left:10px;" type='text' value="" placeholder="条"><b class="list_price"></b><a href="javascript:h('partsGem')" class="close_c"><img src="${ctx}/resources/images/close.png"></a></dd>
          <dd class="zuanshiGem" style="display: none;"><img src="${ctx}/resources/images/good_03.png"><input type='text' value="1颗"><b>12590元</b><a href="javascript:h('zuanshiGem')" class="close_c"><img src="${ctx}/resources/images/close.png"></a></dd>
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
      <div style=" width:100%; position:relative;">
				<!--库选石弹窗-->
				  <div class="kxbs" id='kxs' style=' display:none;'>
					<div class="kxbs-in">
					  <div class="kxbs-in-close"><a href="javascript:;" onclick="KxsShow_Hidden(kxs)">X</a></div>
					  <div id="choose">
						<h3>链子</h3>
						<select name="material" id="chain-material-id">
						  <option value="-1">请选择</option>
						</select>
					  </div>
					  <div id="choose">
						<select name="type" id="chain-style-id">
						  <option value="-1">请选择</option>
						</select>
					  </div>
					  <div id="choose">
						<select name="spec" id="chain-spec-id">
						  <option value="-1">请选择</option>
						</select>
					  </div>
					  <input type="button" name="button" value="OK" class="ok">
					</div>
				  </div>
				<!--库选石弹窗END-->
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
			  C.innerHTML = "<input value='"+val+"' id='"+id+"' readonly>";
			  C = R.insertCell();
			  C.innerHTML = "<a onclick='deleteRow(this)' class='address-close'>X</a>";
			 }
			 function deleteRow(obj){
			  alert('确定要删除吗');
			  tbl.deleteRow(obj.parentElement.parentElement.rowIndex);
			 }
			 function add_addr(){
			 	$(".add_dizhi").show();
			 }
		  </script>
          <div class="address">
          	<input type="hidden" name="addressId" value="${ordervo['addressId'] }" id="addressId">
            <table name='tbl' id="tbl"  class="add-address"> </table> 
            <!--<p class="new_adr">丁力 清华路17号院29号楼B座1103室...<a href="">X</a></p>-->
            <input type="button" value="+新建地址" onclick="add_addr()" />
          </div>
          <div class="add_dizhi" style="display:none;">
            <div class="save1"><input type='text' name='vreceiverName' class="add name receiverName" value='' placeholder="姓名"></div>
            <p>
            <div id="city">
            <select name="vprovince" class="add area1 prov province">
              </select>
              <select name="vcity" class="add area2 city">
              </select>
            </div>
            </p>
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
          <p><input type='text' name="nquotedPrice" class="zf bj" value="${ordervo['nquotedPrice'] }" placeholder="报价"><input type='text' name="npayment" class="zf yf" value="${ordervo['npayment'] }" placeholder="已付"></p>
          <p><input type='text' name="nnonPayment" class="zf bj" value="${ordervo['nnonPayment'] }" placeholder="未付"><input type='text' name="ntailPaid" class="zf yf" value="${ordervo['ntailPaid'] }" placeholder="尾收"></p>
          <input type="text" id="datetimepicker" class="jianding" placeholder="交付时间" />
          
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
