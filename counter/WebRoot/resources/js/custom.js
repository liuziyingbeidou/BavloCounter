/**
 * @author shijf
 * 款式单js
 */

/**
 * 初始基础数据
 */
//本地webservice
var nativeUrl = "/counter/webservice/http.do";

$(function(){
	//发送客户显示
	$(".menu-send-cust").show();
	
	//款式单ID
	var customId = $("#customId").val();
	//客户ID
	var customerId = $("#customerId").val();
	//刻字矢量图
	var vengraveVh = $("#vengraveVh").val();
	//CAD文件
	var vcadFile = $("#vcadFile").val();
	//款式类型
	var srcstyleType = $("#srcstyleType").val();
	//金属材质
	var srcmetal = $("#srcmetal").val();
	//戒指手寸
	var srcringSize = $("#srcringSize").val();
	//主石价值
	var nmainGemCost = $("#nmainGemCost").val();
	//主石信息
	var vmainGemName = $("#vmainGemName").val();
	//主石图片
	var vmainGemPic = $("#vmainGemPic").val();
	//配石数量
	var ipartsGemNum = $("#ipartsGemNum").val();
	//配石信息
	var vpartsGemName = $("#vpartsGemName").val();
	//配石图片
	var vpartsGemPic = $("#vpartsGemPic").val();
	//工艺标签
	var vcraftTag = $("#vcraftTag").val();
	//链子Json
	var chainJson = $("#chainJson").val();
	//库选宝石Json
	var stockGemJson = $("#stockGemJson").val();
	
	// 款式类型下拉框值
	var typeUrl = "http://www.bavlo.com/getAllStyleType";
	loadSelDataStr(nativeUrl, typeUrl, "styleType", "data[i].id",
			"data[i].type_name_cn", function() {
				$("#styleType").val(srcstyleType);
			},"款式");
	// 金属材质下拉框值
	var typeUrl = "http://www.bavlo.com/getAllMetalMaterialType";
	loadSelDataStr(nativeUrl, typeUrl, "metalType", "data[i].id",
			"data[i].metal_type_cn", function() {
				$("#metalType").val(srcmetal);
			},"金属");
	// 款式类型下拉框值
	var typeUrl = "http://www.bavlo.com/getAllRingSize";
	loadRingSizeData(nativeUrl, typeUrl, "ringSize", "data[i].id",
			"data[i].china", "data[i].diameter", "data[i].circumference",
			function() {
				$("#ringSize").val(srcringSize);
			},"手寸");
	// 当款式类型不是戒指时，隐藏戒指手寸选项
	$("#styleType").change(function() {
		if ($("#styleType").val() == "戒指") {
			$("#ringSize").css({
				display : "block"
			});
		} else {
			$("#ringSize").css({
				display : "none"
			});
		}
	});
	
	// 客主石
	if(nmainGemCost != ""){
		$(".kzsGem").show();
		var pic = $("#vmainGemPic").val();
		$(".kzs_img").append("<img class='mainGem_img' style='width:38px;height:38px;' src="+pic+" >");
	}
	$(".kzsGem_btn").click(function() {
		if ($(".kzsGem").css("display") == 'none') {
			$(".kzsGem").show();
			//var text = $(this).text();
			//$(this).text(text.replace('+', '-'));
		} else {
			h("kzsGem");
		}
	})
	// 客配石
	if(ipartsGemNum != ""){
		$(".kpsGem").show();
		var pic = $("#vpartsGemPic").val();
		$(".kps_img").append("<img class='partsGem_img' style='width:38px;height:38px;' src="+pic+" >");
	}
	$(".kpsGem_btn").click(function() {
		if ($(".kpsGem").css("display") == 'none') {
			$(".kpsGem").show();
			//var text = $(this).text();
			//$(this).text(text.replace('+', '-'));
		} else {
			h("kpsGem");
		}
	})

	// 初始化标签
	var WS = function(opt) {

		var regexp = opt.regexp || /\S/, el = $(opt.el), list = el.val().split(','), holder = $('<span class="words-split"></span>')

		for (var i = 0; i < list.length; i++) {
			if(list[i] != ""){
				holder.append($('<a href="javascript:void(0)" class="fm-button">'
						+ list[i] + '<em> </em></a>'));
			}
		}
		el.hide().after(holder);

		holder.on('click', 'a>em', function() { // 刪除
			$(this).parent().remove();
			el.val(holder.text().match(/\S+/g).join(','))
		});

		$(".gongyi1").change(function() { // 添加
			var t = $(this).find("option:selected").val();
			var str = $(".custom_engrave").val();
			if(str.indexOf(t) < 0){
				if (t) {
					holder.append($('<a href="javascript:void(0)" class="fm-button">'
									+ t + '<em> </em></a>'));
					el.val(holder.text().match(/\S+/g).join(','));
				} 
			}
		});
	}

	WS({
		el : '#vcraftTag',
		regexp : /\w+\.\w+/
	});
	//刻字字体样式
	initFont();
	$(".ziti").change(function(){
		initFont();
	})
	
	//链子
	if(chainJson != ""){
		add("chain",chainJson);
	}
	//库选石
	if(stockGemJson != ""){
		add("stockGem",stockGemJson)
	}
	
	
	// 金属重量值
	$("input[id='metalWeight']").blur(function() {
		// 增加后缀
		initSuffix("metal_weight","克");
		checkNum(this);
	})
	
	// 制版费用值
	$("input[id='pmPrice']").blur(function() {
		// 增加后缀
		initSuffix("pm_price","元");
		checkNum(this);
	})
	
	// 主石保价值
	$("input[id='mainGemPrice']").blur(function() {
		// 增加后缀
		initSuffix("kzs_price","元");
		checkNum(this);
	})
	
	// 配石数量
	$("input[id='inlayPrice']").blur(function() {
		// 增加后缀
		initSuffix("kps_count","颗");
		checkNum(this);
	})
	
	// 其他价格
	$("input[id='otherPrice']").blur(function() {
		// 增加后缀
  		initSuffix("other_price","元");
  		checkNum(this);
	})
	
	// 最终价格
	$(".calculator_btn").click(function() {
		calculator("totalPrice");
	})
	// 价格详情
	$(".calculator_btn2").click(function() {
		calculator("detailPrice");
	})
	
	//增加后缀
	initFieldSuffix();
})

