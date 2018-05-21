package bbs_control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.notice_model;

public class check_notice extends HttpServlet {

	
	public check_notice() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
            String notice_id = request.getParameter("notice_id");
		    notice_control nc = new notice_control();
		    ArrayList<notice_model> list = nc.getNoticeList(notice_id);
           request.setAttribute("notice_list", list);		

			
			RequestDispatcher rd = request.getRequestDispatcher("checknotice.jsp");
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
