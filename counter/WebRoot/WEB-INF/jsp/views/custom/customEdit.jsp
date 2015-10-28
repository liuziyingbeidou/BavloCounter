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
<meta name="viewport" content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>编辑定制单</title>
<script language="javascript" type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<link type='text/css' rel='stylesheet' href='css/style.css' media='all' />
<link type='text/css' rel='stylesheet' href='css/bootstrap.css' media='all' />
<script src="js/top.js"></script>

<!--必要样式-->
<link rel="stylesheet" href="css/photoswipe.css"/> 
<link rel="stylesheet" href="css/default-skin.css"/> 

<script src="js/photoswipe.min.js"></script> 
<script src="js/photoswipe-ui-default.min.js"></script> 
</head>

<body>

<div class="header">
	<div class="head1">
		<div class="top">
			<b><a href="javascript:;" onclick="EditShow_Hidden(ed1)"><img src="images/plus.png"/></a> 编辑定制单 81812560</b>
			<font><a href="javascript:;" onclick="Show_Hidden(tr1)"><img src="images/plus.png"/></a></font>
		</div>
		<div class="hidden_enent1" id="tr1" style="display:none;">
			<ul>
				<li class="jian"><a href="javascript:;" onclick="Show_Hidden(tr1)">—</a></li>
				<li><a href="">定制单</a></li>
				<li><a href="">宝石签收单</a></li>
				<li><a href="">订单</a></li>
				<li><a href="">客户</a></li>
			</ul>
		</div>
		<div class="edit_hidden1" id="ed1" style="display:none;">
			<ul>
				<li class="jian2"><a href="javascript:;" onclick="EditShow_Hidden(ed1)">—</a></li>
				<li><a href="">Open</a></li>
				<li><a href="">Save</a></li>
				<li><a href="">Save as</a></li>
				<li><a href="">Print</a></li>			
			</ul>
		</div>
	</div>
</div>

