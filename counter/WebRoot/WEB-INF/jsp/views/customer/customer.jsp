<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>编辑实物签收单</title>
<link type='text/css' rel='stylesheet' href='css/style.css' media='all' />
<link type='text/css' rel='stylesheet' href='css/bootstrap.css' media='all' />
<script src="js/top.js"></script>
</head>

<body>
<form action="customer/customer.do" method="post">
<div class="header">
	<div class="head2">
		<div class="top2">
			<b><a href="javascript:;" onclick="EditShow_Hidden(ed1)"><img src="images/plus.png" /></a> 编辑客户 81812560 </b>
			<font><a href="javascript:;" onclick="Show_Hidden(tr1)"><img src="images/plus.png" /></a></font>
		</div>
		<div class="hidden_enent2" id="tr1" style="display:none;">
			<ul>
				<li class="jian"><a href="javascript:;" onclick="Show_Hidden(tr1)"> ▬ </a></li>
				<li><a href="">定制单</a></li>
				<li><a href="">宝石签收单</a></li>
				<li><a href="">订单</a></li>
				<li><a href="">客户</a></li>
			</ul>
		</div>
		<div class="edit_hidden2" id="ed1" style="display:none;">
			<ul>
				<li class="jian2"><a href="javascript:;" onclick="EditShow_Hidden(ed1)"> ▬ </a></li>
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
        <li><a href=""><img src="images/customer_01.png" /></a></li>
        <li><a href=""><img src="images/customer_02.png" /></a></li>
        <li class="focus">最后关注<br/>2015-09-22</li>
      </ul>
      <div class="edit_btn">
        <div class="edit_1">
          <input type='text' name='' value='张丹丹' class="edit_2 edit_1_name" />
          <select name="select" class="edit_2 edit_1_area_son">
            <option>女</option>
            <option>男</option>
          </select>
          <div class="clear"></div>
        </div>
        <div class="edit_1">
          <input type='text' name='' value='13810539698' class="edit_2 edit_1_name" />
          <input type='text' name='' value='mtvdb@sina.com' class="edit_2 edit_1_sex" />
          <div class="clear"></div>
        </div>
        <div class="edit_1">
          <input type='text' name='' value='丹妞儿' class="edit_2 edit_1_name" />
          <select name="select" class="edit_2 edit_1_area_son">
            <option>中国</option>
          </select>
          <div class="clear"></div>
        </div>
        <div class="edit_1">
          <select name="select" class="edit_2 edit_1_area">
            <option>北京</option>
            <option>天津</option>
          </select>
          <select name="select" class="edit_2 edit_1_area_son">
            <option>海淀</option>
          </select>
          <div class="clear"></div>
        </div>
        <div class="edit_1">
          <select name="select" class="edit_2 edit_1_area">
            <option>zh_CN</option>
          </select>
          <select name="select" class="edit_2 edit_1_area_son">
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