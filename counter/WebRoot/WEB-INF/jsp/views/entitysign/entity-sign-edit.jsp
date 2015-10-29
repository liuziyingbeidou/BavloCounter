<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>${ctx }实物签收单</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		
		<script src="${ctx}/resources/js/jquery-1.7.2.min.js"></script>
		<link type='text/css' rel='stylesheet' href='${ctx}/resources/css/style.css' media='all' />
		<link type='text/css' rel='stylesheet' href='${ctx}/resources/css/bootstrap.css' media='all' />
		<script src="${ctx}/resources/js/top.js"></script>
		
		<script type="text/javascript">
		(function($){
		    $.fn.serializeJson=function(){
		        var serializeObj={};
		        var array=this.serializeArray();
		        var str=this.serialize();
		        $(array).each(function(){
		            if(serializeObj[this.name]){
		                if($.isArray(serializeObj[this.name])){
		                    serializeObj[this.name].push(this.value);
		                }else{
		                    serializeObj[this.name]=[serializeObj[this.name],this.value];
		                }
		            }else{
		                serializeObj[this.name]=this.value;
		            }
		        });
		        return serializeObj;
		    };
		})(jQuery);
		//实物签收单保存
		function save(){
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
		}
		</script>
		
	</head>
	<body>
	<form id="entityfrmId" method="post">
	<input id="entityid" type="hidden" name="id" value="${entityvo['id']}">
		<div class="header">
			<div class="head">
				<div class="top1">
					<b><a href="javascript:;" onclick="EditShow_Hidden(ed1)"><img src="${ctx}/resources/images/plus.png">
					</a> 编辑实物签收单81812560 </b>
					<font><a href="javascript:;" onclick="Show_Hidden(tr1)"><img src="${ctx}/resources/images/plus.png">
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
							<a href="${ctx}/entity-sign/list.do">实物签收单</a>
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
							<a href=""><img src="${ctx}/resources/images/customer_01.png">
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
							<a href=""><img src="${ctx}/resources/images/camera.png">
							</a>
						</li>
						<div class="clear"></div>
					</ul>
					<div class="clear"></div>
					<dt>
						<img src="${ctx}/resources/images/pic_02.png">
					</dt>
				</div>
				<div class="qsd_right">
					<div class="qsd_right_1">
						<input type='text' name='vtype' value="${entityvo['vtype']}" class="qsdn t3">
					</div>
					<div class="qsd_right_1">
						<input type='text' name='nweight' value="${entityvo['nweight']}" class="qsdr r2">
						<dt>
							<input type='text' name='icount' class="qsdr" value="${entityvo['icount']}">
						</dt>
						<div class="clear"></div>
					</div>
					<div class="qsdtt">
						<input type='text' name='nworth' value="${entityvo['nworth']}" class="qsdn t3">
					</div>
					<div class="clear"></div>
					<div class="qssm-l">
						<textarea name="vmemo" cols="" rows="" class="qssm"
							onfocus="if(this.value=='签收说明'){this.value='';}"
							onblur="if(this.value==''){this.value='签收说明';}">${entityvo['vmemo']}</textarea>
					</div>
					<div class="clear"></div>
					<div class="qsdtt">
						<input type='text' name='nrecoveryPrice' value="${entityvo['nrecoveryPrice']}" class="qsdn t3">
					</div>
					<div class="qs_save">
						<input type="button" onclick="save()" name="button" value="保存">
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</form>
	<form id="entityfrmBId">
	<input type='text' name='vname' value="测试" class="qsdn t3">
	<input type='text' name='biscover' value="bbb" class="qsdn t3">
	</form>
	</body>
</html>
