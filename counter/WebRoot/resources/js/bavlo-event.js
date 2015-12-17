/**
 * @author liuzy
 * @param 2015-10-21
 * 事件
 */
(function( $ ){
    $(function() {
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
	   
    	/***************宝石签收单-开始******************/
    	//价值
    	setSuffix("gem-worth","元");
    	//重量
    	setSuffix("gem-weight","ct");
    	//数量
    	setSuffix("gem-count","颗");
    	/***************宝石签收单-结束******************/
    	
    	/***************实物签收单-开始*******************/
    	//数量
    	setSuffix("entity-count","件");
    	//重量
    	setSuffix("entity-weight","ct");
    	//价值
    	setSuffix("entity-worth","元");
    	//回收价格
    	setSuffix("entity-recoveryPrice","元/克");
    	/***************实物签收单-结束*******************/

    	/***************订单-开始*******************/
    	//报价
    	setSuffix("order-quotedPrice","元");
    	//已付
    	setSuffix("order-payment","元");
    	//未付
    	setSuffix("order-nonPayment","元");
    	//尾款实收
    	setSuffix("order-tailPaid","元");
    	/***************订单-结束*******************/
    	/***************配石单-开始*******************/
    	//数量
    	setSuffix("useGem-count","颗");
    	//重量
    	setSuffix("useGem-weight","ct");
    	//价值
    	setSuffix("useGem-worth","元");
    	/***************配石单-结束*******************/
    	/***************款式单-开始*******************/
    	//金属重量
    	//setSuffix("custom_weight","克");
    	//主石金额
    	//setSuffix("kzs_price","元");
    	//配石数量
    	//setSuffix("kps_count","颗");
    	//链子条数
    	//setSuffix("custom_item","条");
    	//其他金额
    	//setSuffix("costom_otherPrice","元");
    	/***************款式单-结束*******************/
    	
    	/*********************校验-start*******************/
    	//非空校验{class='bl-ck-null'}
    	checkNull("bl-ck-null");
    	/*********************校验-end*******************/
    });
    
    //非空校验
    function checkNull(myClass){
    	//失去焦点
    	$("."+myClass).bind("focusout",function(){
    		if($(this).val() == ""){
				setBorderRed(this);
    		}else{
    			cancelBorderRed(this);
    		}
    	});    	
    }
    
    /**
     * 设置后缀
     */
    function setSuffix(myClass,suffix){
    	
    	//获得焦点
    	$("."+myClass).bind("focusin",function(){
    		var worth = $("."+myClass).val();
    		var index = isContain(worth,suffix);
    		if(index >= 0){
    			$("."+myClass).val(worth.substring(0,index));
    		}
    	});
    	//失去焦点
    	$("."+myClass).bind("focusout",function(){
    		if($(this).val() != ""){
    			var worth = $("."+myClass).val();
        		var index = isContain(worth,suffix);
        		if(index == -1){
        			$("."+myClass).val(worth + suffix);
        		}
    		}
    		//必输项校验
    		var classV = $("."+myClass).prop("class");
    		if(classV.indexOf("bl-suf-null") >= 0){
    			if($("."+myClass).val() == ""){
    				setBorderRed(myClass);
        		}else{
        			cancelBorderRed(myClass);
        		}
    		}
    	});    	
    }
 
})( jQuery );


function setBorderRed(em){
	if(typeof(em) == "object"){
		$(em).css({"border-color":"red","border-style":"solid","border-width":"2px"});
	}else{
		$("."+em).css({"border-color":"red","border-style":"solid","border-width":"2px"});
	}
}

function cancelBorderRed(em){
	if(typeof(em) == "object"){
		$(em).css({"border-color":"","border-style":"none","border":"0"});
	}else{
		$("."+em).css({"border-color":"","border-style":"none","border":"0"});
	}
}

//必输项校验
function ckLose(loc,cls){
	var flag = true;
	$("."+loc + " ." + cls).each(function(){
		var type = $(this).prop("type");
		//文本框
		if(type == "text"){
			if($(this).val() == ""){
				setBorderRed(this);
				flag = false;
			}else{
				cancelBorderRed(this);
			}
		}
		//下拉框
		else if(type == "select-one"){
			if(("省份城市区县-1").indexOf($(this).val()) >= 0){
				setBorderRed(this);
				flag = false;
			}else{
				cancelBorderRed(this);
			}
		}
	});
	return flag;
}

//去后缀
function clearSuffix(myClass,suffix){
	var worth = $("."+myClass).val();
	var index = isContain(worth,suffix);
	if(index >= 0){
		$("."+myClass).val(worth.substring(0,index));
	}
}
//加后缀
function initSuffix(myClass,suffix){
	var worth = $("."+myClass).val();
	var index = isContain(worth,suffix);
	if(index == -1){
		$("."+myClass).val(worth + suffix);
	}
}
/*
 * 判断是否包含该字符
 * str 目标字符串
 * em 包含的字符串
 */
function isContain(str,em){
    var s = str.indexOf(em); 
    return (s);
} 

//是否存在指定函数 
function isExitsFunction(funcName) {
    try {
        if (typeof(eval(funcName)) == "function") {
            return true;
        }
    } catch(e) {}
    return false;
}

//弹框回调
function callbackMuilt(){
	//$(".ui-dialog-titlebar-close",window.parent.document).trigger('click');
}

//js获取项目根路径，如： http://localhost:8083/uimcardprj
function getRootPath(){
    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
    var curWwwPath=window.document.location.href;
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPaht=curWwwPath.substring(0,pos);
    //获取带"/"的项目名，如：/uimcardprj
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    return(localhostPaht+projectName);
}
//js获取页面URL
function getPageURL(){
    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
    var curWwwPath=window.document.location.href;
    return(curWwwPath);
}