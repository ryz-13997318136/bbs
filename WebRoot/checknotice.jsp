<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page language="java" errorPage="error.jsp"%>
<%@page import="model.notice_model" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>publish</title>
    <link rel="stylesheet" href="css/contact.css" />	    	
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
                    <div style="text-align: center;"class="d_out" onmouseover="this.className='d_over'" onmouseout="this.className='d_out'"><span style="line-height: 1.6;"><a href="main">HOME</a></span></div>
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
      <div id="w-area-aaap" data-type="area" class="p-173886 n-widget w-area">
        <div id="w-area-aaaq" data-type="area" class="p-173886 n-widget w-area">
          <div id="w-text-aaar" data-type="text" class="n-widget w-text">
            <div style="text-align: center;"><span style="color: rgb(197, 223, 196); font-size: x-large; line-height: 1.6;"><font face="arial, helvetica, sans-serif">公告详情</font></span></div>
           
          </div>
        </div>
        <div id="w-area-aaas" data-type="area" class="p-173886 n-widget w-area">         
          <div id="w-columnbox-aaau" data-type="columnbox" class="n-widget w-columnbox">
              
             <%             
                  ArrayList<notice_model> notice_list=(ArrayList<notice_model>)request.getAttribute("notice_list");   
                                         
                  for(notice_model notice : notice_list){
                  	   
                     {
                      
                       out.println("<div style='margin-left:241px'><h3>标题:"+notice.getNotice_name()+"</h3><br>"+
                       "<div align='center' style='height:200px'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+notice.getNotice_content()+"</div>"+
                        "<div class='date'>日期:"+notice.getNotice_Date()+"</div></div>");
                   
                      }
                  }                 
                  %>
          








            
          
      </div>
      <div id="w-columnbox-aabi" data-type="columnbox" class="n-widget w-columnbox"  align="center">
          <div class="w-col" style="width:100%;">
          <div id="w-area-aabj" data-type="area" class="p-173886 n-widget w-area">
            <div id="w-text-aabk" data-type="text" class="n-widget w-text">
              © 2016 by NOMAD ON THE ROAD. Proudly created with RYZ
            </div>
          </div>
          </div>
         
          </div>
  </body>
</html>