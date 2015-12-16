<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>客户列表</title>
<script language="javascript" type="text/javascript"
	src="${ctx}/resources/js/jquery-1.8.3.min.js"></script>
<script src="${ctx}/resources/js/top.js"></script>
<link href="${ctx}/resources/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="${ctx}/resources/css/bootstrap-list.css" rel="stylesheet"
	type="text/css" />
<link href="${ctx}/resources/css/orderlist.css" rel="stylesheet"
	type="text/css" />
<script src="${ctx}/resources/js/showList.js" type="text/javascript"></script>

<!-- 自定义 -->
<script src="${ctx}/resources/js/bavlo-event.js"></script>
<!-- Loading -->
<script src="${ctx}/resources/showLoading/showLoading.js"></script>
<link type="text/css" rel="stylesheet" href="${ctx}/resources/showLoading/showLoading.css">

<!-- 弹框 -->
<!-- jQuery & jQuery UI files (needed)--> 
<script src="/counter/resources/jquery.multiDialog/js/jquery/jquery-ui-1.10.3.custom.js"></script> 
<!-- MultiDialog files (needed) --> 
<script src="/counter/resources/jquery.multiDialog/js/jquery.ui.dialog.extended-1.0.2.js"></script> 
<script src="/counter/resources/jquery.multiDialog/js/jquery.multiDialog.js"></script> 

<link rel="stylesheet" href="${ctx }/page/counter/assets/css/amazeui.min.css"/>
<link rel="stylesheet" href="${ctx }/page/counter/assets/css/admin.css">
<script type="text/javascript" src="${ctx }/page/counter/assets/js/amazeui.min.js"></script>
<script type="text/javascript">
	$(function(){
		initData();
	});
	
	function initData(){
		startMask();
		$("#juheweb").empty();
		var url = "${ctx}/qy/getUserByTagName.do";
		$.post(url,{tagName:"${role}"},function(row){debugger
			if(row.length > 0){
				var data = row;
				for(var i = 0; i < data.length; i++){
					var ht = "<li><h4><img style='width:60px;height:60px;' ";
					var img = "src='${ctx}/resources/images/customer_01.png'";
					if(data[i].avatar != ""){
						img = "src='"+data[i].avatar+"'";
					}
					var ml = "><b>"+data[i].name+"</b><a href='#'>"+data[i].mobile+"</a><span><a href='#' onclick='selHander(\""+data[i].userid+"\")'>选择</a></span></h4><div class='clear'></div></li>";
					$("#juheweb").append(ht+img+ml);
					endMask();
				}
			}else{
				$("#juheweb").append("<span style='color:#FFF;'>不存在！</span>");
				endMask();
			}
			
		});
	}
	
	//调用父窗体方法
	function selHander(userid){
		if("${listType}" == "menu"){
			//alert("userid:"+userid+"  url："+window.parent.document.location.href);
			var $pageAttr = $("#pageAttr",window.parent.document);
			var pageAttr = null;
			if($pageAttr.length > 0){
				pageAttr = $pageAttr.val();
			}else{
				alert("该页面为设置页面属性");return ;
			}
			var $id = $(".tableId",window.parent.document);
			var id = null;
			if($id.length > 0){alert($id.val()+"  "+$pageAttr.val());
				if($id.val() != null && $id.val() != ""){
					id = $id.val();
				}else{
					alert("完善信息后再转发...");return ;
				}
			}else{
				alert("该页面不允许转发...");return ;
			}
			$('#my-prompt').modal({
		      relatedTarget: this,
		      onConfirm: function(e) {
		        toRoleObj(pageAttr,userid,e.data,pageAttr,id);
		      },
		      onCancel: function(e) {
		      	toRoleObj(pageAttr,userid,"",pageAttr,id);
		      }
		    });
			//window.parent.setValueByFrame("role-menu",id,callbackMuilt());
		}
	}
	//转发页面
	function toRoleObj(pageAttr,userid,memo,pageAttr,id){
		window.parent.closeMultiDlg();
		var url = "${ctx}/sendMassage.do";
		$.post(url,{pageAttr:pageAttr,touser:userid,memo:memo,pageAttr:pageAttr,rootPath:getRootPath(),id:id},function(data){
			if(data == 0){
				alert("转发成功!");
			}else{
				alert("转发失败!");
			}
		});
	}
	//js获取项目根路径
	function getRootPath(){
	    //获取当前网址
	    var curWwwPath=window.document.location.href;
	    //获取主机地址之后的目录
	    var pathName=window.document.location.pathname;
	    var pos=curWwwPath.indexOf(pathName);
	    //获取主机地址
	    var localhostPaht=curWwwPath.substring(0,pos);
	    //获取带"/"的项目名
	    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	    return(localhostPaht+projectName);
	}
	</script>
	<style type="text/css">
	@media screen and (max-width: 1280px) and (min-width: 320px){
		.operate ul li h4{background:none!important}
	}
	.orderlist{left:0;width:450px;text-align: center;}
	.order-main{width:450px;}
	.operate ul li{width:auto;}
	.main1 .left-sider{width:465px;}
	.list-item dt{font-size:14px;}
	
	.operate ul li h4 span{float:none;margin-right:0px;}
	</style>
</head>

<body>
	<!--企业内部列表弹窗-->
	<div class="orderlist" id='pic2'>
		<div class="order-main">
			<div class="search-1">
			</div>
			<div class="">
				<div class="main1 content">
					<div class="left-sider">
						<div class="operate">
							<ul id="juheweb">
								<!--<c:forEach var="customerList" items="${customerList }">
									<li>
										<h4>
											<img src="${ctx}/resources/images/customer_01.png" /> <b>${customerList.vname }</b><a
												href="">${customerList.vphoneCode
														}</a><span><a
												href="${ctx}/customer/info.do?id=${customerList.id}">选择</a>
											</span>
										</h4>
										<div class="list-item none">
											<dl>
												<dd>
													<img src="${ctx}/resources/images/good_01.png" />
												</dd>
												<dd>
													<img src="${ctx}/resources/images/good_02.png" />
												</dd>
												<dd>
													<img src="${ctx}/resources/images/good_03.png" />
												</dd>
											</dl>
											<div class="clear"></div>
											<dt>
												报价： <b>36700元</b> 已付： <b>10000元</b> 未付： <b>26700元</b> 实收：—
											</dt>
										</div>
										<div class="clear"></div>
									</li>
								</c:forEach>
							--></ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--企业内部列表弹窗END-->
	<div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt">
	  <div class="am-modal-dialog">
	    <div class="am-modal-hd">Bavlo Counter</div>
	    <div class="am-modal-bd">
	      简单描述:
	      <input type="text" class="am-modal-prompt-input">
	    </div>
	    <div class="am-modal-footer">
	      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
	      <span class="am-modal-btn" data-am-modal-confirm>提交</span>
	    </div>
	  </div>
	</div>
</body>
</html>