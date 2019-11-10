<%@page import="classes.FriendImpl"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
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
	int p = request.getParameter("p") == null ? 1 : Integer.parseInt(request.getParameter("p"));
	int c = request.getParameter("c") == null ? 10 : Integer.parseInt(request.getParameter("c"));
	%>
	
	<script type="text/javascript">
		function function1() {
			document.myform.action = "updateform.jsp?p=<%=p%>";
			document.myform.submit();
		}
		
		function function2() {
			document.myform.action = "<%=request.getContextPath() %>/deleteFriends?p=<%=p%>";
			document.myform.submit();
		}
	</script>
	
	<a href="addFriendForm.jsp">添加好友</a>
	<a href="#" onclick="function2()">删除好友</a>
	<a href="#" onclick="function1()">修改好友</a>
	<a href="index.jsp">返回首页</a>
	
	<%
	List<FriendImpl> friendImpls = (List<FriendImpl>) session.getAttribute("friends");
	if(friendImpls == null) {
		return;
	}
	int flag = c*(p-1)+1;
	out.println("<form action='' name='myform' method='POST'><table border = 1>");
	out.println("<th>修改</th> <th>删除</th> <th>姓名</th> <th>性别</th> <th>年龄</th> <th>QQ</th> <th>电话</th> <th>Email</th> <th>地址</th>");
	for(int j = 0 ; j < c ; j++) {
		if(flag >= friendImpls.size()) {
			break;
		}
		FriendImpl friendImpl = friendImpls.get(flag++);
		out.println("<tr>");
		out.print("<td><input type='radio' name='m1' value='" + friendImpl.getId() + "'/></td>");
		out.print("<td><input type='checkbox' name='m2' value='" + friendImpl.getId() + "'/></td>");
		out.print("<td>" + friendImpl.getName() + "</td>");
		out.print("<td>" + friendImpl.getSex() + "</td>");
		out.print("<td>" + friendImpl.getAge() + "</td>");
		out.print("<td>" + friendImpl.getQq() + "</td>");
		out.print("<td>" + friendImpl.getTelephone() + "</td>");
		out.print("<td>" + friendImpl.getEmail() + "</td>");
		out.print("<td>" + friendImpl.getAdress() + "</td>");
		out.println("</tr>");
	}
	int r = friendImpls.size();
	int rows = (int)Math.ceil((double)r/c);
	out.println("</table></form>");
	out.println("<a href='listFriend.jsp?p=1'>|<</a>");
	for(int i = 0 ; i <= rows ; i++) {
		out.println("<a href='listFriend.jsp?p=" + i + "'> " + (i+1) + " </a>");
	}
	out.println("<a href='listFriend.jsp?p=" + (int)Math.ceil((double)r/c) + "'>>|</a>");
	
	%>
	
</body>
</html>