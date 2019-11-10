package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import com.sun.org.apache.bcel.internal.generic.NEW;

import classes.FriendImpl;
import classes.UserImpl;
import util.DBConnection;

public class MyFriendsDao implements BaseDao{

	@Override
	public int add(Object obj) {
		HttpServletRequest request = (HttpServletRequest) obj;
		int userid	     = (int) request.getSession().getAttribute("id");
		String name 	 = request.getParameter("name");
		String sex		 = request.getParameter("sex");
		String age 	     = request.getParameter("age");
		String qq 		 = request.getParameter("qq");
		String telephone = request.getParameter("telephone");
		String email 	 = request.getParameter("email");
		String address   = request.getParameter("address");
		Connection con   = DBConnection.getInstance().getConnection();
		try {
			PreparedStatement st = con.prepareStatement("INSERT INTO myfriend (name,sex,age,qq,telephone,email,address,userid) VALUES (?,?,?,?,?,?,?,?)");
			st.setString(1, name);
			st.setString(2, sex);
			st.setInt(3, Integer.parseInt(age));
			st.setString(4, qq);
			st.setString(5, telephone);
			st.setString(6, email);
			st.setString(7, address);
			st.setInt(8, userid);
			st.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return this.DAO_SUCCEED;
	}

	@Override
	public int update(Object obj) {
		HttpServletRequest request = (HttpServletRequest) obj;
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String sex	= request.getParameter("sex");
		String age 	= request.getParameter("age");
		String qq 	= request.getParameter("qq");
		String telephone = request.getParameter("telephone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		Connection con = DBConnection.getInstance().getConnection();
		try {
			PreparedStatement st = con.prepareStatement("update myfriend set name = ?, sex = ?, age =?, qq =?, telephone =?, email = ?, address =? where id = ?");
			st.setString(1, name);
			st.setString(2, sex);
			st.setInt(3, Integer.parseInt(age));
			st.setString(4, qq);
			st.setString(5, telephone);
			st.setString(6, email);
			st.setString(7, address);
			st.setInt(8, Integer.parseInt(id));
			st.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return this.DAO_SUCCEED;
	}

	@Override
	public int delete(Object key) {
		try {
			String ids[] = (String[]) key;
			Connection con = DBConnection.getInstance().getConnection();
			for( String id : ids ) {
				PreparedStatement st = con.prepareStatement("DELETE FROM myfriend where id = " + id);
				st.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public List<Object> getBy(String where) {
		List<Object> list = new ArrayList<Object>();
		try {
			Connection con = DBConnection.getInstance().getConnection();
			Statement st = con.createStatement();
			ResultSet rs = null;
			rs = st.executeQuery(where);
			while (rs!=null && rs.next()) {
				FriendImpl friendImpl = new FriendImpl();
				friendImpl.setId(Integer.parseInt(rs.getString(1)));
				friendImpl.setUserId(Integer.parseInt(rs.getString(2)));
				friendImpl.setName(rs.getString(3));
				friendImpl.setSex(rs.getString(4));
				friendImpl.setAge(Integer.parseInt(rs.getString(5)));
				friendImpl.setQq(rs.getString(6));
				friendImpl.setTelephone(rs.getString(7));
				friendImpl.setEmail(rs.getString(8));
				friendImpl.setAdress(rs.getString(9));
				list.add(friendImpl);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Object> getAll() {
		List<Object> list = new ArrayList<>();
		UserImpl user = new UserImpl();
		user.setmUserName("abc");
		user.setmUserPassword("123");
		list.add(user);
		return list;
	}

	@Override
	public boolean exits(Object key) {
		return false;
	}

	@Override
	public long getCount(String where) {
		return 0;
	}

}
