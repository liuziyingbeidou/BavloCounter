<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${ctx }/resources/jquery.multiDialog/js/jquery/jquery-1.9.1.js"></script>
<script src="${ctx }/resources/js/bavlo-initdata.js"></script>
<script type="text/javascript">
$(function(){
	$(".multidialog").click(function(){
		var cont = $("#api-button",window.parent.document).text();
		alert(cont);
	});
	$(".remote").click(function(){
		var nativeUrl = "${pageScope.basePath}/counter/webservice/httprequest.do";
		var requestUrl = "http://www.bavlo.com/getGemCalibrated";
		var requestMethod = "POST";//GET
		var outputStr = "typeId=3&shapeId=4";
		var info = httpRequest(nativeUrl,requestUrl,requestMethod,outputStr,test);
	});
	});
function test(data){
	alert(data);
}
</script>
</head>
<body>
    
    1、<a href="${ctx}/gem-sign/add.do">宝石签收单新增</a>
       <a href="${ctx}/gem-sign/list.do">宝石签收单列表</a>
    <br>   
    2、<a href="${ctx}/entity-sign/add.do">实物签收单新增</a>
       <a href="${ctx}/entity-sign/list.do">实物签收单列表</a>
    <br>   
    3、<a href="${ctx}/customer/info.do">客户</a>
      <a href="${ctx}/customer/list.do">客户列表</a>
    <br>
    4、<a href="${ctx}/useGem/info.do">配石单</a>
      <a href="${ctx}/useGem/list.do">配石单列表</a>
    <br>
    5、<a href="${ctx}/order/add.do">订单新增</a>
       <a href="${ctx}/order/list.do">订单列表</a>
       <a href="${ctx}/order/view.do?id=1">订单查看</a>
    <br>   
    6、<a href="${ctx}/custom/edit.do">款式单</a>
       <a href="${ctx}/custom/getList.do">款式单列表</a>
       <a href="${ctx}/custom/detail.do">款式单详细</a>
    <br>
    <button class="remote">远程接口测试</button>
    <br>
    <fieldset>
    	<legend>数据权限控制</legend>
    	客户（CUST）、定制顾问（CC）、产品经理（PM）、起版师（CAD）、生产主管（PMC）、配石员（GB）、工厂跟单员（PPS）<br>
    	当前角色下，页面中的元素需要控制不显示的方式：定制顾问（CC）举例:<br>
    	①单个元素：添加class="CC-R"<br>
    	②多个元素一起（块域）：可适当添加< span class="CC-R" >< /span>包围
    </fieldset>
    <fieldset>
    	<legend>下载文件Controller</legend>
    	http://127.0.0.1:8080/counter/file/download.do<br>
		参数：  模块filePath   文件名fileName <br>
		调用下载文件controller回写订单状态<br>
		@Resource<br>
		IOrderService orderService;<br>
		orderService.updateOrderState(订单id,2);
    </fieldset>
    <fieldset>
    	<legend>订单→款式单→订单</legend>
    	1、订单中添加款式单时调用url=info.do?orderId="+data.id+"&customerId="+customerId{orderId:订单ID,customerId:客户ID}<br>
    	2、款式单保存后需要回写订单中的子表信息；回写条件：订单ID+款式单ID
    </fieldset>
    <fieldset>
    	<legend>弹框Demo</legend>
    	<a href="http://127.0.0.1:8080/counter/demo/dialog.jsp">点我</a>
    </fieldset>
    <fieldset>
    	<legend>上传文件Demo</legend>
    	<a href="http://127.0.0.1:8080/counter/demo/upload.jsp">上传图片</a>
    </fieldset>
    <fieldset>
    	<legend>展示图片设置方法</legend>
    	openURL("${ctx}/upload/showpic.do?cpath=com.bavlo.counter.model.sign.GemSignBVO&fkey=gemsignId&id="+mid,"图片展示");<br>
    	cpath:图片VO类全路径<br>
    	fkey:主表在子表的外键<br>
    	id:主表主键
    </fieldset>
    <fieldset>
    	<legend>后缀单位设置方法</legend>
    	1、引入<script src="${ctx}/resources/js/bavlo-event.js"></script><br>
    	2、设置placeholder="后缀"<br>
    	3、设置属性class<br>
    	4、在bavlo-event.js中添加如下：<br>
    	setSuffix(class属性值,后缀);实例：setSuffix("worth","元");
    </fieldset>
    <fieldset>
    	<legend>回写接口（IOrderService）</legend>
    	/**
		 * 款式单保存回写订单数量、价格
		 * @param orderId 订单ID
		 * @param customId 款式单ID
		 */<br>
		public void backWriteByCum(Integer orderId,Integer customId);<br>
		/**
		 * 回写订单状态
		 * @param orderId
		 * @param ista 提交(0)、制版(1)、生产(2)、质检(3)、快递(4)、支付(5)
		 */<br>
		public void updateOrderState(Integer orderId,Integer ista);<br>
		/**
		 * 回写快递单号 且 回写订单状态
		 * @param orderId
		 * @param cnum
		 */<br>
		public void updateOrderCNumber(Integer orderId,String cnum);
    </fieldset>
    
</body>
</html>