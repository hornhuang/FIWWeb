package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import classes.FriendImpl;
import dao.MyFriendsDao;
import util.DBConnection;

/**
 * Servlet implementation class ListFriendsServlet
 */
@WebServlet(
		urlPatterns = "/listFriends",
		loadOnStartup = 1)
public class ListFriendsServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pathName = request.getParameter("pathName");
		request.getSession().setAttribute("queryName",request.getParameter("name"));
		try {
			HttpSession session = request.getSession();
			String name = request.getParameter("n");
			ResultSet rs = null;
			if(session.getAttribute("friends") == null){
				String sql = "select * from myfriend where userid = " + 
					"(select userid from user where name = '" + session.getAttribute("name") + "')";
				if(name != null) {
					sql += " and name like '%" + name + "%'";
				}
				List<Object> objects = new MyFriendsDao().getBy(sql);
				List<FriendImpl> friendImpls = listToFriends(objects);
				System.out.println(friendImpls.size() + " --- " + objects.size());
				session.setAttribute("friends", friendImpls);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		response.sendRedirect("lessen/exp_6/" + pathName);
	}
	
	private List<FriendImpl> listToFriends(List<Object> objects) {
		List<FriendImpl> friendImpls = new ArrayList<FriendImpl>();
		for(Object o : objects) {
			friendImpls.add((FriendImpl) o);
		}
		return friendImpls;
	}

}
