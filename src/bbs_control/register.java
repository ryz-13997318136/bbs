package bbs_control;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs_dao.connection;


public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public register() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");//传值编码
		String name = request.getParameter("user_name");			
		String sex = request.getParameter("sex");
		String age = request.getParameter("age");			
		String phone_number = request.getParameter("phone_number");
		String password = request.getParameter("password_one");			
		String signature = request.getParameter("signature");
		connection conn=new connection();
		java.sql.Connection conn_object=conn.getconn();
		Date date= new Date();
		Statement statement;
		String state="";
		try {
			statement = conn_object.createStatement();
			String sql= "insert into user(user_id,user_name,user_password,user_age,user_sex,user_phonenumber,user_signature) values('"+date.getTime()
					+"','"
					+name+"','"
					+password +"','"
					+age+"','"
					+sex+"','"
					+phone_number+"','"
					+signature+"')";
			int result = statement.executeUpdate(sql);
			if(result==1){
				state="注册成功，赶快去登录吧!";
				statement.close();
				conn_object.close();
				request.setAttribute("state", state);
	        	RequestDispatcher requestDis=request.getRequestDispatcher("Register.jsp"); 
	        	requestDis.forward(request,response);
			}else{
				state="该用户已经注册过了，请换一个用户名！";
				statement.close();
				conn_object.close();
				request.setAttribute("state", state);
	        	RequestDispatcher requestDis=request.getRequestDispatcher("Register.jsp"); 
	        	requestDis.forward(request,response);
			}
	}catch(SQLException e){
		state="注册失败，请重试！";
		request.setAttribute("state", state);
    	RequestDispatcher requestDis=request.getRequestDispatcher("Register.jsp"); 
    	requestDis.forward(request,response);
	}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
