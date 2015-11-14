<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>库选宝石</title>
<link type='text/css' rel='stylesheet' href='${ctx }/resources/css/style.css' media='all' />
<link type='text/css' rel='stylesheet' href='${ctx }/resources/css/bootstrap.css' media='all' />
<script src="${ctx }/resources/js/top.js"></script>
		<!-- 弹框 -->
		<!-- jQuery & jQuery UI files (needed)--> 
		<link rel="stylesheet" href="/counter/resources/jquery.multiDialog/css/jquery-ui-1.10.3.custom.css">
		<script src="/counter/resources/jquery.multiDialog/js/jquery/jquery-1.9.1.js"></script> 
		<script src="/counter/resources/jquery.multiDialog/js/jquery/jquery-ui-1.10.3.custom.js"></script> 
		<!-- MultiDialog files (needed) --> 
		<link rel="stylesheet" href="/counter/resources/jquery.multiDialog/css/jquery.multiDialog.css"> 
		<script src="/counter/resources/jquery.multiDialog/js/jquery.ui.dialog.extended-1.0.2.js"></script> 
		<script src="/counter/resources/jquery.multiDialog/js/jquery.multiDialog.js"></script> 
		<script src="/counter/resources/js/bavlo-dialog.js"></script>
		
		<script type="text/javascript">
		$(function(){
			$(".gem-upload").bind("click",function(){
				openURL("${ctx}/upload/uppage.do","上传图片");
			});
		});
		</script>
</head>

<body>
<form>
	<input type="hidden" id="filemodel" value="test">
	<input type="hidden" id="filetype" value="pic">
	<input type="hidden" id="FILE_0"></input>
	<input type="hidden" id="FILE_1"></input>
	<input type="hidden" id="FILE_2"></input>
	<input type="hidden" id="FILE_3"></input>
	<input type="hidden" id="FILE_4"></input>
	<input type="hidden" id="FILE_5"></input>
	<input type="hidden" id="FILE_6"></input>
	<input type="hidden" id="FILE_7"></input>
	<input type="hidden" id="FILE_8"></input>
	<input type="hidden" id="FILE_9"></input>
	<input type="hidden" name="filevalue" id="filevalue" value="filevalue"></input>
<a class="gem-upload" href="javascript:;"><img src="${ctx}/resources/images/camera.png"></a>
<br>
<xmp>
1、引入JS和CSS文件
	<!-- 弹框 -->
	<!-- jQuery & jQuery UI files (needed)--> 
	<link rel="stylesheet" href="/counter/resources/jquery.multiDialog/css/jquery-ui-1.10.3.custom.css">
	<script src="/counter/resources/jquery.multiDialog/js/jquery/jquery-1.9.1.js"></script> 
	<script src="/counter/resources/jquery.multiDialog/js/jquery/jquery-ui-1.10.3.custom.js"></script> 
	<!-- MultiDialog files (needed) --> 
	<link rel="stylesheet" href="/counter/resources/jquery.multiDialog/css/jquery.multiDialog.css"> 
	<script src="/counter/resources/jquery.multiDialog/js/jquery.ui.dialog.extended-1.0.2.js"></script> 
	<script src="/counter/resources/jquery.multiDialog/js/jquery.multiDialog.js"></script> 
	<script src="/counter/resources/js/bavlo-dialog.js"></script>		
    
2、9个隐藏文本框（其中id必须为以下名称，用于接收上传成功返回的文件名称）
	name/id分别为FILE_0~FILE_9
	filevalue 隐藏域：用来在上传时临时存放上传完成后图片名称文本对应的id

3、2个隐藏文本框
	name/id="filetype";//上传文件类型，value值为pic代表上传图片，file代表上传普通文件
<br>
	name/id="filemodel";//自定义上传目录模块

4、调用上传图片方法（弹框）
	//上传图片
	$(".gem-upload").bind("click",function(){
		openURL("${ctx}/upload/uppage.do","上传图片");
	});
</xmp>
</form>
</body>
</html>
