package bbs_control;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import bbs_dao.connection;

public class edit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public edit() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();	
		connection conn=new connection();
		java.sql.Connection conn_object=conn.getconn();
				
	    SmartUpload su=new SmartUpload();	  
	    su.initialize(this.getServletConfig(),request,response);	 		
	    try {
			su.upload();
			 
		    int count=su.save("/image");
		    String name = (String)su.getRequest().getParameter("name");		 
			String sex = (String)su.getRequest().getParameter("sex");
			String age = (String)su.getRequest().getParameter("age");			
			String phone_number = (String)su.getRequest().getParameter("phonenumber");		
			String signature = (String)su.getRequest().getParameter("signature");
		    String imageid=(String)su.getRequest().getParameter("file");
		    
		    File file=su.getFiles().getFile(0);
		    
		    file.saveAs("/image/"+file.getFileName());
		    
		    file.saveAs("/image/"+file.getFileName(),su.SAVE_VIRTUAL);
		    String url=file.getFileName();
		 
		    Statement statement;		
				try {
					statement = conn_object.createStatement();
					String sql = "update user set user_name='"+name+"',user_sex='"+sex+"',user_age='"+age+"',"
							+ "user_phonenumber='"+phone_number+"',user_signature='"+signature+"',user_imageId='"+url+"'where user_id='"+session.getAttribute("user_id")+"'";
					String sql2 = "update topic t, sub_topic s set t.user_name='"+name+"',s.sub_user_name='"+name+"' where t.user_name='"+session.getAttribute("user_name")+"' and t.user_name=s.sub_user_name ";
					String sql3 = "update user_friend set user_name='"+name+"' where user_id='"+session.getAttribute("user_id")+"'";
					String sql4 = "update user_friend set user_friend_name='"+name+"' where user_friend_id='"+session.getAttribute("user_id")+"'";
					int result = statement.executeUpdate(sql);
					int resut2 = statement.executeUpdate(sql2);
					int resut3 = statement.executeUpdate(sql3);
					int resut4 = statement.executeUpdate(sql4);
					//String state=null;
					if(result==1){
						statement.close();
						conn_object.close();
						
						session.removeAttribute("user_name");
						session.removeAttribute("user_age");
						session.removeAttribute("user_sex");
						session.removeAttribute("user_user_phonenumber");
						session.removeAttribute("user_signature");
						session.removeAttribute("imageid");
						
						session.setAttribute("user_name", name);
						session.setAttribute("user_age", age);
						session.setAttribute("user_sex", sex);
						session.setAttribute("user_phonenumber", phone_number);
						session.setAttribute("user_signature", signature);
						 session.setAttribute("imageid",url);
						response.sendRedirect("center.jsp");
					}
					else{
						statement.close();
						conn_object.close();
						response.sendRedirect("edit.jsp");
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    
		    
		    
	  
		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   
	    
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
