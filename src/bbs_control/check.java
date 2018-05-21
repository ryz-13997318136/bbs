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

import model.sub_topic_model;
import model.topic_model;
import bbs_dao.connection;

public class check extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public check() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		String local_user = (String)session.getAttribute("user_name");
		
		String topic_id=request.getParameter("topic_id");
		
		String user_name=null,topic_name=null,topic_content=null,topic_date=null;
		connection conn=new connection();
		java.sql.Connection conn_object=conn.getconn();
		try {
			Statement statement = conn_object.createStatement();
			String sql2="select user_name,topic_name,topic_content,topic_date from topic where topic_id='"+topic_id+"'";
			String sql3="select topic_id,sub_topic_id,sub_user_name,sub_topic_content from sub_topic where topic_id='"+topic_id+"'";
			ResultSet rs2 = statement.executeQuery(sql2);			
			ArrayList<topic_model> list2=new ArrayList<topic_model>();
			if(rs2.next()){
				topic_model topic = new topic_model(
						topic_id,
						rs2.getString("user_name"),
						rs2.getString("topic_name"),
						rs2.getString("topic_content"),
						rs2.getString("topic_date")
						);
				list2.add(topic);
			   }					
			rs2.close();
			ResultSet rs3 = statement.executeQuery(sql3);//�����������һ�����ӵ��������۵����
			
			ArrayList<sub_topic_model> list3=new ArrayList<sub_topic_model>();
			while(rs3.next()){
				sub_topic_model sub_topic = new sub_topic_model(
						rs3.getString("topic_id"),
						rs3.getString("sub_topic_id"),
						rs3.getString("sub_topic_content"),								
						rs3.getString("sub_user_name")								
						);
				list3.add(sub_topic);
			}
//			    request.setAttribute("list", list);//��������ȥ
//				request.setAttribute("user_name", user_name);
//				request.setAttribute("topic_id", topic_id);
//				request.setAttribute("topic_name", topic_name);
//				request.setAttribute("topic_content", topic_content);
//				request.setAttribute("topic_date", topic_date);
//				request.setAttribute("local_user", local_user);
			session.setAttribute("list2", list2);
			session.setAttribute("list3", list3);
				rs3.close();
				statement.close();
				conn_object.close();
				
//				RequestDispatcher rd = request.getRequestDispatcher("check.jsp");
//				rd.forward(request, response);
				response.sendRedirect("check.jsp");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