<div class="all">
	<div class="main">
    	<div class="mainleft">
        	<div class="cankao">
				<h2>+ 参考图 （6）</h2>
				<div class="pro">
					<!--<img src="images/zb_03.png" />-->
				
					<b><a href="javascript:;" onclick="PicShow_Hidden(pic)">显示</a></b>
					<div class="demo" id='pic' style=' display:block;'>
						<b><a href="javascript:;" onclick="PicShow_Hidden(pic)">隐藏</a></b>
					<!--<b class="hide">隐藏</b>-->
						<div class="my-gallery">
						<volist name="list" id="list">
							<figure>						
								<a href="images/zb_03.png" data-size="800x1142"><img src="images/zb_03.png" alt="Image description" /></a>
								<figcaption itemprop="caption description"><h3>图片名称8</h3>
								   <!--<div class="bottom"><ul><li><a href="#"><img src="images/share.png"></a></li><li><a href="#"><img src="images/download.png"></a></li><li><a href="#"><img src="images/link.png"></a></li></ul></div>-->
								</figcaption>						 
							</figure>
							<figure style="display:none;">		
								<a href="images/zb_03.png" data-size="800x1142"><img src="images/zb_03.png" alt="Image description" /></a>
								<figcaption itemprop="caption description"><h3>图片名称8</h3>
								</figcaption>						 
							</figure>
							<figure style="display:none;">						
								<a href="images/zb_03.png" data-size="800x1142"><img src="images/zb_03.png" alt="Image description" /></a>
								<figcaption itemprop="caption description"><h3>图片名称8</h3>
								</figcaption>						 
							</figure>
						</volist>
						
						</div>				
					</div>				
				</div>
			</div>
            <div class="sheji">
				<h2>+ 起版设计图 （2）</h2>
				<div class="pro">
					<!--<img src="images/zb_06.png" />-->				
					<b><a href="javascript:;" onclick="Pic1Show_Hidden(pic1)">显示</a></b>
					<div class="demo" id='pic1' style=' display:block;'>
					<b><a href="javascript:;" onclick="Pic1Show_Hidden(pic1)">隐藏</a></b>
				<!--<b class="hide">隐藏</b>-->
					<div class="my-gallery">
					<volist name="list" id="list">
						<figure>						
							<a href="images/zb_06.png" data-size="800x1142"><img src="images/zb_06.png" alt="Image description" /></a>
							<figcaption itemprop="caption description"><h3>图片名称8</h3>
							   <!--<div class="bottom"><ul><li><a href="#"><img src="images/share.png"></a></li><li><a href="#"><img src="images/download.png"></a></li><li><a href="#"><img src="images/link.png"></a></li></ul></div>-->
							</figcaption>						 
						</figure>
						<figure style="display:none;">		
							<a href="images/zb_06.png" data-size="800x1142"><img src="images/zb_06.png" alt="Image description" /></a>
							<figcaption itemprop="caption description"><h3>图片名称8</h3>
							</figcaption>						 
						</figure>
						<figure style="display:none;">						
							<a href="images/zb_06.png" data-size="800x1142"><img src="images/zb_06.png" alt="Image description" /></a>
							<figcaption itemprop="caption description"><h3>图片名称8</h3>
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
								<button class="pswp__button pswp__button--close" title="Close (Esc)"></button>
								<div class="pswp__preloader">
									<div class="pswp__preloader__icn">
										<div class="pswp__preloader__cut">
											<div class="pswp__preloader__donut"></div>
										</div>
									</div>
								</div>
							</div>
							<div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
								<div class="pswp__share-tooltip"></div> 
							</div>
							<button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)"></button>
							<button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)"></button>
							<div class="pswp__caption">
								<div class="pswp__caption__center"></div>
							</div>
						</div>
						</div>
					</div>					
				</div>
				<script language="javascript" type="text/javascript" src="js/photoswipefromdom.js"></script>
				</div>
			</div>
			<div class="clear"></div>
            <div class="name"><input name="textfield" type="text" id="textfield" value="给本款取个名字吧！"  class="quming"/></div>  
            <div class="xuqiu">
              <textarea name="" cols="" rows="" class="miaoshu1">需求描述</textarea></div>
        </div>
        <div class="mainmid">
        	<h2>BOM</h2>
          <div class="bom">
            <select name="" class="jiezhi">
              <option>戒指</option>
              <option>2</option>
              <option>3</option>
            </select>
            <select name="" class="nvkuan">
              <option>女款</option>
              <option>男款</option>
            </select>
          </div>
          <div class="changdu"><select name="" class="neijin">
            <option>3号   内径16.65mm   周长52.28mm</option>
            <option>2</option>
            <option>3</option>
          </select></div>
          <div class="weight"><select name="" class="wk">
            <option>W18K</option>
            <option>2</option>
            <option>3</option>
          </select>
          <select name="" class="ke">
            <option>5.5       克</option>
            <option>2</option>
            <option>3</option>
          </select></div>
          <div class="price"><select name="" class="jiege">
            <option>200                             元 </option>
            <option>2</option>
            <option>3</option>
          </select>
          
          <b>+选择</b>
          </div>
          <dl>
			  <dd class="lzGem" style="display: none">
				  <div class="lianzi">
					<h3>链子</h3><a href="javascript:h('lzGem')"><font>X</font></a> 
					<div class="clear"></div>
					<b>2  条</b>
					<strong>肖邦链  W18k  16"×1.6mm</strong>          
				  </div>
			  </dd>
			  <dd class="kzsGem" style="display: none">
				  <div class="kzs">
					<h3><a href="">客主石</a></h3>
					<ul>
					  <li class="kzs_price">25000元</li>
					  <li class="kzs_gl"><input type='button' name="guanlian" value="+ 关联"></li>
					  <li class="kong">空</li>
					  <li class="cha"><a href="javascript:h('kzsGem')"><font>X</font></a></li>
					  <div class="clear"></div>
					</ul>
				  </div>
			  </dd>
			  <dd class="kpsGem" style="display: none">
				  <div class="kzs">
					<h3><a href="">客配石</a></h3>
					<ul>
					  <li class="kzs_price">2颗</li>
					  <li class="kzs_gl"><input type='button' name="guanlian" value="+ 关联"></li>
					  <li class="kps"><img src="images/zb_09.png" width="42" height="42" /></li>
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
          <div style=" width:100%; position:relative;">
				<!--库选石弹窗-->
				  <div class="kxbs" id='kxs' style=' display:none;'>
					<div class="kxbs-in">
					  <div class="kxbs-in-close"><a href="javascript:;" onclick="KxsShow_Hidden(kxs)">X</a></div>
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
						<dd><img src="images/ks_01.png"></dd>
						<dd><img src="images/ks_02.png"></dd>
						<dd><img src="images/ks_03.png"></dd>
						<div class="clear"></div>
					  </dl>
					  <input type="submit" name="button" value="OK" class="ok">
					</div>
				  </div>
				<!--库选石弹窗END-->
		  </div>
          <!--
          <div class="kezhushi"><h3>客主石</h3><b>25000元</b><strong>+关联</strong><u>空</u><font>x</font></div>
          <div class="kepeishi"><h3>客配石</h3><b>2颗</b><strong>+关联</strong><img src="images/zb_09.png" width="42" height="42" /><font>x</font></div>
          <div class="kuxuanshi"><h3>库选石</h3>
          	<b>22颗</b><strong>橄榄石</strong><img src="images/zhubao1_03.jpg" width="41" height="40" /><font>x</font></div>
            -->
          <div class="xuanze">
       		<ul>
           	  <li><a href="javascript:void(0);" class="kzsGem_btn">+客主石</a></li>
           	  <li><a href="javascript:void(0);" class="kpsGem_btn">+客配石</a></li>
           	  <li><a href="javascript:;" onclick="KxsShow_Hidden(kxs)" class="kxsGem_btn">+库选石</a></li>
           	  <li><a href="javascript:void(0);" class="lzGem_btn">+链子</a></li>
            </ul>
			<div class="clear"></div>
          </div>
        </div>
		<script language="javascript" type="text/javascript" src="js/add-input.js"></script>
		
        <div class="mainrig"><h2>其他信息</h2><select name="" class="kezi">
          <option>刻字</option>
          <option>2</option>
          <option>3</option>
      </select>
      <select name="" class="ziti">
        <option>字体</option>
        <option>2</option>
        <option>3</option>
      </select><br />
      <select name="" class="jianding1">
        <option>喷砂</option>
        <option>2</option>
        <option>3</option>
      </select>
      <select name="" class="jianding1">
        <option>成色打标</option>
        <option>2</option>
        <option>3</option>
      </select>
      <textarea name="" cols="" rows="" class="miaoshu1">表面工艺描述</textarea><br />
      <select name="" class="jianding1">
        <option>鉴定证书</option>
        <option>2</option>
        <option>3</option>
      </select>
      <div class="tu">
     <div class="tu1"> <b>+ 刻字矢量图</b><strong>Love & Love.cdr</strong><br /></div>
      <u>+ CAD文件</u><strong>无</strong>
      </div>
      <div class="qita">
      	<div class="clear"></div>
          	<b>其他 元</b><strong>13325+13150=<u>26800 </u>元</strong>
      </div>
      <div class="jisuan">
      	<dl>
        	<dd class="plus"><b>+</b></dd>
            <dd class="sum"><a href="">计算</a></dd>
            <div class="clear"></div>
        </dl>
      </div>
      <div class="baocun1">
        <input type="submit" name="button" value="保存">
      </div>
      </div>
        <div class="clear"></div>
    </div>
  
</div>
</body>
</html>