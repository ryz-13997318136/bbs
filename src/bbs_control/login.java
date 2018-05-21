package bbs_control;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.friend_model;
import model.notice_model;
import model.topic_model;

import com.mysql.jdbc.Connection;

import bbs_dao.connection;

/**
 * Servlet implementation class login
 */
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
    }	
    user_control uc = new user_control();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		    request.setCharacterEncoding("UTF-8");
		    HttpSession session = request.getSession();
			String name = request.getParameter("user_name");			
			String password = request.getParameter("user_password");
			connection conn=new connection();
			java.sql.Connection conn_object=conn.getconn();
	
			try {
				Statement statement = conn_object.createStatement();
				String sql= "select user_id,user_name,user_age,user_sex,user_phonenumber,user_signature,user_imageId,user_qiandao from user a where a.user_name='"+ name+ "' and a.user_password='"+password+ "'";
				
				ResultSet rs = statement.executeQuery(sql);
				//session保存用户的信息
				if(rs.next()){
					//该用户是合法用户，现在判断是不是第一次登陆
					boolean IsFirstLogin = CasTest(rs.getString("user_id"));
					if(IsFirstLogin==false){
						String info = "您在其他地方已登录，不能二次登陆！";
						session.setAttribute("user_id", rs.getString("user_id"));
			        	request.setAttribute("info",info);
			        	
			        	rs.close();
			        	statement.close();
			        	conn_object.close();
			        	
						RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
						rd.forward(request, response);
		
					}
					else{
						//第一次登陆，设置登录时间到数据库中
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh-mm-ss");
						java.util.Date date = new java.util.Date();
						String str = sdf.format(date);
						
						String user_logintime = uc.SetLoginTime(rs.getString("user_id"),str);
						
						 session.setAttribute("user_logintime", user_logintime);
						 
					     session.setAttribute("user_id", rs.getString("user_id"));
					     session.setAttribute("user_name", rs.getString("user_name"));
					     session.setAttribute("user_age", rs.getString("user_age"));
					     session.setAttribute("user_sex", rs.getString("user_sex"));
					     session.setAttribute("user_phonenumber", rs.getString("user_phonenumber"));
					     session.setAttribute("user_signature", rs.getString("user_signature"));
					     session.setAttribute("imageid", rs.getString("user_imageId"));
					     session.setAttribute("user_qiandao", rs.getString("user_qiandao"));
					   
			        	rs.close();
			        	statement.close();
			        	conn_object.close();
			        	
			        	response.sendRedirect("main?action=shou");
					}
			            
			        }
				else{
					rs.close();
		        	statement.close();
		        	conn_object.close();
		        	String info = "您输入的用户名或密码错误！";
		        	request.setAttribute("info",info);
					RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
					rd.forward(request, response);
		        	//response.sendRedirect("Login.jsp?info="+info+"");
				 }
				
			}catch(SQLException e){
				System.out.println("查询数据库出现异常！");
				RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
				rd.forward(request, response);
			}
		}
		
		
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	public boolean CasTest(String user_id) {
		
		boolean tag = uc.IsFirstLogin(user_id);
		if(tag==true){
			return true;
		}
		else{
			return false;
		}
	}

}
