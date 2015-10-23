<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>编辑实物签收单</title>
<link type='text/css' rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/style.css' media='all' />
<link type='text/css' rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/bootstrap.css' media='all' />
<script src="${pageContext.request.contextPath}/resources/js/top.js"></script>
</head>

<body>
<form id="customer" action="saveOrUpdate.do" method="post">
<div class="header">
	<div class="head2">
		<div class="top2">
			<b><a href="javascript:;" onclick="EditShow_Hidden(ed1)"><img src="${pageContext.request.contextPath}/resources/images/plus.png" /></a> 编辑客户 81812560 </b>
			<font><a href="javascript:;" onclick="Show_Hidden(tr1)"><img src="${pageContext.request.contextPath}/resources/images/plus.png" /></a></font>
		</div>
		<div class="hidden_enent2" id="tr1" style="display:none;">
			<ul>
				<li class="jian"><a href="javascript:;" onclick="Show_Hidden(tr1)">__</a></li>
				<li><a href="">定制单</a></li>
				<li><a href="">宝石签收单</a></li>
				<li><a href="">订单</a></li>
				<li><a href="">客户</a></li>
			</ul>
		</div>
		<div class="edit_hidden2" id="ed1" style="display:none;">
			<ul>
				<li class="jian2"><a href="javascript:;" onclick="EditShow_Hidden(ed1)">__</a></li>
				<li><a href="">Open</a></li>
				<li><a href="">Save</a></li>
				<li><a href="">Save as</a></li>
				<li><a href="">Print</a></li>			
			</ul>
		</div>
		<div class="clear"></div>
	</div>
</div>
<div class="edit_main">
    <div class="edit_left">
      <ul>
        <li><a href=""><img src="${pageContext.request.contextPath}/resources/images/customer_01.png" /></a></li>
        <li><a href="../customer/getList.do"><img src="${pageContext.request.contextPath}/resources/images/customer_02.png" /></a></li>
        <li class="focus">最后关注<br/>2015-09-22</li>
        <div class="clear"></div>
      </ul>
      <div class="edit_btn">
        <div class="edit_1">
          <input type='text' name='vname' value="姓名" onfocus="if(value =='姓名'){value =''}" onblur="if(value ==''){value='姓名'}" class="edit_2 edit_1_name" />
          <select name="vsex" class="edit_2 edit_1_area_son">
            <option>女</option>
            <option>男</option>
          </select>
          <div class="clear"></div>
        </div>
        <div class="edit_1">
          <input type='text' name='vphoneCode' value="手机" onfocus="if(value =='手机'){value =''}" onblur="if(value ==''){value='手机'}" class="edit_2 edit_1_name" />
          <input type='text' name='vemail' value="邮箱" onfocus="if(value =='邮箱'){value =''}" onblur="if(value ==''){value='邮箱'}" class="edit_2 edit_1_sex" />
          <div class="clear"></div>
        </div>
        <div class="edit_1">
          <input type='text' name='vnickname' value="昵称" onfocus="if(value =='昵称'){value =''}" onblur="if(value ==''){value='昵称'}" class="edit_2 edit_1_name" />
          <select name="vcountry" class="edit_2 edit_1_area_son">
            <option>中国</option>
          </select>
          <div class="clear"></div>
        </div>
        <div class="edit_1">
          <select name="vprovince" class="edit_2 edit_1_area">
            <option>北京</option>
            <option>天津</option>
          </select>
          <select name="vdistrict" class="edit_2 edit_1_area_son">
            <option>海淀</option>
          </select>
          <div class="clear"></div>
        </div>
        <div class="edit_1">
          <select name="select" class="edit_2 edit_1_area">
            <option>zh_CN</option>
            <option>en_US</option>
          </select>
          <select name="vgroup" class="edit_2 edit_1_area_son">
            <option>无分组</option>
          </select>
          <div class="clear"></div>
        </div>
        <div class="edit_save">
          <input type='submit' name='' value='保存' class="" />
        </div>
      </div>
    </div>
</div>
</form>
</body>
</html>