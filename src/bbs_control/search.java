package bbs_control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.topic_model;
import bbs_dao.connection;

public class search extends HttpServlet {

	
	public search() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String key,scope,type,sql = null;
		request.setCharacterEncoding("UTF-8");//传值编码
		key=request.getParameter("key");
		scope = request.getParameter("scope");
		type = request.getParameter("type");
		//模糊查找
		if(type.equals("M")){
		if(scope.equals("0")){
			sql="select * from topic where user_name like '%"+key+"%' or topic_name like '%"+key+"%'";
		}
		if(scope.equals("1")){
			sql="select * from topic where user_name like '%"+key+"%'";
		}
		if(scope.equals("2")){
			sql="select * from topic where topic_name like '%"+key+"%'";
		}
		}
		//精确查找
		if(type.equals("J")){
			if(scope.equals("0")){
				sql="select * from topic where user_name ='"+key+"' or topic_name ='"+key+"'";
			}
			if(scope.equals("1")){
				sql="select * from topic where user_name = '"+key+"'";
			}
			if(scope.equals("2")){
				sql="select * from topic where topic_name = '"+key+"'";
			}
			}
		topic_control tc = new topic_control();
		List<topic_model> list = tc.GetTopicList(sql);
		request.setAttribute("key", key);
		request.setAttribute("scope", scope);
		request.setAttribute("searched_list", list);		
		RequestDispatcher rd = request.getRequestDispatcher("search.jsp");
		rd.forward(request, response);
		
		
		

	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
