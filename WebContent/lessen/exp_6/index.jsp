<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<hr/>

	<%=session.getAttribute("name") %>
	
	<a href="<%=request.getContextPath() %>/listFriends?pathName=listFriend.jsp">查询所有好友</a><p>
	<a href="queryByName.jsp">按姓名查询所有好友</a>
	
	<%@ include file="footer.jsp" %>
</body>
</html>