/**
 * 弹框
 */
//宝石图片class名 
var gemSignClass = "";
$(function() {
	
	//宝石签收单列表
	$(".kzs_guanlian").bind("click",function(){
		openURL("/counter/gem-sign/list.do","宝石签收单列表",470,550);
		gemSignClass = "kzs_img";
	});
	//宝石签收单列表
	$(".kps_guanlian").bind("click",function(){
		openURL("/counter/gem-sign/list.do","宝石签收单列表",470,550);
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
		 	$("#filetype").val("pic");
		 	$("#vtype").val("customCankao");
	 		openURL("/counter/upload/uppage.do","上传参考图"); 
	 });
	 $(".qibantu").bind("click",function(){
		 	$("#filetype").val("pic");
		 	$("#vtype").val("customSheji");
	 		openURL("/counter/upload/uppage.do","上传起版图"); 
	 });
	 $(".vectorgraph").bind("click",function(){
		 	$("#filetype").val("file");
	 		openURL("/counter/upload/uppage.do","上传刻字矢量图"); 
	 		$("#filevalue").val("vengraveVh");
	 });
	 /*$(".cad_file").bind("click",function(){
			$("#filetype").val("file");
	 		openURL("/counter/upload/uppage.do","上传CAD文件"); 
	 		$("#filevalue").val("vcadFile");
	 });*/
	 
	 //图片展示
	 var customId = $("#customId").val();
	 //参考图片显示
	 $(".customCankaoShow").bind("click",function(){
		//款式单ID
	 	if(customId == "" || customId == undefined){
	 		alert("请保存后查看!");
	 	}else{
	 		openURL("/counter/upload/showpic.do?cpath=com.bavlo.counter.model.custom.CustomBVO&fkey=customId&ptype=vtype&vtype=customCankao&id="+customId,"图片展示");
	 	}
	 });
	 //设计图片显示
	 $(".customShejiShow").bind("click",function(){
		//款式单ID
	 	if(customId == "" || customId == undefined){
	 		alert("请保存后查看!");
	 	}else{
	 		openURL("/counter/upload/showpic.do?cpath=com.bavlo.counter.model.custom.CustomBVO&fkey=customId&ptype=vtype&vtype=customSheji&id="+customId,"图片展示");
	 	}
	 });
	 
});



