<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>${pageEntityType }实物签收单</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		
		<script src="${ctx}/resources/js/jquery-1.8.3.min.js"></script>
		<link type='text/css' rel='stylesheet' href='${ctx}/resources/css/style.css' media='all' />
		<link type='text/css' rel='stylesheet' href='${ctx}/resources/css/bootstrap.css' media='all' />
		<script src="${ctx}/resources/js/top.js"></script>
		<!-- 自定义event	 -->
		<script src="${ctx}/resources/js/bavlo-event.js"></script>
		<!-- 弹框 -->
		<!-- jQuery & jQuery UI files (needed)--> 
		<link rel="stylesheet" href="/counter/resources/jquery.multiDialog/css/jquery-ui-1.10.3.custom.css">
		<script src="/counter/resources/jquery.multiDialog/js/jquery/jquery-ui-1.10.3.custom.js"></script> 
		<!-- MultiDialog files (needed) --> 
		<link rel="stylesheet" href="/counter/resources/jquery.multiDialog/css/jquery.multiDialog.css"> 
		<script src="/counter/resources/jquery.multiDialog/js/jquery.ui.dialog.extended-1.0.2.js"></script> 
		<script src="/counter/resources/jquery.multiDialog/js/jquery.multiDialog.js"></script> 
		<script src="/counter/resources/js/bavlo-dialog.js"></script>
		<script type="text/javascript">
		$(function() {
			 //选择客户
			 $("#file").bind("click",function(){
			 		openURL("${ctx}/customer/list.do","客户列表");
			 });
			 setValueByFrame("customer","${entityvo['id']}");
			 //上传图片
			 $(".entity-upload").bind("click",function(){
			 		openURL("${ctx}/upload/uppage.do","上传图片");
			 });
			 //图片显示
			 $(".entity-pic-show").bind("click",function(){
			 	var mid = $(".mid").val();
			 	if(mid == ""){
			 		alert("请保存后查看!");
			 	}else{
			 		openURL("${ctx}/upload/showpic.do?cpath=com.bavlo.counter.model.sign.EntitySignBVO&fkey=entitysignId&id="+mid,"图片展示");
			 	}
			 });
			 //实物签收单列表
			 $(".entity-page-list").bind("click",function(){
			 	openURL("${ctx}/entity-sign/list.do","实物签收单列表");
			 });
			 //有值后加后缀
			 initFieldSuffix();
			 //加载子表数据
		  	loadSubData("${entityvo['id']}");
		});
		//实物签收单保存
		function save(){
			//数量
	    	clearSuffix("entity-count","件");
	    	//重量
	    	clearSuffix("entity-weight","ct");
	    	//价值
	    	clearSuffix("entity-worth","元");
	    	//回收价格
	    	clearSuffix("entity-recoveryPrice","元/克");
	    	
			var bvo = JSON.stringify($('#entityfrmBId').serializeJson());
			$.ajax({
			     type : "POST",
			     url : "save.do",
			     data:$('#entityfrmId').serialize()+"&bvo="+bvo,// formid
			     async:false,
			     cache:false,
			     success : function(data) {
			     	 $("#entityid").val(data.id);
			     	 alert("保存成功!");
			     },
			     error : function(e) {
			     	alert("保存失败!");
			     }
		    });
		    //有值加后缀
		  	initFieldSuffix();
		}
		//加载子表数据
		function loadSubData(mid){
			var url = "${ctx}/upload/showpicJson.do";
			$.get(url,{cpath:"com.bavlo.counter.model.sign.EntitySignBVO",fkey:"entitysignId",id:mid},function(row){
				var data = row;
				if(data != "" && data != null){
					for(var i = 0; i < data.length; i++){
						if(data[i].biscover == "Y"){
							$("#FILE_0").val(data[i].vname);
						}else{
							$("#FILE_"+i).val(data[i].vname);
						}
					}
				}
			});
		}
		
		function initFieldSuffix(){
			if($(".entity-count").val() != ""){
	    		//数量
		    	initSuffix("entity-count","件");
    		}
		  	if($(".entity-weight").val() != ""){
	    		//重量
	    		initSuffix("entity-weight","ct");
    		}
	    	if($(".entity-worth").val() != ""){
	    		//价值
	    		initSuffix("entity-worth","元");
    		}
	    	if($(".entity-recoveryPrice").val() != ""){
	    		//回收价格
	    		initSuffix("entity-recoveryPrice","元/克");
    		}
		}
		
		//子窗体调用
		function setValueByFrame(type,id,json){
			var url;
			if(type == "entity"){
				url = "${ctx}/entity-sign/view.do?id="+id;//根据id查询客户信息
				window.location = url;
			}else if(type == "customer"){
				url = "${ctx}/customer/infoJson.do";
				$.get(url,{id:id},function(data){
					if(data != null){
						if(data.vhendimgurl != ""){
							$(".cusheader").prop("src",data.vhendimgurl);
						}
						$("#customerId").val(data.id);
					}
					closeMultiDlg();
				});
			}
		}
		</script>
		
	</head>
