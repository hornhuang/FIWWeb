<%@ page language="java" 

		import="java.io.File"
		import="java.io.FileInputStream"  
		import="java.io.FileNotFoundException"  
		import="java.io.FileOutputStream"  
		import="java.io.IOException"  
		import="java.io.InputStreamReader" 
		import="java.util.Properties"

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
		
		// 识别系统
		private static boolean isOSLinux() {
	        Properties prop = System.getProperties();
	        String os = prop.getProperty("os.name");
	        if (os != null && os.toLowerCase().indexOf("linux") > -1) {
	            return true;
	        } else {
	            return false;
	        }
	    }
		
		// 该方法用于实验二读取文件
		public String readAndSaveTraffic(){
			File file;
			if(isOSLinux()) {
				file = new File("/usr/java/tomcat/apache-tomcat-8.5.46/webapps/MyJspProject", "traffic.txt");	
			}else {
				file = new File("E:/workspace/EclipseWorkspace/MyJspProject", "traffic.txt");
			}
			if(!file.exists()){
				try {  
				    file.createNewFile(); // 创建文件  
				    writeTrafficToFile(0, file);
				} catch (IOException e) {  
				    // TODO Auto-generated catch block  
				    e.printStackTrace();  
				}  
			}   
		        
			int traffic = readTrafficFromFile(file);
			traffic ++;
			writeTrafficToFile(traffic, file);
			return traffic+"";
		}
		
		// 向文件写入内容(输出流)  
		private boolean writeTrafficToFile(int traffic, File file) {
			String str = traffic + "";  
			byte bt[] = new byte[1024];  
			bt = str.getBytes();  
			try {  
			    FileOutputStream in = new FileOutputStream(file);  
			    try {  
			        in.write(bt, 0, bt.length);  
			        in.close();  
			        // boolean success=true;  
			        // System.out.println("写入文件成功");  
			    } catch (IOException e) {  
			        // TODO Auto-generated catch block  
			        e.printStackTrace();  
			    }  
			} catch (FileNotFoundException e) {  
			    // TODO Auto-generated catch block  
			    e.printStackTrace();  
			}  
			return true;
		}
		
		// 读取文件内容 (输入流)
		private int readTrafficFromFile(File file) {
			StringBuffer sb = new StringBuffer();
			try {    
			    FileInputStream out = new FileInputStream(file);  
			    InputStreamReader isr = new InputStreamReader(out);  
			    int ch = 0;  
			    while ((ch = isr.read()) != -1) {  
			        sb.append((char) ch);  
			    }  
			} catch (Exception e) {  
			    // TODO: handle exception  
			} 
			return Integer.parseInt(sb.toString());
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
	String traffic = readAndSaveTraffic(); 
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