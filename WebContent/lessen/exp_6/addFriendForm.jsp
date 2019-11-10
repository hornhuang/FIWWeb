<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DBConnection"%>
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
	<form action="<%=request.getContextPath() %>/addFriend?id=<%=session.getAttribute("id")%>" method="post">
		<table>
			<tr>
				<td>姓名</td>
				<td><input type="text" name="name" value=""></td>
			</tr>
			<tr>
				<td>性别</td>
				<td><input type="radio" name="sex" value="M" checked>男</td>
				<td><input type="radio" name="sex" value="F" >女</td>
			</tr>
			<tr>
				<td>年龄</td>
				<td><input type="text" name="age" value=""></td>
			</tr>
			<tr>
				<td>QQ</td>
				<td><input type="text" name="qq" value=""></td>
			</tr>
			<tr>
				<td>电话</td>
				<td><input type="text" name="telephone" value=""></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="email" value=""></td>
			</tr>
			<tr>
				<td>地址</td>
				<td><input type="text" name="address" value=""></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="提交"><input type="reset" value="重置"></td>
			</tr>
		</table>
	</form>
	
	<%@ include file="footer.jsp" %>
</body>
</html>