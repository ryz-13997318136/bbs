package bbs_control;

import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import bbs_dao.connection;
import model.user_model;

public class user_control {

	connection conn=new connection();
	
	Statement statement;
	Date date =  new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
    String dateNowStr = sdf.format(date);  
	
	public List<user_model> getUserList(List list,int num){
		List<user_model> newList = new ArrayList<user_model>();
		int start=0,end=0;
		int size=list.size();
		
		if (size < 10) {
			start = 0;
			end = size;
		}// 不够一页，不够10条数据
		else {
			if (num < size && size <= (num + 10)) {
				start = num;
				end = size;
			}// 不够一页。size=13.num=10
		}
		if (size > (num + 10)) {
			start = num;
			end = num + 10;
		}// 够一页;
		for(int i=start;i<end;i++){
			user_model user = (user_model) list.get(i);
			newList.add(user);
		}
		return newList;
	}
	
	public int getQianDaoTimes(String user_id){
		try {
			String sql = "select qiandao as times from user where user_id='"+user_id+"'";
			java.sql.Connection conn_object=conn.getconn();
			statement = conn_object.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			String r = "";
			while (rs.next()) {
				r = rs.getString("times");
			}
			rs.close();
			statement.close();
			conn_object.close();
			return Integer.parseInt(r);
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
		
	}
	public boolean setQianDaoTimes(String user_id,int newQianDaoTimes){
		boolean tag = isFirstQianDao(user_id);
		if(tag==false){
			return false;
		}
		try {
			String sql = "update user set user_qiandao='"+newQianDaoTimes+"',user_qiandaodate='"+dateNowStr+"' where user_id ='"+user_id+"'";
			java.sql.Connection conn_object=conn.getconn();
			statement = conn_object.createStatement();
			int rs = statement.executeUpdate(sql);			
			statement.close();
			conn_object.close();
			if(rs==1){
				return true;
			}
			else{
				return false;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}
	public boolean isFirstQianDao(String user_id){
		String date = "";
		try {
			String sql = "select user_qiandaodate from user where user_id ='"+user_id+"'";
			java.sql.Connection conn_object=conn.getconn();
			statement = conn_object.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				date = rs.getString("user_qiandaodate");
			}
			rs.close();
			statement.close();
			conn_object.close();
			if(date.equals(dateNowStr)){
				return false;
			}
			else{
				return true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			return true;
		}
	
	}
	public boolean IsFirstLogin(String user_id){
		String logintime = "";
		try {
			String sql = "select user_logintime from user where user_id ='"+user_id+"'";
			java.sql.Connection conn_object=conn.getconn();
			statement = conn_object.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				logintime = rs.getString("user_logintime");
			}
			rs.close();
			statement.close();
			conn_object.close();
			if(logintime==null){
				return true;
			}
			else{
				return false;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	public String SetLoginTime(String user_id,String str) {

		try {
			String sql ="";
			if(str==null){
				 sql = "update user set user_logintime = "+str+" where user_id ='" + user_id + "'";
			}
			else{
				 sql = "update user set user_logintime = '"+str+"' where user_id ='" + user_id + "'";
			}
			java.sql.Connection conn_object=conn.getconn();
			statement = conn_object.createStatement();
			int rs = statement.executeUpdate(sql);

			statement.close();
			conn_object.close();
			return str;

		} catch (Exception e) {
			// TODO: handle exception
            return null;
		}
	}
	
	public String GetLoginTime(String user_id) {
        String LoginTime = null;
		try {
			String sql = "select user_logintime  from user where user_id ='" + user_id + "'";	
			java.sql.Connection conn_object=conn.getconn();
			statement = conn_object.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				LoginTime = rs.getString("user_logintime");
			}
			statement.close();
			conn_object.close();
			return LoginTime;

		} catch (Exception e) {
			// TODO: handle exception
            return null;
		}
	}
		
	
}
