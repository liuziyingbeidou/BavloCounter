<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>编辑定制单</title>
<script language="javascript" type="text/javascript"
	src="js/jquery-1.8.3.min.js"></script>
<link type='text/css' rel='stylesheet'
	href='${ctx}/resources/css/style.css' media='all' />
<link type='text/css' rel='stylesheet'
	href='${ctx}/resources/css/bootstrap.css' media='all' />
<script src="${ctx}/resources/js/top.js"></script>
<script language="javascript" type="text/javascript"
	src="${ctx}/resources/js/add-input.js"></script>
<!--必要样式-->
<link rel="stylesheet" href="${ctx}/resources/css/photoswipe.css" />
<link rel="stylesheet" href="${ctx}/resources/css/default-skin.css" />

<script src="${ctx}/resources/js/photoswipe.min.js"></script>
<script src="${ctx}/resources/js/photoswipe-ui-default.min.js"></script>
<script language="javascript" type="text/javascript"
	src="${ctx}/resources/js/photoswipefromdom.js"></script>
	
<script>
// 本地webservice
var nativeUrl = "${pageScope.basePath}/counter/webservice/http.do";
		$(function() {
		// 款式类型下拉框值
		var typeUrl = "http://www.bavlo.com/getAllStyleType";
		loadSelData(nativeUrl, typeUrl, "styleType", "data[i].id",
				"data[i].type_name_cn", function() {
					$("#styleType").val("${customerDetail['vtype']}");
				});
		
		//形状下拉框
		initShapeByType();
		//规格下拉框
		initSpecByTypeShape();

		//类型和形状改变
		$("#styleTypeId").change(function() {
			initShapeByType();
		});
		$("#styleShapeId").change(function() {
			initSpecByTypeShape();
		});
		/**
		 *$(document).ajaxStop(function () {setNowSelData(); });
		 **/

	});
	
	//初始化input
	$(function initVal() {
		var customerWorth = "${customerDetail['nworth']}";
		var customerWeigth = "${customerDetail['nweight']}";
		var customerCount = "${customerDetail['icount']}";
		if (customerWorth == "") {
			$("#nworth").val("价值（元）");
		}
		if (customerWeigth == "") {
			$("#nweight").val("重量（克拉）");
		}
		if (customerCount == "") {
			$("#icount").val("数量（颗）");
		}
	});
	
	//初始化形状下拉框值
	function initShapeByType() {
		var styleTypeId = $("#styleTypeId").val();
		if (styleTypeId == "-1") {
			styleTypeId = "${customerDetail['vtype']}";
		}
		var shapeUrl = "http://www.bavlo.com/getGemShape?typeId="+ styleTypeId;
		loadSelData(nativeUrl, shapeUrl, "styleShapeId", "data[i].id",
				"data[i].shape_cn", function() {
					$("#styleShapeId").val("${customerDetail['vshape']}");
				});
	}
	
	//初始化规格下拉框值
	function initSpecByTypeShape() {
		var styleTypeId = $("#styleTypeId").val();
		var styleShapeId = $("#styleShapeId").val();
		if (styleTypeId == "-1") {
			styleTypeId = "${customerDetail['vtype']}";
		}
		if (styleShapeId == "-1") {
			styleShapeId = "${customerDetail['vshape']}";
		}
		var specUrl = "http://www.bavlo.com/getGemCalibrated?typeId="
				+ styleTypeId + "&shapeId=" + styleShapeId;
		loadSelData(nativeUrl, specUrl, "styleSpecId", "data[i].id",
				"data[i].size", function() {
					$("#styleSpecId").val("${customerDetail['vspec']}");
				});
	}

