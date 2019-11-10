<%@page import="util.DBConnection"%>
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
	
	<hr/>
	
	<%
	String id = request.getParameter("m1");
	if(id == null) {
		response.sendRedirect("listFriend.jsp?p=" + request.getParameter("p"));
		return;
	}

	Connection con = DBConnection.getInstance().getConnection();
	Statement st = con.createStatement();
	String sql = "select * from myfriend where id = " + id;
	ResultSet rs = st.executeQuery(sql);
	if (rs.next()) {
	%>
		<form action="<%=request.getContextPath() %>/update?id=<%=rs.getString(1) %>&p=<%=request.getParameter("P") %>" method="post">
		<input type="hidden" name="id" value="<%=rs.getString("id") %>">
			<table>
				<tr>
					<td>姓名</td>
					<td><input type="text" name="name" value="<%=rs.getString(3)%>"></td>
				</tr>
				<tr>
					<td>性别</td>
					<td><input type="radio" name="sex" value="M" <%=rs.getString(4).equals("M")?"checked":"" %> >男</td>
					<td><input type="radio" name="sex" value="F" <%=rs.getString(4).equals("F")?"checked":"" %> >女</td>
				</tr>
				<tr>
					<td>年龄</td>
					<td><input type="text" name="age" value="<%=rs.getString(5)%>"></td>
				</tr>
				<tr>
					<td>QQ</td>
					<td><input type="text" name="qq" value="<%=rs.getString(6)%>"></td>
				</tr>
				<tr>
					<td>电话</td>
					<td><input type="text" name="telephone" value="<%=rs.getString(7)%>"></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><input type="text" name="email" value="<%=rs.getString(8)%>"></td>
				</tr>
				<tr>
					<td>地址</td>
					<td><input type="text" name="address" value="<%=rs.getString(9)%>"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="提交"><input type="reset" value="重置"></td>
				</tr>
			</table>
		</form>
	<%} else  {
		
	}
	%>
	
	<%@ include file="footer.jsp" %>
</body>
</html>