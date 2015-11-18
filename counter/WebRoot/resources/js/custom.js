var params = {};
params.insuranceRate = 0.005;
params.expressPrice = 22;
params.typeId = 1;
params.metalId = 1;
params.mainGemPrice = 0;
params.inlayPrice = 0;
params.chainPrice = 0;
params.pmPrice = 0;
params.otherPrice = 0;
params.reportPrice = 25;
params.stockGemPrice = "";
$(function() {
	$(".mainGem_btn").click(function() {
		if ($(".mainGem").css("display") == 'none') {
			$(".mainGem").show();
		} else {
			$(".mainGem").hide();
			params.mainGemPrice = 0;
		}
	})
	$(".partsGem_btn").click(function() {
		if ($(".partsGem").css("display") == 'none') {
			$(".partsGem").show();
		} else {
			$(".partsGem").hide();
			params.inlayPrice = 0;
		}
	})
	$(".stockGem_btn").click(function() {
		$(".gem_sel").show();
	})
	$(".chain_btn").click(function() {
		if ($(".chain").css("display") == 'none') {
			$(".chain").show();
			loadChain();
		} else {
			$(".chain").hide();
			params.chainPrice = 0;
		}
	})
	$("select[name='metal']").change(function() {
		params.metalId = $(this).val();
	})
	$("select[name='type']").change(function() {
		params.typeId = $(this).val();
	})
	$("input[name='metal_weight']").blur(function() {
		checkNum(this);
		params.metalWeight = $(this).val();
	})
	$("input[name='platemaking_price']").blur(function() {
		checkNum(this);
		$("#pmPrice").text($(this).val() + "元");
		params.pmPrice = $(this).val();
	})
	$("input[name='main_gem']").blur(function() {
		checkNum(this);
		$("#mainGemPrice").text($(this).val() * 0.04 + "元");
		params.mainGemPrice = $(this).val() * 0.04;
	})
	$("input[name='gem']").blur(function() {
		checkNum(this);
		$("#inlayPrice").text($(this).val() * 2 + "元");
		params.inlayPrice = parseInt($(this).val()) * 2;
	})
	$("input[name='otherPrice']").blur(function() {
		checkNum(this);
		$("#otherPrice_view").text($(this).val() + "元");
		params.otherPrice = $(this).val();
	})
	$("select[name='checkout']").change(function() {
		if ($(this).val() == 1) {
			params.reportPrice = 25;
		} else {
			params.reportPrice = 0;
		}

	})
	$("#check_express").click(function() {
		if (this.checked) {
			params.expressPrice = 22;
		} else {
			params.expressPrice = 0;
			$('#check_insurance').removeAttr('checked');
			params.insuranceRate = 0;
		}
	})
	$("#check_insurance").click(function() {
		if (this.checked) {
			params.insuranceRate = 0.005;
		} else {
			params.insuranceRate = 0;
		}
	})

	// 库选宝石
	$("#gem_add")
			.click(
					function() {
						var html = "";
						var gem = $(".gem_img_sel");
						if (gem.length != 0) {
							var i = 1;
							for (var g = 1; g < 100; g++) {
								if ($(".stockGem" + g).length == 0) {
									i = g;
									break;
								}
							}
							var type = gem.attr("type");
							var shape = gem.attr("shape");
							var calibrated = gem.attr("calibrated");
							var weight = gem.attr("weight");
							var costPrice = gem.attr("costPrice");
							var pic = gem.find("img").attr("src");

							html += "<li class='stockGem"
									+ i
									+ "'>"
									+ "<label>库选宝石</label>"
									+ "<p>"
									+ "<font>"
									+ "<b class='b_img'><img src='"
									+ pic
									+ "'/></b><b>"
									+ type
									+ "</b><b>"
									+ weight
									+ "ct</b>"
									+ "</font>"
									+ "<input class='inpt_3' type='text' price='"
									+ costPrice
									+ "' name='stockGemQ' class='txt_45' value=''/>颗"
									+ "<span><a href='javascript:removeStockGem("
									+ i
									+ ")'><img src='/web/mobile/images/s/sc.png' /></a></span>"
									+ "</p>"
									+ "<input type='hidden' class='sgPrice'/>"
									+ "</li>";

							$(".biaodan ul").append(html);
							$(".alertdiv1").hide();
							$("input[name='stockGemQ']")
									.blur(
											function() {
												checkNum(this);
												var qutity = $(this).val();
												var price = $(this).attr(
														"price");
												$(this)
														.parent()
														.nextAll(".sgPrice")
														.val(
																(price * qutity + qutity * 2)
																		.toFixed(2));
											})
						}

					})
	$("#gem_exit").click(function() {
		$(".alertdiv1").hide();
	})

	// 最终价格
	$(".calculator_btn").click(function() {
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
		$.ajax({
			url : '../mobile/calculate',
			type : 'POST',
			data : params,
			dataType : 'json',
			success : function(data) {
				$(".price").text(data.price + "元");
			}
		})
	})

	// 价格详情
	$(".calculator_btn2")
			.click(
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
						$
								.ajax({
									url : '../mobile/calculate',
									type : 'POST',
									data : params,
									dataType : 'json',
									success : function(data) {
										$("#makePrice").text(
												parseInt(data.makePrice) + "元");
										$("#metalPrice")
												.text(
														parseInt(data.metalPrice)
																+ "元");
										$(".detailCost").find(".cont_2").text(
												data.sumDetail);
										$(".price")
												.text(
														parseInt(data.cost)
																+ " + "
																+ (parseInt(data.price) - parseInt(data.cost))
																+ " = "
																+ data.price
																+ "元");
									}
								})
					})
	$(".gem_type").bind("change", loadShape);
	$(".gem_shape").bind("change", loadCalibrated);
	$(".gem_calibrated").bind("change", loadGem);
	$("select[name='chain_metal']").bind("change", loadChainStyleList);
	$("select[name='chain_style']").bind("change", loadChain);
	$("select[name='chain_detail']").change(function() {
		$("#chainPrice").text($(this).val() + "元");
		params.chainPrice = $(this).val();
	})
	loadGem();
})
function h(str) {
	if ("chain" == str) {
		params.chainPrice = 0;
	} else if ("mainGem" == str) {
		params.mainGemPrice = 0;
	} else if ("partsGem" == str) {
		params.inlayPrice = 0;
	}
	var value = $("." + str + "_btn").val();
	$("." + str + "_btn").val(value.replace('取消', '增加'));
	$("." + str).hide();
}
function removeStockGem(id) {
	$(".stockGem" + id).remove();
}
function loadShape() {
	var type = $(".gem_type").val();
	if (type == 1) {
		$(".gem_shape").prepend("<option value='4'>圆形</option>");
		$(".gem_shape:first").trigger("change");
	} else {
		$.ajax({
			url : '../styles/loadShape',
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
		url : '../styles/loadCalibrated',
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
	var type = $(".gem_type").val();
	var shape = $(".gem_shape").val();
	var calibrated = $(".gem_calibrated").val();
	var type_cn = $(".gem_type").find("option:selected").text();
	var shape_cn = $(".gem_shape").find("option:selected").text();
	var calibrated_cn = $(".gem_calibrated").find("option:selected").text();
	$.ajax({
		url : '../styles/loadGem',
		type : 'POST',
		data : {
			'typeId' : type,
			'shapeId' : shape,
			'calibratedId' : calibrated
		},
		dataType : 'json',
		success : function(data) {
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
		url : '../web/loadChainStyleList',
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
		url : '../styles/loadChainList',
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
}
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