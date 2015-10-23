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

		<title>编辑配石单</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
		<link rel="stylesheet" type="text/css" href="styles.css">
		-->
		<link type='text/css' rel='stylesheet'
			href='${pageContext.request.contextPath}/resources/css/style.css'
			media='all' />
		<link type='text/css' rel='stylesheet'
			href='${pageContext.request.contextPath}/resources/css/bootstrap.css'
			media='all' />
		<script src="${pageContext.request.contextPath}/resources/js/top.js"></script>
	</head>

	<body>
		<form id="useGem" action="edit.do">
			<div class="header">
				<div class="top1">
					<b><a href="javascript:;" onclick="EditShow_Hidden(ed1)"><img
								src="${pageContext.request.contextPath}/resources/images/plus.png">
					</a> 配石单 81812560 </b>
					<font><a href="javascript:;" onclick="Show_Hidden(tr1)"><img
								src="${pageContext.request.contextPath}/resources/images/plus.png">
					</a> </font>
				</div>
				<div class="hidden_enent" id="tr1" style="display: none;">
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
				<div class="edit_hidden" id="ed1" style="display: none;">
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
			<div class="qsd">
				<div class="qsd_main">
					<div class="qsd_left">
						<div class="peishi">
							<!--<img src="${pageContext.request.contextPath}/resources/images/zb_09.png">
						<ul>
							<li>
								名称：钻石
							</li>
							<li>
								形状：垫形
							</li>
							<li>
								重量：3.35
							</li>
							<li>
								颜色：H
							</li>
							<li>
								净度：IF
							</li>
							<li>
								规格：6.51x6.48x4.69
							</li>
							<li>
								参考价：70元/ct
							</li>
							<li>
								数量：1
							</li>
							<div class="clear"></div>
						</ul>
						-->
							<dt>
								定制单号：
								<a href="">123123</a>
							</dt>
						</div>
					</div>
					<div class="qsd_right">
						<div class="qsd_right_1">
							<select name="select" class="qsdr r1">
								<option>
									坦桑石
								</option>
							</select>
							<dt>
								<input type='text' name='vtype' class="qsdr r2" value="元" onfocus="if(value =='元'){value =''}" onblur="if(value ==''){value='元'}">
							</dt>
							<div class="clear"></div>
						</div>
						<div class="qsd_right_1">
							<select name="select" class="qsdr r1">
								<option>
									垫形
								</option>
							</select>
							<dt>
								<input type='text' name='' class="qsdr r2" value="克拉" onfocus="if(value =='克拉'){value =''}" onblur="if(value ==''){value='克拉'}">
							</dt>
							<div class="clear"></div>
						</div>
						<div class="qsdtt">
							<select name="select" class="qsdt">
								<option>
									6.51 x 6.48 x 4.22
								</option>
							</select>
						</div>
						<div class="clear"></div>
						<div class="qsdtt">
							<input type='text' name='' value='1颗' class="qsdn t3">
						</div>
						<div class="qssm-l">
							<textarea name="" cols="" rows="" class="qssm" value="说明"
								onfocus="if(value =='说明'){value =''}"
								onblur="if(value ==''){value='说明'}"></textarea>
						</div>
						<div class="qs_save">
							<input type="submit" name="button" value="保存">
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</form>
	</body>
</html>
