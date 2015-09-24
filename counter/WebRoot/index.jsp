<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form action="user.do">
        <input type="text" name="name" />
        <br/>
        <input type="password" name="password" />
        <input type="hidden" name="method" value="log" />
        <br/>
        <input type="submit" value="登录" />
    </form>
    
    <a href="/counter/reg.jsp">注册</a>
</body>
</html>