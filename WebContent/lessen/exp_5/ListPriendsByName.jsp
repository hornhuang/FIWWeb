<%@page import="com.sun.xml.internal.bind.util.Which"%>
<%@page import="jdk.nashorn.internal.objects.annotations.Where"%>
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
	int p = request.getParameter("p") == null ? 1 : Integer.parseInt(request.getParameter("p"));
	int c = request.getParameter("c") == null ? 10 : Integer.parseInt(request.getParameter("c"));
	String friendsName = request.getParameter("name");
	out.print(friendsName);
	%>
	<script type="text/javascript">
		function function1() {
			document.myform.action = "updateform.jsp?p=<%=p%>";
			document.myform.submit();
		}
		
		function function2() {
			document.myform.action = "delete.jsp?p=<%=p%>";
			document.myform.submit();
		}
	</script>
	
	<a href="addFriendForm.jsp">添加好友</a>
	<a href="#" onclick="function2()">删除好友</a>
	<a href="#" onclick="function1()">修改好友</a>
	<a href="index.jsp">返回首页</a>
	
	<%@ include file="Header.jsp" %>
	<%
	if(session.getAttribute("name") == null) {
		response.sendRedirect("Loginform.jsp");
		return;
	}
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("n");
	ResultSet rs = null;
	if(session.getAttribute("friends") == null){
		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/myfriend?serverTimezone=GMT", "root", "qaz123456");
		Statement st = con.createStatement();
		String sql = "select * from myfriend where userid = " + 
			"(select userid from user where name = '" + session.getAttribute("name") + "')";
		if(name != null) {
			sql += " and name like '%" + name + "%'";
		}
		rs = st.executeQuery(sql);
		session.setAttribute("friends", rs);
	}else {
		rs = (ResultSet) session.getAttribute("friends");
	}
	rs.absolute(c*(p-1)+1);
	out.println("<form action='' name='myform' method='POST'><table border = 1>");
	out.println("<th>修改</th> <th>删除</th> <th>姓名</th> <th>性别</th> <th>年龄</th> <th>QQ</th> <th>电话</th> <th>Email</th> <th>地址</th>");
	for(int j = 0 ; j < c ; j++) {
		if(!rs.getString("name").contains(friendsName)) {
			if(!rs.next()) {
				break;
			}
			continue;
		}
		out.println("<tr>");
		out.print("<td><input type='radio' name='m1' value='" + rs.getString(1) + "'/></td>");
		out.print("<td><input type='checkbox' name='m2' value='" + rs.getString(1) + "'/></td>");
		for(int i = 3 ; i <= 9 ; i++) {
			out.print("<td>" + rs.getString(i) + "</td>");
		}
		out.println("</tr>");
		if(!rs.next()) {
			break;
		}
	}
	rs.last();
	int r = rs.getRow();
	int rows = (int)Math.ceil((double)r/c);
	out.println("</table></form>");
	out.println("<a href='ListFriend.jsp?p=1'>|<</a>");
	for(int i = 0 ; i <= rows ; i++) {
		out.println("<a href='ListFriend.jsp?p=" + i + "'> " + (i+1) + " </a>");
	}
	out.println("<a href='ListFriend.jsp?p=" + (int)Math.ceil((double)r/c) + "'>>|</a>");
	
	%>
	<%@ include file="Footer.jsp" %>
	
</body>
</html>