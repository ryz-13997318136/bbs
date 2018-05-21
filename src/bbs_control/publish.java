package bbs_control;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bbs_dao.connection;

/**
 * Servlet implementation class publish
 */
public class publish extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public publish() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");//传值编码
		String topic_name = request.getParameter("title");		
		String topic_content = request.getParameter("content");
		System.out.println(topic_content);
		HttpSession session = request.getSession();
		Date date =  new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
        String dateNowStr = sdf.format(date);  
		
		
		connection conn=new connection();
		java.sql.Connection conn_object=conn.getconn();
		try {
			Statement statement = conn_object.createStatement();
			String sql= "insert into topic(topic_id,user_name,user_id,topic_name,topic_content,topic_date)values('"
					+date.getTime()
					+"','"
					+session.getAttribute("user_name")
					+ "','"
					+session.getAttribute("user_id")
					+ "','"
					+topic_name
					+"','"
					+topic_content
					+"','"
					+dateNowStr+"')";
			System.out.println(sql);
			int result = statement.executeUpdate(sql);
			System.out.println("帖子插入结果:"+result);
			if(result==1){				
	        	statement.close();
	        	conn_object.close();
	        	String state="发布成功，还要再发布一条吗?";
	        	request.setAttribute("state", state);
	        	RequestDispatcher requestDis=request.getRequestDispatcher("publish.jsp"); 
	        	requestDis.forward(request,response);
	            
			}
		}catch(SQLException e){
			e.printStackTrace();	
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	

}
