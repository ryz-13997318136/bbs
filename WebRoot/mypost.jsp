<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page language="java" errorPage="error.jsp"%>
<%@page import=" java.sql.ResultSet"%>
<%@page import="model.topic_model"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>about</title>
    <link rel="stylesheet" href="css/about.css" />
   <script>
   function del(){
   var isSure = confirm("你确定要删除该帖子吗？");
		if (isSure) {
			return true;
		} else {

			return false;
		}
   
   }
   
   
   </script>
    
    		
  </head>
  <body id="w-body-aaaa" data-type="body" class="p-173886 n-widget w-body">
    <div id="w-area-aaab" data-type="area" class="p-173886 n-widget w-area">
    <p align="right">当前用户：<%=(String)session.getAttribute("user_name") %> &nbsp;&nbsp;&nbsp; <a href="com?action=logout" >退出</a></p>
      <div id="w-columnbox-aaac" data-type="columnbox" class="n-widget w-columnbox">
          <div class="w-col" style="width:20%;">
          <div id="w-area-aaad" data-type="area" class="p-173886 n-widget w-area">
             
            <div id="w-image-aaae" data-type="image" class="n-widget w-image">
              <img src="picture/logo.jpg" />
            </div>
          </div>
          </div>
          <div class="w-col" style="width:80%;">
          <div id="w-area-aaaf" data-type="area" class="p-173886 n-widget w-area">
            <div id="w-divider-aaag" data-type="divider" class="n-widget w-divider">
             
              <hr />
            </div>
            <div id="w-columnbox-aaah" data-type="columnbox" class="n-widget w-columnbox">
                <div class="w-col" style="width:33.333333333333%;">
                <div id="w-area-aaai" data-type="area" class="p-173886 n-widget w-area">
                  <div id="w-text-aaaj" data-type="text" class="n-widget w-text">
                    <div style="text-align: center;"class="d_out" onmouseover="this.className='d_over'" onmouseout="this.className='d_out'"><span style="line-height: 1.6;"><a href="main" >HOME</a></span></div>
                  </div>
                </div>
                </div>
                <div class="w-col" style="width:33.333333333333%;">
                <div id="w-area-aaak" data-type="area" class="p-173886 n-widget w-area">
                  <div id="w-text-aaal" data-type="text" class="n-widget w-text">
                    <div style="text-align: center;"class="d_out" onmouseover="this.className='d_over'" onmouseout="this.className='d_out'"><span style="line-height: 1.6;"><a href="publish.jsp">PUBLISH</a></span></div>
                  </div>
                </div>
                </div>
                <div class="w-col" style="width:33.333333333333%;">
                <div id="w-area-aaam" data-type="area" class="p-173886 n-widget w-area">
                  <div id="w-text-aaan" data-type="text" class="n-widget w-text">
                    <div style="text-align: center;"class="d_out" onmouseover="this.className='d_over'" onmouseout="this.className='d_out'"><span style="line-height: 1.6;"><a href="center">CENTER</a></span></div>
                  </div>
                </div>
                </div>
            </div>
            <div id="w-divider-aaao" data-type="divider" class="n-widget w-divider">
              <hr />
            </div>
          </div>
          </div>
      </div>
      <div id="w-columnbox-aaap" data-type="columnbox" class="n-widget w-columnbox">
       <div id="w-area-aaar3" data-type="area" class="p-173886 n-widget w-area">
              <div id="w-text-aaas" data-type="text" class="n-widget w-text">
                <div style="text-align: center;"><span style="color: rgb(197, 223, 196); font-size: x-large; line-height: 1.6;"><font face="arial, helvetica, sans-serif">我的帖子</font></span></div>
              </div>
            </div>         
      </div>
      
     
      
      
      
   <div class="clearfix1">   
      
       
      <table border="1" align="center">
                 <tr style="background-color: aquamarine;">
                    <th width='10%'>帖主</th>
                    <th width='14%'>标题</th>
                    <th style='word-break:break-all' width='60%'>内容</th>
                    <th width='11%'>日期</th>
                    <th width='5%'>操作</th>                     
                 </tr>
                  <%             
                  ArrayList<topic_model> list=(ArrayList<topic_model>)request.getAttribute("my_topic_list");   
                                          
                  for(topic_model my_topic : list){                
                       out.println("<tr style='background-color: floralwhite;'>"
                       +"<td >"+my_topic.getUser_name()+"</td>"
                       +"<td>"+my_topic.getTopic_name()+"</td>"
                       +"<td style='word-break:break-all'>"+my_topic.getTopic_content()+"</td>"
                       +"<td>"+my_topic.getTopic_date()+"</td>"   
                       +"<td><a onclick='return del();' href=com?action=deleteTopic&topic_id="+my_topic.getTopic_id()+">删除</a></td>"                                                                           
                       +"</tr>");
                  }                 
                   %>
                 
            </table>
     
     
      
      </div>
      
      
      
     
    </div>
  </body>
</html>