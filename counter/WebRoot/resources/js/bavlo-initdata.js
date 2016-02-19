/**
 * @author liuzy
 * @param 2015-10-21
 * 初始化界面数据
 */



/**
 * 远程数据
 * 下拉框赋值<br>
 * nativeUrl 本地<br>
 * remoteUrl 远程数据接口<br>
 * emName 下拉框id名称<br>
 * selId json中作为下拉框id 如：data[i].id<br>
 * selName json中作为下拉框显示名称 如：data[i].type_cn<br>
 */
function loadSelData(nativeUrl,remoteUrl,emName,selId,selName,callback,explain){
	if(explain == undefined){
		explain = "请选择";
	}
	$('#'+emName).empty();
	$('#'+emName).append("<option value='-1'>"+explain+"</option>");
	//下拉框-形状
	if(emName == "gemShapeId"){
		if(!isExistOption("gemShapeId","-2")){
			$('#'+emName).append("<option class='mytipclass' value='-2'>自定义</option>");
		}
	}
	/*$.ajax({
		type:"get",
		async: false,
		url:nativeUrl,
		data:{url:remoteUrl},
		dataType:"json",
		success:function(row){
			var data = row;
			for(var i=0;i<data.length;i++){
				$('#'+emName).append("<option value='"+eval(selId)+"'>"+eval(selName) +"</option>");
			}
		}
		
	});*/
	
	$.get(nativeUrl,{url:remoteUrl},function(row){
		var data = row;debugger
		if(data != null){
			for(var i=0;i<data.length;i++){
				$('#'+emName).append("<option value='"+eval(selId)+"'>"+eval(selName)+"</option>");
			}
		}
		if(typeof(callback)!=='undefined'){
			callback&&callback();
		}
	},"json");
}



/**
 * 远程数据
 * 下拉框赋值<br>
 * nativeUrl 本地<br>
 * remoteUrl 远程数据接口<br>
 * emName 下拉框id名称<br>
 * selId json中作为下拉框id 如：data[i].id<br>
 * selName json中作为下拉框显示名称 如：data[i].type_cn<br>
 */
function loadSelDataStr(nativeUrl,remoteUrl,emName,selId,selName,callback,explain){
	if(explain == undefined){
		explain = "请选择";
	}
	$('#'+emName).empty();
	$('#'+emName).append("<option value='-1'>"+explain+"</option>");
	
	/*$.ajax({
		type:"get",
		async: false,
		url:nativeUrl,
		data:{url:remoteUrl},
		dataType:"json",
		success:function(row){
			var data = row;
			for(var i=0;i<data.length;i++){
				$('#'+emName).append("<option value='"+eval(selId)+"'>"+eval(selName) +"</option>");
			}
		}
		
	});*/
	
	$.get(nativeUrl,{url:remoteUrl},function(row){
		var data = row;
		if(data != null){
			for(var i=0;i<data.length;i++){
				$('#'+emName).append("<option sid='"+eval(selId)+"' value='"+eval(selName)+"'>"+eval(selName)+"</option>");
			}
		}
		if(typeof(callback)!=='undefined'){
			callback&&callback();
		}
	},"json");
	

}

function loadRingSizeData(nativeUrl,remoteUrl,emName,selId,selName1,selName2,selName3,callback,explain){
	if(explain == undefined){
		explain = "请选择";
	}
	$('#'+emName).empty();
	$('#'+emName).append("<option value='-1'>"+explain+"</option>");
	
	$.get(nativeUrl,{url:remoteUrl},function(row){
		var data = row;
		if(data != null){
			for(var i=0;i<data.length;i++){
				$('#'+emName).append("<option value='"+eval(selName1)+"号 内径"+eval(selName2)+"mm 周长"+eval(selName3)+"mm'>"+eval(selName1)+"号 内径"+eval(selName2)+"mm 周长"+eval(selName3)+"mm</option>");
			}
		}
		
		if(typeof(callback)!=='undefined'){
			callback&&callback();
		}
	},"json");
		

}

/**
 * 获取宝石图片
 * @param nativeUrl
 * @param remoteUrl
 */
