package bbs_cas;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bbs_control.user_control;
public class Cas implements Filter {

	
	private FilterConfig filterConfig = null;
	public String excepUrlRegex = "";
	public void destroy() {
	 

	}

	public void doFilter(ServletRequest request, ServletResponse response,
	  FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		user_control uc = new user_control();
		if (excepUrlRegex.length()!=0) {
			chain.doFilter(request, response);
              }
		
		
		String logintime = uc.GetLoginTime(session.getAttribute("user_id").toString());
	  if(!logintime.equals(session.getAttribute("user_logintime").toString())){
		  HttpServletResponse res = (HttpServletResponse) response;
		  res.sendRedirect("Login.jsp");
	  }
		
	  chain.doFilter(request, response);
	}

	public void init(FilterConfig filterConfig) throws ServletException {

	
	excepUrlRegex = filterConfig.getInitParameter("excepUrlRegex");
   
	}

	
}
