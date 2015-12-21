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
		<link rel="stylesheet" href="${ctx}/resources/jquery.multiDialog/css/jquery-ui-1.10.3.custom.css">
		<script src="${ctx}/resources/jquery.multiDialog/js/jquery/jquery-ui-1.10.3.custom.js"></script> 
		<!-- MultiDialog files (needed) --> 
		<link rel="stylesheet" href="${ctx}/resources/jquery.multiDialog/css/jquery.multiDialog.css"> 
		<script src="${ctx}/resources/jquery.multiDialog/js/jquery.ui.dialog.extended-1.0.2.js"></script> 
		<script src="${ctx}/resources/jquery.multiDialog/js/jquery.multiDialog.js"></script> 
		<script src="${ctx}/resources/js/bavlo-dialog.js"></script>
		<script type="text/javascript">
		$(function() {
			 //选择客户
			 $("#file").bind("click",function(){
			 		openURL("${ctx}/customer/list.do","客户列表",470,550);
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
			 		openURL("${ctx}/upload/showpic.do?cpath=com.bavlo.counter.model.sign.EntitySignBVO&fkey=entitysignId&id="+mid,"图片展示",null,null,true);
			 	}
			 });
			 //实物签收单列表
			 /*$(".entity-page-list").bind("click",function(){
			 	openURL("${ctx}/entity-sign/list.do","实物签收单列表");
			 });*/
			 //有值后加后缀
			 initFieldSuffix();
			 //加载子表数据
		  	loadSubData("${entityvo['id']}");
		  	//控制头像显示
			if($("#customerId").val()){
				$(".header-loc").show();
			}else{
				$(".header-loc").hide();
			}
		});
		//实物签收单保存
		function save(){
		
			if(!ckLose("edit_btn","lose-entity")){
				return;
			}
			
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
			     	 $(".entity-pic-show img").prop("src","/counter/staticRes/"+$("#filemodel").val()+"/"+$("#FILE_0").val());
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
		function setValueByFrame(type,id,callback,json){
			var url;
			if(type == "customer"){
				url = "${ctx}/customer/infoJson.do";
				$.get(url,{id:id},function(data){
					if(data != null){
						if(data.vhendimgurl != ""){
							$(".cusheader").prop("src",data.vhendimgurl);
						}
						$("#customerId").val(data.id);
					}
					if($("#customerId").val()){
						$(".header-loc").show();
					}else{
						$(".header-loc").hide();
					}
					closeMultiDlg();
				});
			}else if(type == "chain"){
				var data = JSON.parse(json);
				$("#order-list").append("<dd type='ch' sid='"+data.sid+"' class='"+data.sid+" bill'><span class='list_name bill-name'>"+data.sname+"</span><input class='list_num bill-num' style='width:40px;margin-left:10px;' type='text' value='1' placeholder='条'><b class='list_price bill-price'>"+data.sprice+"</b><a href='javascript:rlist("+data.sid+")' class='close_c'><img src='${ctx}/resources/images/close.png'></a></dd>");
				closeMultiDlg();
			}else if(type == "order"){
				url = "${ctx}/order/edit.do?id="+id;//根据id查询客户信息
				window.location = url;
			}else if(type == "order-view"){
				url = "${ctx}/order/view.do?id="+id;//根据id查询客户信息
				window.location = url;
			}else if(type == "signGem"){
				url = "${ctx}/gem-sign/view.do?id="+id;//根据id查询客户信息
				window.location = url;
			}else if(type == "entity"){
				url = "${ctx}/entity-sign/view.do?id="+id;//根据id查询客户信息
				window.location = url;
			}else if(type == "customer-menu"){
				url = "${ctx}/customer/info.do?id="+id;//根据id查询客户信息
				window.location = url;
			}else if(type == "custom"){
				url = "${ctx}/custom/edit.do?id="+id;//根据id定制单信息
				window.location = url;
			}else if(type == "custom-view"){
				url = "${ctx}/custom/detail.do?id="+id;//根据id显示定制单信息
				window.location = url;
			}
		}
		</script>
		<style type="text/css">
		.camera a{
			background:none;
		}
		.qsd_left ul li { width: auto; padding-right: 20px; float: left;}
		.hidden_enent { width:110px; position:relative; top:10px; right:-690px;}
		.edit_hidden { width:110px; position:relative; top:10px; left:-15;}
		.e-customer-add{cursor:pointer;}
		/*.swqsd,.swqsd1,.qssm,.qsdn1{width:328px;}*/
		@media screen and (max-width: 1280px) and (min-width: 320px){
		.qsd_left ul li {
			height:auto;
		}
		.hidden_enent { width:110px; position:relative; top:10px; right:-400px;}
		.edit_hidden { width:120px; position:relative; top:10px; left:0;}
		}
		</style>
	</head>
<body>
<form id="entityfrmId" method="post">
<input type="hidden" id="pageAttr" value="ENTITY"/>
<input id="entityid" class="mid tableId"  type="hidden" name="id" value="${entityvo['id']}">
<input id="customerId" class="tocustomerId" type="hidden" name="customerId" value="${entityvo['customerId']}">
<div class="header">
	<div class="head">
		<div class="top1">
			<b><a href="#" onclick="EditShow_Hidden(ed1)"><img src="${ctx}/resources/images/plus.png"></a>${pageEntityType }实物签收单
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
			<font><a href="#" onclick="Show_Hidden(tr1)"><img src="${ctx}/resources/images/plus.png"></a></font>
		</div>
		<div class="hidden_enent" id="tr1" style="display:none;">
			<ul>
				<li class="jian"><a href="#" onclick="Show_Hidden(tr1)">—</a></li>
				<jsp:include page="../menu_pg.jsp"></jsp:include>
			</ul>
		</div>
		<div class="edit_hidden" id="ed1" style="display:none;">
			<ul>
				<li class="jian2"><a href="#" onclick="EditShow_Hidden(ed1)">—</a></li>
				<jsp:include page="../menu_cau.jsp"></jsp:include>
			</ul>
		</div>
	</div>
</div>
<div class="qsd">
  <div class="qsd_main">
    <div class="qsd_left">
      <ul>
        <li class="header-loc"><a href="#"><img class="cusheader" style="width:60px;height:60px;" src="${ctx}/resources/images/customer_01.png"></a></li>
		<li><div class="file3"><a href="#"><input class="e-customer-add" type="text" name="file" id="file"></a></div></li>
        <li class="camera"><a class="entity-upload" href="#"><img src="${ctx}/resources/images/camera.png"></a></li>
        <div class="clear"></div>
      </ul>
      <dt><a class="entity-pic-show" href="#">
      <c:choose>
		<c:when test="${empty entityvo['FILE_0']}">   
		<img style="width:330px;height:330px;" src="${ctx}/resources/images/pic_03.png">
		</c:when>
		<c:otherwise>
		<img style="width:330px;height:330px;" src="${ctx}/staticRes/${entityvo['FILE_0']}">
		</c:otherwise>
	  </c:choose> 
      </a>
      </dt>
    </div>
    <div class="qsd_right edit_btn">
      <div class="qsd_right_1">
        <input type='text' name='vtype' value="${entityvo['vtype']}" placeholder='声明类型 ' class="swqsd entity-type bl-ck-null lose-entity">
      </div>
      <div class="qsd_right_1">
        <dt><input type='text' name='icount' value="${entityvo['icount']}" placeholder="数量" class="swqs t3 entity-count bl-ck-null lose-entity"></dt>
        <dt><input type='text' name='nweight' value="${entityvo['nweight']}" placeholder="重量" class="qsdr r2 entity-weight bl-ck-null lose-entity"></dt>
        <div class="clear"></div>
      </div>
      <div class="save1"><input type='text' name='nworth' value="${entityvo['nworth']}"  placeholder='声明价值' class="swqsd1 entity-worth bl-ck-null lose-entity"></div>
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
