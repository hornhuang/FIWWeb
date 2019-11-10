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
	if(session.getAttribute("name") == null) {
		response.sendRedirect("Loginform.jsp");
		return;
	}
	%>
	
	<hr/>
	
	<a href="ListFriend.jsp">查询所有好友</a><p>
	<a href="QueryByName.jsp">按姓名查询所有好友</a>
	
	<%@ include file="Footer.jsp" %>
</body>
</html>