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
    	
    });
    
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
    		var worth = $("."+myClass).val();
    		var index = isContain(worth,suffix);
    		if(index == -1){
    			$("."+myClass).val(worth + suffix);
    		}
    	});
    }
    
})( jQuery );
//去前缀
function clearSuffix(myClass,suffix){
	var worth = $("."+myClass).val();
	var index = isContain(worth,suffix);
	if(index >= 0){
		$("."+myClass).val(worth.substring(0,index));
	}
}
//加前缀
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
