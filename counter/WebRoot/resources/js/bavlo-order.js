/**
 * @author liuzy
 * @param 2015-10-21
 * 订单
 */
(function( $ ){
    $(function() {
    	
    });
});

//订单状态条 提交(0)、制版(1)、生产(2)、质检(3)、快递(4)、支付(5)
function freshOrderState(iorderState){
	if(iorderState != "-1"){
		$("#orderSubmit").hide();
	}else{
		$(".o-ssave").hide();
		$(".o-csave").hide();
	}
	switch (iorderState) {
	case "0":
		$(".st-tj").css({"background":"url('/counter/resources/images/Arrow3.png') no-repeat"});
		$(".o-ssave").hide();
		$(".o-csave").hide();
		break;
	case "1":
		$(".st-tj").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-zb").css({"background":"url('/counter/resources/images/Arrow3.png') no-repeat"});
		$(".o-ssave").hide();
		$(".o-csave").hide();
		break;
	case "2":
		$(".st-tj").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-zb").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-sc").css({"background":"url('/counter/resources/images/Arrow3.png') no-repeat"});
		$(".o-csave").hide();
		$(".o-ssave").show();
		$(".ista option[value='5']").remove(); 
		break;
	case "3":
		$(".st-tj").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-zb").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-sc").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-zj").css({"background":"url('/counter/resources/images/Arrow3.png') no-repeat"});
		$(".ista option[value='3']").remove(); 
		$(".o-ssave").hide();
		$(".o-csave").show();
		$(".o-csave").css("padding-top","30px");
		break;
	case "4":
		$(".st-tj").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-zb").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-sc").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-zj").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-kd").css({"background":"url('/counter/resources/images/Arrow3.png') no-repeat"});
		$("#csave").hide();
		$(".ista").val(5); 
		$(".o-ssave").show();
		$(".o-csave").show();
		$(".o-csave").css("padding-top","");
		$(".ista option[value='3']").remove(); 
		break;
	case "5":
		$(".st-tj").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-zb").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-sc").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-zj").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-kd").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-jf").css({"background":"url('/counter/resources/images/Arrow5.png') no-repeat"});
		$("#csave").hide();
		$(".close").hide();
		$(".o-ssave").hide();
		$(".o-csave").show();
		$(".o-csave").css("padding-top","30px");
		//$(".ista option[value='3']").remove(); 
		$("#ssave").hide();
		break;								
	}
}