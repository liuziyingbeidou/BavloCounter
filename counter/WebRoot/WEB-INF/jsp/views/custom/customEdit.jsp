<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">


		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<title>定制单</title>
		<script language="javascript" type="text/javascript"
			src="${ctx}/resources/js/jquery-1.8.3.min.js"></script>
		<link type='text/css' rel='stylesheet' href='css/style.css'
			media='all' />
		<link type='text/css' rel='stylesheet' href='css/bootstrap.css'
			media='all' />
		<script src="${ctx}/resources/js/top.js"></script>
		<script src="${ctx}/resources/js/hide.js"></script>
		<!--必要样式-->
		<link rel="stylesheet" href="css/photoswipe.css">
		<link rel="stylesheet" href="css/default-skin.css">

		<script src="${ctx}/resources/js/photoswipe.min.js"></script>
		<script src="${ctx}/resources/js/photoswipe-ui-default.min.js"></script>
	</head>

	<body>

		<div class="header">
			<div class="top">
				<b><a href="javascript:;" onclick="EditShow_Hidden(ed1)"><img
							src="${ctx}/resources/images/plus.png">
				</a> 定制单81812560 </b>
				<font><a href="javascript:;" onclick="Show_Hidden(tr1)"><img
							src="${ctx}/resources/images/plus.png">
				</a>
				</font>
				<div class="clear"></div>
			</div>
			<div class="hidden_enent1" id="tr1" style="display: none;">
				<ul>
					<li class="jian">
						<a href="javascript:;" onclick="Show_Hidden(tr1)">—</a>
					</li>
					<li>
						<a href="">定制单</a>
					</li>
					<li>
						<a href="">宝石签收单</a>
					</li>
					<li>
						<a href="">订单</a>
					</li>
					<li>
						<a href="">客户</a>
					</li>
				</ul>
			</div>
			<div class="edit_hidden1" id="ed1" style="display: none;">
				<ul>
					<li class="jian2">
						<a href="javascript:;" onclick="EditShow_Hidden(ed1)">—</a>
					</li>
					<li>
						<a href="">Open</a>
					</li>
					<li>
						<a href="">Save</a>
					</li>
					<li>
						<a href="">Save as</a>
					</li>
					<li>
						<a href="">Print</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="all">
			<div class="main">
				<div class="mainleft">
					<div class="cankao">
						<h2>
							+ 参考图 （6）
						</h2>
						<div class="pro">
							<!--<img src="${ctx}/resources/images/zb_03.png" />-->

							<b><a href="javascript:;" onclick="PicShow_Hidden(pic)">显示</a>
							</b>
							<div class="demo" id='pic' style='display: block;'>
								<b><a href="javascript:;" onclick="PicShow_Hidden(pic)">隐藏</a>
								</b>
								<!--<b class="hide">隐藏</b>-->
								<div class="my-gallery">
									<volist name="list" id="list">
									<figure>
									<a href="images/zb_03.png" data-size="800x1142"><img
											src="${ctx}/resources/images/zb_03.png" alt="Image description" />
									</a>
									<figcaption itemprop="caption description">
									<h3>
										图片名称8
									</h3>
									<!--<div class="bottom"><ul><li><a href="#"><img src="${ctx}/resources/images/share.png"></a></li><li><a href="#"><img src="${ctx}/resources/images/download.png"></a></li><li><a href="#"><img src="${ctx}/resources/images/link.png"></a></li></ul></div>-->
									</figcaption>
									</figure>
									<figure style="display:none;">
									<a href="${ctx}/resources/images/zb_03.png" data-size="800x1142"><img
											src="${ctx}/resources/images/zb_03.png" alt="Image description" />
									</a>
									<figcaption itemprop="caption description">
									<h3>
										图片名称8
									</h3>
									</figcaption>
									</figure>
									<figure style="display:none;">
									<a href="${ctx}/resources/images/zb_03.png" data-size="800x1142"><img
											src="${ctx}/resources/images/zb_03.png" alt="Image description" />
									</a>
									<figcaption itemprop="caption description">
									<h3>
										图片名称8
									</h3>
									</figcaption>
									</figure>
									</volist>

								</div>
							</div>
						</div>
					</div>
					<div class="sheji">
						<h2>
							+ 起版设计图 （2）
						</h2>
						<div class="pro">
							<!--<img src="${ctx}/resources/images/zb_06.png" />-->
							<b><a href="javascript:;" onclick="Pic1Show_Hidden(pic1)">显示</a>
							</b>
							<div class="demo" id='pic1' style='display: block;'>
								<b><a href="javascript:;" onclick="Pic1Show_Hidden(pic1)">隐藏</a>
								</b>
								<!--<b class="hide">隐藏</b>-->
								<div class="my-gallery">
									<volist name="list" id="list">
									<figure>
									<a href="${ctx}/resources/images/zb_06.png" data-size="800x1142"><img
											src="${ctx}/resources/images/zb_06.png" alt="Image description" />
									</a>
									<figcaption itemprop="caption description">
									<h3>
										图片名称8
									</h3>
									<!--<div class="bottom"><ul><li><a href="#"><img src="${ctx}/resources/images/share.png"></a></li><li><a href="#"><img src="${ctx}/resources/images/download.png"></a></li><li><a href="#"><img src="${ctx}/resources/images/link.png"></a></li></ul></div>-->
									</figcaption>
									</figure>
									<figure style="display:none;">
									<a href="${ctx}/resources/images/zb_06.png" data-size="800x1142"><img
											src="${ctx}/resources/images/zb_06.png" alt="Image description" />
									</a>
									<figcaption itemprop="caption description">
									<h3>
										图片名称8
									</h3>
									</figcaption>
									</figure>
									<figure style="display:none;">
									<a href="${ctx}/resources/images/zb_06.png" data-size="800x1142"><img
											src="${ctx}/resources/images/zb_06.png" alt="Image description" />
									</a>
									<figcaption itemprop="caption description">
									<h3>
										图片名称8
									</h3>
									</figcaption>
									</figure>
									</volist>

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
							<script language="javascript" type="text/javascript"
								src="${ctx}/resources/js/photoswipefromdom.js"></script>
						</div>
					</div>
					<div class="clear"></div>
					<b>订单号 1133695</b>
				</div>
				<div class="mainmid">
					<div class="dzd">
						<dl>
							<dd>
								报价：
								<b>26800元</b>
							</dd>
							<dd>
								类型：戒指
							</dd>
							<dd>
								款型：女款
							</dd>
							<dd>
								手寸：13号
							</dd>
							<dd>
								报价：
							</dd>
							<dd>
								类型：戒指
							</dd>
							<dd>
								手寸：
							</dd>
							<dd>
								报价：
							</dd>
							<dd>
								类型：戒指
							</dd>
							<dd>
								手寸：
							</dd>
							<dd>
								报价：
							</dd>
							<dd>
								类型：戒指
							</dd>
							<dd>
								手寸：
							</dd>
							<dd>
								类型：戒指
							</dd>
							<dd>
								定制说明：
							</dd>
						</dl>
					</div>
				</div>
				<div class="mainrig">
					<div class="dzd_right">
						<dl>
							<dd>
								1、通过该设计：即开始付款和定制。
							</dd>
							<dd>
								2、如需要修改，请通过服务号联系定制顾问，设计师将根据您的意见进行修改。
							</dd>
						</dl>
						<p>
							<input type="checkbox" name="checkbox" value="checkbox"
								checked="checked" class="true" />
							<a href="">同意宝珑定制条款</a>
						</p>
						<div class="dzd_right_btm">
							<a href="">需要修改</a>
							<a href="" class="pass">通过该设计</a>
							<div class="clear"></div>
							<input type="submit" name="Submit" value="关闭" class="dzd_close" />
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>

		</div>
	</body>
</html>