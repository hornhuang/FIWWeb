package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import classes.FriendImpl;
import classes.UserImpl;
import dao.UserDao;
import util.DBConnection;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(
	urlPatterns = "/login",
	loadOnStartup = 1)
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		login(req, resp, req.getSession());
	}
	
	private boolean login(HttpServletRequest request, HttpServletResponse  response, HttpSession session) {
		try {
			String mName     = request.getParameter("name");
			String mPassword = request.getParameter("password");
			List<UserImpl> userImpls = listToUsers(new UserDao().getAll());
			for(UserImpl u : userImpls) {
				if(u.getmUserName().equals(mName)) {
					if(u.getmUserPassword().equals(mPassword)) {
						session.setAttribute("name", mName);
						session.setAttribute("id", u.getId());
						response.sendRedirect("index.jsp");
						return false;
					}else {
						request.setAttribute("msg", "<font color='red'>用户名错误</font>");
						request.getRequestDispatcher("lessen/exp_6/loginForm.jsp").forward(request, response);
						return false;
					}
				}
			}
			request.setAttribute("msg", "<font color='red'>密码错误</font>");
			request.getRequestDispatcher("lessen/exp_6/loginForm.jsp").forward(request, response);
		} catch (Exception e) {
			if (e != null) {
				e.printStackTrace();
			}
			return false;
		}
		return true;
	}
	
	private List<UserImpl> listToUsers(List<Object> objects) {
		List<UserImpl> userImpls = new ArrayList<UserImpl>();
		for(Object o : objects) {
			userImpls.add((UserImpl) o);
		}
		return userImpls;
	}
	
}
