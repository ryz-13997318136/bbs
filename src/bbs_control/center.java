package bbs_control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class center
 */
public class center extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public center() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		request.setAttribute("user_name", session.getAttribute("user_name"));
		request.setAttribute("user_age", session.getAttribute("user_age"));
		request.setAttribute("user_sex", session.getAttribute("user_sex"));
		request.setAttribute("user_phonenumber", session.getAttribute("user_phonenumber"));
		request.setAttribute("user_signature", session.getAttribute("user_signature"));
		RequestDispatcher rd = request.getRequestDispatcher("center.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
