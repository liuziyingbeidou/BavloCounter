/**
 * @author shijf
 * 定制单js
 */

//计算价格webservice
var calculatorUrl = "/counter/webservice/httpcalculator.do";
//宝石图片class名 
var gemSignClass = "";
//弹框页面
$(function() {
	
	//宝石签收单列表
	$(".kzs_guanlian").bind("click",function(){
		openURL("/counter/gem-sign/list.do","宝石签收单列表");
		gemSignClass = "kzs_img";
	});
	//宝石签收单列表
	$(".kps_guanlian").bind("click",function(){
		openURL("/counter/gem-sign/list.do","宝石签收单列表");
		gemSignClass = "kps_img";
	});
	//宝石弹框
	$(".kxsGem_btn").click(function(){
		openURL("/counter/common/getGemInfo.do","库选石");
	});
	//链子弹框
	$(".lzGem_btn").click(function(){
		openURL("/counter/common/getChainInfo.do","链子");
	});
	
	
	 //上传图片
	 $(".cankaotu").bind("click",function(){
	 		openURL("/counter/upload/uppage.do","上传参考图"); 
	 });
	 $(".qibantu").bind("click",function(){
	 		openURL("/counter/upload/uppage.do","上传起版图"); 
	 });
	 $(".vectorgraph").bind("click",function(){
	 		openURL("/counter/upload/uppage.do","上传刻字矢量图"); 
	 		$("#filevalue").val("vengraveVh");
	 });
	 $(".cad_file").bind("click",function(){
	 		openURL("/counter/upload/uppage.do","上传CAD文件"); 
	 		$("#filevalue").val("vcadFile");
	 });
	 
	 //图片显示
	 $(".customPicShow").bind("click",function(){
	 	var mid = $("#customid").val();
	 	if(mid == "" || mid == undefined){
	 		alert("请保存后查看!");
	 	}else{
	 		openURL("/counter/upload/showpic.do?cpath=com.bavlo.counter.model.custom.CustomBVO&fkey=customId&id="+mid,"图片展示");
	 	}
	 });
	 
});

// 计算价格
var params = {};
params.insuranceRate = 0.005;
params.expressPrice = 22;
params.typeId = 1;
params.metalId = 1;
params.metalWeight = 0;
params.mainGemPrice = 0;
params.inlayPrice = 0;
params.pmPrice = 0;
params.otherPrice = 0;
params.reportPrice = 0;
params.chainPrice = "";
params.stockGemPrice = "";

$(function() {
	
	// 款式类型值
	$("select[id='styleType']").change(function() {
		params.typeId = $(this).find("option:selected").attr("sid");
	})
	
	// 金属类型值
	$("select[id='metalType']").change(function() {
		params.metalId = $(this).find("option:selected").attr("sid");
	})
	
	// 金属重量值
	$("input[id='metalWeight']").blur(function() {
		params.metalWeight = parseInt($(this).val()) * 1;
		// 增加后缀
		initSuffix("metal_weight","克");
		checkNum(this);
	})
	
	// 制版费用值
	$("input[id='pmPrice']").blur(function() {
		params.pmPrice = parseInt($(this).val()) * 1;
		// 增加后缀
		initSuffix("pm_price","元");
		checkNum(this);
	})
	
	// 主石保价值
	$("input[id='mainGemPrice']").blur(function() {
		params.mainGemPrice = parseInt($(this).val()) * 0.04;
		// 增加后缀
		initSuffix("kzs_price","元");
		checkNum(this);
	})
	
	// 配石数量
	$("input[id='inlayPrice']").blur(function() {
		params.inlayPrice = parseInt($(this).val()) * 2;
		// 增加后缀
		initSuffix("kps_count","颗");
		checkNum(this);
	})
	
	// 其他价格
	$("input[id='otherPrice']").blur(function() {
		params.otherPrice = parseInt($(this).val()) * 1;
		// 增加后缀
  		initSuffix("other_price","元");
  		checkNum(this);
	})
	
	// 鉴定费用
	$("select[id='certificate']").change(function() {
		if ($(this).val() == 1) {
			params.reportPrice = 25;
		} else {
			params.reportPrice = 0;
		}

	})

	// 最终价格
	$(".calculator_btn").click(function() {
		calculator("totalPrice")
	})
	
	// 价格详情
	$(".calculator_btn2").click(function() {
		calculator("detailPrice")
	})
	
})

