<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>我的好友录</h1>
<hr>
<form action="<%=request.getContextPath() %>/listFriends?pathName=listFriendsByName.jsp" method="post">
	<input type="text" width="100px" name="name" >
	<input type="submit" value="查询">
</form>
<a href="index.jsp">返回主页</a>
<a href="logout.jsp">注销</a>
<hr>
</body>
</html>