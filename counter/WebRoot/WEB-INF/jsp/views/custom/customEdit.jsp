<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>${pageCustomType}款式单
	<c:choose>
		 <c:when test="${empty customEdit['vcustomCode']}">   
		 ${number }
		 </c:when>
		 <c:otherwise>
		 ${customEdit['vcustomCode']}
		 </c:otherwise>	
	</c:choose>
</title>

<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<!--必要样式-->
<link rel='stylesheet' href='/counter/resources/css/style.css' media='all' />
<link rel='stylesheet' href='/counter/resources/css/bootstrap.css' media='all' />
<link rel="stylesheet" href="/counter/resources/css/photoswipe.css" />
<link rel="stylesheet" href="/counter/resources/css/default-skin.css" />

<script src="/counter/resources/js/jquery-1.8.3.min.js"></script>
<script src="/counter/resources/js/top.js"></script>
<script src="/counter/resources/js/photoswipe.min.js"></script>
<script src="/counter/resources/js/photoswipe-ui-default.min.js"></script>
<script src="/counter/resources/js/photoswipefromdom.js"></script>

<!-- 定义JS -->
<script src="/counter/resources/js/bavlo-initdata.js"></script>
<script src="/counter/resources/js/bavlo-event.js"></script>
<script src="/counter/resources/js/custom.js"></script>

<!-- 弹框 -->
<!-- jQuery & jQuery UI files (needed)--> 
<link rel="stylesheet" href="/counter/resources/jquery.multiDialog/css/jquery-ui-1.10.3.custom.css">
<script src="/counter/resources/jquery.multiDialog/js/jquery/jquery-ui-1.10.3.custom.js"></script> 
<!-- MultiDialog files (needed) --> 
<link rel="stylesheet" href="/counter/resources/jquery.multiDialog/css/jquery.multiDialog.css"> 
<script src="/counter/resources/jquery.multiDialog/js/jquery.ui.dialog.extended-1.0.2.js"></script> 
<script src="/counter/resources/jquery.multiDialog/js/jquery.multiDialog.js"></script> 
<script src="/counter/resources/js/bavlo-dialog.js"></script>
<script src="/counter/resources/showLoading/showLoading.js"></script>
<link type="text/css" rel="stylesheet" href="/counter/resources/showLoading/showLoading.css">
</head>