/**
 * 计算价格
 */
//计算webservice
var calculatorUrl = "/counter/webservice/httpcalculator.do";
var params = {};
// 保费
params.insuranceRate = 0.005;
// 邮费
params.expressPrice = 22;
// 款式类型
params.typeId = 1;
// 金属材质
params.metalId = 1;
// 金属重量
params.metalWeight = 0;
// 主石费
params.mainGemPrice = 0;
// 配石费
params.inlayPrice = 0;
// 起版费
params.pmPrice = 0;
// 其他费
params.otherPrice = 0;
// 鉴定费
params.reportPrice = 0;
// 链子费
params.chainPrice = "";
// 库选宝石费
params.stockGemPrice = "";
// 利润率
params.agentProfit = 0;

//计算价格
function calculator(str) {
	
	//款式类型
	if($("#styleType").find("option:selected").attr("sid") != undefined){
		params.typeId = $("#styleType").find("option:selected").attr("sid");
	}
	//金属材质
	if($("#metalType").find("option:selected").attr("sid") != undefined){
		params.metalId = $("#metalType").find("option:selected").attr("sid");
	}
	//金属重量
	if($("#metalWeight").val() != ""){
		params.metalWeight = parseInt($("#metalWeight").val());
	}
	//主石保价
	if($("#mainGemPrice").val() != ""){
		params.mainGemPrice = parseInt($("#mainGemPrice").val()) * 0.04;
	}
	//镶嵌费
	if($("#inlayPrice").val() != ""){
		params.inlayPrice = parseInt($("#inlayPrice").val()) * 2;;
	}
	//起版费用
	if($("#pmPrice").val() != ""){
		params.pmPrice = parseInt($("#pmPrice").val());
	}
	//其他价格
	if($("#otherPrice").val() != ""){
		params.otherPrice = parseInt($("#otherPrice").val());
	}
	//鉴定费用
	if($("#certificate").find("option:selected").val() != ""){
		params.reportPrice = $("#certificate").find("option:selected").val();
	}
	//利润率
	var weChat = $("#weChat").val()
	var remoteUrl = "http://www.bavlo.com/getAgentFromWeChat?weChat=" + weChat;
	loadProfit(nativeUrl,remoteUrl,function(data){
			params.agentProfit = data.customizeRate;
	});
	
	if (params.metalWeight == "" || params.metalWeight == 0 || isNaN(params.metalWeight)) {
		alert("请输入正确的金属重量");
		$("#metalWeight").val("");
		$("#metalWeight").focus();
		return;
	} else if (params.metalWeight >= 500) {
		alert("金属不能大于500克");
		$("#metalWeight").val("");
		$("#metalWeight").focus();
		return;
	}
	// 链子费
	params.chainPrice = "";
	if($(".cPrice").val() != ""){
		$(".cPrice").each(function() {
			params.chainPrice+=$(this).val()+";";
		})
	}
	// 库选宝石费
	params.stockGemPrice = "";
	if($(".cPrice").val() != ""){
		$(".cPrice").each(function() {
			params.stockGemPrice+=$(this).val()+";";
		})
	}

	var requestUrl = 'http://www.bavlo.com/calculate';
	var requestMethod = "POST";//GET
	var outputStr = 'typeId='+params.typeId+'&metalId='+params.metalId+'&metalWeight='+params.metalWeight+'&pmPrice='+params.pmPrice+'&mainGemPrice='+params.mainGemPrice+'&inlayPrice='+params.inlayPrice+'&otherPrice='+params.otherPrice+'&reportPrice='+params.reportPrice+'&expressPrice='+params.expressPrice+'&insuranceRate='+params.insuranceRate+'&chainPrice='+params.chainPrice+'&stockGemPrice='+params.stockGemPrice+'&agentProfit='+params.agentProfit+'';
	
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

// 款式单保存
function saveOrUpdate() {
	//通过计算后保存
	calculator("savePrice");
}
// 款式单保存方法
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
			//订单ID
			var orderId = $("#orderId").val();
			//跳转到订单页面
			if(orderId != ""){
				url = "/counter/order/edit.do?id="+orderId;//根据id查询客户信息
				window.location = url;
			}
		},
		error : function(e) {
			alert("保存失败!");
			initFieldSuffix();
		}
	});
}

