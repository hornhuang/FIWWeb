<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
		response.sendRedirect("Loginfrom.jsp");
		return;
	}
	%>
	
	<hr/>
	
	<%
	String id = request.getParameter("m1");
	if(id == null) {
		response.sendRedirect("ListFriend.jsp?p=" + request.getParameter("p"));
		return;
	}

	Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/myfriend", "root", "qaz123456");
	Statement st = con.createStatement();
	String sql = "select * from myfriend where userid = " + id;
	ResultSet rs = st.executeQuery(sql);
	if (rs.next()) {
	%>
		<form action="update.jsp" method="post">
			<table>
				<tr>
					<td>姓名</td>
					<td><input type="text" name="name" value="<%=rs.getString(3)%>"></td>
				</tr>
				<tr>
					<td>性别</td>
					<td><input type="radio" name="sex" value="M" <%rs.getString(4).equals("M")?"checked":"" %> >男</td>
					<td><input type="radio" name="sex" value="F" <%rs.getString(4).equals("F")?"checked":"" %> >女</td>
				</tr>
				<tr>
					<td>年龄</td>
					<td><input type="text" name="name" value="<%=rs.getString(5)%>"></td>
				</tr>
				<tr>
					<td>QQ</td>
					<td><input type="text" name="name" value="<%=rs.getString(6)%>"></td>
				</tr>
				<tr>
					<td>电话</td>
					<td><input type="text" name="name" value="<%=rs.getString(7)%>"></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><input type="text" name="name" value="<%=rs.getString(8)%>"></td>
				</tr>
				<tr>
					<td>地址</td>
					<td><input type="text" name="name" value="<%=rs.getString(9)%>"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="提交"><input type="reset" value="重置"></td>
				</tr>
			</table>
		</form>
	<%} else  {
		
	}
	%>
	
	<%@ include file="Footer.jsp" %>
</body>
</html>