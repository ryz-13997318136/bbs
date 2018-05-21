package bbs_control;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.advertisement_model;
import model.friend_model;
import model.notice_model;
import model.topic_model;

/**
 * Servlet implementation class main
 */
public class main extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public main() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		user_control uc = new user_control();
		HttpSession session = request.getSession();
		//String action = request.getParameter("action");
		try{
	    //在此处判断CAS	
			String logintime = uc.GetLoginTime(session.getAttribute("user_id").toString());
			if(!session.getAttribute("user_logintime").toString().equals(logintime)){
				
				session.invalidate();
				String info = "您在其他地方已登录，被迫下线！";
	        	request.setAttribute("info",info);
	
				RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
				rd.forward(request, response);
				return;
			}
		
		}catch(NullPointerException e){
			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			rd.forward(request, response);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		int cp = 1;
		if(request.getParameter("p") != null) {
			cp = Integer.parseInt(request.getParameter("p"));
		}
		if (session.getAttribute("user_name") != null) {
			topic_control tc = new topic_control();
			int count = tc.getTopicCount();
//			//加载好友列表和通知
			loadFriendAndNoticListAndAdv(request,response,session);
			
			List<topic_model> list;
			int num = (cp-1) * 10;
			list = tc.GetTopicList(num);
			request.setAttribute("cp", cp);
			request.setAttribute("tp",count/10+1);
			request.setAttribute("topic_list", list);		

			
			RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
			rd.forward(request, response);

		} else {
			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			rd.forward(request, response);
		}
		

		
	}
 public void loadFriendAndNoticListAndAdv(HttpServletRequest request,
			HttpServletResponse response,HttpSession session) throws ServletException{
	            // 得到好友列表
				friend_control fc = new friend_control();
				List<friend_model> friend_list = fc.getFriendLis(0,
						(String) session.getAttribute("user_id"));
				request.setAttribute("friend_list", friend_list);
				// 查出所有的通知记录
				notice_control notice = new notice_control();
				List<notice_model> notice_list = notice.getNoticeList();
				request.setAttribute("notice_list", notice_list);
                //查出所有的广告资源
				advertisement_control ac = new advertisement_control();
				List<advertisement_model> adv_list = ac.getAdvList();
				request.setAttribute("adv_list", adv_list);
	 
 }
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
