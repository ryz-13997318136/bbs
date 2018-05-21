package bbs_control;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bbs_dao.connection;

/**
 * Servlet implementation class liuyan
 */
public class liuyan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public liuyan() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//String user_name = new String(request.getParameter("user_name").getBytes("iso-8859-1"), "utf-8");
		String user_to_id= request.getParameter("friend_id");
		String user_to_name=request.getParameter("friend_name");
		String message_content = request.getParameter("content");
		HttpSession session = request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		String user_name=(String)session.getAttribute("user_name");
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
        String dateNowStr = sdf.format(date);  
		String sql = "insert into liuyan(message_id,user_id,user_name,user_to_id,user_to_name,message_content,date) values('"+
				date.getTime()+"',"
				+ "'"+user_id+"',"
				+ "'"+user_name+"',"
				+ "'"+user_to_id+"',"
				+ "'"+user_to_name+"',"
				+ "'"+message_content+"',"
				+ "'"+dateNowStr+"')";
		connection conn=new connection();
		java.sql.Connection conn_object=conn.getconn();
		try {
			Statement statement = conn_object.createStatement();
			int result = statement.executeUpdate(sql);
			if(result==1){				
	        	statement.close();
	        	conn_object.close();
	        	
	        	response.sendRedirect("userinfo.jsp");
	            
			}
		}catch(SQLException e){
			e.printStackTrace();	
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
