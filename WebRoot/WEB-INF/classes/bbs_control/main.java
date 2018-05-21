// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   main.java

package bbs_control;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

// Referenced classes of package bbs_control:
//			user_control, topic_control, friend_control, notice_control, 
//			advertisement_control

public class main extends HttpServlet
{

	private static final long serialVersionUID = 1L;

	public main()
	{
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		user_control uc = new user_control();
		HttpSession session = request.getSession();
		try
		{
			String logintime = uc.GetLoginTime(session.getAttribute("user_id").toString());
			if (!session.getAttribute("user_logintime").toString().equals(logintime))
			{
				session.invalidate();
				String info = "您在其他地方已登录，被迫下线！";
				request.setAttribute("info", info);
				RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
				rd.forward(request, response);
				return;
			}
		}
		catch (NullPointerException e)
		{
			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			rd.forward(request, response);
		}
		int cp = 1;
		if (request.getParameter("p") != null)
			cp = Integer.parseInt(request.getParameter("p"));
		if (session.getAttribute("user_name") != null)
		{
			topic_control tc = new topic_control();
			int count = tc.getTopicCount();
			loadFriendAndNoticListAndAdv(request, response, session);
			int num = (cp - 1) * 10;
			java.util.List list = tc.GetTopicList(num);
			request.setAttribute("cp", Integer.valueOf(cp));
			request.setAttribute("tp", Integer.valueOf(count / 10 + 1));
			request.setAttribute("topic_list", list);
			RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
			rd.forward(request, response);
		} else
		{
			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			rd.forward(request, response);
		}
	}

	public void loadFriendAndNoticListAndAdv(HttpServletRequest request, HttpServletResponse response, HttpSession session)
		throws ServletException
	{
		friend_control fc = new friend_control();
		java.util.List friend_list = fc.getFriendLis(0, (String)session.getAttribute("user_id"));
		request.setAttribute("friend_list", friend_list);
		notice_control notice = new notice_control();
		java.util.List notice_list = notice.getNoticeList();
		request.setAttribute("notice_list", notice_list);
		advertisement_control ac = new advertisement_control();
		java.util.List adv_list = ac.getAdvList();
		request.setAttribute("adv_list", adv_list);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		doGet(request, response);
	}
}
