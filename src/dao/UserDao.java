package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import classes.UserImpl;
import util.DBConnection;

public class UserDao implements BaseDao{

	@Override
	public int add(Object obj) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Object obj) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Object key) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Object> getBy(String where) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> getAll() {
		List<Object> list = new ArrayList<Object>();
		try {
			Connection con = DBConnection.getInstance().getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from user");
			while (rs.next()) {
				UserImpl u = new UserImpl();
				u.setId(Integer.parseInt(rs.getString(1)));
				u.setmUserName(rs.getString(2));
				u.setmUserPassword(rs.getString(3));
				list.add(u);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean exits(Object key) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public long getCount(String where) {
		// TODO Auto-generated method stub
		return 0;
	}

}
