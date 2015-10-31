<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>${customPageType}定制单</title>

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
<script	src="${ctx}/resources/js/add-input.js"></script>
<script src="${ctx}/resources/js/photoswipe.min.js"></script>
<script src="${ctx}/resources/js/photoswipe-ui-default.min.js"></script>
<script src="${ctx}/resources/js/photoswipefromdom.js"></script>
<script src="${ctx}/resources/js/bavlo-initdata.js"></script>

<script>
	// 本地webservice
	var nativeUrl = "${pageScope.basePath}/counter/webservice/http.do";
	$(function() {
		// 款式名字初始化
		
		// 款式类型下拉框值
		var typeUrl = "http://www.bavlo.com/getAllStyleType";
		loadData(
				nativeUrl,
				typeUrl,
				"styleTypeId",
				"data[i].id",
				"data[i].type_name_cn", 
				function() {
					$("#styleTypeId").val("${customDetail['srcstyleType']}");
				});
		// 金属材质下拉框值 
		var typeUrl = "http://www.bavlo.com/getAllMetalMaterialType";
		loadData(
				nativeUrl,
				typeUrl,
				"srcmetail",
				"data[i].id",
				"data[i].metal_type_cn", 
				function() {
					$("#srcmetail").val("${customDetail['srcmetail']}");
				});
		// 款式类型下拉框值
		var typeUrl = "http://www.bavlo.com/getAllRingSize"; 
		loadRingSizeData(
				nativeUrl,
				typeUrl,
				"ringSizeId",
				"data[i].id",
				"data[i].china", 
				"data[i].diameter", 
				"data[i].circumference", 
				function() {
					$("#ringSizeId").val("${customDetail['srcringSize']}");
				});
		// 当款式类型不是戒指时，隐藏戒指手寸选项 
		$("#styleTypeId").change(function() {
			if($("#styleTypeId").val()=="1"){
				$("#ringSizeId").css({display:"block"});
			}else{
				$("#ringSizeId").css({display:"none"});
			}	
		});
	});

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
	<input type="hidden" id='customerid' name='customerId'
		value="${customDetail.customerId }" />
	<input type="hidden" id='customid' name='id'
		value="${customDetail.id }" />
	<div class="all">
		<div class="main">
			<div class="mainleft">
				<div class="cankao">
					<h2><a href="javascript:;" style="color:#fff" onclick="PicShow_Hidden(pic)">+ 参考图 （6）</a></h2>
					<div class="pro">
						<b><a href="javascript:;" onclick="PicShow_Hidden(pic)">显示</a></b>
						<div class="demo" id='pic' style='display: none;'>
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
					<h2><a href="javascript:;" style="color:#fff" onclick="Pic1Show_Hidden(pic1)">+ 起版设计图 （2）</a></h2>
					<div class="pro">
						<!--<img src="images/zb_06.png" />-->
						<b><a href="javascript:;" onclick="Pic1Show_Hidden(pic1)">显示</a></b>
						<div class="demo" id='pic1' style='display: none;'>
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
					<input type="text" id="vstyleName" name="vstyleName"
						value="给本款取个名字吧！"
						onfocus="if(value=='给本款取个名字吧！'){value=''}" 
						onblur="if(value==''){value='给本款取个名字吧！'}"
						class="quming" />
				</div>
				<div class="xuqiu">
					<textarea id="vrequirement" name="vrequirement" cols="" rows=""
						onfocus="if(value=='需求描述'){value=''}" 
						onblur="if(value==''){value='需求描述'}"
						class="miaoshu1">需求描述</textarea>
				</div>
			</div>
			<div class="mainmid">
				<h2>BOM</h2>
				<div class="bom">
					<select id="styleTypeId" name="srcstyleType" class="jiezhi">
						<option>选择款式</option>
					</select> <select id="vsex" name="vsex" class="nvkuan">
						<option>女款</option>
						<option>男款</option>
					</select>
				</div>
				<div class="changdu">
					<select id="ringSizeId" name="srcringSize" class="neijin">
						<option>选择手寸</option>
					</select>
				</div>
				<div class="weight">
					<select id="srcmetail" name="srcmetail" class="wk">
						<option>选择金属</option>
					</select>
					<input type="text" id="nweight" name="nweight"
						value="克"
						onfocus="if(value=='克'){value=''}" 
						onblur="if(value==''){value='克'}"
						class="ke" />
				</div>
				<div class="price">
					<input id="iprice" name="iprice" 
					value="元"
					onfocus="if(value=='元'){value=''}" 
					onblur="if(value==''){value='元'}"
					class="jiege" /> <b>+选择</b>
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
								<li class="kzs_price">2颗</li>
								<li class="kzs_gl"><input type='button' name="guanlian"
									value="+ 关联" /></li>
								<li class="kps"><img src="${ctx}/resources/images/zb_09.png" width="42"
									height="42" /></li>
								<li class="cha"><a href="javascript:h('kpsGem')"><font>X</font></a></li>
							</ul>
							<div class="clear"></div>
						</div>
					</dd>
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
							</dl>
							<div class="clear"></div>
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
				
				<!-- 标签 -->
				<input type="text" name="staticPath" value="刻字标签：" id="staticPath" />
				<div class="zhanwei">
				<select name="" class="ziti">
					<option value="华文细黑" >华文细黑</option>
					<option value="华文仿宋" >华文仿宋</option>
					<option value="华文楷体" >华文楷体</option>
					<option value="华文宋体" >华文宋体</option>
					<option value="华文中宋" >华文中宋</option>
					<option value="仿宋" >仿宋</option>
					<option value="黑体" >黑体</option>
					<option value="楷体" >楷体</option>
					<option value="Bradley Hand ITC" >Bradley Hand ITC</option>
					<option value="Segoe Script" >Segoe Script</option>
					<option value="Verdana" >Verdana</option>
				</select>
				</div>
				<br />
	
				<textarea name="" cols="" rows="" 
				onfocus="if(value=='表面工艺描述'){value=''}" 
				onblur="if(value==''){value='表面工艺描述'}"				
				class="miaoshu1">表面工艺描述</textarea>
				<br />
				
				<select name="" class="jianding1">
					<option>鉴定证书</option>
					<option value="1">有</option>
					<option value="0">无</option>
				</select>
				<!-- 
				<div class="tu">
					<div class="tu1">
						<input type="file" id="kezitu" style="display: none;">
						<a href="javascript:;" class="kzsGem_btn">+ 刻字矢量图</a><strong>Love.cdr</strong><br />
					</div>
					<u>+ CAD文件</u><strong>无</strong>
				</div> -->
				<div class="qita">
					<div class="clear"></div>
					<input type="text" value="其他      元"
					onfocus="if(value=='其他      元'){value=''}" 
					onblur="if(value==''){value='其他      元'}">
					<strong>13325+13150=<u>26800 </u>元</strong>
				</div>
				<div class="jisuan">
					<dl>
						<dd class="plus">
							<a href="">+</a>
						</dd>
						<dd class="sum">
							<a href="">计算</a>
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
	<script src="${ctx}/resources/js/custom.js"></script>
</body>
</html>
