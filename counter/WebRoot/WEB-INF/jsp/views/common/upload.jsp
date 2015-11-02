<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>上传文件</title>
<link type='text/css' rel='stylesheet' href='${ctx }/resources/css/style.css' media='all' />
<link type='text/css' rel='stylesheet' href='${ctx }/resources/css/bootstrap.css' media='all' />
<script src="${ctx }/resources/js/top.js"></script>
	<!-- 上传图片 -->
	<link rel="stylesheet" type="text/css" href="${ctx }/resources/webuploader/css/webuploader.css" />
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/webuploader/css/upload.css" />    
    <script type="text/javascript" src="${ctx }/resources/js/jquery.js"></script>
    <script type="text/javascript" src="${ctx }/resources/webuploader/js/webuploader.js"></script>
    <script type="text/javascript" src="${ctx }/resources/webuploader/js/upload.js"></script> 
</head>

<body>
<form>
<div id="upload">
  <div class="upload">
    <p>上传文件</p>
    <p>限9张图片</p>
	<div id="wrapper">
			        <div id="container">
			            <!--头部，相册选择和格式选择-->
			            <div id="uploader">
			                <div class="queueList">
			                    <div id="dndArea" class="placeholder">
			                        <div id="filePicker"></div>
			                        <p>或将照片拖到这里</p>
			                    </div>
			                </div>
			                <div class="statusBar" style="display:none;">
			                    <div class="progress">
			                        <span class="text">0%</span>
			                        <span class="percentage"></span>
			                    </div><div class="info"></div>
			                    <div class="btns">
			                        <div id="filePicker2"></div><div class="uploadBtn">开始上传</div>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
  </div>
</div>
</form>
</body>
</html>
