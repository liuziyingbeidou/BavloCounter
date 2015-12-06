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
    <!-- amazeui 1.4.4 -->
  	<link rel="stylesheet" href="${ctx }/page/counter/assets/css/amazeui.min.css"/>
  	<link rel="stylesheet" href="${ctx }/page/counter/assets/css/admin.css">
  	
  	<!-- easyui 1.4.1 -->
    <script type="text/javascript" src="${ctx }/resources/jquery-easyui-1.4.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${ctx }/resources/jquery-easyui-1.4.1/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${ctx }/resources/jquery-easyui-1.4.1/themes/gray/easyui.css">
	<script type="text/javascript" src="${ctx }/resources/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${ctx }/resources/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
    
    	<script type="text/javascript">
		$(function(){
			// 数据表格
			$('#pttg').datagrid({
				rownumbers:true,
				checkbox:true,
				height:560,
				toolbar:'#tb',
				singleSelect:true,
				collapsible:true,
				remoteSort:false,
				url:'${ctx }/resources/jquery-easyui-1.4.4/datagrid_data1.json',
				method:'get',
				pagination:true,
				onDblClickRow:
			           function () {
			               //单击行的时候，将单选按钮设置为选中
			               var selectRow = $('#pttg').datagrid("getSelected");
			               //window.open("./customer/visit_regist/visit_regist!add.do?type=update&way=sel&seloppid="+selectRow.id+"&selcustid="+selectRow.customerid,"_blank");
			           }
			});  
			
			var table = $('#pttg').datagrid('getPager'); 
			$(table).pagination({ 
				layout:['list','sep','first','prev','links','next','last','sep','refresh']
			}); 
			
			$(window).resize(function () {
		        $('#pttg').datagrid('resize', {
		            /* width: $(window).width(), */
		        	width: function(){return document.body.clientWidth;}
		        }).datagrid('resize', {
		            /* width: $(window).width(), */
		        	width: function(){return document.body.clientWidth;}
		        });
		 
			});
		});
		function  htgl(val,row){
			var tocss = ' <div style="text-align:center;margin:0 auto;" > '
						+'<a class="col0070c0" href="#" onclick="selectOneOpp('+row.id+','+row.customerid+')">选择</a>'
					+'</div>';
		
			return tocss ;
		}	
	</script>
   
  </head>
  
  <body>
    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-md">二维码管理</strong> / <small>Qrcode manage</small></div>
    </div>
    <hr/>
	<div id="tb" class="fy_ldList clearfix">
	  	<dl style="margin:10px 0;">
	      <dt class="yahei">二维码列表
		      	&nbsp;
		      	&nbsp;
		      	<input type="text" id="searchinput" placeholder="工号" value="" class="newAddFy_input01 search_myopp" name="search_myopp" style="width: 150px"/> 
				<a href="#" class="fy_li07"  onclick="searchopp();"><em></em>增加二维码</a>
	      </dt>
	      <dd>
	        <!--
	        <ul>
	          <li class="fy_search"><a href="#" onclick="onImport();" ><em style="background:url(${pageContext.request.contextPath}/images/basebticons/import.png) no-repeat;"></em>导入客户</a></li>
	        </ul>
	      -->
	      </dd>
	    </dl>
	</div>
	<!-- 表格界面 -->
	<table id="pttg">
			<thead>
				<tr>
					<th data-options="field:'id',hidden:'true'">id</th>
					<th data-options="field:'customerid',hidden:'true'">customerid</th>
					<th data-options="field:'ck',checkbox:true" width='5%'></th>
					<th data-options="field:'vtel',width:120,align:'center'" width='15%'>工号</th>
					<th data-options="field:'vsex',width:120,align:'center'" width='15%'>门店</th>
					<th data-options="field:'vyxcd',width:120,align:'center'" width='20%'>二维码</th>
					<th data-options="field:'action',formatter:htgl,width:100,align:'center'" width='10%'>操作</th>
				</tr>
			</thead>
	</table>
  </body>
</html>
