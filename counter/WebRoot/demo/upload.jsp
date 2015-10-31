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
<!-- 上传图片 -->
	<link rel="stylesheet" type="text/css" href="${ctx }/resources/webuploader/css/webuploader.css" />
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/webuploader/css/upload.css" />    
    <script type="text/javascript" src="${ctx }/resources/js/jquery.js"></script>
    <script type="text/javascript" src="${ctx }/resources/webuploader/js/webuploader.js"></script>
    <script type="text/javascript" src="${ctx }/resources/webuploader/js/upload.js"></script> 
    <script type="text/javascript">
    
    </script>
</head>

<body>
<div id="upload">
  <div class="upload">
    <p>上传CAD</p>
    <p>限9张图片+1个CAD文件</p>
	
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
    <div class="upload-cad">
      <a href="javascript:;" class="file2"><input type="file" name="file" id="file"></a><font id="d9" style="display:block; margin-bottom:10px;">&nbsp;CAD : 张丹丹的款.jcd<a href="javascript:;"  onclick="shwoOrHidden8()">X</a></font>
	  <div class="clear"></div>
    </div>
    <div class="upload_btn"><input type='submit' name='button' value='Upload'></div>
  </div>
</div>
<br>
<span id="FILE_0"></span><br>
<span id="FILE_1"></span><br>
<span id="FILE_2"></span><br>
<span id="FILE_3"></span><br>
<span id="FILE_4"></span><br>
<span id="FILE_5"></span><br>
<span id="FILE_6"></span><br>
<span id="FILE_7"></span><br>
<span id="FILE_8"></span><br>
<span id="FILE_9"></span><br>
</body>
</html>
