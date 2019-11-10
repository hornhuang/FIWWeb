<%@page import="util.DBConnection"%>
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
	String mName     = request.getParameter("name");
	String mPassword = request.getParameter("password");
	Connection con = DBConnection.getInstance().getConnection();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from user");
	while(rs.next()){
		if(rs.getString(2).equals(mName)) {
			if(rs.getString(3).equals(mPassword)) {
				session.setAttribute("name", mName);
				response.sendRedirect("index.jsp");
				return;
			}else {
				request.setAttribute("msg", "<font color='red'>用户名错误</font>");
				request.getRequestDispatcher("Loginfrom.jsp").forward(request, response);
				return;
			}
		}
	}
	request.setAttribute("msg", "<font color='red'>密码错误</font>");
	request.getRequestDispatcher("Loginfrom.jsp").forward(request, response);
	%>

</body>
</html>