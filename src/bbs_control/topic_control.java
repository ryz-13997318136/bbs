package bbs_control;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.topic_model;
import bbs_dao.connection;

public class topic_control {
	connection conn=new connection();
	
	Statement statement;
	
public List<topic_model> GetTopicList(){
	
	try {
		java.sql.Connection conn_object=conn.getconn();
		statement = conn_object.createStatement();
		String sql= "select * from topic";
		ResultSet topic_rs = statement.executeQuery(sql);
		ArrayList<topic_model> list=new ArrayList<topic_model>();
		while(topic_rs.next()){
			topic_model topic = new topic_model(
					topic_rs.getString("topic_id"),
					topic_rs.getString("user_name"),
					topic_rs.getString("user_id"),
					topic_rs.getString("topic_name"),
					topic_rs.getString("topic_date"),
					topic_rs.getString("topic_content")
					);
			list.add(topic);
		}
		topic_rs.close();
		conn_object.close();
		return list;		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return null;
	}
	
}
public List<topic_model> GetTopicList(int a){
	
	try {
		java.sql.Connection conn_object=conn.getconn();
		statement = conn_object.createStatement();
		String sql= "select * from topic ORDER BY topic_date DESC limit "+a+",10 ";
		ResultSet topic_rs = statement.executeQuery(sql);
		ArrayList<topic_model> list=new ArrayList<topic_model>();
		while(topic_rs.next()){
			topic_model topic = new topic_model(
					topic_rs.getString("topic_id"),
					topic_rs.getString("user_name"),
					topic_rs.getString("user_id"),
					topic_rs.getString("topic_name"),
					topic_rs.getString("topic_date"),
					topic_rs.getString("topic_content")
					);
			list.add(topic);
		}
		topic_rs.close();
		conn_object.close();
		return list;		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return null;
	}
	
}

	public int getTopicCount() {
		try {
			java.sql.Connection conn_object=conn.getconn();
			String sql = "select count(*) as total from topic";
			statement = conn_object.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			String r = "";
			while (rs.next()) {
				r = rs.getString("total");
			}
			rs.close();
			statement.close();
			return Integer.parseInt(r);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}
	
	public List<topic_model> GetTopicList(String sql){
		
		try {
			java.sql.Connection conn_object=conn.getconn();
			statement = conn_object.createStatement();
			ResultSet topic_rs = statement.executeQuery(sql);
			ArrayList<topic_model> list=new ArrayList<topic_model>();
			while(topic_rs.next()){
				topic_model topic = new topic_model(
						topic_rs.getString("topic_id"),
						topic_rs.getString("user_name"),
						topic_rs.getString("user_id"),
						topic_rs.getString("topic_name"),
						topic_rs.getString("topic_date"),
						topic_rs.getString("topic_content")
						);
				list.add(topic);
			}
			topic_rs.close();
			conn_object.close();
			return list;		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
	
}