<body>
<form id="entityfrmId" method="post">
<input id="entityid" class="mid" type="hidden" name="id" value="${entityvo['id']}">
<input id="customerId" type="hidden" name="customerId" value="${entityvo['customerId']}">
<div class="header">
	<div class="head">
		<div class="top1">
			<b><a href="javascript:;" onclick="EditShow_Hidden(ed1)"><img src="${ctx}/resources/images/plus.png"></a>${pageEntityType }实物签收单
					<c:choose>
						 <c:when test="${empty entityvo['vnumber']}">
						 ${number }
						 <input type="hidden" name="vnumber" value="${number }">
						 </c:when>
						 <c:otherwise>
						 ${entityvo['vnumber']}
						 <input type="hidden" name="vnumber" value="${entityvo['vnumber']}">
						 </c:otherwise>	
					</c:choose> 
			</b>
			<font><a href="javascript:;" onclick="Show_Hidden(tr1)"><img src="${ctx}/resources/images/plus.png"></a></font>
		</div>
		<div class="hidden_enent" id="tr1" style="display:none;">
			<ul>
				<li class="jian"><a href="javascript:;" onclick="Show_Hidden(tr1)">—</a></li>
				<jsp:include page="../menu_pg.jsp"></jsp:include>
				<!--
				<li><a href="">定制单</a></li>
				<li><a class="entity-page-list" href="javascript:void();">实物签收单</a></li>
				<li><a href="">订单</a></li>
				<li><a href="">客户</a></li>
				-->
			</ul>
		</div>
		<div class="edit_hidden" id="ed1" style="display:none;">
			<ul>
				<li class="jian2"><a href="javascript:;" onclick="EditShow_Hidden(ed1)">—</a></li>
				<jsp:include page="../menu_cau.jsp"></jsp:include>
				<!--
				<li><a href="">Open</a></li>
				<li><a href="">Save</a></li>
				<li><a href="">Save as</a></li>
				<li><a href="">Print</a></li>			
				-->
			</ul>
		</div>
	</div>
</div>
<div class="qsd">
  <div class="qsd_main">
    <div class="qsd_left">
      <ul>
        <li><a href="javascript:void();"><img class="cusheader" src="${ctx}/resources/images/customer_01.png"></a></li>
		<li><div class="file3"><a href="javascript:;"><input type="text" name="file" id="file"></a></div></li>
        <li class="camera"><a class="entity-upload" href="javascript:void();"><img src="${ctx}/resources/images/camera.png"></a></li>
        <div class="clear"></div>
      </ul>
      <p><a class="entity-pic-show" href="javascript:void();">
      <c:choose>
		<c:when test="${empty entityvo['FILE_0']}">   
		<img src="${ctx}/resources/images/pic_03.png">
		</c:when>
		<c:otherwise>
		<img src="${ctx}/staticRes/${entityvo['FILE_0']}">
		</c:otherwise>
	  </c:choose> 
      </a></p>
    </div>
    <div class="qsd_right">
      <div class="qsd_right_1">
        <input type='text' name='vtype' value="${entityvo['vtype']}" placeholder='声明类型 ' class="swqsd entity-type">
      </div>
      <div class="qsd_right_1">
        <dt><input type='text' name='icount' value="${entityvo['icount']}" placeholder="数量" class="swqs t3 entity-count"></dt>
        <dt><input type='text' name='nweight' value="${entityvo['nweight']}" placeholder="重量" class="qsdr r2 entity-weight"></dt>
        <div class="clear"></div>
      </div>
      <div class="save1"><input type='text' name='nworth' value="${entityvo['nworth']}"  placeholder='声明价值' class="swqsd1 entity-worth"></div>
      <div class="save1"><textarea name="" cols="" rows="" class="qssm" placeholder="说明">${entityvo['vmemo']}</textarea></div>
      <div class="save1"><input type='text' name='nrecoveryPrice' value="${entityvo['nrecoveryPrice']}" placeholder='回收价格' class="qsdn1 t3 entity-recoveryPrice"></div>
      <div class="qs_save1">
        <input type="button" onclick="save()" value="保存">
      </div>
    </div>
    <div class="clear"></div>
  </div>
</div>
</form>
<form id="entityfrmBId">
	<input type="hidden" name="filemodel" id="filemodel" value="entitysign">
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
</form>
</body>
</html>
