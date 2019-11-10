package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyFriendsDao;
import dao.UserDao;
import util.DBConnection;

/**
 * Servlet implementation class DeleteFriends
 */
@WebServlet(
		urlPatterns = "/deleteFriends",
		loadOnStartup = 1)
public class DeleteFriendsServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public DeleteFriendsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ids[] = request.getParameterValues("m2");
		System.out.println(ids);
		if(ids == null || ids.length == 0) {
			response.sendRedirect("listFriend.jsp?p=" + request.getParameter("p"));
			return;
		}
		System.out.println(ids.length);
		try {
			new MyFriendsDao().delete(ids);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getSession().setAttribute("friends", null);
		request.getRequestDispatcher("lessen/exp_6/index.jsp").forward(request, response);
	}

}