<body>
	<form id="custom">
	<input type="hidden" id="pageAttr" value="STYLE"/>
	<input type="hidden" id='customId' class="tableId" name='id' value="${customEdit['id'] }" />
	<input type="hidden" id='orderId' name='orderId' value="${customEdit['orderId'] }" />
	<input type="hidden" id='customerId' class="tocustomerId" name='customerId' value="${customEdit['customerId'] }" />
	<input type="hidden" id='vengraveVh' name='vengraveVh' value="${customEdit['vengraveVh'] }" />
	<input type="hidden" id='vcadFile' name='vcadFile' value="${customEdit['vcadFile'] }" />
	
	<input type="hidden" id='srcstyleType' value="${customEdit['srcstyleType']}" />
	<input type="hidden" id='srcmetal' value="${customEdit['srcmetal']}" />
	<input type="hidden" id='srcringSize' value="${customEdit['srcringSize']}" />
	<input type="hidden" id='nmainGemCost' value="${customEdit['nmainGemCost']}" />
	<input type="hidden" id='vmainGemName' value="${customEdit['vmainGemName']}" />
	<input type="hidden" id='vmainGemPic' value="${customEdit['vmainGemPic']}" />
	<input type="hidden" id='ipartsGemNum' value="${customEdit['ipartsGemNum']}" />
	<input type="hidden" id='vpartsGemName' value="${customEdit['vpartsGemName']}" />
	<input type="hidden" id='vpartsGemPic' value="${customEdit['vpartsGemPic']}" />
	<input type="hidden" id='vrequirement' value="${customEdit['vrequirement']}" />
	<input type="hidden" id='vrequirementB' value="${customEdit['vrequirementB']}" />
	
	<input type="hidden" id='chainJson' value='${chainJson}' />
	<input type="hidden" id='stockGemJson' value='${stockGemJson}' />
	
	<input type="hidden" id='agentJson' value='${agentJson}' />
	<header class="demo-bar">
		<h1>
			<c:choose>
				 <c:when test="${empty customEdit['vcustomCode']}">   
				 <input type="hidden" id="vcustomCode" name="vcustomCode" value="${number }">
				 </c:when>
				 <c:otherwise>
				 <input type="hidden" id="vcustomCode" name="vcustomCode" value="${customEdit['vcustomCode']}">
				 </c:otherwise>	
			</c:choose>
		</h1> 
	</header>
	<jsp:include page="../header.jsp"></jsp:include>
	<%-- <div class="header" style="display:none;">
		<div class="head1">
			<div class="top">
				<b><a href="javascript:;" onclick="EditShow_Hidden(ed1)"><img
							src="/counter/resources/images/plus.png" />
				</a> ${pageCustomType}款式单
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
							src="/counter/resources/images/plus.png" />
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
	</div> --%>

	<div class="all">
		<div class="main">
			<div class="mainleft">
				<div class="cankao">
					<h2><a href="javascript:;" style="color:#fff" class="cankaotu">+ 参考图</a></h2>
					<div class="pro">
						<b><a href="javascript:;" onclick="PicShow_Hidden(pic)">显示</a></b>
						<div class="demo" id='pic'>
							<b><a href="javascript:;" onclick="PicShow_Hidden(pic)">隐藏</a></b>
							<div class="my-gallery">
								<a class="customCankaoShow" href="javascript:void();">
									<c:choose>
										<c:when test="${empty customEdit['FILE_0']}">   
											<img src="">
										</c:when>
										<c:otherwise>
											<img style="width: 98%;height: 330px" src="/counter/staticRes/${customEdit['FILE_0']}">
										</c:otherwise>
									</c:choose> 
								</a>
							<div class="cankao_pic_list">
							<ul>
							</ul>
							</div>
							</div>
						</div>
					</div>
				</div>
				<div class="sheji">
					<h2><a href="javascript:;" style="color:#fff" class="qibantu CUST-RL CAD-RL CC-RL PMC-RL GB-RL PPS-RL">+ 起版设计图</a></h2>
					<h2><a href="javascript:;" style="color:#fff" class="qibantu PM-RL">+ 起版设计图</a></h2>
					<div class="pro">
						<b><a href="javascript:;" onclick="Pic1Show_Hidden(pic1)">显示</a></b>
						<div class="demo" id='pic1'>
							<b><a href="javascript:;" onclick="Pic1Show_Hidden(pic1)">隐藏</a></b>
							<div class="my-gallery">
								<a class="customShejiShow" href="javascript:void();">
									<c:choose>
										<c:when test="${empty customEdit['FILE_1']}">
											<img src="">   
										</c:when>
										<c:otherwise>
											<img style="width: 98%;height: 330px" src="/counter/staticRes/${customEdit['FILE_1']}">
										</c:otherwise>
									</c:choose> 
								</a>
								<div class="qiban_pic_list">
									<ul>
									</ul>
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
						onfocus="if(value =='需求描述'){value =''}" onblur="if(value ==''){value='需求描述'}" 
						class="miaoshu1">需求描述</textarea>
				</div>
			</div>
			<div class="mainmid">
				<h2>BOM</h2>
				<div class="bom">
					<select id="styleType" name="srcstyleType" class="jiezhi">
						<option>选择款式</option>
					</select>
					<select name="vsex" class="nvkuan">
						<option value="女款" <c:if test="${customEdit['vsex']=='女款'}">selected</c:if>>女款</option>
						<option value="男款" <c:if test="${customEdit['vsex']=='男款'}">selected</c:if>>男款</option>
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
								客主石
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
									<input type="hidden" 
									id='mainGemId' name="mainGemId" class="main_gem_id"
									value="${customEdit['mainGemId']}" />
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
								客配石
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
									<input type="hidden" 
									id='partsGemId' name="partsGemId" class="parts_gem_id"
									value="${customEdit['partsGemId']}" />
								</li>
								<li class="kzs_gl">
									<input type='button' name="guanlian" class="kps_guanlian"
									value="+ 关联" /></a></li>
								<li class="kps_img"></li>
								<%-- <li class="kps"><img src="/counter/resources/images/zb_09.png" width="42"
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
				<input type="text" class="custom_engrave" name="vcraftTag" value="${customEdit['vcraftTag'] }" id="vcraftTag" />
				<select class="gongyi1">
					<option value="">表面工艺</option>
					<option value="喷砂">喷砂</option>
					<option value="拉丝">拉丝</option>
					<option value="珐琅">珐琅</option>
				</select>
				<textarea id="requirementB" name="vrequirementB" cols="" rows="" 
				onfocus="if(value =='表面工艺描述'){value =''}" onblur="if(value ==''){value='表面工艺描述'}" 
				class="miaoshu1">表面工艺描述</textarea>
				<br />
				<select id="certificate" name="icertificate" class="jianding1">
					<option value="0" <c:if test="${customEdit['icertificate']=='0'}">selected</c:if>>鉴定证书 -无</option>
					<option value="30" <c:if test="${customEdit['icertificate']=='30'}">selected</c:if>>鉴定证书 -有</option>
				</select>
				</div>
				<div class="tu">
					<div class="dzd_right_btm2 CUST-RL CAD-RL CC-RL PMC-RL GB-RL PPS-RL">
						<a href="javascript:;" class="vectorgraph">+ 刻字矢量图</a>
						<a href="javascript:;" class="cad_file"> + CAD文件   </a>
					</div>
				</div>
				<div class="tu2 CUST-RL CAD-RL CC-RL PMC-RL GB-RL PPS-RL">
						<a href="javascript:;" class="vectorgraphName"></a>
						<a href="javascript:;" class="cad_fileName"></a>
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
	<input type="hidden" name="vtype" id="vtype" value=""></input>
	</form>
</body>
</html>
