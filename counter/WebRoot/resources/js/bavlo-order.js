/**
 * @author liuzy
 * @param 2015-10-21
 * 订单
 */
(function( $ ){
    $(function() {
    	
    });
});

//订单状态条
function freshOrderState(iorderState){
	if(iorderState != "-1"){
		$("#orderSubmit").hide();
	}
	switch (iorderState) {
	case "0":
		$(".st-tj").css({"background":"url('/counter/resources/images/Arrow3.png') no-repeat"});
		break;
	case "1":
		$(".st-tj").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-zb").css({"background":"url('/counter/resources/images/Arrow3.png') no-repeat"});
		break;
	case "2":
		$(".st-tj").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-zb").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-sc").css({"background":"url('/counter/resources/images/Arrow3.png') no-repeat"});
		break;
	case "3":
		$(".st-tj").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-zb").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-sc").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-zj").css({"background":"url('/counter/resources/images/Arrow3.png') no-repeat"});
		break;	
	case "4":
		$(".st-tj").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-zb").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-sc").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-zj").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-kd").css({"background":"url('/counter/resources/images/Arrow3.png') no-repeat"});
		break;		
	case "5":
		$(".st-tj").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-zb").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-sc").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-zj").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-kd").css({"background":"url('/counter/resources/images/Arrow1.png') no-repeat"});
		$(".st-jf").css({"background":"url('/counter/resources/images/Arrow5.png') no-repeat"});
		break;								
	}
}