package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classes.FriendImpl;
import dao.MyFriendsDao;
import util.DBConnection;

/**
 * Servlet implementation class update
 */
@WebServlet(
		urlPatterns = "/update",
		loadOnStartup = 1)
public class UpdateServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		new MyFriendsDao().update(request);
		request.getSession().setAttribute("friends", null);
		request.getRequestDispatcher("lessen/exp_6/index.jsp").forward(request, response);
	}

}
