package bbs_control;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.sub_topic_model;
import model.topic_model;
import bbs_dao.connection;

public class sub_topic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public sub_topic() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub		
		request.setCharacterEncoding("UTF-8");//传值编码
		String user_name=null,topic_name=null,topic_content=null,topic_date=null;
		HttpSession session=request.getSession();
		
		    String local_user = (String)session.getAttribute("user_name");
		    System.out.println("local_user="+local_user);
			String topic_id=request.getParameter("topic_id");
			String sub_topic_content=request.getParameter("sub_topic_content");
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  			
	    	Date date=new Date();  
	    	String str=sdf.format(date); 
	    	sub_topic_content = sub_topic_content +"--------"+ str ; 
			//Date date=new Date();
			String sub_topic_id=date.getTime()+"";
			connection conn=new connection();
			java.sql.Connection conn_object=conn.getconn();
			String state=null;
			try {
				Statement statement = conn_object.createStatement();
				//插入评论的数据
				String sql="insert into sub_topic(topic_id,sub_topic_id,sub_topic_content,sub_user_name) values('"+topic_id+"','"+sub_topic_id+"','"+sub_topic_content+"','"+local_user+"')";
				//查出主话题
				String sql2="select user_name,topic_name,topic_content,topic_date from topic where topic_id='"+topic_id+"'";
				//查出评论的话题
				String sql3="select topic_id,sub_topic_id,sub_user_name,sub_topic_content from sub_topic where topic_id='"+topic_id+"'";
				
				int rs = statement.executeUpdate(sql);
				
				System.out.println(rs);
			    if(rs==1){
			    	ResultSet rs2 = statement.executeQuery(sql2);//这里面查一条帖子
			    	ArrayList<topic_model> list2=new ArrayList<topic_model>();
					if(rs2.next()){
						topic_model topic = new topic_model(
								topic_id,
								rs2.getString("user_name"),
								rs2.getString("topic_name"),
								rs2.getString("topic_content"),
								rs2.getString("topic_date")
								);
						list2.add(topic);
					   }					
					ResultSet rs3 = statement.executeQuery(sql3);//这里面查上面一条帖子的所有评论的数据
					ArrayList<sub_topic_model> list3=new ArrayList<sub_topic_model>();
					while(rs3.next()){
						sub_topic_model sub_topic = new sub_topic_model(
								rs3.getString("topic_id"),
								rs3.getString("sub_topic_id"),
								rs3.getString("sub_topic_content"),								
							    rs3.getString("sub_user_name")								
								);
						list3.add(sub_topic);						
					}
					
					session.setAttribute("list2", list2);
					session.setAttribute("list3", list3);

			    	rs3.close();
			    	rs2.close();
			    	statement.close();
			    	conn_object.close();
	
			    	response.sendRedirect("check.jsp");
			    }
			    else {
			    	statement.close();
			    	conn_object.close();
			    	state="发表评论失败!";
			    	request.setAttribute("state", state);
			    	RequestDispatcher rd = request.getRequestDispatcher("check.jsp");
					rd.forward(request, response);	
			    }
			    
		     }catch(SQLException e){
			state="发表评论失败!";
	    	request.setAttribute("state", state);
	    	RequestDispatcher rd = request.getRequestDispatcher("check.jsp"); 
			rd.forward(request, response);	
			}
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
