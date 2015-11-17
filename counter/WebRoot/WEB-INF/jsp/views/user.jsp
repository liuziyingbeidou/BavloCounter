<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Model And List</title>
</head>
<body>
	<h3>获取到的Userid是:${UserId}</h3>
	<h3>获取到的Tagname是:${Tagname}</h3>
	<h3>==================</h3>
	<form action="sendMassage.do">
		发送给:	<input type="text" name="touser" value="${UserId}"/><br>
		内容:	<input type="text" name="text" value=""/><input type="submit"/>
	</form>
	<form action="sendTemplateMessages.do">
		发送模板消息:	<input type="submit"/>
	</form>
</body>
</html>