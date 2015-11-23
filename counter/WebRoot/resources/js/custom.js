// 计算价格
var params = {};
params.insuranceRate = 0.005;
params.expressPrice = 22;
params.typeId = 1;
params.metalId = 1;
params.metalWeight = 0;
params.mainGemPrice = 0;
params.inlayPrice = 0;
params.chainPrice = 0;
params.pmPrice = 0;
params.otherPrice = 0;
params.reportPrice = 25;
params.stockGemPrice = "";

$(function() {
	// 客主石显示和隐藏
	$(".kzsGem_btn").click(function() {
		if ($(".kzsGem").css("display") == 'none') {
			$(".kzsGem").show();
		} else {
			h('kzsGem');
		}
	})
	// 客配石显示和隐藏
	$(".kpsGem_btn").click(function() {
		if ($(".kpsGem").css("display") == 'none') {
			$(".kpsGem").show();
		} else {
			h('kpsGem');
		}
	})

	// 款式类型值
	$("select[id='styleType']").change(function() {
		params.typeId = $(this).val();
	})
	// 金属类型值
	$("select[id='metalType']").change(function() {
		params.metalId = $(this).val();
	})
	// 金属重量值
	$("input[id='metalWeight']").blur(function() {
		checkNum(this);
		params.metalWeight = $(this).val();
	})
	// 制版费用值
	$("input[id='pmPrice']").blur(function() {
		checkNum(this);
		params.pmPrice = $(this).val();
	})
	// 主石保价值
	$("input[id='mainGemPrice']").blur(function() {
		checkNum(this);
		params.mainGemPrice = $(this).val() * 0.04;
	})
	// 配石数量
	$("input[id='inlayPrice']").blur(function() {
		checkNum(this);
		params.inlayPrice = parseInt($(this).val()) * 2;
	})
	// 其他价格
	$("input[id='otherPrice']").blur(function() {
		checkNum(this);
		params.otherPrice = $(this).val();
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
		var weight = $("input[id='metal_weight']");
		checkNum(weight);
		if (weight.val() == "" || weight.val() == 0) {
			$(weight).val("");
			$(weight).focus();
			return;
		}
		params.stockGemPrice = "";
		$(".sgPrice").each(function() {
			params.stockGemPrice += $(this).val() + ";";
		})
		
		//本地webservice
		var nativeUrl = "/counter/webservice/httpcalculator.do";
		var requestUrl = 'http://www.bavlo.com/calculate';
		var requestMethod = "POST";//GET
		var outputStr = 'typeId='+params.typeId+'&metalId='+params.metalId+'&metalWeight='+params.metalWeight+'&pmPrice='+params.pmPrice+'&mainGemPrice='+params.mainGemPrice+'&inlayPrice='+params.inlayPrice+'&otherPrice='+params.otherPrice+'&reportPrice='+params.reportPrice+'&expressPrice='+params.expressPrice+'&insuranceRate='+params.insuranceRate+'&chainPrice='+params.chainPrice+'&stockGemPrice='+params.stockGemPrice+'';

		 /*$.ajax({
			 url : nativeUrl,
				type : 'POST',
				data : outputStr,
				success : function(data) {
					$(".price").text(data.price+"元");
				}
		 })*/ 
		 httpRequest(nativeUrl,requestUrl,requestMethod,outputStr,function(data) {
			 	var jsonStr = JSON.parse(data);
				$(".price").text(jsonStr.price);
				alert(jsonStr.price);
		 });

	})
	
/*	// 价格详情
	$(".calculator_btn2").click(
		function() {
			var weight = $("input[name='metal_weight']");
			checkNum(weight);
			if (weight.val() == "" || weight.val() == 0) {
				$(weight).val("");
				$(weight).focus();
				return;
			}
			params.stockGemPrice = "";
			$(".sgPrice").each(function() {
				params.stockGemPrice += $(this).val() + ";";
			})
			var requestUrl = 'http://www.bavlo.com/mobile/calculate';
			var requestMethod = "POST";//GET
			var outputStr = "typeId=";
			httpRequest(nativeurl,requestUrl,requestMethod,outputStr,function(data) {
				$(".price").text(data.price + "元");
			})
		})*/
})
function h(str) {
	if ("kzsGem" == str) {
		params.mainGemPrice = 0;
	} else if ("kpsGem" == str) {
		params.inlayPrice = 0;
	}
	var value = $("." + str + "_btn").val();
	$("." + str + "_btn").val(value.replace('+', '-'));
	$("." + str).hide();
}
function removeStockGem(id) {
	$(".stockGem" + id).remove();
}
/*function loadShape() {
	var type = $(".gem_type").val();
	if (type == 1) {
		$(".gem_shape").prepend("<option value='4'>圆形</option>");
		$(".gem_shape:first").trigger("change");
	} else {
		$.ajax({
			url : 'www.bavlo.com/styles/loadShape',
			type : 'POST',
			data : {
				'typeId' : type
			},
			dataType : 'json',
			success : function(data) {
				$(".gem_shape").empty();
				for (var i = 0; i < data.length; i++) {
					$(".gem_shape").append(
							"<option value='" + data[i].id + "'>"
									+ data[i].shape_cn + "</option>");
				}
				$(".gem_shape:first").trigger("change");
			}
		})
	}

}
function loadCalibrated() {
	var type = $(".gem_type").val();
	var shape = $(".gem_shape").val();
	$.ajax({
		url : 'www.bavlo.com/styles/loadCalibrated',
		type : 'POST',
		data : {
			'typeId' : type,
			'shapeId' : shape
		},
		dataType : 'json',
		success : function(data) {
			$(".gem_calibrated").empty();
			for (var i = 0; i < data.length; i++) {
				$(".gem_calibrated").append(
						"<option value='" + data[i].id + "'>"
								+ data[i].x.toFixed(2) + "×"
								+ data[i].y.toFixed(2) + "×"
								+ data[i].z.toFixed(2) + "</option>");
			}
			$(".gem_calibrated:first").trigger("change");
		}
	})
}
function loadGem() {
	var type = 14;
	var shape = 4;
	var calibrated = 8;
	var type_cn = $(".gem_type").find("option:selected").text();
	var shape_cn = $(".gem_shape").find("option:selected").text();
	var calibrated_cn = $(".gem_calibrated").find("option:selected").text();
	var remoteUrl = "http://www.bavlo.com/styles/loadGem?typeId=" + type
			+ "&shapeId=" + shape + "&calibratedId=" + calibrated;
	alert(remoteUrl);
	$.ajax({
		type : "post",
		async : false,
		url : nativeUrl,
		data : "url=" + remoteUrl,
		dataType : "json",
		success : function(data) {
			alert(data);
			var html = "";
			for (var i = 0; i < data.length; i++) {
				html += "<span class='gem_img' type='" + type_cn + "' shape='"
						+ shape_cn + "' calibrated='" + calibrated_cn
						+ "' weight='" + data[i].weight + "' costPrice='"
						+ data[i].costPrice + "'>"
						+ "<img src='http://img.bavlo.com/GemPics/"
						+ data[i].shape.id + "_" + data[i].color.id
						+ ".png'/><div class='weight'>" + data[i].weight + ' '
						+ "CT</div></span>"
			}
			$(".gem_sel_h").html(html);
			$(".gem_img").click(function() {
				if ($(this).attr("class") == 'gem_img') {
					$(".gem_img_sel").attr("class", "gem_img");
					$(this).attr("class", "gem_img_sel");
				} else {
					$(this).attr("class", "gem_img");
				}
			})
		}
	})
}
function loadChainStyleList() {
	var metalId = $("select[name='chain_metal']").val();
	$.ajax({
		url : 'http://www.bavlo.com/web/loadChainStyleList',
		type : 'POST',
		data : {
			'metalId' : metalId
		},
		dataType : 'json',
		success : function(data, sts) {
			$("select[name='chain_style']").empty();
			for (var i = 0; i < data.length; i++) {
				$("select[name='chain_style']").append(
						"<option value='" + data[i].id + "'>" + data[i].name_cn
								+ "</option>");
			}
			$("select[name='chain_style']:first").trigger("change");
		}
	})
}
function loadChain() {
	var metalId = $("select[name='chain_metal']").val();
	var chainStyleId = $("select[name='chain_style']").val();
	var styleId = $("#styleId").val();
	$.ajax({
		url : 'http://www.bavlo.com/styles/loadChainList',
		type : 'POST',
		data : {
			'metalId' : metalId,
			'chainStyleId' : chainStyleId
		},
		dataType : 'json',
		success : function(data, sts) {
			$("select[name='chain_detail']").empty();
			for (var i = 0; i < data.length; i++) {
				$("select[name='chain_detail']").append(
						"<option value='" + data[i].chainCost + "'>长×宽:"
								+ data[i].chainLength + "\"("
								+ (data[i].chainLength * 25.4).toFixed(0)
								+ "mm) × " + data[i].y + "(mm)</option>");
			}
			$("select[name='chain_detail']:first").trigger("change");
		}
	})
}*/
function checkNum(obj) {
	var reg = new RegExp("^[0-9].*$");
	if ($(obj).val() == "") {
		$(obj).val(0);
		return;
	} else {
		if (!reg.test($(obj).val())) {
			$(obj).focus();
			$(obj).val("");
			return;
		}
	}
}