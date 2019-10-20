<%@page import="util.FileManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
    import="java.io.File"
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>J2EE 实验</title>
</head>
<body>
	<%!
	
		public final String path = "E:/workspace/EclipseWorkspace/MyJspProject/WebContent/lessen";
	
		public List<String> getFilesName(List<File> files) {
			List<String> names = new ArrayList<>();
			for (File file : files) {
				names.add(file.getName());
			}
			return names;
		}
	%>
	
	<%
	for(String name : getFilesName(FileManager.getAllDirectory(path))) {
		out.print("<a href='../lessen/" + name + "/index.jsp'");
		out.print("<p >" + name + "</p>");
		out.print("</a>");
	}
	%>
	
</body>
</html>