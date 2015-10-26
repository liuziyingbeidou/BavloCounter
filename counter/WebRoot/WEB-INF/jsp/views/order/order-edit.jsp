<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>编辑定单</title>
<script language="javascript" type="text/javascript" src="${ctx}/resources/js/jquery-1.8.3.min.js"></script>
<link type='text/css' rel='stylesheet' href='${ctx}/resources/css/style.css' media='all' />
<link type='text/css' rel='stylesheet' href='${ctx}/resources/css/bootstrap.css' media='all' />
<script src="${ctx}/resources/js/top.js"></script>
<script src="${ctx}/resources/js/hide.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/jquery.min.js"></script>
<link href="${ctx}/resources/css/orderlist.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/resources/js/showList.js" type="text/javascript"></script>

</head>

<body>

<div class="header">
	<div class="head1">
		<div class="top">
			<b><a href="javascript:;" onclick="EditShow_Hidden(ed1)"><img src="${ctx}/resources/images/plus.png"></a> 编辑定单81812560</b>
			<font><a href="javascript:;" onclick="Show_Hidden(tr1)"><img src="${ctx}/resources/images/plus.png"></a></font>
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
      <div class="customer">
        <ul>
          <li><a href=""><img src="${ctx}/resources/images/customer_01.png"></a></li>
		  <!--<li class="file"><a href="javascript:;"><input type="file" name="file" id="file"></a></li>-->
		  <li class="file"><a href="javascript:;" onclick="Pic2Show_Hidden(pic2)"><img src="${ctx}/resources/images/customer_02.png"></a></li>
          <div class="clear"></div>
        </ul>
      </div>
	  
	  <!--订单列表弹窗-->
	  <div class="orderlist" id='pic2' style=' display:none;'>
		<div class="order-main">
			<div class="order-list">订单列表 <a href="javascript:;" onclick="Pic2Show_Hidden(pic2)">X</a></div>
			<div class="search-1">
				<form action='' method='post'>
					<input type='text' name='search' class="search" value='搜索'>
				</form>
			</div>
			<div class="">
				<div class="main1 content">
					<div class="left-sider">
					  <div class="operate">
						<ul id="juheweb">
						  <li >
							<h4 ><img src="${ctx}/resources/images/customer_01.png"><b>张丹丹</b><a href="">68664646</a><span><a href="">选择</a></span></h4>
							<div class="list-item none">
							  <dl>
								<dd><img src="${ctx}/resources/images/good_01.png"></dd>
								<dd><img src="${ctx}/resources/images/good_02.png"></dd>
								<dd><img src="${ctx}/resources/images/good_03.png"></dd>
							  </dl>
							  <div class="clear"></div>
							  <dt>报价：<b>36700元</b> 已付：<b>10000元</b> 未付：<b>26700元</b> 实收：— </dt>
							</div>
							<div class="clear"></div>
						  </li>
						  <li >
							<h4 ><img src="${ctx}/resources/images/customer_01.png"><b>张丹丹</b><a href="">68664646</a><span><a href="">选择</a></span></h4>
							<div class="list-item none">
							  <dl>
								<dd><img src="${ctx}/resources/images/good_01.png"></dd>
								<dd><img src="${ctx}/resources/images/good_02.png"></dd>
								<dd><img src="${ctx}/resources/images/good_03.png"></dd>
							  </dl>
							  <div class="clear"></div>
							  <dt>报价：<b>36700元</b> 已付：<b>10000元</b> 未付：<b>26700元</b> 实收：— </dt>
							</div>
							<div class="clear"></div>
						  </li>
						  <li >
							<h4 ><img src="${ctx}/resources/images/customer_01.png"><b>张丹丹</b><a href="">68664646</a><span><a href="">选择</a></span></h4>
							<div class="list-item none">
							  <dl>
								<dd><img src="${ctx}/resources/images/good_01.png"></dd>
								<dd><img src="${ctx}/resources/images/good_02.png"></dd>
								<dd><img src="${ctx}/resources/images/good_03.png"></dd>
							  </dl>
							  <div class="clear"></div>
							  <dt>报价：<b>36700元</b> 已付：<b>10000元</b> 未付：<b>26700元</b> 实收：— </dt>
							</div>
							<div class="clear"></div>
						  </li>
						  <li >
							<h4 ><img src="${ctx}/resources/images/customer_01.png"><b>张丹丹</b><a href="">68664646</a><span><a href="">选择</a></span></h4>
							<div class="list-item none">
							  <dl>
								<dd><img src="${ctx}/resources/images/good_01.png"></dd>
								<dd><img src="${ctx}/resources/images/good_02.png"></dd>
								<dd><img src="${ctx}/resources/images/good_03.png"></dd>
							  </dl>
							  <div class="clear"></div>
							  <dt>报价：<b>36700元</b> 已付：<b>10000元</b> 未付：<b>26700元</b> 实收：— </dt>
							</div>
							<div class="clear"></div>
						  </li>
						  <li >
							<h4 ><img src="${ctx}/resources/images/customer_01.png"><b>张丹丹</b><a href="">68664646</a><span><a href="">选择</a></span></h4>
							<div class="list-item none">
							  <dl>
								<dd><img src="${ctx}/resources/images/good_01.png"></dd>
								<dd><img src="${ctx}/resources/images/good_02.png"></dd>
								<dd><img src="${ctx}/resources/images/good_03.png"></dd>
							  </dl>
							  <div class="clear"></div>
							  <dt>报价：<b>36700元</b> 已付：<b>10000元</b> 未付：<b>26700元</b> 实收：— </dt>
							</div>
							<div class="clear"></div>
						  </li>
						  <li >
							<h4 ><img src="${ctx}/resources/images/customer_01.png"><b>张丹丹</b><a href="">68664646</a><span><a href="">选择</a></span></h4>
							<div class="list-item none">
							  <dl>
								<dd><img src="${ctx}/resources/images/good_01.png"></dd>
								<dd><img src="${ctx}/resources/images/good_02.png"></dd>
								<dd><img src="${ctx}/resources/images/good_03.png"></dd>
							  </dl>
							  <div class="clear"></div>
							  <dt>报价：<b>36700元</b> 已付：<b>10000元</b> 未付：<b>26700元</b> 实收：— </dt>
							</div>
							<div class="clear"></div>
						  </li>
						  <li >
							<h4 ><img src="${ctx}/resources/images/customer_01.png"><b>张丹丹</b><a href="">68664646</a><span><a href="">选择</a></span></h4>
							<div class="list-item none">
							  <dl>
								<dd><img src="${ctx}/resources/images/good_01.png"></dd>
								<dd><img src="${ctx}/resources/images/good_02.png"></dd>
								<dd><img src="${ctx}/resources/images/good_03.png"></dd>
							  </dl>
							  <div class="clear"></div>
							  <dt>报价：<b>36700元</b> 已付：<b>10000元</b> 未付：<b>26700元</b> 实收：— </dt>
							</div>
							<div class="clear"></div>
						  </li>
						  <li >
							<h4 ><img src="${ctx}/resources/images/customer_01.png"><b>张丹丹</b><a href="">68664646</a><span><a href="">选择</a></span></h4>
							<div class="list-item none">
							  <dl>
								<dd><img src="${ctx}/resources/images/good_01.png"></dd>
								<dd><img src="${ctx}/resources/images/good_02.png"></dd>
								<dd><img src="${ctx}/resources/images/good_03.png"></dd>
							  </dl>
							  <div class="clear"></div>
							  <dt>报价：<b>36700元</b> 已付：<b>10000元</b> 未付：<b>26700元</b> 实收：— </dt>
							</div>
							<div class="clear"></div>
						  </li>
						  <li >
							<h4 ><img src="${ctx}/resources/images/customer_01.png"><b>张丹丹</b><a href="">68664646</a><span><a href="">选择</a></span></h4>
							<div class="list-item none">
							  <dl>
								<dd><img src="${ctx}/resources/images/good_01.png"></dd>
								<dd><img src="${ctx}/resources/images/good_02.png"></dd>
								<dd><img src="${ctx}/resources/images/good_03.png"></dd>
							  </dl>
							  <div class="clear"></div>
							  <dt>报价：<b>36700元</b> 已付：<b>10000元</b> 未付：<b>26700元</b> 实收：— </dt>
							</div>
							<div class="clear"></div>
						  </li>
						  <li >
							<h4 ><img src="${ctx}/resources/images/customer_01.png"><b>张丹丹</b><a href="">68664646</a><span><a href="">选择</a></span></h4>
							<div class="list-item none">
							  <dl>
								<dd><img src="${ctx}/resources/images/good_01.png"></dd>
								<dd><img src="${ctx}/resources/images/good_02.png"></dd>
								<dd><img src="${ctx}/resources/images/good_03.png"></dd>
							  </dl>
							  <div class="clear"></div>
							  <dt>报价：<b>36700元</b> 已付：<b>10000元</b> 未付：<b>26700元</b> 实收：— </dt>
							</div>
							<div class="clear"></div>
						  </li>
						  <li >
							<h4 ><img src="${ctx}/resources/images/customer_01.png"><b>张丹丹</b><a href="">68664646</a><span><a href="">选择</a></span></h4>
							<div class="list-item none">
							  <dl>
								<dd><img src="${ctx}/resources/images/good_01.png"></dd>
								<dd><img src="${ctx}/resources/images/good_02.png"></dd>
								<dd><img src="${ctx}/resources/images/good_03.png"></dd>
							  </dl>
							  <div class="clear"></div>
							  <dt>报价：<b>36700元</b> 已付：<b>10000元</b> 未付：<b>26700元</b> 实收：— </dt>
							</div>
							<div class="clear"></div>
						  </li>
						</ul>
						<script type="text/javascript" language="javascript">
							navList(12);
						</script>
					  </div>
					</div>
				  </div>
			</div>
		</div>
	  </div>
	  <!--订单列表弹窗END-->
	  
      <div class="gylc">
		<dl class="barbox">
			<dd class="barline">
				<div w="50" style="width: 50%;" class="charts"></div>
			</dd>
		</dl>
		<!--<dt><i class="status" style=" width:182px; position:absolute; top:180px; left:105px;"></i></dt>-->
        <ul>
          <li>提交</li>
          <li>模具</li>
          <li>工艺</li>
          <li>质检</li>
          <li>快递</li>
          <li>交付</li>
          <div class="clear"></div>
        </ul>
      </div>
      <div class="list">
        <h3>清单</h3>
        <dl>
          <dd class="mainGem" style="display: none"><img src="${ctx}/resources/images/good_01.png"><input type='text' value="1对"><b>6590元</b><a href="javascript:h('mainGem')" class="close_c"><img src="${ctx}/resources/images/close.png"></a></dd>
          <dd class="partsGem" style="display: none;"><img src="${ctx}/resources/images/good_02.png"><input type='text' value="1条"><b>1590元</b><a href="javascript:h('partsGem')" class="close_c"><img src="${ctx}/resources/images/close.png"></a></dd>
          <dd class="zuanshiGem" style="display: none;"><img src="${ctx}/resources/images/good_03.png"><input type='text' value="1颗"><b>12590元</b><a href="javascript:h('zuanshiGem')" class="close_c"><img src="${ctx}/resources/images/close.png"></a></dd>
          <div class="clear"></div>
        </dl>
      </div>
      <div class="list1">
        <dl>
          <dd><a href="javascript:void(0);" class="mainGem_btn">+款式</a></dd>
          <dd><a href="javascript:void(0);" class="partsGem_btn">+链子</a></dd>
          <dd><a href="javascript:void(0);" class="zuanshiGem_btn">+钻石</a></dd>
		  <div class="clear"></div>
        </dl>
      </div>
	<script language="javascript" type="text/javascript" src="${ctx}/resources/js/add-input.js"></script>
	
      <div class="miaoshu2"><textarea name="" cols="" rows="" class="miaoshu"value="订单说明" onfocus="if(this.value=='订单说明'){this.value='';}"  onblur="if(this.value==''){this.value='订单说明';}"></textarea></div>
    </div>
        <div class="mainmid">
          <h2>交付地址</h2>
		  <script>
			 var i=0

			 function insert_row(){
			  i ++
			  R = tbl.insertRow()
			  C = R.insertCell()
			  C.innerHTML = "<input>"
			  C = R.insertCell()
			  C.innerHTML = "<a onclick='deleteRow(this)' class='address-close'>X</a>"
			 }
			 function deleteRow(obj){
			  alert('确定要删除吗');
			  tbl.deleteRow(obj.parentElement.parentElement.rowIndex);
			 }
		  </script>
          <div class="address">
            <table name='tbl' id="tbl"  class="add-address"> </table> 
            <!--<p class="new_adr">丁力 清华路17号院29号楼B座1103室...<a href="">X</a></p>-->
            <input type="button" value="+新建地址" onclick="insert_row()" />
          </div>
          <div class="add_dizhi">
            <div class="save1"><input type='text' name='username' class="add name" value='丁力'></div>
            <p>
              <select name="select" class="add area1">
                <option>北京市</option>
              </select>
              <select name="select2" class="add area2">
                <option>海淀区</option>
              </select>
            </p>
            <div class="save1"><input type='text' name='address' class="add dizhi" value='清华路17号院29号楼B座1103室'></div>
            <p><input type='text' name='tel' class="add tel" value="13810539493"><input type='text' class="add email" name='email' value="mtvdb@sina.com"></p>
            <div class="save1"><input type="submit" name="Submit" class="save" value="Save" /></div>
          </div>
          <div class="fapiao">
            <h3>发票</h3>
            <p>
              <select name="select" class="fp fp1">
                <option>不开发票</option>
              </select>
              <select name="select2" class="fp fp2">
                <option>珠宝首饰</option>
              </select>
            </p>
            <input type='text' name='' value='发票抬头'>
          </div>
        </div>
        <div class="mainrig">
          <h2>支付与交付</h2>
          <select name="" class="jianding">
            <option>预算 20000-30000元</option>
            <option>2</option>
            <option>3</option>
          </select>
          <p><input type='text' name='' class="zf bj" value="报价36700元"><input type='text' class="zf yf" value="已付10000"></p>
          <p><input type='text' name='' class="zf bj" value="未付6700元"><input type='text' class="zf yf" value="已付10000"></p>
          <select name="" class="jianding">
            <option>交付时间</option>
            <option>2</option>
            <option>3</option>
          </select>
          <select name="" class="jianding">
            <option>交付方式 来店自取</option>
            <option>2</option>
            <option>3</option>
          </select>
          <div class="baocun">
            <input type="submit" name="button" value="保存">
          </div>
      </div>
        <div class="clear"></div>
    </div>
  
</div>

</body>
</html>
