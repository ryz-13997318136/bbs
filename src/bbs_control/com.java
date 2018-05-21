package bbs_control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.friend_model;
import model.liuyan_model;
import model.topic_model;
import model.user_model;
import bbs_dao.connection;

/**
 * Servlet implementation class com
 */
public class com extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public com() {
		super();
		// TODO Auto-generated constructor stub
	}

	// 这里通过参数的判断执行多个请求
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		user_control uc = new user_control();
    //在此处判断CAS	
//		String logintime = uc.GetLoginTime(session.getAttribute("user_id").toString());
//		if(!session.getAttribute("user_logintime").toString().equals(logintime)){
//			
//			session.invalidate();
//			String info = "您在其他地方已登录，被迫！";
//        	request.setAttribute("info",info);
//			
//			
//		}
//		
		
		
		
		
		
		
		
		
		if (action.equals("logout")) {		
			try{
			uc.SetLoginTime(session.getAttribute("user_id").toString(), null);
			}catch(NullPointerException e){
				System.out.println("用户session过期，无法清除登录时间");
			}
			session.invalidate();
			response.sendRedirect("Login.jsp");

		}
		if(action.equals("xiaxian")){
			
			uc.SetLoginTime(session.getAttribute("user_id").toString(), null);
			session.invalidate();
			response.sendRedirect("Login.jsp");
		}
		if (action.equals("myliuyan")) {
			request.setCharacterEncoding("UTF-8");
			String user_id = (String) session.getAttribute("user_id");
			String sql = "select * from liuyan where user_to_id='" + user_id
					+ "'";
			connection conn = new connection();
			java.sql.Connection conn_object = conn.getconn();
			try {
				Statement statement = conn_object.createStatement();
				ResultSet rs = statement.executeQuery(sql);
				ArrayList<liuyan_model> list = new ArrayList<liuyan_model>();
				while (rs.next()) {
					liuyan_model liuyan = new liuyan_model(
							rs.getString("message_id"),
							rs.getString("user_id"), rs.getString("user_name"),
							rs.getString("user_to_id"),
							rs.getString("user_to_name"),
							rs.getString("message_content"),
							rs.getString("date")

					);
					list.add(liuyan);
				}
				rs.close();
				statement.close();
				conn_object.close();
				session.setAttribute("my_liuyan_list", list);
				response.sendRedirect("liuyan.jsp");
			} catch (SQLException e) {

			}

		}
		if (action.equals("xiaye")) {
			int size = 10;
			if (session.getAttribute("size") == null) {
				size = 0;
			} else {
				size = (int) session.getAttribute("size");
				size=(size==0)?10:size;
			}
			session.removeAttribute("show_topic_list");
			@SuppressWarnings("unchecked")
			ArrayList<topic_model> topic_list = (ArrayList<topic_model>) session
					.getAttribute("topic_list");
			List<topic_model> show_topic_list = new ArrayList<topic_model>();
			if ((topic_list.size() - size) < 10) {

				for (int i = size; i < topic_list.size(); i++) {
					show_topic_list.add(topic_list.get(i));
				}
				session.setAttribute("ny", (topic_list.size()/10)+1);

			} else {
				for (int i = size; i < size + 10; i++) {
					show_topic_list.add(topic_list.get(i));
				}

				size = size + 10;
				session.setAttribute("ny", ((int)session.getAttribute("ny")+1));
			}
			System.out.println(size);
			
			session.setAttribute("size", size);
			session.setAttribute("show_topic_list", show_topic_list);
			response.sendRedirect("main.jsp");
		}
		if (action.equals("shangye")) {
			int size = 10;
			if (session.getAttribute("size") == null) {// 如果当前是第一页的话，直接返回当前页
				response.sendRedirect("main.jsp");
				return;
			} else {
				size = (int) session.getAttribute("size");
				if (size < 10) {
					response.sendRedirect("main.jsp");
					return;
				}
			}
			session.removeAttribute("show_topic_list");
			@SuppressWarnings("unchecked")
			ArrayList<topic_model> topic_list = (ArrayList<topic_model>) session
					.getAttribute("topic_list");
			List<topic_model> show_topic_list = new ArrayList<topic_model>();

			for (int i = size - 10; i < size; i++) {
				show_topic_list.add(topic_list.get(i));
			}
			size = size - 10;
			System.out.println(size);
			session.setAttribute("ny", ((int)session.getAttribute("ny")-1));
			session.setAttribute("size", size);
			session.setAttribute("show_topic_list", show_topic_list);
			response.sendRedirect("main.jsp");

		}
		// 在主页点击一个用户的名字
		if (action.equals("checkinfo")) {
			if (session.getAttribute("user_list") != null) {
				session.removeAttribute("user_list");
			}
			request.setCharacterEncoding("UTF-8");
			String user_id = new String(request.getParameter("user_id")
					.getBytes("iso-8859-1"), "utf-8");
			String sql = "select * from user where user_id=" + user_id + "";
			connection conn = new connection();
			java.sql.Connection conn_object = conn.getconn();
			try {
				Statement statement = conn_object.createStatement();
				ResultSet rs = statement.executeQuery(sql);
				// 该list保存一个用户的信息,用于查看一个用户的基本信息
				ArrayList<user_model> user_list = new ArrayList<user_model>();
				while (rs.next()) {
					user_model user = new user_model(rs.getString("user_id"),
							rs.getString("user_name"),
							rs.getString("user_age"), rs.getString("user_sex"),
							rs.getString("user_phonenumber"),
							rs.getString("user_signature"),
							rs.getString("user_imageId"),
							rs.getString("user_qiandao"));
					user_list.add(user);
				}
				rs.close();
				statement.close();
				conn_object.close();
				session.setAttribute("user_list", user_list);
				response.sendRedirect("checkuserinfo.jsp");
			} catch (SQLException e) {

			}

		}

		// 添加好友
		if (action.equals("addfriend")) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter pw = response.getWriter();
			String friend_user_id = request.getParameter("user_id");
			String friend_user_name = request.getParameter("user_name");
			friend_user_name = new String(friend_user_name.trim().getBytes("ISO-8859-1"), "UTF-8");  
			String randString = request.getParameter("randString");
			if (!randString.equals(session.getAttribute("randomString"))) {

				pw.print(0);
				pw.flush();
				return;
			}

			String tips = null;
			String sql = "insert into user_friend(user_id,user_name,user_friend_id,user_friend_name) values("
					+ "'"
					+ session.getAttribute("user_id")
					+ "',"
					+ "'"
					+ session.getAttribute("user_name")
					+ "',"
					+ "'"
					+ friend_user_id + "'," + "'" + friend_user_name + "')";
			connection conn = new connection();
			java.sql.Connection conn_object = conn.getconn();
			try {
				Statement statement = conn_object.createStatement();
				int rs = statement.executeUpdate(sql);
				// 添加好友成功
				if (session.getAttribute("friend_list") != null) {
					session.removeAttribute("friend_list");
				}
				String sql2 = "select user_friend_id,user_friend_name from user_friend where user_id='"
						+ session.getAttribute("user_id") + "'";
				ResultSet rs2 = statement.executeQuery(sql2);
				List<friend_model> friend_list = new ArrayList<friend_model>();
				while (rs2.next()) {
					friend_model friend = new friend_model();
					friend.setFriend_id(rs2.getString("user_friend_id"));
					friend.setFriend_name(rs2.getString("user_friend_name"));

					friend_list.add(friend);

				}
				session.setAttribute("friend_list", friend_list);
				rs2.close();
				statement.close();
				conn_object.close();

				// response.sendRedirect("checkuserinfo.jsp");
				pw.print(1);
				pw.flush();
				return;

			} catch (SQLException e) {
				tips = "添加失败，该用户已经是你的好友！";

				// response.sendRedirect("checkuserinfo.jsp");

				pw.print(new String(tips.getBytes("UTF-8"), "UTF-8"));
				pw.flush();
				return;
			}

		}
		if (action.equals("test")) {
			response.setContentType("text/html;charaet=UTF-8");
			PrintWriter out = response.getWriter();
			String str = request.getParameter("str");
			String str1 = (String) session.getAttribute("randomString");
			if (!str.equals(str1)) {
				out.print(1);
			}
			out.flush();
			out.close();
		}
		if(action.equals("qiandao")){
			response.setContentType("text/html;charaet=UTF-8");
			PrintWriter out = response.getWriter();
			String user_id = (String) session.getAttribute("user_id");
			String qiandaotimes = session.getAttribute("user_qiandao").toString();
			int newQianDaoTimes = Integer.parseInt(qiandaotimes)+1;
			
			boolean tag = uc.setQianDaoTimes(user_id,newQianDaoTimes);
			if(tag==true){
				out.print(newQianDaoTimes);
				session.setAttribute("user_qiandao", newQianDaoTimes);
			}
			else{
				out.print(0);
			}
			out.flush();
			out.close();
		}
		if(action.equals("friend")){
			String user_id = (String) session.getAttribute("user_id");
			String sql = "select * from user where user_id IN (select user_friend_id from user_friend where user_id='"+user_id+"')";
			connection conn = new connection();
			java.sql.Connection conn_object = conn.getconn();
			try {
				Statement statement = conn_object.createStatement();
				ResultSet rs = statement.executeQuery(sql);
				ArrayList<user_model> list = new ArrayList<user_model>();
				while (rs.next()) {
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
					list.add(friend);
				}
				rs.close();
				statement.close();
				conn_object.close();
				int num = Integer.parseInt(request.getParameter("num"));
				if(num<0){num=0;}
				if(list.size()<num){
					num=num-10;
				}
				
				List<user_model> newLIst = uc.getUserList(list, num);
				
				
				request.setAttribute("all_friend_list", newLIst);
				request.setAttribute("num", num);
				request.setAttribute("size", list.size());
				RequestDispatcher rd = request.getRequestDispatcher("myfriend.jsp");
				rd.forward(request, response);
			} catch (SQLException e) {

			}
		}
		
		if(action.equals("deleteFriend")){
			String friend_id = request.getParameter("friend_id");
			String sql = "delete from user_friend where user_id='"+session.getAttribute("user_id")+"' and user_friend_id = '"+friend_id+"'";
			connection conn = new connection();
			java.sql.Connection conn_object = conn.getconn();
			
			try {
				Statement statement  = conn_object.createStatement();
				int rs = statement.executeUpdate(sql);
				statement.close();
				conn_object.close();
		}catch(SQLException e){
			
			}
			
			
			response.sendRedirect("com?action=friend&num=0");
		}
		if(action.equals("deleteTopic")){
			String topic_id = request.getParameter("topic_id");
			String sql = "delete from topic where topic_id='"+topic_id+"'";
			String sql1 = "delete from sub_topic where topic_id='"+topic_id+"'";
			connection conn = new connection();
			java.sql.Connection conn_object = conn.getconn();
			try {
				Statement statement = conn_object.createStatement();
				int rs = statement.executeUpdate(sql);
				int rs1 = statement.executeUpdate(sql1);
				statement.close();
				conn_object.close();
		    }catch(SQLException e){
		    	
			}
			response.sendRedirect("mypost");
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}