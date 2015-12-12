<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<title>定制单</title>
<script language="javascript" type="text/javascript"
	src="${ctx}/resources/js/jquery-1.8.3.min.js"></script>
<link type='text/css' rel='stylesheet'
	href='${ctx}/resources/css/style.css' media='all' />
<link type='text/css' rel='stylesheet'
	href='${ctx}/resources/css/bootstrap.css' media='all' />
<script src="${ctx}/resources/js/top.js"></script>
<script src="${ctx}/resources/js/hide.js"></script>
<!--必要样式-->
<link rel="stylesheet" href="${ctx}/resources/css/photoswipe.css">
<link rel="stylesheet" href="${ctx}/resources/css/default-skin.css">
<link rel="stylesheet"
	href="/counter/resources/jquery.multiDialog/css/jquery-ui-1.10.3.custom.css">
<script
	src="/counter/resources/jquery.multiDialog/js/jquery/jquery-ui-1.10.3.custom.js"></script>
<script src="${ctx}/resources/js/photoswipe.min.js"></script>
<script src="${ctx}/resources/js/photoswipe-ui-default.min.js"></script>
<script src="${ctx}/resources/js/photoswipefromdom.js"></script>
<script type="text/javascript">
$(function(){
	var toUser = "${customerId}";
	$(".dzd_close").click(function() {
		sendTMessage(toUser);
	})
	function sendTMessage(toUser){
		 var url = window.location.href;
		 $.ajax({
			 url : '../sendTM.do',
				type : 'POST',
				data :{
					'toUser' : toUser,
					'url': url
				},
				success : function(data) {		
					alert("发送成功");
				},
				error : function(data) {		
					alert("发送失败"); 
				}
		 })	 	
	}
});
</script>
</head>

<body>
	<form id="custom">
		<div class="header">
			<div class="head1">
				<div class="top">
					<b><a href="#" onclick="EditShow_Hidden(ed1)"><img
							src="${ctx}/resources/images/plus.png" /> </a>
						定制单${customDetail.vcustomCode }</b> <font><a
						href="javascript:;" onclick="Show_Hidden(tr1)"><img
							src="${ctx}/resources/images/plus.png" /> </a> </font>
				</div>
				<div class="hidden_enent2" id="tr1" style="display: none;">
					<ul>
						<li class="jian"><a href="#" onclick="Show_Hidden(tr1)">一</a>
						</li>
						<jsp:include page="../menu_pg.jsp"></jsp:include>
					</ul>
				</div>
				<div class="edit_hidden1" id="ed1" style="display: none;">
					<ul>
						<li class="jian2"><a href="#" onclick="EditShow_Hidden(ed1)">一</a>
						</li>
						<jsp:include page="../menu_cau.jsp"></jsp:include>
						</li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="all">
			<div class="main">
				<div class="mainleft">
					<div class="cankao">
						<h2>+ 参考图</h2>
						<div class="pro">
							<!--<img src="${ctx}/resources/images/zb_03.png" />-->

							<b><a href="#" onclick="PicShow_Hidden(pic)">显示</a> </b>
							<div class="demo" id='pic' style='display: block;'>
								<b><a href="#" onclick="PicShow_Hidden(pic)">隐藏</a> </b>
								<!--<b class="hide">隐藏</b>-->
								<div class="my-gallery">
									<volist name="list" id="list"> <figure> <a
										href="images/zb_03.png" data-size="800x1142"><img
										src="${ctx}/resources/images/zb_03.png"
										alt="Image description" /> </a> <figcaption
										itemprop="caption description">
									<h3>图片名称8</h3>
									<!--<div class="bottom"><ul><li><a href="#"><img src="${ctx}/resources/images/share.png"></a></li><li><a href="#"><img src="${ctx}/resources/images/download.png"></a></li><li><a href="#"><img src="${ctx}/resources/images/link.png"></a></li></ul></div>-->
									</figcaption> </figure> </volist>

								</div>
							</div>
						</div>
					</div>
					<div class="sheji">
						<h2>+ 起版设计图</h2>
						<div class="pro">
							<!--<img src="${ctx}/resources/images/zb_06.png" />-->
							<b><a href="javascript:;" onclick="Pic1Show_Hidden(pic1)">显示</a>
							</b>
							<div class="demo" id='pic1' style='display: block;'>
								<b><a href="javascript:;" onclick="Pic1Show_Hidden(pic1)">隐藏</a>
								</b>
								<div class="my-gallery">
									<volist name="list" id="list"> <figure> <a
										href="${ctx}/resources/images/zb_06.png" data-size="800x1142"><img
										src="${ctx}/resources/images/zb_06.png"
										alt="Image description" /> </a> <figcaption
										itemprop="caption description">
									<h3>图片名称8</h3>
									<!--<div class="bottom"><ul><li><a href="#"><img src="${ctx}/resources/images/share.png"></a></li><li><a href="#"><img src="${ctx}/resources/images/download.png"></a></li><li><a href="#"><img src="${ctx}/resources/images/link.png"></a></li></ul></div>-->
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
					<b>订单号 ${customDetail.vorderCode }</b>
				</div>
				<div class="mainmid">
					<div class="dzd">
						<dl>
							<dd>
								报价： <b>${customDetail.nprice }元</b>
							</dd>
							<dd>类型：${customDetail.srcstyleType }</dd>
							<dd>手寸：${customDetail.srcringSize }</dd>
							<dd>金属：${customDetail.nprice }</dd>
							<dd class="chain"></dd>
							<dd class="mainGem"></dd>
							<dd class="partGem"></dd>
							<dd class="stockGem"></dd>
							<dd>刻字：${customDetail.vengrave }</dd>
							<dd>表面工艺：${customDetail.vrequirementB }</dd>
							<dd>鉴定证书：${customDetail.icertificate }</dd>
							<dd>定制说明：${customDetail.vrequirement }</dd>
						</dl>
					</div>
				</div>
				<div class="mainrig">
          <div class="dzd_right">
            <h3>客主石</h3>
	            <dt>
	              <!-- <img src="images/kzs.png"> -->托帕石(AA)x1颗，0.05ct 2.50x2.50x1.50
	            </dt>
	            <div class="clear"></div>
	            <div class="dzd_right_btm d1">
	              <span class="gf" ><a href="">下载CAD</a> </span>
	              <b><a href="">下载矢量图</a></b>
	              <div class="clear"></div>
	            </div>
	            <div class="dzd_right_btm">
	              <input type='text' class="gf" value='工费258元'>
	              <b><a href="">通知QC</a></b>
	              <div class="clear"></div>
							<input type="button" value="发送给客户" class="dzd_close" />
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</form>
</body>
</html>