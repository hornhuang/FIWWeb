<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	if(request.getAttribute("msg") != null) {
		out.print(request.getAttribute("msg"));
	}
	%>
	<form action="<%=request.getContextPath() %>/login" method="post">
		登陆名称：<input name="name" value="abc"><br/>
		登录密码：<input type="password" name="password" value="123"><br/>
		<input type="submit" value="登录"/>
		<input type="reset" value="重置"/>
		<input type="button" value="注册" onclick="window.location='resisterform.jsp'"/>
	</form>
</body>
</html>