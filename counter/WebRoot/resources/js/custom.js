/**
 * @author shijf
 * 款式单js
 */

/**
 * 初始基础数据
 */

var nativeUrl = "/counter/webservice/http.do"; // 本地webservice
var customId; // 款式单ID
var customerId; // 客户ID
var vengraveVh;// 刻字矢量图
var vcadFile; // CAD文件
var srcstyleType; // 款式类型
var srcmetal; // 金属材质
var srcringSize; // 戒指手寸
var nmainGemCost; // 主石价值
var vmainGemName; // 主石信息
var vmainGemPic; // 主石图片
var ipartsGemNum; // 配石数量
var vpartsGemName; // 配石信息
var vpartsGemPic; // 配石图片
var vcraftTag; // 工艺标签
var vrequirement; // 需求描述
var vrequirementB = $("#vrequirementB").val(); // 表面工艺描述
$(function() {

	$(".menu-send-cust").show(); // 发送客户显示
	customId = $("#customId").val();
	customerId = $("#customerId").val();
	vengraveVh = $("#vengraveVh").val();
	vcadFile = $("#vcadFile").val();
	srcstyleType = $("#srcstyleType").val();
	srcmetal = $("#srcmetal").val();
	srcringSize = $("#srcringSize").val();
	nmainGemCost = $("#nmainGemCost").val();
	vmainGemName = $("#vmainGemName").val();
	vmainGemPic = $("#vmainGemPic").val();
	ipartsGemNum = $("#ipartsGemNum").val();
	vpartsGemName = $("#vpartsGemName").val();
	vpartsGemPic = $("#vpartsGemPic").val();
	vcraftTag = $("#vcraftTag").val();
	vrequirement = $("#vrequirement").val();
	if (vrequirement != "") {
		$("#requirement").val(vrequirement);
	}
	vrequirementB = $("#vrequirementB").val();
	if (vrequirementB != "") {
		$("#requirementB").val(vrequirementB);
	}
	var chainJson = $("#chainJson").val(); // 链子Json
	var stockGemJson = $("#stockGemJson").val(); // 库选宝石Json

	loadBaseData();

	$("#styleType").change(function() { // 当款式类型不是戒指时，隐藏戒指手寸选项
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

	if (nmainGemCost != "") { // 客主石
		$(".kzsGem").show();
		var pic = $("#vmainGemPic").val();
		$(".kzs_img").append("<img class='mainGem_img' src=" + pic + " >");
	}
	$(".kzsGem_btn").click(function() {
		if ($(".kzsGem").css("display") == 'none') {
			$(".kzsGem").show();
			// var text = $(this).text();
			// $(this).text(text.replace('+', '-'));
		} else {
			h("kzsGem");
		}
	})

	if (ipartsGemNum != "") { // 客配石
		$(".kpsGem").show();
		var pic = $("#vpartsGemPic").val();
		$(".kps_img").append("<img class='partsGem_img' src=" + pic + " >");
	}
	$(".kpsGem_btn").click(function() {
		if ($(".kpsGem").css("display") == 'none') {
			$(".kpsGem").show();
			// var text = $(this).text();
			// $(this).text(text.replace('+', '-'));
		} else {
			h("kpsGem");
		}
	})

	var WS = function(opt) { // 初始化工艺标签

		var regexp = opt.regexp || /\S/, el = $(opt.el), list = el.val().split(
				','), holder = $('<span class="words-split"></span>')

		for (var i = 0; i < list.length; i++) {
			if (list[i] != "") {
				holder
						.append($('<a href="javascript:void(0)" class="fm-button">'
								+ list[i] + '<em> </em></a>'));
			}
		}
		el.hide().after(holder);

		holder.on('click', 'a>em', function() { // 刪除
			$(this).parent().remove();
			el.val(holder.text().match(/\S+/g).join(','))
		});

		$(".gongyi1")
				.change(
						function() { // 添加
							var t = $(this).find("option:selected").val();
							var str = $(".custom_engrave").val();
							if (str.indexOf(t) < 0) {
								if (t) {
									holder
											.append($('<a href="javascript:void(0)" class="fm-button">'
													+ t + '<em> </em></a>'));
									el.val(holder.text().match(/\S+/g)
											.join(','));
								}
							}
						});
	}

	WS({
		el : '#vcraftTag',
		regexp : /\w+\.\w+/
	});

	initFont(); // 刻字字体样式
	$(".ziti").change(function() {
		initFont();
	})

	if (chainJson != "") { // 链子
		add("chain", chainJson);
	}

	if (stockGemJson != "") { // 库选石
		add("stockGem", stockGemJson)
	}

	$("input[id='metalWeight']").blur(function() { // 金属重量值
		initSuffix("metal_weight", "克"); // 增加后缀
		checkNum(this);
	})

	$("input[id='pmPrice']").blur(function() { // 制版费用值
		initSuffix("pm_price", "元"); // 增加后缀
		checkNum(this);
	})

	$("input[id='mainGemPrice']").blur(function() { // 主石保价值
		initSuffix("kzs_price", "元"); // 增加后缀
		checkNum(this);
	})

	$("input[id='inlayPrice']").blur(function() { // 配石数量
		initSuffix("kps_count", "颗"); // 增加后缀
		checkNum(this);
	})

	$("input[id='otherPrice']").blur(function() { // 其他价格
		initSuffix("other_price", "元"); // 增加后缀
		checkNum(this);
	})

	$(".calculator_btn").click(function() { // 最终价格
		calculator("totalPrice");
	})

	$(".calculator_btn2").click(function() { // 价格详情
		calculator("detailPrice");
	})
	loadSubData(customId);
	initFieldSuffix(); // 增加后缀
	fnCompleteBtn(); // 显示CAD、矢量图名字
})
window.onbeforeunload = function() {
	if(customId == ""){
		return '请确认已经保存';
	}
} 
function fnCompleteBtn(){ // 显示CAD、矢量图名字
	var vengraveVhName = $("#vengraveVh").val();
	$(".vectorgraphName").text(vengraveVhName);
	var vcadFileName = $("#vcadFile").val();
	$(".cad_fileName").text(vcadFileName);
}

function loadBaseData() { // 加载基础数据
	loadStyleType();
}

function loadStyleType() { // 款式类型下拉框值
	var typeUrl = "http://www.bavlo.com/getAllStyleType";
	loadSelDataStr(nativeUrl, typeUrl, "styleType", "data[i].id",
			"data[i].type_name_cn", function() {
				$("#styleType").val(srcstyleType);
				loadMetail();
			}, "款式");
}

function loadMetail() { // 金属材质下拉框值
	var typeUrl = "http://www.bavlo.com/getAllMetalMaterialType";
	loadSelDataStr(nativeUrl, typeUrl, "metalType", "data[i].id",
			"data[i].metal_type_cn", function() {
				$("#metalType").val(srcmetal);
				loadRingSize();
			}, "金属");
}

function loadRingSize() { // 链子手寸下拉框值
	var typeUrl = "http://www.bavlo.com/getAllRingSize";
	loadRingSizeData(nativeUrl, typeUrl, "ringSize", "data[i].id",
			"data[i].china", "data[i].diameter", "data[i].circumference",
			function() {
				$("#ringSize").val(srcringSize);
			}, "手寸");
}

/**
 * 弹框
 */
var gemSignClass = ""; // 宝石图片class名
$(function() {

	$(".kzs_guanlian").bind("click", function() { // 宝石签收单列表
		openURL("/counter/gem-sign/list.do", "宝石签收单列表", 470, 550);
		gemSignClass = "kzs_img";
	});

	$(".kps_guanlian").bind("click", function() { // 宝石签收单列表
		openURL("/counter/gem-sign/list.do", "宝石签收单列表", 470, 550);
		gemSignClass = "kps_img";
	});

	$(".kxsGem_btn").click(function() { // 宝石弹框
		openURL("/counter/common/getGemInfo.do", "库选石");
	});

	$(".lzGem_btn").click(function() { // 链子弹框
		openURL("/counter/common/getChainInfo.do", "链子");
	});

	$(".cankaotu").bind("click", function() { // 上传参考图
		$("#filetype").val("pic");
		$("#vtype").val("customCankao");
		openURL("/counter/upload/uppage.do", "上传参考图", null, 430);
	});
	$(".qibantu").bind("click", function() { // 上传起版图
		$("#filetype").val("pic");
		$("#vtype").val("customSheji");
		openURL("/counter/upload/uppage.do", "上传起版图", null, 430);
	});
	$(".vectorgraph").bind("click", function() { // 上传刻字矢量图
		$("#filetype").val("file");
		openURL("/counter/upload/uppage.do", "上传刻字矢量图", null, 430);
		$("#filevalue").val("vengraveVh");
		var vengraveVhName = $("#vengraveVh").val();
		$("#vectorgraphName").text(vengraveVhName);
	});
	$(".cad_file").bind("click", function() {
		$("#filetype").val("file");
		openURL("/counter/upload/uppage.do", "上传CAD文件", null, 430);
		$("#filevalue").val("vcadFile");
		var vcadFileName = $("#vcadFile").val();
		$("#cad_fileName").text(vcadFileName);
	});

	var customId = $("#customId").val(); // 款式单ID
	$(".customCankaoShow")
			.bind(
					"click",
					function() { // 参考图片显示
						if (customId == "" || customId == undefined) {
							if ($("#FILE_0").val() == ""
									|| $("#FILE_0").val() == null) {
								alert("暂未上传图片");
							} else {
								openURL(
										"/counter/upload/shownpic.do?frmId=customBId",
										"图片展示",null,null,true);
							}
						} else {
							openURL(
									"/counter/upload/showpic.do?cpath=com.bavlo.counter.model.custom.CustomBVO&fkey=customId&ptype=vtype&vtype=customCankao&id="
											+ customId, "图片展示",null,null,true);
						}
					});

	$(".customShejiShow")
			.bind(
					"click",
					function() { // 设计图片显示
						if (customId == "" || customId == undefined) { // 款式单ID
							if ($("#FILE_0").val() == ""
									|| $("#FILE_0").val() == null) {
								alert("暂未上传图片");
							} else {
								openURL(
										"/counter/upload/shownpic.do?frmId=customBId",
										"图片展示");
							}
						} else {
							openURL(
									"/counter/upload/showpic.do?cpath=com.bavlo.counter.model.custom.CustomBVO&fkey=customId&ptype=vtype&vtype=customSheji&id="
											+ customId, "图片展示",null,null,true);
						}
					});

});

/**
 * 计算价格
 */
var calculatorUrl = "/counter/webservice/httpcalculator.do"; // 计算webservice
var params = {}; // 声明数组
params.insuranceRate = 0.005; // 保费
params.expressPrice = 22; // 邮费
params.typeId = 1; // 款式类型
params.metalId = 0; // 金属材质
params.metalWeight = 0; // 金属重量
params.mainGemPrice = 0; // 主石费
params.inlayPrice = 0; // 配石费
params.pmPrice = 0; // 起版费
params.otherPrice = 0; // 其他费
params.reportPrice = 0; // 鉴定费
params.chainPrice = ""; // 链子费
params.stockGemPrice = ""; // 库选宝石费
params.agentProfit = 0; // 利润率

function calculator(str) { // 计算价格

	if ($("#styleType").find("option:selected").attr("sid") != undefined) { // 款式类型
		params.typeId = $("#styleType").find("option:selected").attr("sid");
	} else {
		alert("请选择款式类型");
		return;
	}

	if ($("#metalType").find("option:selected").attr("sid") != undefined) { // 金属材质
		params.metalId = $("#metalType").find("option:selected").attr("sid");
	} else {
		alert("请选择金属材质");
		return;
	}

	if ($("#metalWeight").val() != "") { // 金属重量
		params.metalWeight = parseInt($("#metalWeight").val());
	} else {
		alert("请输入正确的金属重量");
		$("#metalWeight").focus();
		return;
	}

	if ($("#mainGemPrice").val() != "") { // 主石保价
		params.mainGemPrice = parseInt($("#mainGemPrice").val()) * 0.04;
	}

	if ($("#inlayPrice").val() != "") { // 镶嵌费
		params.inlayPrice = parseInt($("#inlayPrice").val()) * 2;
		;
	}

	if ($("#pmPrice").val() != "") { // 起版费用
		params.pmPrice = parseInt($("#pmPrice").val());
	}

	if ($("#otherPrice").val() != "") { // 其他价格
		params.otherPrice = parseInt($("#otherPrice").val());
	}

	if ($("#certificate").find("option:selected").val() != "") { // 鉴定费用
		params.reportPrice = $("#certificate").find("option:selected").val();
	}

	if ($("#agentJson").val() != "") { // 利润率
		var agentInfo = $("#agentJson").val();
		var agentJson = JSON.parse(agentInfo);
		params.agentProfit = agentJson[0].customizeRate;
	}

	if (params.metalWeight == "" || params.metalWeight == 0
			|| isNaN(params.metalWeight)) { // 金属重量校验
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

	params.chainPrice = ""; // 链子费
	if ($(".cPrice").val() != "") {
		$(".cPrice").each(function() {
			params.chainPrice += $(this).val() + ";";
		})
	}

	params.stockGemPrice = ""; // 库选宝石费
	if ($(".sgPrice").val() != "") {
		$(".sgPrice").each(function() {
			params.stockGemPrice += $(this).val() + ";";
		})
	}

	var requestUrl = 'http://www.bavlo.com/calculate'; // 计算接口地址
	var requestMethod = "POST"; // 请求方式
	var outputStr = 'typeId=' + params.typeId + '&metalId=' + params.metalId // 请求参数
			+ '&metalWeight=' + params.metalWeight + '&pmPrice='
			+ params.pmPrice + '&mainGemPrice=' + params.mainGemPrice
			+ '&inlayPrice=' + params.inlayPrice + '&otherPrice='
			+ params.otherPrice + '&reportPrice=' + params.reportPrice
			+ '&expressPrice=' + params.expressPrice + '&insuranceRate='
			+ params.insuranceRate + '&chainPrice=' + params.chainPrice
			+ '&stockGemPrice=' + params.stockGemPrice + '&agentProfit='
			+ params.agentProfit + '';

	httpRequest(
			calculatorUrl,
			requestUrl,
			requestMethod,
			outputStr,
			function(data) {
				var jsonStr = JSON.parse(data);
				if ("savePrice" == str) {
					$(".finalPrice").val(jsonStr.price);
					save();
				} else if ("totalPrice" == str) {
					$(".price").text(jsonStr.price);
				} else if ("detailPrice" == str) {
					$(".price")
							.text(
									parseInt(jsonStr.cost)
											+ " + "
											+ (parseInt(jsonStr.price) - parseInt(jsonStr.cost))
											+ " = " + jsonStr.price);
				}
			});
}

function saveOrUpdate() { // 款式单保存
	calculator("savePrice"); // 通过计算后保存
}

function save() { // 款式单保存方法
	cleanFieldSuffix();
	var bvo = JSON.stringify($('#customBId').serializeJson());
	var cvo = chainJson();
	var dvo = stockGemJson();

	$.ajax({
		type : "POST",
		url : "save.do",
		data : $('#custom').serialize() + "&bvo=" + bvo + "&cvo=" + cvo
				+ "&dvo=" + dvo,
		async : false,
		cache : false,
		success : function(data) {
			$("#customid").val(data.id);
			alert("款式单保存成功!");
			initFieldSuffix();
			var orderId = $("#orderId").val(); // 订单ID
			if (orderId != "") { // 跳转到订单页面
				url = "/counter/order/view.do?id=" + orderId;
				window.location = url;
			}
		},
		error : function(e) {
			alert("款式单保存失败!");
			initFieldSuffix();
		}
	});
}

function chainJson() { // 拼接链子Json

	var jsonStr = "[";

	$(".chainList").each(function() {
		var chain_name = $(this).find(".chain_name").text();
		var chain_item = $(this).find(".chain_item").val();
		if (chain_item == "") {
			$(this).find(".chain_item").val("");
			$(this).find(".chain_item").focus();
			return;
		}
		var chain_cost = $(this).find(".chain_item").attr("price");
		jsonStr += "{";
		jsonStr += "\"vchainName\":\"" + chain_name + "\",";
		jsonStr += "\"ichainItem\":\"" + chain_item + "\",";
		jsonStr += "\"nchainCost\":\"" + chain_cost + "\"";
		jsonStr += "},";
	});

	if (jsonStr.length != 1) {
		jsonStr = jsonStr.substring(0, jsonStr.length - 1);
	}

	jsonStr += "]";

	return jsonStr;
}

function stockGemJson() { // 拼接库选宝石Json

	var jsonStr = "[";

	$(".stockGemList").each(function() {
		var stockGem_name = $(this).find(".stockGem_num").attr("stockGemName");
		var stockGem_num = $(this).find(".stockGem_num").val();
		if (stockGem_num == "") {
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
		jsonStr += "{";
		jsonStr += "\"vstockGemName\":\"" + stockGem_name + "\",";
		jsonStr += "\"istockGemNum\":\"" + stockGem_num + "\",";
		jsonStr += "\"vstockGemImgPath\":\"" + stockGem_img_path + "\",";
		jsonStr += "\"nstockGemWeight\":\"" + stockGem_weight + "\",";
		jsonStr += "\"vstockGemShape\":\"" + stockGem_shape + "\",";
		jsonStr += "\"vstockGemSize\":\"" + stockGem_size + "\",";
		jsonStr += "\"vstockGemColor\":\"" + stockGem_color + "\",";
		jsonStr += "\"vstockGemClarity\":\"" + stockGem_clarity + "\",";
		jsonStr += "\"nstockGemCost\":\"" + stockGem_cost + "\"";
		jsonStr += "},";
	});

	if (jsonStr.length != 1) {
		jsonStr = jsonStr.substring(0, jsonStr.length - 1);
	}

	jsonStr += "]";

	return jsonStr;
}

function setValueByFrame(type, id, callback, json) { // 子窗体调用
	var url;
	if (type == "chain") {
		var data = JSON.parse(json);
		addChain(data);
		closeMultiDlg();
	} else if (type == "signGem") {
		var mainGem_img = $(".mainGem_img").attr("src");
		var partsGem_img = $(".partsGem_img").attr("src");
		var url = "/counter/custom/getGem.do";
		$.post(url, {
			id : id
		}, function(row) {
			var data = row;
			if (data != null) {
				var pic = "";
				if (data.FILE_0 != "" && data.FILE_0 != null) {
					pic = "/counter/staticRes/" + data.FILE_0 + "";
					url = "/counter/gem-sign/view.do?id="+data.id;
				}
			}
			if (gemSignClass == "kzs_img") {
				if (mainGem_img == undefined) {
					$(".kzs_img").append(
							"<a href="+ url +"><img class='mainGem_img' src=" + pic + " ></a>");
				} else {
					$(".mainGem_img").attr("src", pic);
				}
				$("#mainGemPrice").val(data.nworth);
				$("#mainGemPic").val(pic);
				$("#mainGemId").val(data.id);
			}
			if (gemSignClass == "kps_img") {
				if (partsGem_img == undefined) {
					$(".kps_img").append(
							"<a href="+ url +"><img class='partsGem_img' src=" + pic + " ></a>");
				} else {
					$(".partsGem_img").attr("src", pic);
				}
				$("#inlayPrice").val(data.icount);
				$("#partsGemPic").val(pic);
				$("#partsGemId").val(data.id);
			}
		});

		closeMultiDlg();
	} else if (type == "stockGem") {
		var data = JSON.parse(json);
		addStockGem(data);
		closeMultiDlg();
	} else if (type == "customer") {
		url = "/counter/customer/infoJson.do";
		$.get(url, {
			id : id
		}, function(data) {
			if (data != null) {
				if (data.vhendimgurl != "") {
					$(".cusheader").prop("src", data.vhendimgurl);
				}
				$("#customerId").val(data.id);
			}
			closeMultiDlg();
		});
	} else if (type == "order") {
		url = "/counter/order/edit.do?id=" + id;// 根据id查询客户信息
		window.location = url;
	} else if (type == "order-view") {
		url = "/counter/order/view.do?id=" + id;// 根据id查询客户信息
		window.location = url;
	} else if (type == "entity") {
		url = "/counter/entity-sign/view.do?id=" + id;// 根据id查询客户信息
		window.location = url;
	} else if (type == "customer-menu") {
		url = "/counter/customer/info.do?id=" + id;// 根据id查询客户信息
		window.location = url;
	} else if (type == "custom") {
		url = "/counter/custom/edit.do?id=" + id;// 根据id款式单信息
		window.location = url;
	} else if (type == "custom-view") {
		url = "/counter/custom/detail.do?id=" + id;// 根据id显示款式单信息
		window.location = url;
	} else if (type == "useGem") {
		url = "/counter/useGem/info.do?id=" + id;// 根据id显示配石单信息
		window.location = url;
	}

}

function rlist(className) { // 删除清单
	$("." + className).remove();
}

function h(str) { // 隐藏主石或配石
	if ("kzsGem" == str) {
		params.mainGemPrice = 0;
		$("#mainGemPrice").val('');
	} else if ("kpsGem" == str) {
		params.inlayPrice = 0;
		$("#inlayPrice").val('');
	}
	var text = $("." + str + "_btn").text();
	// $("." + str + "_btn").text(text.replace('-', '+'));
	$("." + str).hide();
}

function addChain(data) { // 增加链子
	var i = 1;
	for (var c = 1; c < 100; c++) {
		if ($(".chain" + c).length == 0) {
			i = c;
			break;
		}
	}
	var html = "";

	html += "<dd class='chainList chain"
			+ i
			+ "'>"
			+ "<div class='lianzi'>"
			+ "<h3>链子</h3><a href='javascript:removeChain("
			+ i
			+ ")' class='close_c'><font>X</font></a>"
			+ "<div class='clear'></div>"
			+ "<input class='chain_item' id='chainItem' name='ichainItem' type='text' price='"
			+ data.nchainCost + "' value='" + data.ichainItem
			+ "' placeholder='条'>" + "<b>条</b>" + "<strong class='chain_name'>"
			+ data.vchainName + "</strong>" + "</div>"
			+ "<input type='hidden' class='cPrice'/>" + "</dd>";

	$(".chain").append(html);
	$("input[id='chainItem']").blur(function() {
		checkNum(this);
		var qutity = parseInt($(this).val());
		var price = $(this).attr("price");
		$(this).parent().nextAll(".cPrice").val((price * qutity).toFixed(2));
	})
	$("input[id='chainItem']").blur();
}

function removeChain(id) { // 删除链子
	$(".chain" + id).remove();
}

function addStockGem(data) { // 增加库选宝石
	var i = 1;
	for (var g = 1; g < 100; g++) {
		if ($(".stockGem" + g).length == 0) {
			i = g;
			break;
		}
	}
	var html = "";

	html += "<dd class='stockGemList stockGem"
			+ i
			+ "'>"
			+ "<div div class='lianzi'>"
			+ "<h3>库选宝石</h3>"
			+ "<a href='javascript:removeStockGem("
			+ i
			+ ")' class='close_c'><font>X</font></a><div class='clear'></div>"
			+ "<input class='stockGem_num' id='stockGemNum' name='istockGemNum' type='text' value='"
			+ data.istockGemNum + "' size='" + data.vstockGemSize + "' shape='"
			+ data.vstockGemShape + "' weight='" + data.nstockGemWeight
			+ "' stockGemName='" + data.vstockGemName + "' color='"
			+ data.vstockGemColor + "' clarity='" + data.vstockGemClarity
			+ "' price='" + data.nstockGemCost + "'>" + "<b>颗</b>"
			+ "<img class='stockGem_img_path' src='" + data.vstockGemImgPath
			+ "'/><strong class='stockGem_name'>" + data.vstockGemName + " "
			+ data.nstockGemWeight + "ct</strong>" + "</div>"
			+ "<input type='hidden' class='sgPrice'/>" + "</dd>";

	$(".chain").append(html);
	$("input[id='stockGemNum']").blur(
			function() {
				checkNum(this);
				var qutity = parseInt($(this).val());
				var price = $(this).attr("price");
				$(this).parent().nextAll(".sgPrice").val(
						(price * qutity + qutity * 2).toFixed(2));
			})
	$("input[id='stockGemNum']").blur();
}

function removeStockGem(id) { // 删除库选石
	$(".stockGem" + id).remove();
}

function add(type, value) { // 增加链子或库选石
	var data = JSON.parse(value);
	$.each(data, function(n, v) {
		if (type == "chain") {
			addChain(v);
		} else if (type == "stockGem") {
			addStockGem(v);
		}
	});
}

function checkNum(obj) { // 数值校验
	var reg = new RegExp("^[0-9].*$");
	if ($(obj).val() == "") {
		return;
	} else if (!reg.test($(obj).val())) {
		$(obj).val("");
		return;
	}
}

function initFieldSuffix() { // 增加后缀
	if ($(".metal_weight").val() != "") {
		initSuffix("metal_weight", "克"); // 金属重量
	}
	if ($(".kzs_price").val() != "") {
		initSuffix("kzs_price", "元"); // 主石金额
	}
	if ($(".kps_count").val() != "") {
		initSuffix("kps_count", "颗"); // 配石数量
	}
	if ($(".pm_price").val() != "") {
		initSuffix("pm_price", "元"); // 起版费用
	}
	if ($(".other_price").val() != "") {
		initSuffix("other_price", "元"); // 其他金额
	}
}

function cleanFieldSuffix() { // 删除后缀
	if ($(".metal_weight").val() != "") {
		clearSuffix("metal_weight", "克"); // 金属重量
	}
	if ($(".kzs_price").val() != "") {
		clearSuffix("kzs_price", "元"); // 主石金额
	}
	if ($(".kps_count").val() != "") {
		clearSuffix("kps_count", "颗"); // 配石数量
	}
	if ($(".pm_price").val() != "") {
		clearSuffix("pm_price", "元"); // 起版费用
	}
	if ($(".other_price").val() != "") {
		clearSuffix("other_price", "元"); // 其他金额
	}
	if ($("#requirement").val() == "需求描述") {
		$("#requirement").val("");
	}
	if ($("#requirementB").val() == "表面工艺描述") {
		$("#requirementB").val("");
	}

}

function initFont() { // 改变字体
	var font = $('.ziti').find("option:selected").val();
	$(".kezi").css({
		"font-family" : font
	});
}

function showDefaultPic() { // 上传后显示封面
	var vtype = $("#vtype").val();
	if (vtype == "customCankao") {
		if ($("#FILE_0").val() != null && $("#FILE_0").val() != "") {
			$(".customCankaoShow img")
					.attr("style", "width: 98%;height: 330px");
			$(".customCankaoShow img").attr(
					"src",
					"/counter/staticRes/" + $("#filemodel").val() + "/"
							+ $("#FILE_0").val());
		}
	} else if (vtype == "customSheji") {
		if ($("#FILE_0").val() != null && $("#FILE_0").val() != "") {
			$(".customShejiShow img").attr("style", "width: 98%;height: 330px");
			$(".customShejiShow img").attr(
					"src",
					"/counter/staticRes/" + $("#filemodel").val() + "/"
							+ $("#FILE_0").val());
		}
	}
}

var classname = "cankao_pic_list";
$(function(){
	var vtype = $("#vtype").val();
	if (vtype == "customCankao") {
		classname = "cankao_pic_list";
	} else if (vtype == "customSheji") {
		classname = "qiban_pic_list";
	}
	//小图列表遮罩
	setMask(classname);
	//删除图片
	delPic(classname);
});
//遮罩
function setMask(classname){
	$("."+classname+" ul li").hover(
		function () {
			$(this).find(".dask").stop().delay(20).animate({"z-index":"1",opacity:0.8},200);
		 },
		function () {
			$(this).find(".dask").stop().animate({"z-index":"-1",opacity:0},200);
		}
		
	);
}

//删除图片
function delPic(classname){
	$("."+classname+" ul li").bind("click",function(){
		var em = this;
		if(confirm("是否删除?")){
			var fileModel = $("#filemodel").val();
			var fileName = $(this).attr("picn");
		 	var url = "/counter/upload/delPic.do";
			$.get(url,{fileModel:fileModel,fileName:fileName},function(){
				var fem = $(em).attr("fem");
				if(fem == "FILE_0"){
					$("#gem-pic-show-id img").prop("src","/counter/resources/images/pic_02.png");
					$("#FILE_0").val("");
				}
				
				$(em).remove();
			});
		}
	});
}
//上传后显示小图{JS实现}
function showMinPic(em,value,classname){
	if($("#"+em).val() != null && $("#"+em).val() != ""){
		var minPicName = getMinPicByOrg(value);
		var ix = value.indexOf(".");
		var val = value.substring(0,ix);
		var fileModel = $("#filemodel").val();
		$("."+classname+" ul").append("<li id='"+val+"' fem='"+em+"' onmouseout='setMaskT(\""+val+"\")' onmouseover='setMaskO(\""+val+"\")'><img class='list_pic' style='width:60px;height:60px;' src='/counter/staticRes/"+fileModel+"/min/"+minPicName+"'><div onclick='rmMaskC(\""+value+"\")' class='dask' style='z-index:-1;cursor:pointer;width:60px;height:60px;padding:20px 0 0 20px;background:#000;opacity:0.8;position:relative;top:-60px;' picn='"+value+"'><img src='/counter/resources/images/delete_shield_24px.ico'></div></li>");
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
	 	var url = "/counter/upload/delPic.do";
		$.get(url,{fileModel:fileModel,fileName:fileName},function(){
			var fem = $("#"+val).attr("fem");
			if(fem == "FILE_0"){
				$("#gem-pic-show-id img").prop("src","/counter/resources/images/pic_02.png");
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

//加载子表数据
function loadSubData(mid){
	var url = "/counter/upload/showpicJson.do";
	$.get(url,{cpath:"com.bavlo.counter.model.custom.CustomBVO",fkey:"customId",id:mid},function(row){
		var data = row;
		if(data != "" && data != null){
			$(".cankao_pic_list ul").html("");
			$(".qiban_pic_list ul").html("");
			var fileModel = $("#filemodel").val();
			for(var i = 0; i < data.length; i++){
				if(data[i].biscover == "Y"){
					$("#FILE_0").val(data[i].vname);
				}else{
					$("#FILE_"+i).val(data[i].vname);
				}
				var minPicName = getMinPicByOrg(data[i].vname);
				//$(".qsd_pic_list ul").append("<li><img class='list_pic' style='width:60px;height:60px;' src='${ctx}/staticRes/gemsign/min/"+minPicName+"'><div class='dask' style='z-index:-1;cursor:pointer;width:60px;height:60px;padding:20px 0 0 20px;background:#000;opacity:0.8;position:relative;top:-60px;' picn='"+data[i].vname+"'><img src='${ctx}/resources/images/delete_shield_24px.ico'></div></li>");
				var value = data[i].vname;
				var fileType = data[i].vtype;
				var ix = value.indexOf(".");
				var val = value.substring(0,ix);
				var fm = "FILE_"+i;
				if(fileType == "customCankao"){
					$(".cankao_pic_list ul").append("<li id='"+val+"' fem='"+fm+"' onmouseout='setMaskT(\""+val+"\")' onmouseover='setMaskO(\""+val+"\")'><img class='list_pic' style='width:60px;height:60px;' src='/counter/staticRes/"+fileModel+"/min/"+minPicName+"'><div onclick='rmMaskC(\""+value+"\")' class='dask' style='z-index:-1;cursor:pointer;width:60px;height:60px;padding:20px 0 0 20px;background:#000;opacity:0.8;position:relative;top:-60px;' picn='"+value+"'><img src='/counter/resources/images/delete_shield_24px.ico'></div></li>");
				} else if (fileType == "customSheji"){
					$(".qiban_pic_list ul").append("<li id='"+val+"' fem='"+fm+"' onmouseout='setMaskT(\""+val+"\")' onmouseover='setMaskO(\""+val+"\")'><img class='list_pic' style='width:60px;height:60px;' src='/counter/staticRes/"+fileModel+"/min/"+minPicName+"'><div onclick='rmMaskC(\""+value+"\")' class='dask' style='z-index:-1;cursor:pointer;width:60px;height:60px;padding:20px 0 0 20px;background:#000;opacity:0.8;position:relative;top:-60px;' picn='"+value+"'><img src='/counter/resources/images/delete_shield_24px.ico'></div></li>");
				}
				
			}
		}
	});
}