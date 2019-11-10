package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.Session;

import dao.MyFriendsDao;
import util.DBConnection;

/**
 * Servlet implementation class addFriendServlet
 */
 @WebServlet(
			urlPatterns = "/addFriend",
			loadOnStartup = 1)
public class addFriendServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    public addFriendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		new MyFriendsDao().add(request);
		request.getSession().setAttribute("friends", null);
		request.getRequestDispatcher("lessen/exp_6/index.jsp").forward(request, response);
	}

}
