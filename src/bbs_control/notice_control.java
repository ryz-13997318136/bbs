package bbs_control;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import model.notice_model;
import model.topic_model;
import bbs_dao.connection;

public class notice_control {
	connection conn=new connection();
	
	Statement statement;

public ArrayList<notice_model> getNoticeList(){
	
	
	try {
		java.sql.Connection conn_object=conn.getconn();
		statement = conn_object.createStatement();
		String sql= "select * from notice";
		ResultSet notice_rs = statement.executeQuery(sql);
		ArrayList<notice_model> list=new ArrayList<notice_model>();
		while(notice_rs.next()){
			notice_model notice = new notice_model(
					notice_rs.getString("notice_id"),
					notice_rs.getString("notice_name"),
					notice_rs.getString("notice_content"),
					notice_rs.getString("notice_date")
					);
			list.add(notice);
		}
		notice_rs.close();
		conn_object.close();
		return list;		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return null;
	}
	
	
}

public ArrayList<notice_model> getNoticeList(String notice_id){
	
	
	try {
		java.sql.Connection conn_object=conn.getconn();
		statement = conn_object.createStatement();
		String sql= "select * from notice where notice_id = '"+notice_id+"'";
		ResultSet notice_rs = statement.executeQuery(sql);
		ArrayList<notice_model> list=new ArrayList<notice_model>();
		while(notice_rs.next()){
			notice_model notice = new notice_model(
					notice_rs.getString("notice_id"),
					notice_rs.getString("notice_name"),
					notice_rs.getString("notice_content"),
					notice_rs.getString("notice_date")
					);
			list.add(notice);
		}
		notice_rs.close();
		conn_object.close();
		return list;		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return null;
	}
	
	
}


}
