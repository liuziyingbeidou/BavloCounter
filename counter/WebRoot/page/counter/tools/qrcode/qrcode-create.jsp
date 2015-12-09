<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>新增客服二维码</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
  	<link rel="stylesheet" href="${ctx }/page/counter/assets/css/amazeui.min.css"/>
  	<link rel="stylesheet" href="${ctx }/page/counter/assets/css/admin.css">
  	<script type="text/javascript" src="${ctx }/resources/js/jquery-1.8.3.min.js"></script>
  	<script type="text/javascript" src="${ctx }/page/counter/assets/js/amazeui.min.js"></script>
  	<script type="text/javascript" src="${ctx }/resources/js/bavlo-dialog.js"></script>
  	
  	<script type="text/javascript">
  	$(function(){
  		
  		$("#btn-submit").click(function(){
  			create();
  		});
  		
  		if("${qrcodevo['vqrcodeUrl'] }" != null && "${qrcodevo['vqrcodeUrl'] }" != ""){
  			$(".am-radius").prop("src","${ctx}/resources/qrcode/${qrcodevo['vqrcodeUrl'] }");
  		}
  		
  	});
  	
  	//创建二维码
	function create(){
	
		// 处理异步验证结果
		$.when($('#qrcodeFrmId').validator('isFormValid')).then(function(jqXHR) {
			if(jqXHR){
				$.ajax({
				     type : "POST",
				     url : "${ctx}/tools/createQrcode.do",
				     data:$('#qrcodeFrmId').serialize(),// formid
				     async:false,
				     cache:false,
				     success : function(data) {
				     	if(data != null && data != ""){
					     	if(data.vqrcodeUrl != null && data.vqrcodeUrl != ""){
					     		$(".am-radius").prop("src","");
					     		$(".am-radius").prop("src","${ctx}/resources/qrcode/"+data.vqrcodeUrl);
					     		alert("创建成功!");
					     		window.parent.reloadGrid();
					     	}else{
					     		alert("创建失败!");
					     	}
				     	}
				     },
				     error : function(e) {
				     	alert("创建失败!");
				     }
			    });
			}
		}, function() {
		// 验证失败的逻辑
		});
	}
  	</script>
  </head>
  
  <body>
    <form id="qrcodeFrmId" class="am-form am-form-horizontal" data-am-validator>
      <input type="hidden" name="id" value="${qrcodevo['id'] }">
      <fieldset>
      <legend>工号(门店+工号编号)</legend>
	  <div class="am-form-group am-form-group-sm">
	    <label for="doc-ipt-3-2" class="am-u-sm-2 am-form-label">门店</label>
	    <div class="am-u-sm-10">
	      <input type="number" name="vshop" required value="${qrcodevo['vshop'] }" id="doc-ipt-3-2" class="am-form-field" data-validation-message="请输入所属门店" placeholder="所属门店">
	    </div>
	  </div>
	  <div class="am-form-group am-form-group-sm">
	    <label for="doc-ipt-3-1" class="am-u-sm-2 am-form-label">工号编号</label>
	    <div class="am-u-sm-10">
	      <input type="number" pattern="^\d{4}$" required  name="vkfcode" value="${qrcodevo['vkfcode'] }" id="doc-ipt-3-1" class="am-form-field" data-validation-message="输入4位工号" placeholder="输入4位工号">
	    </div>
	  </div>
	  </fieldset>
	  <div class="am-form-group am-form-group-sm">
	    <label for="doc-ipt-3-2" class="am-u-sm-2 am-form-label">帐号</label>
	    <div class="am-u-sm-10">
	      <input type="text" name="userid" required value="${qrcodevo['userid'] }" id="doc-ipt-3-2" class="am-form-field" data-validation-message="请输入客服人员帐号" placeholder="输入客服人员帐号">
	    </div>
	  </div>
	  <div class="am-form-group am-form-group-sm bv-qrcode">
	  	<label for="doc-ipt-3-2" class="am-u-sm-2 am-form-label">二维码</label>
	    <div class="am-u-sm-10">
	      <img class="am-radius" alt="140*140" src="" width="140" height="140" />
	    </div>
	  </div>
	  <div class="am-form-group">
	    <div class="am-u-sm-10 am-u-sm-offset-2">
	      <button type="button" id="btn-submit" class="am-btn am-btn-default">创建二维码</button>&nbsp;
	    </div>
	  </div>
	</form>
  </body>
</html>
