package bbs_control;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.friend_model;
import bbs_dao.connection;

public class friend_control {
	connection conn = new connection();
	
	Statement statement;
	ResultSet rs2;

	public List<friend_model> getFriendLis(int b, String user_id) {
		String sql2 = "select user_friend_id,user_friend_name from user_friend where user_id='"
				+ user_id + "' limit " + b + ",10";

		try {
			java.sql.Connection conn_object = conn.getconn();
			statement = conn_object.createStatement();
			rs2 = statement.executeQuery(sql2);
			List<friend_model> friend_list = new ArrayList<friend_model>();
			while (rs2.next()) {
				friend_model friend = new friend_model();
				friend.setFriend_id(rs2.getString("user_friend_id"));
				friend.setFriend_name(rs2.getString("user_friend_name"));

				friend_list.add(friend);

			}
			rs2.close();
			statement.close();
			conn_object.close();
			return friend_list;
		} catch (Exception e) {
			try {

				rs2.close();
				statement.close();
			} catch (Exception e2) {

			}
		}
		return null;
	}

}