// 拼接链子Json
function chainJson(){
	
	var jsonStr = "[";
	
	$(".chainList").each(function(){
		var chain_name = $(this).find(".chain_name").text();
		var chain_item = $(this).find(".chain_item").val();
		if(chain_item == ""){
			$(this).find(".chain_item").val("");
			$(this).find(".chain_item").focus();
			return;
		}
		var chain_cost = $(this).find(".chain_item").attr("price");
		jsonStr+="{";
		jsonStr+="\"vchainName\":\""+chain_name+"\",";
		jsonStr+="\"ichainItem\":\""+chain_item+"\",";
		jsonStr+="\"nchainCost\":\""+chain_cost+"\"";
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
		var stockGem_name = $(this).find(".stockGem_num").attr("stockGemName");
		var stockGem_num = $(this).find(".stockGem_num").val();
		if(stockGem_num == ""){
			alert("请填写库选宝石颗数");
			$(this).find(".stockGem_num").val("");
			$(this).find(".stockGem_num").focus();
			return;
		}
		var stockGem_img_path = $(this).find(".stockGem_img_path").attr("src");
		var stockGem_weight = $(this).find(".stockGem_num").attr("weight");
		var stockGem_shape = $(this).find(".stockGem_num").attr("shape");
		var stockGem_size = $(this).find(".stockGem_num").attr("size");
		var stockGem_color = $(this).find(".stockGem_num").attr("color");
		var stockGem_clarity = $(this).find(".stockGem_num").attr("clarity");
		var stockGem_cost = $(this).find(".stockGem_num").attr("price");
		jsonStr+="{";
		jsonStr+="\"vstockGemName\":\""+stockGem_name+"\",";
		jsonStr+="\"istockGemNum\":\""+stockGem_num+"\",";
		jsonStr+="\"vstockGemImgPath\":\""+stockGem_img_path+"\",";
		jsonStr+="\"nstockGemWeight\":\""+stockGem_weight+"\",";
		jsonStr+="\"vstockGemShape\":\""+stockGem_shape+"\",";
		jsonStr+="\"vstockGemSize\":\""+stockGem_size+"\",";
		jsonStr+="\"vstockGemColor\":\""+stockGem_color+"\",";
		jsonStr+="\"vstockGemClarity\":\""+stockGem_clarity+"\",";
		jsonStr+="\"nstockGemCost\":\""+stockGem_cost+"\"";
		jsonStr+="},";
	});
	
	if(jsonStr.length != 1){
		jsonStr = jsonStr.substring(0, jsonStr.length-1);
	}
	
	jsonStr+="]";
	
	return jsonStr;
}