//计算价格
function calculator(str) {
	var weight = params.metalWeight;
	if (weight >= 500) {
		alert("金属不能大于500克");
		$("#metalWeight").val("");
		$("#metalWeight").focus();
		return;
	}
	if (weight == "" || weight == 0 || isNaN(weight)) {
		alert("请输入正确的金属重量");
		$("#metalWeight").val("");
		$("#metalWeight").focus();
		return;
	}
	params.chainPrice = "";
	$(".cPrice").each(function() {
		params.chainPrice+=$(this).val()+";";
	})
	params.stockGemPrice = "";
	$(".sgPrice").each(function() {
		params.stockGemPrice+=$(this).val()+";";
	})

	var requestUrl = 'http://www.bavlo.com/calculate';
	var requestMethod = "POST";//GET
	var outputStr = 'typeId='+params.typeId+'&metalId='+params.metalId+'&metalWeight='+params.metalWeight+'&pmPrice='+params.pmPrice+'&mainGemPrice='+params.mainGemPrice+'&inlayPrice='+params.inlayPrice+'&otherPrice='+params.otherPrice+'&reportPrice='+params.reportPrice+'&expressPrice='+params.expressPrice+'&insuranceRate='+params.insuranceRate+'&chainPrice='+params.chainPrice+'&stockGemPrice='+params.stockGemPrice+'';
	
	httpRequest(calculatorUrl,requestUrl,requestMethod,outputStr,function(data) {
		 	var jsonStr = JSON.parse(data);
		 	if ("savePrice" == str) {
		 		$(".finalPrice").val(jsonStr.price);
		 		save();
		 	} else if ("totalPrice" == str) {
		 		$(".price").text(jsonStr.price);
			} else if ("detailPrice" == str) {
				$(".price").text(parseInt(jsonStr.cost)+" + "+(parseInt(jsonStr.price)-parseInt(jsonStr.cost))+" = "+jsonStr.price);
			}
	});
}

// 定制单保存
function saveOrUpdate() {
	//通过计算后保存
	calculator("savePrice");
}
// 定制单保存方法
function save(){
	cleanFieldSuffix();
	var bvo = JSON.stringify($('#customBId').serializeJson());
	var cvo = chainJson();
	var dvo = stockGemJson();
	
	$.ajax({
		type : "POST",
		url : "save.do",
		data : $('#custom').serialize()+"&bvo="+bvo+"&cvo="+cvo+"&dvo="+dvo,// formid
		async : false,
		cache : false,
		success : function(data) {
			$("#customid").val(data.id);
			alert("保存成功!");
			initFieldSuffix();
		},
		error : function(e) {
			alert("保存失败!");
			initFieldSuffix();
		}
	});
	var orderId = $("#orderId").val();
	//跳转到订单页面
	if(orderId != ""){
		url = "/counter/order/edit.do?id="+orderId;//根据id查询客户信息
		window.location = url;
	}
}

// 拼接链子Json
function chainJson(){
	
	var jsonStr = "[";
	
	$(".chainList").each(function(){
		var chain_name = $(this).find(".chain_name").text();
		var chain_item = $(this).find(".chain_item").val();
		var cPrice = $(this).find(".cPrice").val();
		jsonStr+="{";
		jsonStr+="\"vchainName\":\""+chain_name+"\",";
		jsonStr+="\"ichainItem\":\""+chain_item+"\",";
		jsonStr+="\"nchainCost\":\""+cPrice+"\"";
		jsonStr+="},";
	});
	
	if(jsonStr.length != 1){
		jsonStr = jsonStr.substring(0, jsonStr.length-1);
	}
	
	jsonStr+="]";
	
	return jsonStr;
}

