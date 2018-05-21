package bbs_control;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.topic_model;
import model.user_model;
import bbs_dao.connection;

/**
 * Servlet implementation class userinfo
 */
public class userinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public userinfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String friend_id=request.getParameter("friend_id");
		HttpSession session=request.getSession();
		String sql="select * from user where user_id='"+friend_id+"'";
		String sql2="select topic_id,user_name,topic_name,topic_content,topic_date from topic where user_id='"+friend_id+"'";
		connection conn=new connection();
		java.sql.Connection conn_object=conn.getconn();
		try {
			Statement statement = conn_object.createStatement();
			ResultSet rs = statement.executeQuery(sql);			
			ArrayList<user_model> my_one_friend_list=new ArrayList<user_model>();
			if(rs.next()){
				user_model friend = new user_model(
						rs.getString("user_id"),
						rs.getString("user_name"),
						rs.getString("user_age"),
						rs.getString("user_sex"),
						rs.getString("user_phonenumber"),
						rs.getString("user_signature"),
						rs.getString("user_imageId"),
						rs.getString("user_qiandao")
						);
				my_one_friend_list.add(friend);
			   }	
			session.setAttribute("my_one_friend_list", my_one_friend_list);			
			ResultSet rs2 = statement.executeQuery(sql2);
           ArrayList<topic_model> friend_topic_list=new ArrayList<topic_model>();			
			while(rs2.next()){
				topic_model my_topic = new topic_model();
				my_topic.setTopic_id(rs2.getString("topic_id"));
				my_topic.setUser_name(rs2.getString("user_name"));
				my_topic.setTopic_name(rs2.getString("topic_name"));
				my_topic.setTopic_content(rs2.getString("topic_content"));
				my_topic.setTopic_date(rs2.getString("topic_date"));
				friend_topic_list.add(my_topic);
			}
			session.setAttribute("friend_topic_list", friend_topic_list);
			rs2.close();			
			rs.close();
			statement.close();
			response.sendRedirect("userinfo.jsp");
		  }
			catch(SQLException e){
				e.printStackTrace();
				
			}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