//定制单保存
function saveOrUpdate() {
	$.ajax({
		type : "POST",
		url : "customer/saveOrUpdate.do",
		data : $('#customer').serialize(),// formid
		async : false,
		cache : false,
		success : function(data) {
			$("#styleid").val(data.id);
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
	<jsp:include page="../header.jsp"></jsp:include>
	<jsp:include page="customList.jsp"></jsp:include>
	<input type="hidden" id='customerid' name='customerId' value="${customDetail.customerId }" />
	<input type="hidden" id='customid' name='id' value="${customDetail.id }" />
	<div class="all">
		<div class="main">
			<div class="mainleft">
				<div class="cankao">
					<h2>+ 参考图 （6）</h2>
					<div class="pro">
						<!--<img src="images/zb_03.png" />-->

						<b><a href="javascript:;" onclick="PicShow_Hidden(pic)">显示</a></b>
						<div class="demo" id='pic' style='display: block;'>
							<b><a href="javascript:;" onclick="PicShow_Hidden(pic)">隐藏</a></b>
							<!--<b class="hide">隐藏</b>-->
							<div class="my-gallery">
								<volist name="list" id="list"> <figure> <a
									href="${ctx}/resources/images/zb_03.png" data-size="800x1142"><img
									src="${ctx}/resources/images/zb_03.png" alt="Image description" /></a>
								<figcaption itemprop="caption description">
								<h3>图片名称8</h3>
								<!--<div class="bottom"><ul><li><a href="#"><img src="images/share.png"></a></li><li><a href="#"><img src="images/download.png"></a></li><li><a href="#"><img src="images/link.png"></a></li></ul></div>-->
								</figcaption> </figure> <figure style="display:none;"> <a
									href="${ctx}/resources/images/zb_03.png" data-size="800x1142"><img
									src="${ctx}/resources/images/zb_03.png" alt="Image description" /></a>
								<figcaption itemprop="caption description">
								<h3>图片名称8</h3>
								</figcaption> </figure> <figure style="display:none;"> <a
									href="${ctx}/resources/images/zb_03.png" data-size="800x1142"><img
									src="${ctx}/resources/images/zb_03.png" alt="Image description" /></a>
								<figcaption itemprop="caption description">
								<h3>图片名称8</h3>
								</figcaption> </figure> </volist>

							</div>
						</div>
					</div>
				</div>
				<div class="sheji">
					<h2>+ 起版设计图 （2）</h2>
					<div class="pro">
						<!--<img src="images/zb_06.png" />-->
						<b><a href="javascript:;" onclick="Pic1Show_Hidden(pic1)">显示</a></b>
						<div class="demo" id='pic1' style='display: block;'>
							<b><a href="javascript:;" onclick="Pic1Show_Hidden(pic1)">隐藏</a></b>
							<!--<b class="hide">隐藏</b>-->
							<div class="my-gallery">
								<volist name="list" id="list"> <figure> <a
									href="${ctx}/resources/images/zb_06.png" data-size="800x1142"><img
									src="${ctx}/resources/images/zb_06.png" alt="Image description" /></a>
								<figcaption itemprop="caption description">
								<h3>图片名称8</h3>
								<!--<div class="bottom"><ul><li><a href="#"><img src="images/share.png"></a></li><li><a href="#"><img src="images/download.png"></a></li><li><a href="#"><img src="images/link.png"></a></li></ul></div>-->
								</figcaption> </figure> <figure style="display:none;"> <a
									href="${ctx}/resources/images/zb_06.png" data-size="800x1142"><img
									src="${ctx}/resources/images/zb_06.png" alt="Image description" /></a>
								<figcaption itemprop="caption description">
								<h3>图片名称8</h3>
								</figcaption> </figure> <figure style="display:none;"> <a
									href="${ctx}/resources/images/zb_06.png" data-size="800x1142"><img
									src="${ctx}/resources/images/zb_06.png" alt="Image description" /></a>
								<figcaption itemprop="caption description">
								<h3>图片名称8</h3>
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
					<input type="text" id="vstyleName" name="vstyleName" value="给本款取个名字吧！" class="quming" />
				</div>
				<div class="xuqiu">
					<textarea id="vrequirement" name="vrequirement" cols="" rows="" class="miaoshu1">需求描述</textarea>
				</div>
			</div>
			<div class="mainmid">
				<h2>BOM</h2>
				<div class="bom">
					<select id="srcstyleType" name="srcstyleType" class="jiezhi">
						<option>戒指</option>
					</select>
					<select id="vsex" name="vsex" class="nvkuan">
						<option>女款</option>
						<option>男款</option>
					</select>
				</div>
				<div class="changdu">
					<select id="vringSize" name="vringSize" class="neijin">
						<option>选择手寸</option>
					</select>
				</div>
				<div class="weight">
					<select id="srcmetail" name="srcmetail" class="wk">
						<option>W18K</option>
					</select>
					<input type="text" id="nweight" name="nweight" class="ke" value="8克"/>
				</div>
				<div class="price">
					<input id="iprice" name="iprice" class="jiege" value="200"/>
					<b>+选择</b>
				</div>
				<dl>
					<dd class="lzGem" style="display: none">
						<div class="lianzi">
							<h3>链子</h3>
							<a href="javascript:h('lzGem')"><font>X</font></a>
							<div class="clear"></div>
							<b>2 条</b> <strong>肖邦链 W18k 16"×1.6mm</strong>
						</div>
					</dd>
					<dd class="kzsGem" style="display: none">
						<div class="kzs">
							<h3>
								<a href="">客主石</a>
							</h3>
							<ul>
								<li class="kzs_price">25000元</li>
								<li class="kzs_gl"><input type='button' name="guanlian"
									value="+ 关联" /></li>
								<li class="kong">空</li>
								<li class="cha"><a href="javascript:h('kzsGem')"><font>X</font></a></li>
								<div class="clear"></div>
							</ul>
						</div>
					</dd>
					<dd class="kpsGem" style="display: none">
						<div class="kzs">
							<h3>
								<a href="">客配石</a>
							</h3>
							<ul>
								<li class="kzs_price">2颗</li>
								<li class="kzs_gl"><input type='button' name="guanlian"
									value="+ 关联" /></li>
								<li class="kps"><img src="images/zb_09.png" width="42"
									height="42" /></li>
								<li class="cha"><a href="javascript:h('kpsGem')"><font>X</font></a></li>
								<div class="clear"></div>
							</ul>
						</div>
					</dd>
					<!--<dd class="kxsGem" style="display: none">
				  <div class="kzs">
					<h3><a href="">库选石</a></h3>
					<ul>
					  <li class="kzs_price">22颗</li>
					  <li class="kzs_gl">橄榄石</li>
					  <li class="kxs"><img src="images/zhubao1_03.jpg" width="41" height="40" /</li>
					  <li class="cha"><a href="javascript:h('kxsGem')"><font>X</font></a></li>
					  <div class="clear"></div>
					</ul>
				  </div>
			  </dd>-->

				</dl>
				<div style="width: 100%; position: relative;">
					<!--库选石弹窗-->
					<div class="kxbs" id='kxs' style='display: none;'>
						<div class="kxbs-in">
							<div class="kxbs-in-close">
								<a href="javascript:;" onclick="KxsShow_Hidden(kxs)">X</a>
							</div>
							<div id="choose">
								<h3>库选宝石</h3>
								<select>
									<option>锰铝榴石</option>
								</select>
							</div>
							<div id="choose">
								<select>
									<option>椭圆形</option>
								</select>
							</div>
							<div id="choose">
								<select>
									<option>11.60x11.58x7.22</option>
								</select>
							</div>
							<dl>
								<dd>
									<img src="${ctx}/resources/images/ks_01.png" />
								</dd>
								<dd>
									<img src="${ctx}/resources/images/ks_02.png" />
								</dd>
								<dd>
									<img src="${ctx}/resources/images/ks_03.png" />
								</dd>
								<div class="clear"></div>
							</dl>
							<input type="submit" name="button" value="OK" class="ok" />
						</div>
					</div>
					<!--库选石弹窗END-->
				</div>
				<div class="xuanze">
					<ul>
						<li><a href="javascript:;" class="kzsGem_btn">+客主石</a></li>
						<li><a href="javascript:;" class="kpsGem_btn">+客配石</a></li>
						<li><a href="javascript:;" onclick="KxsShow_Hidden(kxs)"
							class="kxsGem_btn">+库选石</a></li>
						<li><a href="javascript:void(0);" class="lzGem_btn">+链子</a></li>
					</ul>
					<div class="clear"></div>
				</div>
			</div>
			<div class="mainrig">
				<h2>其他信息</h2>
				<select name="" class="kezi">
					<option>刻字</option>
					<option>2</option>
					<option>3</option>
				</select> <select name="" class="ziti">
					<option>字体</option>
					<option>2</option>
					<option>3</option>
				</select><br /> <select name="" class="jianding1">
					<option>喷砂</option>
					<option>2</option>
					<option>3</option>
				</select> <select name="" class="jianding1">
					<option>成色打标</option>
					<option>2</option>
					<option>3</option>
				</select>
				<textarea name="" cols="" rows="" class="miaoshu1">表面工艺描述</textarea>
				<br /> <select name="" class="jianding1">
					<option>鉴定证书</option>
					<option>2</option>
					<option>3</option>
				</select>
				<div class="tu">
					<div class="tu1">
						<b>+ 刻字矢量图</b><strong>Love & Love.cdr</strong><br />
					</div>
					<u>+ CAD文件</u><strong>无</strong>
				</div>
				<div class="qita">
					<div class="clear"></div>
					<b>其他 元</b><strong>13325+13150=<u>26800 </u>元
					</strong>
				</div>
				<div class="jisuan">
					<dl>
						<dd class="plus">
							<b>+</b>
						</dd>
						<dd class="sum">
							<a href="">计算</a>
						</dd>
						<div class="clear"></div>
					</dl>
				</div>
				<div class="baocun1">
					<input type="button" name="button" onclick="javascript:saveOrUpdate()" value="保存"/>
				</div>
			</div>
			<div class="clear"></div>
		</div>

	</div>
</body>
</html>
