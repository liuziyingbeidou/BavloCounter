<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>${pageCustomType}定制单</title>

<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<!--必要样式-->
<link rel='stylesheet' href='${ctx}/resources/css/style.css' media='all' />
<link rel='stylesheet' href='${ctx}/resources/css/bootstrap.css' media='all' />
<link rel="stylesheet" href="${ctx}/resources/css/photoswipe.css" />
<link rel="stylesheet" href="${ctx}/resources/css/default-skin.css" />

<script src="${ctx}/resources/js/jquery-1.8.3.min.js"></script>
<script src="${ctx}/resources/js/top.js"></script>
<script src="${ctx}/resources/js/photoswipe.min.js"></script>
<script src="${ctx}/resources/js/photoswipe-ui-default.min.js"></script>
<script src="${ctx}/resources/js/photoswipefromdom.js"></script>

<!-- 定义JS -->
<script src="${ctx}/resources/js/bavlo-initdata.js"></script>
<script src="${ctx}/resources/js/bavlo-event.js"></script>
<script src="${ctx}/resources/js/custom.js"></script>

<!-- 弹框 -->
<!-- jQuery & jQuery UI files (needed)--> 
<link rel="stylesheet" href="/counter/resources/jquery.multiDialog/css/jquery-ui-1.10.3.custom.css">
<script src="/counter/resources/jquery.multiDialog/js/jquery/jquery-ui-1.10.3.custom.js"></script> 
<!-- MultiDialog files (needed) --> 
<link rel="stylesheet" href="/counter/resources/jquery.multiDialog/css/jquery.multiDialog.css"> 
<script src="/counter/resources/jquery.multiDialog/js/jquery.ui.dialog.extended-1.0.2.js"></script> 
<script src="/counter/resources/jquery.multiDialog/js/jquery.multiDialog.js"></script> 
<script src="/counter/resources/js/bavlo-dialog.js"></script>
<script>
//本地webservice
var nativeUrl = "/counter/webservice/http.do";
//初始基础数据
$(function(){
	// 款式类型下拉框值
	var typeUrl = "http://www.bavlo.com/getAllStyleType";
	loadSelDataStr(nativeUrl, typeUrl, "styleType", "data[i].id",
			"data[i].type_name_cn", function() {
				$("#styleType").val("${customEdit['srcstyleType']}");
			},"款式");
	// 金属材质下拉框值
	var typeUrl = "http://www.bavlo.com/getAllMetalMaterialType";
	loadSelDataStr(nativeUrl, typeUrl, "metalType", "data[i].id",
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
	
	// 客主石显示和隐藏
	var mainGemCost = "${customEdit['nmainGemCost']}";
	if(mainGemCost != ""){
		$(".kzsGem").show();
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
	// 客配石显示和隐藏
	var partsGemNum = "${customEdit['ipartsGemNum']}";
	if(partsGemNum != ""){
		$(".kpsGem").show();
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
	// 显示参考图片 
	var id = "${customEdit['id']}";
	if(id != null){
		PicShow_Hidden(pic);
	}
	// 初始化标签
	var str = "";
	if("${customEdit['vcraftTag']}" != ""){
		str = "${customEdit['vcraftTag']}"
	}
	$("#vcraftTag").val(str);
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
	//增加后缀
	initFieldSuffix();
})
</script>
</head>

<body>
	<form id="custom">
	<div class="header">
		<div class="head1">
			<div class="top">
				<b><a href="javascript:;" onclick="EditShow_Hidden(ed1)"><img
							src="${ctx}/resources/images/plus.png" />
				</a> ${pageCustomType}定制单
				 <c:choose>
					 <c:when test="${empty customEdit['vcustomCode']}">   
					 ${number }
					 <input type="hidden" id="vcustomCode" name="vcustomCode" value="${number }">
					 </c:when>
					 <c:otherwise>
					 ${customEdit['vcustomCode']}
					 <input type="hidden" id="vcustomCode" name="vcustomCode" value="${customEdit['vcustomCode']}">
					 </c:otherwise>	
				</c:choose>
				</b>
				<font><a href="javascript:;" onclick="Show_Hidden(tr1)"><img
							src="${ctx}/resources/images/plus.png" />
				</a> </font>
			</div>
			<div class="hidden_enent1" id="tr1" style="display: none;">
				<ul>
					<li class="jian">
						<a href="javascript:;" onclick="Show_Hidden(tr1)">一</a>
					</li>
					<jsp:include page="../menu_pg.jsp"></jsp:include>
				</ul>
			</div>
			<div class="edit_hidden1" id="ed1" style="display: none;">
				<ul>
					<li class="jian2">
						<a href="javascript:;" onclick="EditShow_Hidden(ed1)">一</a>
					</li>
					<jsp:include page="../menu_cau.jsp"></jsp:include>
					</li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!--<input type="hidden" id='vcustomCode' name='vcustomCode'
		value="${number }" />
	-->
	<input type="hidden" id='id' name='id'
		value="${customEdit['id'] }" />
	<input type="hidden" id='orderId' name='orderId'
		value="${customEdit['orderId'] }" />
	<input type="hidden" id='customerId' name='customerId'
		value="${customEdit['customerId'] }" />
	<input type="hidden" id='vengraveVh' name='vengraveVh'
		value="${customEdit['vengraveVh'] }" />
	<input type="hidden" id='vcadFile' name='vcadFile'
		value="${customEdit['vcadFile'] }" />
	<div class="all">
		<div class="main">
			<div class="mainleft">
				<div class="cankao">
					<h2><a href="javascript:;" style="color:#fff" class="cankaotu">+ 参考图</a></h2>
					<div class="pro">
						<b><a href="javascript:;" onclick="PicShow_Hidden(pic)">显示</a></b>
						<div class="demo" id='pic' style='display: none;'>
							<b><a href="javascript:;" onclick="PicShow_Hidden(pic)">隐藏</a></b>
							<!--<b class="hide">隐藏</b>-->
							<div class="my-gallery">
								<volist name="list" id="list"> <figure> 
								<a class="customPicShow" href="javascript:void();">
									<c:choose>
										<c:when test="${empty customEdit['FILE_0']}">   
											<img src="${ctx}/resources/images/zb_03.png">
										</c:when>
										<c:otherwise>
											<img src="${ctx}/staticRes/${customEdit['FILE_0']}">
										</c:otherwise>
									</c:choose> 
								</a>
								</figcaption> </figure> </volist>

							</div>
						</div>
					</div>
				</div>
				<div class="sheji" style="display: none;">
					<h2><a href="javascript:;" style="color:#fff" class="qibantu">+ 起版设计图</a></h2>
					<div class="pro">
						<!--<img src="images/zb_06.png" />-->
						<b><a href="javascript:;" onclick="Pic1Show_Hidden(pic1)">显示</a></b>
						<div class="demo" id='pic1' style='display: none;'>
							<b><a href="javascript:;" onclick="Pic1Show_Hidden(pic1)">隐藏</a></b>
							<!--<b class="hide">隐藏</b>-->
							<div class="my-gallery">
								<volist name="list" id="list"> <figure>
								<a class="customPicShow" href="javascript:void();">
									<c:choose>
										<c:when test="${empty customEdit['FILE_0']}">   
											<img src="${ctx}/resources/images/zb_03.png">
										</c:when>
										<c:otherwise>
											<img src="${ctx}/staticRes/${customEdit['FILE_0']}">
										</c:otherwise>
									</c:choose> 
								</a>
								</figcaption> </figure> </volist>

							</div>

							<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
								<div class="pswp__bg"></div>
								<div class="pswp__scroll-wrap">
									<div class="pswp__container">
										<div class="pswp__item"></div>
										<div class="pswp__item"></div>
										<div class="pswp__item"></div>
									</div>
									<div class="pswp__ui pswp__ui--hidden">
										<div class="pswp__top-bar">
											<div class="pswp__counter"></div>
											<button class="pswp__button pswp__button--close"
												title="Close (Esc)"></button>
											<div class="pswp__preloader">
												<div class="pswp__preloader__icn">
													<div class="pswp__preloader__cut">
														<div class="pswp__preloader__donut"></div>
													</div>
												</div>
											</div>
										</div>
										<div
											class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
											<div class="pswp__share-tooltip"></div>
										</div>
										<button class="pswp__button pswp__button--arrow--left"
											title="Previous (arrow left)"></button>
										<button class="pswp__button pswp__button--arrow--right"
											title="Next (arrow right)"></button>
										<div class="pswp__caption">
											<div class="pswp__caption__center"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="clear"></div>
				<div class="name">
					<input type="text" id="styleName" name="vstyleName"
						value="${customEdit['vstyleName']}"
						placeholder="给本款取个名字把"
						class="quming" />
				</div>
				<div class="xuqiu">
					<textarea id="requirement" name="vrequirement" cols="" rows=""
						placeholder="需求描述"
						class="miaoshu1">${customEdit['vrequirement']}</textarea>
				</div>
			</div>
			<div class="mainmid">
				<h2>BOM</h2>
				<div class="bom">
					<select id="styleType" name="srcstyleType" class="jiezhi">
						<option>选择款式</option>
					</select>
					<select name="vsex" class="nvkuan">
						<option value="0" <c:if test="${customEdit['vsex']=='0'}">selected</c:if>>女款</option>
						<option value="1" <c:if test="${customEdit['vsex']=='1'}">selected</c:if>>男款</option>
					</select>
				</div>
				<div class="changdu">
					<select id="ringSize" name="srcringSize" class="neijin">
						<option>选择手寸</option>
					</select>
				</div>
				<div class="weight">
					<select id="metalType" name="srcmetal" class="wk">
						<option>选择金属</option>
					</select>
					<input type="text" id="metalWeight" name="nweight"
						value="${customEdit['nweight']}"
						placeholder="克"
						class="metal_weight"/>
				</div>
				<!-- <div class="price">
					<input id="iprice" name="iprice" 
					value="元"
					onfocus="if(value=='元'){value=''}" 
					onblur="if(value==''){value='元'}"
					class="jiege" /> <b>+选择</b>
				</div> -->
				<dl class="chain">

					<dd class="kzsGem" style="display: none">
						<div class="kzs">
							<h3>
								<a href="">客主石</a>
							</h3>
							<ul>
								<li>
									<input type="text" 
									id="mainGemPrice" name="nmainGemCost" class="kzs_price"
									value="${customEdit['nmainGemCost'] }"
									placeholder="元"/>
									<input type="hidden"
									id="mainGemName" name="vmainGemName" class="main_gem_name"
									value="${customEdit['vmainGemName'] }"/>
									<input type="hidden"
									id="mainGemPic" name="vmainGemPic" class="main_gem_pic"
									value="${customEdit['vmainGemPic'] }"/>
								</li>
								<li class="kzs_gl"><input type='button' name="guanlian" class="kzs_guanlian"
									value="+ 关联" /></li>
								<li class="kzs_img"></li>
								<li class="cha"><a href="javascript:h('kzsGem')"><font>X</font></a></li>
							</ul>
							<div class="clear"></div>
						</div>
					</dd>
					<dd class="kpsGem" style="display: none">
						<div class="kzs">
							<h3>
								<a href="">客配石</a>
							</h3>
							<ul>
								<li>
									<input type="text"
									id="inlayPrice" name="ipartsGemNum" class="kps_count"
									value="${customEdit['ipartsGemNum'] }"
									placeholder="颗"/>
									<input type="hidden" 
									id="partsGemName" name="vpartsGemName" class="parts_gem_name" 
									value="${customEdit['vpartsGemName'] }"/>
									<input type="hidden" 
									id="partsGemPic" name="vpartsGemPic" class="parts_gem_pic" 
									value="${customEdit['vpartsGemPic'] }"/>
								</li>
								<li class="kzs_gl">
									<input type='button' name="guanlian" class="kps_guanlian"
									value="+ 关联" /></a></li>
								<li class="kps_img"></li>
								<%-- <li class="kps"><img src="${ctx}/resources/images/zb_09.png" width="42"
									height="42" /></li> --%>
								<li class="cha"><a href="javascript:h('kpsGem')"><font>X</font></a></li>
							</ul>
							<div class="clear"></div>
						</div>
					</dd>
				</dl>
<!-- 				<div style="width: 100%; position: relative;">
				
				</div> -->
				<div class="xuanze">
					<ul>
						<li><a href="javascript:;" class="kzsGem_btn">+客主石</a></li>
						<li><a href="javascript:;" class="kpsGem_btn">+客配石</a></li>
						<li><a href="javascript:;" class="kxsGem_btn">+库选石</a></li>
						<li><a href="javascript:;" class="lzGem_btn">+链子</a></li>
					</ul>
					<div class="clear"></div>
				</div>
			</div>
			<div class="mainrig">
				<h2>其他信息</h2>
				
				<input type="text" class="kezi" id="vengrave" name="vengrave" value="${customEdit['vengrave']}" placeholder="刻字" />
				<select id="vfont" name="vfont" class="ziti">
					<option value="" <c:if test="${customEdit['vfont']==''}">selected</c:if>>字体</option>
					<option value="华文细黑" <c:if test="${customEdit['vfont']=='华文细黑'}">selected</c:if>>华文细黑</option>
					<option value="华文仿宋" <c:if test="${customEdit['vfont']=='华文仿宋'}">selected</c:if>>华文仿宋</option>
					<option value="华文楷体" <c:if test="${customEdit['vfont']=='华文楷体'}">selected</c:if>>华文楷体</option>
					<option value="华文宋体" <c:if test="${customEdit['vfont']=='华文宋体'}">selected</c:if>>华文宋体</option>
					<option value="华文中宋" <c:if test="${customEdit['vfont']=='华文中宋'}">selected</c:if>>华文中宋</option>
					<option value="仿宋" <c:if test="${customEdit['vfont']=='仿宋'}">selected</c:if>>仿宋</option>
					<option value="黑体" <c:if test="${customEdit['vfont']=='黑体'}">selected</c:if>>黑体</option>
					<option value="楷体" <c:if test="${customEdit['vfont']=='楷体'}">selected</c:if>>楷体</option>
					<option value="Bradley Hand ITC" <c:if test="${customEdit['vfont']=='Bradley Hand ITC'}">selected</c:if>>Bradley Hand ITC</option>
					<option value="Segoe Script" <c:if test="${customEdit['vfont']=='Segoe Script'}">selected</c:if>>Segoe Script</option>
					<option value="Verdana" <c:if test="${customEdit['vfont']=='Verdana'}">selected</c:if>>Verdana</option>
				</select>
				<br />
	
				<div class="zhanwei">
				<input type="text" class="custom_engrave" name="vcraftTag" value="" id="vcraftTag" />
				<select class="gongyi1">
					<option value="">表面工艺</option>
					<option value="喷砂">喷砂</option>
					<option value="拉丝">拉丝</option>
					<option value="珐琅">珐琅</option>
				</select>
				<textarea id="vrequirementB" name="vrequirementB" cols="" rows="" 
				placeholder="表面工艺描述"			
				class="miaoshu1">${customEdit['vrequirementB'] }</textarea>
				<br />
				<select id="certificate" name="icertificate" class="jianding1">
					<option value="0" <c:if test="${customEdit['icertificate']=='0'}">selected</c:if>>鉴定证书 -无</option>
					<option value="1" <c:if test="${customEdit['icertificate']=='1'}">selected</c:if>>鉴定证书 -有</option>
				</select>
				</div>
				<div class="tu">
					<div class="tu1">
						<a href="javascript:;" class="vectorgraph">+ 刻字矢量图</a>
						<a href="javascript:;" class="cad_file"> + CAD文件   </a>
					</div>
				</div>
				<div class="qita">
					<div class="clear"></div>
					<input type="text" 
					id="pmPrice" name="npmPrice" class="pm_price"
					value="${customEdit['npmPrice'] }"
					placeholder="起版 元" />
				</div>
				<div class="qita">
					<div class="clear"></div>
					<input type="text" 
					id="otherPrice" name="notherPrice" class="other_price"
					value="${customEdit['notherPrice'] }"
					placeholder="其他 元" />
					<strong><u class="price"></u> 元</strong>
					<input type="hidden" class="finalPrice" id='nprice' name='nprice' value="${customEdit['nprice'] }" />
				</div>

				<div class="jisuan">
					<dl>
						<dd class="plus">
							<a href="javascript:;" class="calculator_btn2">+</a>
						</dd>
						<dd class="sum">
							<a href="javascript:;" class="calculator_btn">计算</a>
						</dd>
					</dl>
					<div class="clear"></div>
				</div>
				<div class="baocun1">
					<input type="button" name="button"
						onclick="javascript:saveOrUpdate()" value="保存" />
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	</form>
	<form id="customBId">
	<input type="hidden" name="filemodel" id="filemodel" value="custom">
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
	<input type="hidden" name="filevalue" id="filevalue" value=""></input>
	</form>
</body>
</html>