//拼接库选宝石Json
function stockGemJson(){
	
	var jsonStr = "[";
	
	$(".stockGemList").each(function(){
		var stockGem_name = $(this).find(".stockGem_name").text();
		var stockGem_num = $(this).find(".stockGem_num").val();
		var stockGem_img_path = $(this).find(".stockGem_img_path").attr("src");
		var sgPrice = $(this).find(".sgPrice").val();
		jsonStr+="{";
		jsonStr+="\"vstockGemName\":\""+stockGem_name+"\",";
		jsonStr+="\"istockGemNum\":\""+stockGem_num+"\",";
		jsonStr+="\"vstockGemImgPath\":\""+stockGem_img_path+"\",";
		jsonStr+="\"nstockGemCost\":\""+sgPrice+"\"";
		jsonStr+="},";
	});
	
	if(jsonStr.length != 1){
		jsonStr = jsonStr.substring(0, jsonStr.length-1);
	}
	
	jsonStr+="]";
	
	return jsonStr;
}

//子窗体调用
function setValueByFrame(type,id,callback,json,v){
	var url;
	if(type == "chain"){
		addChain(json);
		closeMultiDlg();
	}else if(type == "signGem"){
		var mainGemPic = $("#mainGemPic").val();
		var partsGemPic = $("#partsGemPic").val();
		var url = "/counter/custom/getGem.do";
		$.post(url,{id:id},function(row){
			var data = row;
			if(data!=null){
				var pic = "";
				if(data.FILE_0 != "" && data.FILE_0 != null){
					pic = "'/counter/staticRes/"+data.FILE_0+"'";
				}else{
					pic = "'/counter/resources/images/good_01.png'";
				}
			}
			if(gemSignClass == "kzs_img"){
				if(mainGemPic == ""){
					$("."+gemSignClass).append("<img class='gem_img' style='width:38px;height:38px;' src="+pic+" >");
				}else {
					$(".gem_img").attr("src",pic);
				}
				$("#mainGemPic").val(pic);
			}
			if(gemSignClass == "kps_img"){
				if(partsGemPic == ""){
					$("."+gemSignClass).append("<img class='gem_img' style='width:38px;height:38px;' src="+pic+" >");
				}else {
					$(".gem_img").attr("src",pic);
				}
				$("#partsGemPic").val(pic);
			}
		});
		
		closeMultiDlg();
	}else if(type == "gem"){
		addStockGem(v);
		closeMultiDlg();
	}else if(type == "customer"){
		url = "/counter/customer/infoJson.do";
		$.get(url,{id:id},function(data){
			if(data != null){
				if(data.vhendimgurl != ""){
					$(".cusheader").prop("src",data.vhendimgurl);
				}
				$("#customerId").val(data.id);
			}
			closeMultiDlg();
		});
	}else if(type == "order"){
		url = "/counter/order/edit.do?id="+id;//根据id查询客户信息
		window.location = url;
	}else if(type == "order-view"){
		url = "/counter/order/view.do?id="+id;//根据id查询客户信息
		window.location = url;
	}else if(type == "entity"){
		url = "/counter/entity-sign/view.do?id="+id;//根据id查询客户信息
		window.location = url;
	}else if(type == "customer-menu"){
		url = "/counter/customer/info.do?id="+id;//根据id查询客户信息
		window.location = url;
	}else if(type == "custom"){
		url = "/counter/custom/edit.do?id="+id;//根据id定制单信息
		window.location = url;
	}else if(type == "custom-view"){
		url = "/counter/custom/detail.do?id="+id;//根据id显示定制单信息
		window.location = url;
	}
	
}

//删除清单
function rlist(className){
	$("."+className).remove();
}

