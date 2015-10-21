/**
 * @author liuzy
 * @param 2015-10-21
 * 初始化界面数据
 */
jQuery(document).ready(function($){
	
	
});


/**
 * 远程数据
 * 下拉框赋值<br>
 * nativeUrl 本地<br>
 * remoteUrl 远程数据接口<br>
 * emName 下拉框id名称<br>
 * selId json中作为下拉框id 如：data[i].id<br>
 * selName json中作为下拉框显示名称 如：data[i].type_cn<br>
 */
function loadSelData(nativeUrl,remoteUrl,emName,selId,selName){
	$('#'+emName).empty();
	$('#'+emName).append("<option>==请选择==</option>");
	
	$.ajax({
		type:"GET",
		async: false,
		url:nativeUrl,
		data:"url="+remoteUrl,
		dataType:"json",
		success:function(row){
			var data = row;
			for(var i=0;i<data.length;i++){
				$('#'+emName).append("<option value='"+eval(selId)+"'>"+eval(selName)+"</option>");
			}
		}
		
	});
}

/**
 * 宝石类型(未使用)
 * @param nativeUrl
 * @param remoteUrl
 * @param emName
 */
function loadGemType(nativeUrl,remoteUrl,emName){
	$('#'+emName).empty();
	$('#'+emName).append("<option>==请选择==</option>");
	
	$.ajax({
		type:"GET",
		async: false,
		url:nativeUrl,
		data:"url="+remoteUrl,
		dataType:"json",
		success:function(row){
			var data = row;
			for(var i=0;i<data.length;i++){
				$('#'+emName).append("<option value='"+data[i].id+"'>"+data[i].type_cn +"</option>");
			}
		}
		
	});
}

/**
 * 宝石形状(未使用)
 * @param nativeUrl
 * @param remoteUrl
 * @param emName
 */
function loadGemShape(nativeUrl,remoteUrl,emName){
	$('#'+emName).empty();
	$('#'+emName).append("<option>==请选择==</option>");
	
	$.ajax({
		type:"GET",
		async: false,
		url:nativeUrl,
		data:"url="+remoteUrl,
		dataType:"json",
		success:function(row){
			var data = row;
			for(var i=0;i<data.length;i++){
				$('#'+emName).append("<option value='"+data[i].id+"'>"+data[i].shape_cn+"</option>");
			}
		}
		
	});
}