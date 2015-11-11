<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${ctx }/resources/jquery.multiDialog/js/jquery/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(function(){
	$(".multidialog").click(function(){
		var cont = $("#api-button",window.parent.document).text();
		alert(cont);
	});
});
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
    6、<a href="${ctx}/custom/edit.do">定制单</a>
       <a href="${ctx}/custom/getList.do">定制单列表</a>
       <a href="${ctx}/custom/detail.do">定制单详细</a>
    <br>
    <br>
     <fieldset>
    	<legend>订单→定制单→订单</legend>
    	1、订单中添加定制单时调用url=info.do?orderId="+data.id+"&customerId="+customerId{orderId:订单ID,customerId:客户ID}<br>
    	2、定制单中点击保存调用该方法（调用方式）:window.opener.loadCumById(定制单ID);
    	3、定制单保存后需要回写订单中的子表信息；回写条件：订单ID+定制单ID
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
</body>
</html>