<%@page import="java.util.Random"%>
<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>猜数游戏</h1>
	
	<HR align=center width=100% color=#987cb9 SIZE=1>

	<%
	int trueNumber = 0;
	try {
		trueNumber = (int) session.getAttribute("trueNumber");
	} catch (Exception e){
		trueNumber = (new Random()).nextInt(100);
		session.setAttribute("trueNumber", trueNumber );
	}
	out.print("正确答案提示- " + trueNumber + "<br>");
	int guessNumber = Integer.parseInt(request.getParameter("number"));
	if ( guessNumber == trueNumber ) {
		out.print("正确");
		trueNumber = (new Random()).nextInt(100);
		session.setAttribute("trueNumber", trueNumber );
	}else if(guessNumber > trueNumber){
		out.print("大了");
	}else if(guessNumber < trueNumber) {
		out.print("小了");
	}
	%>
	
	<br>
	
	<a href="javascript:history.back(-1)">再来一次...</a>
</body>
</html>