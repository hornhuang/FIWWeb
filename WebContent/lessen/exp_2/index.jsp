<%@ page language="java" 

		import="java.io.File"
		import="java.io.FileInputStream"  
		import="java.io.FileNotFoundException"  
		import="java.io.FileOutputStream"  
		import="java.io.IOException"  
		import="java.io.InputStreamReader" 
		import="java.util.Properties"
		import="visitors.Count"

contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	JSP 教学
	<br>
	<br>
	====定义全局 变量/方法 ：====
	<br>
	<%! 
		// 全局变量
		public String mBookName;
		public void init(String name) {
			mBookName = name;
		}
		
	%>
	
	<br>
	<br>
	===定义 局部变量/java语句====
	<br>
	<%
		String mName = "jspText";
		out.print("hello" + mName);
		init("this is your name");
	%>
	
	<br>
	<br>
	=====输出表达式  《与局部变量区别：句末无 ”；“ 号》	=====
	<br>
	<%="hello " + mBookName %>
	
	<br>
	<br>
	==== 实验二 ====
	<br>
	<table style="margin-left: auto; margin-right: auto; border: 1">
	<%
		for(int i = 1 ; i < 10 ; i ++ ) {
			 
			 out.print("<tr>");
			 for(int j = 1 ; j < 10 ; j++){
				if(j <= i){
					 out.print("<td style=' width: 100px'>" + j + "*" + i + "=" + (i * j) + "</td>");
				 }}
				
				 out.print("</tr>");
		}
			
	%> 
	</table>
	
	
	<br>
	<br>
	==== 实验二 获得计数 ====
	<br>
	<% 
	String traffic = Count.readAndSaveTraffic(); 
	out.print("" + traffic + "<br><br>");
	for(int i = 6 ; i > 0 ; i--) {
		if(traffic.length() > 6){
			out.print("访问人数已越界，请联系管理员");
		}
		if(i > traffic.length()){
			out.print("<img src='visitor_count/0.GIF'  style='width: 50px; height:100px'>");
		}else{
			out.print("<img src='visitor_count/" + traffic.charAt(traffic.length()-i) + ".GIF' style='width: 50px; height:100px'>");
		}
	}
	%>
</body>
</html>