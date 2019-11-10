package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.List;

import com.sun.org.apache.bcel.internal.generic.NEW;

public class DBConnection {

	List<Connection> pooList;
	
	private static DBConnection instance;
	
	private DBConnection() {
		pooList = new ArrayList<Connection>();
		addConnection();
	}
	
	private void addConnection() {
		for (int i = 0; i <10; i++) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/myfriend?serverTimezone=GMT", "root", "qaz123456");
				pooList.add(connection);
			} catch (Exception e) {
				// TODO: handle exception
				if (e != null) {
					e.printStackTrace();
				}
			}
		}
	}
	
	public static DBConnection getInstance() {
		if (instance == null) {
			instance = new DBConnection();
		}
		return instance;
	}
	
	public Connection getConnection() {
		if (pooList.size() == 0) {
			addConnection();
		}
		return pooList.remove(0);
	}
	
	public void release( Connection connection ) {
		if (connection != null) {
			pooList.add(connection);
		}
	}
	
}