function loadGemImg(nativeUrl,remoteUrl){
	var type_cn = $("#gemTypeId").find("option:selected").text();
	var shape_cn = $("#gemShapeId").find("option:selected").text();
	var calibrated_cn = $("#gemSpecId").find("option:selected").text();
	$.get(nativeUrl,
		{url:remoteUrl},
		function(data){
			var html = "";
			for (var i = 0; i < data.length; i++) {
				html += "<dl class='gem_img' type='"+type_cn+"' shape='"+shape_cn+"' calibrated='"+calibrated_cn+"' weight='"+data[i].weight+"' color='"+data[i].color.name_cn+"' clarity='"+data[i].clarity.name_en+"' costPrice='"+data[i].costPrice+"'>"
						+ "<dd><img src='http://img.bavlo.com/GemPics/"+data[i].shape.id+"_"+data[i].color.id+".png'/><div class='kxs_weight'>"
						+ data[i].weight
						+ "CT</div></dd></dl>"
			}

			$(".gem_sel_h").html(html);
			$(".gem_img").click(function() {
				if ($(this).attr("class") == 'gem_img') {
					$(".gem_img_sel").attr("class", "gem_img");
					$(this).attr("class", "gem_img_sel");
				} else {
					$(this).attr("class", "gem_img");
				}
			})
		
	},"json");
}

/**
 * 宝石类型(未使用)
 * @param nativeUrl
 * @param remoteUrl
 * @param emName
 */
function loadGemType(nativeUrl,remoteUrl,emName){
	$('#'+emName).empty();
	$('#'+emName).append("<option>请选择</option>");
	
	$.ajax({
		type:"post",
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
	$('#'+emName).append("<option>请选择</option>");
	
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

/**
 * http远程请求
 * var nativeUrl = "${pageScope.basePath}/counter/webservice/httprequest.do";
 */
function httpRequest(nativeurl,requestUrl,requestMethod,outputStr,callback){
	$.post(nativeurl,{requestUrl:requestUrl,requestMethod:requestMethod,outputStr:outputStr},function(data){
		if(typeof(callback)!=='undefined'){
			callback&&callback(JSON.stringify(data));
		}
	});
}

/**
 * http远程请求
 * var nativeUrl = "${pageScope.basePath}/counter/webservice/httprequest.do";
 */
function httpRequestStr(nativeurl,remoteUrl,callback){
	$.get(nativeUrl,{url:remoteUrl},function(data){
		if(typeof(callback)!=='undefined'){
			callback&&callback(data);
		}
	});
}

/**
 * 获取利润率
 * @param nativeUrl
 * @param remoteUrl
 */
function loadProfit(nativeUrl,remoteUrl,callback){
	$.get(nativeUrl,
			{url:remoteUrl},
			function(data){
				if(typeof(callback)!=='undefined'){
					callback&&callback();
				}
			},"json");
}

//设置下拉框自定义
function setCustomV(em){
	
	$("#"+em).customComboBox({
        tipText : "自定义",
        tipClass : "mytipclass",
        allowed : /[A-Za-z0-9\$\.\s]/,
        notallowed : /[\<\>]/,
        index : 'last',
        isEditing : function(el, status, value) {
            if (typeof window.console!='object') { return; }
            console.info('Editing status changed to (', status, ') on ', el, ' combo box and the selected value is "', value, '"');
        },
        onKeyDown : function(el, character, fulltext) {
            if (typeof window.console!='object') { return; }
            console.info('The character (', character, ') was just typed into ', el, ' combo box and the complete text is now "', fulltext, '"');
        },
        onDelete : function(el, fulltext) {
            if (typeof window.console!='object') { return; }
            console.info('A character was deleted from ', el, ' combo box and the complete text is now "', fulltext, '"');
        }
    });
}
//判断select中是否存在值为value的项 
function isExistOption(id,value) { 
	var isExist = false; 
	var count = $('#'+id).find('option').length; 
	for(var i=0;i<count;i++) { 
		if($('#'+id).get(0).options[i].value == value) { 
			isExist = true; break; 
		} 
	} 
	return isExist; 
}