//隐藏主石或配石
function h(str) {
	if ("kzsGem" == str) {
		params.mainGemPrice = 0;
		$("#mainGemPrice").val('');
	} else if ("kpsGem" == str) {
		params.inlayPrice = 0;
		$("#inlayPrice").val('');
	}
	var text = $("." + str + "_btn").text();
	//$("." + str + "_btn").text(text.replace('-', '+'));
	$("." + str).hide();
}
//增加链子
function addChain(json){
	var i=1;
	for(var c=1;c<100;c++){
		if($(".chain"+c).length==0){
			i=c;
			break;
		}
	}
	var html="";
	var data = JSON.parse(json);
	
	html+= "<dd class='chainList chain"+i+"'>"+
		   "<div class='lianzi'>"+
		   "<h3>链子</h3><a href='javascript:removeChain("+i+")' class='close_c'><font>X</font></a>"+
		   "<div class='clear'></div>"+
		   "<input class='chain_item' id='chainItem' name='ichainItem' type='text' price='"+data.sprice+"' value='' placeholder='条'>"+
		   "<strong class='chain_name'>"+data.sname+"</strong>" +
		   "</div>" +
		   "<input type='hidden' class='cPrice'/>"+
		   "</dd>";
	
	$(".chain").append(html);
	$("input[id='chainItem']").blur(function(){
		 checkNum(this);
		 var qutity=$(this).val();
		 var price=$(this).attr("price");
		 $(this).parent().nextAll(".cPrice").val((price*qutity).toFixed(2));
	})
}
//删除链子
function removeChain(id) {
	$(".chain" + id).remove();
}

//增加库选宝石
function addStockGem(json){
	var i=1;
	 for(var g=1;g<100;g++){
		 if($(".stockGem"+g).length==0){
			 i=g;
			 break;
		 }
	 }
	 var html="";
	 var type=json.attr("type");
	 var shape=json.attr("shape");
	 var calibrated=json.attr("calibrated");
	 var weight=json.attr("weight");
	 var costPrice=json.attr("costPrice");
	 var pic=json.find("img").attr("src");
		
    html+= "<dd class='stockGemList stockGem"+i+"'>"+
   	 	"<div div class='lianzi'>"+	
		    "<h3>库选宝石</h3>"+
		    "<a href='javascript:removeStockGem("+i+")' class='close_c'><font>X</font></a><div class='clear'></div>"+
		    "<input class='stockGem_num' id='stockGem' name='istockGemNum' type='text' value='' price='"+costPrice+"' placeholder='颗'>"+
			"<img class='stockGem_img_path' src='"+pic+"'/><strong class='stockGem_name'>"+type+" "+weight+"ct</strong>"+
			"</div>" +
			"<input type='hidden' class='sgPrice'/>"+
			"</dd>";
			
	 $(".chain").append(html);
	 $("input[id='stockGem']").blur(function(){
	 	  checkNum(this);
		  var qutity=$(this).val();
		  var price=$(this).attr("price");
		  $(this).parent().nextAll(".sgPrice").val((price*qutity+qutity*2).toFixed(2));
	 })
}
//删除库选石
function removeStockGem(id) {
	$(".stockGem" + id).remove();
}

//检查数值
function checkNum(obj) {
	var reg = new RegExp("^[0-9].*$");
	if ($(obj).val() == "") {
		$(obj).val(0);
		return;
	} else if (!reg.test($(obj).val())) {
			$(obj).val("");
			return;
	}
}

//增加后缀 
function initFieldSuffix(){
	if($(".metal_weight").val() != ""){
		 //金属重量 
		initSuffix("metal_weight","克");
	}
  	if($(".kzs_price").val() != ""){
		//主石金额 
		initSuffix("kzs_price","元"); 
	}
  	if($(".kps_count").val() != ""){
		//配石数量
		initSuffix("kps_count","颗"); 
	}
  	if($(".pm_price").val() != ""){
  		//起版费用
  		initSuffix("pm_price","元"); 
  	}
  	if($(".other_price").val() != ""){
		//其他金额 
		initSuffix("other_price","元"); 
	}
}

//清除后缀
function cleanFieldSuffix(){
	//金属重量 
	clearSuffix("metal_weight","克");
	//主石金额 
	clearSuffix("kzs_price","元");
	//配石数量
	clearSuffix("kps_count","颗");
	//制版金额 
	clearSuffix("pm_price","元");
	//其他金额 
	clearSuffix("other_price","元");

}

//改变字体
function initFont(){
	var font=$('.ziti').find("option:selected").val();
	$(".kezi").css({"font-family":font});
}
