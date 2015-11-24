//本地webservice
var nativeUrl = "/counter/webservice/http.do";
var calculatorUrl = "/counter/webservice/httpcalculator.do";
//宝石图片class名 
var gemSignClass = "";
$(function() {

	// 款式类型下拉框值
	var typeUrl = "http://www.bavlo.com/getAllStyleType";
	loadSelData(nativeUrl, typeUrl, "styleType", "data[i].id",
			"data[i].type_name_cn", function() {
				$("#styleType").val("${customEdit['srcstyleType']}");
			},"款式");
	// 金属材质下拉框值
	var typeUrl = "http://www.bavlo.com/getAllMetalMaterialType";
	loadSelData(nativeUrl, typeUrl, "metalType", "data[i].id",
			"data[i].metal_type_cn", function() {
				$("#metalType").val("${customEdit['srcmetal']}");
			},"金属");
	// 款式类型下拉框值
	var typeUrl = "http://www.bavlo.com/getAllRingSize";
	loadRingSizeData(nativeUrl, typeUrl, "ringSize", "data[i].id",
			"data[i].china", "data[i].diameter", "data[i].circumference",
			function() {
				$("#ringSize").val("${customEdit['srcringSize']}");
			},"手寸");
	// 当款式类型不是戒指时，隐藏戒指手寸选项
	$("#styleType").change(function() {
		if ($("#styleType").val() == "1") {
			$("#ringSize").css({
				display : "block"
			});
		} else {
			$("#ringSize").css({
				display : "none"
			});
		}
	});
	 
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
	
	//初始化刻字
	var WS = function(opt) {

		var regexp = opt.regexp || /\S/, el = $(opt.el), list = el.val().split(','), holder = $('<span class="words-split"></span>')

		for (var i = 0; i < list.length; i++) {
			holder.append($('<a href="javascript:void(0)" class="fm-button">'
					+ list[i] + '<em> </em></a>'));
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
	 
	 //字体改变样式
	 $(".ziti").change(function(){
		 var font=$('.ziti').val();
		 $(".kezi").css({"font-family":font}); 
	 })

	 //有值加后缀
 	initFieldSuffix();
	 
	//加载子表数据
	function loadSubData(mid){
		var url = "/counter/upload/showpicJson.do";
		$.get(url,{cpath:"com.bavlo.counter.model.custom.CustomBVO",fkey:"customId",id:mid},function(row){
			var data = row;
			if(data != "" && data != null){
				for(var i = 0; i < data.length; i++){
					if(data[i].biscover == "Y"){
						$("#FILE_0").val(data[i].vname);
					}else{
						$("#FILE_"+i).val(data[i].vname);
					}
				}
			}
		});
	}
});

// 定制单保存
function saveOrUpdate() {
	cleanFieldSuffix();
	var bvo = JSON.stringify($('#customBId').serializeJson());
	var cvo = JSON.stringify($('#customCId').serializeJson());
	$.ajax({
		type : "POST",
		url : "save.do",
		data : $('#custom').serialize()+"&bvo="+bvo+"&cvo="+cvo,// formid
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
}

//增加后缀 
function initFieldSuffix(){
	if($(".metal_weight").val() != ""){
		 //金属重量 
		initSuffix("custom_weight","克");
	}
  	if($(".kzs_price").val() != ""){
		//主石金额 
		initSuffix("kzs_price","元"); 
	}
  	if($(".kps_count").val() != ""){
		//配石数量
		initSuffix("kps_count","颗"); 
	}
  	if($(".other_price").val() != ""){
		//制版金额 
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
	//链子数量
	//clearSuffix("custom_item","条");
}

//子窗体调用
function setValueByFrame(type,id,callback,json,gem){
	var url;
	if(type == "chain"){
		var data = JSON.parse(json);
		$(".chain").append("<dd class='"+data.sid+"'>"+
						   "<div class='lianzi'>"+
						   "<h3>链子</h3><a href='javascript:rlist("+data.sid+")' class='close_c'><font>X</font></a>"+
						   "<div class='clear'></div>"+
						   "<input class='custom_item' id='iitem' name='iitem' type='text' price='"+data.chainCost+"' value='' placeholder='条'>"+
						   "<strong>"+data.sname+"</strong></div></dd>"+
						   "<input type='hidden' class='chainPrice' value='"+data.chainCost+"'/>");
		$("input[id='iitem']").blur(function(){
			 checkNum(this);
			 var qutity=$(this).val();
			 var price=$(this).attr("price");
			 $(this).parent().nextAll(".chainPrice").val(price*qutity);
		 })
		closeMultiDlg();
	}else if(type == "signGem"){
		alert(id);
		var gemSign = $("#gemSignId").val();
		var gemSignB = $("#gemSignBId").val();
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
				if(gemSign == ""){
					$("#gemSignId").val(id);
					$("."+gemSignClass).append("<img class='gem_img' style='width:38px;height:38px;' src="+pic+" >");
				}else {
					$("#gemSignId").val(id);
					$(".gem_img").attr("src",pic);
				}
			}
			if(gemSignClass == "kps_img"){
				if(gemSignB == ""){
					$("#gemSignBId").val(id);
					$("."+gemSignClass).append("<img class='gem_img' style='width:38px;height:38px;' src="+pic+" >");
				}else {
					$("#gemSignBId").val(id);
					$(".gem_img").attr("src",pic);
				}
			}
		});
		
		closeMultiDlg();
	}else if(type == "gem"){
		 var html="";
		 var data = JSON.parse(json);
		 
		 var type=gem.attr("type");
		 var shape=gem.attr("shape");
		 var calibrated=gem.attr("calibrated");
		 var weight=gem.attr("weight");
		 var costPrice=gem.attr("costPrice");
		 var pic=gem.find("img").attr("src");
			
	     html+= "<dd class='"+data.sid+"'>"+
	    	 	"<div div class='lianzi'>"+	
			    "<h3>库选宝石</h3>"+
			    "<a href='javascript:rlist("+data.sid+")' class='close_c'><font>X</font></a><div class='clear'></div>"+
			    "<input class='stockGem_num' id='stockGem' name='iitem' type='text' value='' price='"+costPrice+"' placeholder='颗'>"+
				"<img src='"+pic+"'/><strong>"+type+" "+weight+"ct</strong>"+
				"<input type='hidden' class='sgPrice' value='"+costPrice+"'/>"+
				"</div></dd>";
				 
				
				
		 $(".chain").append(html);
		$("input[id='stockGem']").blur(function(){
			 checkNum(this);
			 var qutity=$(this).val();
			 var price=$(this).attr("price");
			 $(this).parent().nextAll(".sgPrice").val((price*qutity+qutity*2).toFixed(2));
		 })
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
		var weight = $("input[id='metalWeight']");
		checkNum(weight);
		if (weight.val() == "" || weight.val() == 0) {
			alert("请输入金属重量");
			$(weight).val("");
			$(weight).focus();
			return;
		}
		params.stockGemPrice = "";
		$(".sgPrice").each(function() {
			params.stockGemPrice += $(this).val() + ";";
		})
		var requestUrl = 'http://www.bavlo.com/calculate';
		var requestMethod = "POST";//GET
		var outputStr = 'typeId='+params.typeId+'&metalId='+params.metalId+'&metalWeight='+params.metalWeight+'&pmPrice='+params.pmPrice+'&mainGemPrice='+params.mainGemPrice+'&inlayPrice='+params.inlayPrice+'&otherPrice='+params.otherPrice+'&reportPrice='+params.reportPrice+'&expressPrice='+params.expressPrice+'&insuranceRate='+params.insuranceRate+'&chainPrice='+params.chainPrice+'&stockGemPrice='+params.stockGemPrice+'';

		httpRequest(calculatorUrl,requestUrl,requestMethod,outputStr,function(data) {
			 	var jsonStr = JSON.parse(data);
				$(".price").text(jsonStr.price);
		});

	})
	
	// 价格详情
	$(".calculator_btn2").click(
		function() {
			var weight = $("input[name='metalWeight']");
			checkNum(weight);
			if (weight.val() == "" || weight.val() == 0) {
				alert("请输入金属重量");
				$(weight).val("");
				$(weight).focus();
				return;
			}
			params.stockGemPrice = "";
			$(".sgPrice").each(function() {
				params.stockGemPrice += $(this).val() + ";";
			})

			var requestUrl = 'http://www.bavlo.com/calculate';
			var requestMethod = "POST";//GET
			var outputStr = 'typeId='+params.typeId+'&metalId='+params.metalId+'&metalWeight='+params.metalWeight+'&pmPrice='+params.pmPrice+'&mainGemPrice='+params.mainGemPrice+'&inlayPrice='+params.inlayPrice+'&otherPrice='+params.otherPrice+'&reportPrice='+params.reportPrice+'&expressPrice='+params.expressPrice+'&insuranceRate='+params.insuranceRate+'&chainPrice='+params.chainPrice+'&stockGemPrice='+params.stockGemPrice+'';
			
			httpRequest(calculatorUrl,requestUrl,requestMethod,outputStr,function(data) {
				 	var jsonStr = JSON.parse(data);
				 	$(".price").text(parseInt(jsonStr.cost)+" + "+(parseInt(jsonStr.price)-parseInt(jsonStr.cost))+" = "+jsonStr.price);
			});
		})
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