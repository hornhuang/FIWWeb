<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>实验四  Cookie</title>
</head>
<body>
   
	<%!

	private final String USER_NAME     = "user_name";
	private final String USER_PASSWORD = "user_password";
	
	%>
   
   
    <form action="login.jsp" method="post">

        <table>
                
	<%
	
	String mUserName = "", mUserPassword = "";
	String mNameError = null, mPasswordError = null;
	
	Cookie[] cookies = request.getCookies();
	if(cookies != null) {
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals(USER_NAME)){
				mUserName = cookie.getValue();
			}
			if(cookie.getName().equals(USER_PASSWORD)){
				mUserPassword = cookie.getValue();
			}
		}
	}
	try {
		mNameError     = (String) request.getAttribute("name");
		mPasswordError = (String) request.getAttribute("password");
	}catch(NullPointerException e){
		e.printStackTrace();
	}

	if(mNameError != null && mNameError.equals("用户名不存在")) {
		out.print("<tr><td></td><td>" + mNameError + "</td></tr>");
	}
	
	out.print("<tr><td>用户名称</td><td><input type='text' name='user_name' value='" + mUserName + "'></td>");
	out.print("</tr>");
	
	if(mPasswordError != null && mPasswordError.equals("用户密码不正确")) {
		out.print("<tr><td></td><td>" + mPasswordError + "</td></tr>");
	}
	
	out.print("<tr>");
	out.print("<td>用户名称</td>");
	out.print("<td><input type='text' name='user_password' value='" + mUserPassword + "'></td>");
	
	%>
                
            </tr>

            <tr>
                <td colspan="2"><input type="checkbox" name="save_name">自动记录名称</input> </td>
            </tr>

            <tr>
                <td colspan="2"><input type="checkbox" name="save_password">自动记录密码</input> </td>
            </tr>

            <tr>
                <td><input type="submit" value="登录"></td>
                <td><input type="reset" value="重置"></td>
            </tr> 

        </table>

    </form>
	
</body>
</html>