<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.sun.scenario.effect.impl.state.LinearConvolveRenderState.PassType"%>
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
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String sex = request.getParameter("sex");
	String age = request.getParameter("age");
	String qq = request.getParameter("qq");
	String telephone = request.getParameter("telephone");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	String id = request.getParameter("id");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/myfriend?serverTimezone=GMT", "root", "qaz123456");
	PreparedStatement st = con.prepareStatement("update myfriend set name = ?, sex = ?, age =?, qq =?, telephone =?, email = ?, address =? where id = ?");
	st.setString(1, name);
	st.setString(2, sex);
	st.setInt(3, Integer.parseInt(age));
	st.setString(4, qq);
	st.setString(5, telephone);
	st.setString(6, email);
	st.setString(7, address);
	st.setInt(8, Integer.parseInt(id));
	st.executeUpdate();
	session.setAttribute("friends", null);
	request.setAttribute("msg", "<font color='red'>密码错误</font>");
	request.getRequestDispatcher("Loginform.jsp").forward(request, response);
	%>

</body>
</html>