//子窗体调用
function setValueByFrame(type,id,callback,json){
	var url;
	if(type == "chain"){
		var data = JSON.parse(json);
		addChain(data);
		closeMultiDlg();
	}else if(type == "signGem"){
		var mainGem_img = $(".mainGem_img").attr("src");
		var partsGem_img = $(".partsGem_img").attr("src");
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
				if(mainGem_img == undefined){
					$(".kzs_img").append("<img class='mainGem_img' style='width:38px;height:38px;' src="+pic+" >");
				}else {
					$(".mainGem_img").attr("src",pic);
				}
				$("#mainGemPic").val(pic);
			}
			if(gemSignClass == "kps_img"){
				if(partsGem_img == undefined){
					$(".kps_img").append("<img class='partsGem_img' style='width:38px;height:38px;' src="+pic+" >");
				}else {
					$(".partsGem_img").attr("src",pic);
				}
				$("#partsGemPic").val(pic);
			}
		});
		
		closeMultiDlg();
	}else if(type == "stockGem"){
		var data = JSON.parse(json);
		addStockGem(data);
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
		url = "/counter/custom/edit.do?id="+id;//根据id款式单信息
		window.location = url;
	}else if(type == "custom-view"){
		url = "/counter/custom/detail.do?id="+id;//根据id显示款式单信息
		window.location = url;
	}else if(type == "useGem"){
		url = "${ctx}/useGem/info.do?id="+id;//根据id显示配石单信息
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
function addChain(data){
	var i=1;
	for(var c=1;c<100;c++){
		if($(".chain"+c).length==0){
			i=c;
			break;
		}
	}
	var html="";
	
	html+= "<dd class='chainList chain"+i+"'>"+
		   "<div class='lianzi'>"+
		   "<h3>链子</h3><a href='javascript:removeChain("+i+")' class='close_c'><font>X</font></a>"+
		   "<div class='clear'></div>"+
		   "<input class='chain_item' id='chainItem' name='ichainItem' type='text' price='"+data.nchainCost+"' value='"+data.ichainItem+"' placeholder='条'>"+
		   "<b>条</b>"+
		   "<strong class='chain_name'>"+data.vchainName+"</strong>" +
		   "</div>" +
		   "<input type='hidden' class='cPrice'/>"+
		   "</dd>";
	
	$(".chain").append(html);
	$("input[id='chainItem']").blur(function(){
		 checkNum(this);
		 var qutity=parseInt($(this).val());
		 var price=$(this).attr("price");
		 $(this).parent().nextAll(".cPrice").val((price*qutity).toFixed(2));
	})
	$("input[id='chainItem']").blur();
}
//删除链子
function removeChain(id) {
	$(".chain" + id).remove();
}

//增加库选宝石
function addStockGem(data){
	var i=1;
	 for(var g=1;g<100;g++){
		 if($(".stockGem"+g).length==0){
			 i=g;
			 break;
		 }
	 }
	 var html="";
		
	 html+= "<dd class='stockGemList stockGem"+i+"'>"+
			"<div div class='lianzi'>"+	
			"<h3>库选宝石</h3>"+
			"<a href='javascript:removeStockGem("+i+")' class='close_c'><font>X</font></a><div class='clear'></div>"+
			"<input class='stockGem_num' id='stockGemNum' name='istockGemNum' type='text' value='"+data.istockGemNum+"' size='"+data.vstockGemSize+"' shape='"+data.vstockGemShape+"' weight='"+data.nstockGemWeight+"' stockGemName='"+data.vstockGemName+"' color='"+data.vstockGemColor+"' clarity='"+data.vstockGemClarity+"' price='"+data.nstockGemCost+"'>"+
			"<b>颗</b>"+
			"<img class='stockGem_img_path' src='"+data.vstockGemImgPath+"'/><strong class='stockGem_name'>"+data.vstockGemName+" "+data.nstockGemWeight+"ct</strong>"+
			"</div>" +
			"<input type='hidden' class='sgPrice'/>"+
			"</dd>";
		
	$(".chain").append(html);
	$("input[id='stockGemNum']").blur(function(){
		checkNum(this);
		var qutity=parseInt($(this).val());
		var price=$(this).attr("price");
		$(this).parent().nextAll(".sgPrice").val((price*qutity+qutity*2).toFixed(2));
	})
	$("input[id='stockGemNum']").blur();
}
//删除库选石
function removeStockGem(id) {
	$(".stockGem" + id).remove();
}
//增加
function add(type,value){
	var data = JSON.parse(value);
	$.each(data, function (n, v) {
		if(type == "chain"){
			addChain(v);
		} else if(type == "stockGem"){
			addStockGem(v);
		}
	});
}

//检查数值
function checkNum(obj) {
	var reg = new RegExp("^[0-9].*$");
	if ($(obj).val() == "") {
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
	if($(".metal_weight").val() != ""){
		 //金属重量 
		clearSuffix("metal_weight","克");
	}
 	if($(".kzs_price").val() != ""){
		//主石金额 
 		clearSuffix("kzs_price","元"); 
	}
 	if($(".kps_count").val() != ""){
		//配石数量
 		clearSuffix("kps_count","颗"); 
	}
 	if($(".pm_price").val() != ""){
 		//起版费用
 		clearSuffix("pm_price","元"); 
 	}
 	if($(".other_price").val() != ""){
		//其他金额 
 		clearSuffix("other_price","元"); 
	}
}

//改变字体
function initFont(){
	var font=$('.ziti').find("option:selected").val();
	$(".kezi").css({"font-family":font});
}
