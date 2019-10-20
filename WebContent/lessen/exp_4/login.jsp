<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%!
	
	private final String USER_NAME     = "user_name";
	private final String USER_PASSWORD = "user_password";

	private final String SAVE_NAME     = "save_name";
	private final String SAVE_PASSWORD = "save_password";
	
	private void deleteCookie(HttpServletRequest request, HttpServletResponse response ,String key) {

		Cookie[] cookies = request.getCookies();
		if(cookies !=null){
            for(int i = 0;i < cookies.length;i++){  //遍历cookie对象集合
                if(cookies[i].getName().equals(key)){//如果cookie对象的名称是mrCookie
                    cookies[i].setMaxAge(0);
                	response.addCookie(cookies[i]);
                }
                
            }
        }
		
	}
	
	%>

	<%
	
	request.setCharacterEncoding("UTF-8");
	
	String mUserName = (String) request.getParameter(USER_NAME);
	String mUserPassword = (String) request.getParameter(USER_PASSWORD);
			
	String[] mShouldSaveName     = request.getParameterValues(SAVE_NAME);
	String[] mShouldSavePassword = request.getParameterValues(SAVE_PASSWORD);
	
	// 判断
	if(!mUserName.equals("abc")) {
		request.setAttribute("name", "用户名不存在");
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}
	
	if(!mUserPassword.equals("123")) {
		request.setAttribute("password", "用户密码不正确");
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}
	
	
	if(mShouldSaveName != null) {
		Cookie mNameCookie = new Cookie(USER_NAME, mUserName);
		mNameCookie.setMaxAge(60 * 60 * 24 * 30);    //设置cookie有效期为30天
		response.addCookie(mNameCookie);//保存cookie
	}else {
		deleteCookie(request, response, USER_NAME);
	}

	if(mShouldSavePassword != null) {
		Cookie mPasswordCookie = new Cookie(USER_PASSWORD, mUserPassword);
		mPasswordCookie.setMaxAge(60 * 60 * 24 * 30);    //设置cookie有效期为30天
		response.addCookie(mPasswordCookie);//保存cookie
	}else {
		deleteCookie(request, response, USER_PASSWORD);
	}
	
	request.setAttribute("name", null);
	request.setAttribute("password", null);
	
	%>
	
	<h1>登录成功</h1>
	
	<a href="index.jsp">重新登录</a>
	
</body>
</html>