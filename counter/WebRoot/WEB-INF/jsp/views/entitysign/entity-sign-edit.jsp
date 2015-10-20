<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>新增宝石签收单</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		
		<link type='text/css' rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/style.css' media='all' />
		<link type='text/css' rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/bootstrap.css' media='all' />
		<script src="${pageContext.request.contextPath}/resources/js/top.js"></script>
	</head>
	<body>
	<form id="entity" action="saveEntySign.do" method="post">
		<div class="header">
			<div class="head">
				<div class="top1">
					<b><a href="javascript:;" onclick="EditShow_Hidden(ed1)"><img
								src="${pageContext.request.contextPath}/resources/images/plus.png">
					</a> 编辑宝石签收单81812560 </b>
					<font><a href="javascript:;" onclick="Show_Hidden(tr1)"><img
								src="${pageContext.request.contextPath}/resources/images/plus.png">
					</a>
					</font>
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
				<div class="clear"></div>
			</div>
		</div>

		<div class="qsd">
			<div class="qsd_main">
				<div class="qsd_left">
					<ul>
						<li>
							<a href=""><img src="${pageContext.request.contextPath}/resources/images/customer_01.png">
							</a>
						</li>
						<li>
							<div class="file3">
								<a href="javascript:;"><input type="file" name="file"
										id="file">
								</a>
							</div>
						</li>
						<li class="camera">
							<a href=""><img src="${pageContext.request.contextPath}/resources/images/camera.png">
							</a>
						</li>
						<div class="clear"></div>
					</ul>
					<div class="clear"></div>
					<dt>
						<img src="${pageContext.request.contextPath}/resources/images/pic_02.png">
					</dt>
				</div>
				<div class="qsd_right">
					<div class="qsd_right_1">
						<select name="select" class="qsdr r1">
							<option>
								坦桑石
							</option>
						</select>
						<dt>
							<input type='text' name='vtype' class="qsdr r2" value='25000元'>
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
							<input type='text' name='' class="qsdr r2" value='3035ct'>
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
						<textarea name="" cols="" rows="" class="qssm" value="签收说明"
							onfocus="if(this.value=='签收说明'){this.value='';}"
							onblur="if(this.value==''){this.value='签收说明';}"></textarea>
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
