<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>客服二维码管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
  	<script type="text/javascript" src="${ctx }/resources/js/jquery-1.8.3.min.js"></script>
  	<!-- easyui 1.4.1 -->
    <script type="text/javascript" src="${ctx }/resources/jquery-easyui-1.4.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${ctx }/resources/jquery-easyui-1.4.1/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${ctx }/resources/jquery-easyui-1.4.1/themes/gray/easyui.css">
	<script type="text/javascript" src="${ctx }/resources/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${ctx }/resources/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
	
	<!-- amazeui 1.4.4 -->
  	<link rel="stylesheet" href="${ctx }/page/counter/assets/css/amazeui.min.css"/>
  	<link rel="stylesheet" href="${ctx }/page/counter/assets/css/admin.css">
  	<script type="text/javascript" src="${ctx }/page/counter/assets/js/amazeui.min.js"></script>
  	
  	<!-- 弹框 -->
	<!-- jQuery & jQuery UI files (needed)--> 
	<link rel="stylesheet" href="/counter/resources/jquery.multiDialog/css/jquery-ui-1.10.3.custom.css">
	<script src="/counter/resources/jquery.multiDialog/js/jquery/jquery-ui-1.10.3.custom.js"></script> 
	<!-- MultiDialog files (needed) --> 
	<link rel="stylesheet" href="/counter/resources/jquery.multiDialog/css/jquery.multiDialog.css"> 
	<script src="/counter/resources/jquery.multiDialog/js/jquery.ui.dialog.extended-1.0.2.js"></script> 
	<script src="/counter/resources/jquery.multiDialog/js/jquery.multiDialog.js"></script> 
  	<script type="text/javascript" src="${ctx }/resources/js/bavlo-dialog.js"></script>
    
    	<script type="text/javascript">
		$(function(){
			$("#condition").keyup(function(){
				 delay(function(){
					 gridload('pttg');
				 }, 500 );
			});
			
			var delay = (function(){
				 var timer = 0;
				 return function(callback, ms){
					 clearTimeout (timer);
					 timer = setTimeout(callback, ms);
				 };
			})();
			function gridload(emid){
				var condition = $("input[name='condition']").val().trim();
				$('#'+emid).datagrid('load',{
					condition:condition
				});
			}
			// 数据表格
			$('#pttg').datagrid({
				rownumbers:true,
				checkbox:true,
				height:560,
				toolbar:'#tb',
				singleSelect:true,
				collapsible:true,
				remoteSort:false,
				url:'${ctx }/tools/getListQrcode.do',
				method:'get',
				pagination:true,
				onDblClickRow:
		           function () {
		               //单击行的时候，将单选按钮设置为选中
		               var selectRow = $('#pttg').datagrid("getSelected");
		           }
			});  
			
			var table = $('#pttg').datagrid('getPager'); 
			$(table).pagination({ 
				layout:['list','sep','first','prev','links','next','last','sep','refresh']
			}); 
			
			$(window).resize(function () {
		        $('#pttg').datagrid('resize', {
		        	width: function(){return document.body.clientWidth;}
		        }).datagrid('resize', {
		        	width: function(){return document.body.clientWidth;}
		        });
		 
			});
			
			$(".am-btn").click(function(){
				openWin();
			});
		});
		function  htgl(val,row){
			var tocss = ' <div style="text-align:center;margin:0 auto;" > '
						+'<a class="col0070c0" href="#" onclick="openWin('+row.id+')">选择</a>'
					+'</div>';
		
			return tocss ;
		}
		
		function openWin(id){
			//openURL("${ctx}/page/counter/tools/qrcode/qrcode-create.jsp","创建客服二维码",null,310);
			openURL("${ctx}/tools/goEditeQrcode.do?id="+id,"创建客服二维码",null,310);
			
		}
	</script>
   
  </head>
  
  <body>
    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-md">客服二维码管理</strong> / <small>Qrcode manage</small></div>
    </div>
    <hr/>
	<div id="tb" class="fy_ldList clearfix">
	  	<dl style="margin:10px 0;">
	      <dt class="yahei">客服二维码列表
		      	&nbsp;
		      	&nbsp;
		      	<input type="text" id="condition" placeholder="工号" value="" class="newAddFy_input01 search_myopp" name="condition" style="width: 150px"/> 
				<button type="button"  class="am-btn am-btn-default am-btn-xs">增加二维码</button>
	      </dt>
	    </dl>
	</div>
	<!-- 表格界面 -->
	<table id="pttg">
			<thead>
				<tr>
					<th data-options="field:'id',hidden:'true'">id</th>
					<th data-options="field:'vkfcode',width:120,align:'center'" width='15%'>工号</th>
					<th data-options="field:'vshop',width:120,align:'center'" width='15%'>门店</th>
					<th data-options="field:'vqrcodeUrl',width:120,align:'center'" width='20%'>二维码</th>
					<th data-options="field:'action',formatter:htgl,width:100,align:'center'" width='10%'>操作</th>
				</tr>
			</thead>
	</table>
	
  </body>
</html>
