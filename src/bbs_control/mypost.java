package bbs_control;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.topic_model;
import bbs_dao.connection;


public class mypost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public mypost() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		connection conn=new connection();
		java.sql.Connection conn_object=conn.getconn();
		try {
			Statement statement = conn_object.createStatement();
			String sql= "select topic_id,user_name,topic_name,topic_content,topic_date from topic where user_id='"+session.getAttribute("user_id")+"'";
			ResultSet rs = statement.executeQuery(sql);
			ArrayList<topic_model> my_topic_list=new ArrayList<topic_model>();
			
			while(rs.next()){
				topic_model my_topic = new topic_model();
				my_topic.setTopic_id(rs.getString("topic_id"));
				my_topic.setUser_name(rs.getString("user_name"));
				my_topic.setTopic_name(rs.getString("topic_name"));
				my_topic.setTopic_content(rs.getString("topic_content"));
				my_topic.setTopic_date(rs.getString("topic_date"));
				my_topic_list.add(my_topic);
			}
			rs.close();
			statement.close();
			conn_object.close();
			request.setAttribute("my_topic_list", my_topic_list);
			//session.setAttribute("my_topic_list", my_topic_list);
			RequestDispatcher rd = request.getRequestDispatcher("mypost.jsp");
			rd.forward(request, response);
			//response.sendRedirect("mypost.jsp");
		}catch(SQLException e){
			e.printStackTrace();	
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
