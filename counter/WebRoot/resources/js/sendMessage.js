/**
 * 把本页面链接发送给客户
 */
function sendTMessage(toUser){
	 var url = window.location.href;
	 $.ajax({
		 url : '../sendTM.do',
			type : 'POST',
			data :{
				'toUser' : toUser,
				'url': url
			},
			dataType:'json',
			success : function(data) {		
				alert(data);
			}
	 })	 	
}