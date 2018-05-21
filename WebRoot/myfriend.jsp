<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page language="java" errorPage="error.jsp"%>
<%@page import=" java.sql.ResultSet"%>
<%@page import="model.user_model"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>MyFriend</title>
    <link rel="stylesheet" href="css/about.css" />
   <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
    <%
    int num = Integer.parseInt(request.getAttribute("num").toString());
	int size = Integer.parseInt(request.getAttribute("size").toString());
	 %>
   <script>
   function del(){
   var isSure = confirm("你确定要删除该好友吗？");
		if (isSure) {
			return true;
		} else {

			return false;
		}
   
   }
   
   function check(){
   var num = <%=num%>;
   var size = <%=size%>;
   if(num<size){
   
   alert("已经是第一页了")
   return false;
   }
   return ;
   }
   
   function checked(){
   var num = <%=num%>;
   var size = <%=size%>;
   if(num>size||size<10){
   alert("已经是最后一页了")
   return false;
   }
   return ;
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
                <div style="text-align: center;"><span style="color: rgb(197, 223, 196); font-size: x-large; line-height: 1.6;"><font face="arial, helvetica, sans-serif">我的好友</font></span></div>
              </div>
            </div>         
      </div>
      
     
      
      
      
   <div class="clearfix2">   
      
       
      
                 <table width="95%" class="bordered" border="0" align="center" cellpadding="0" cellspacing="0">

            
                
               
                  <tr style="background-color: mediumslateblue;">
                    <td width="10%" align="center" >头像</td>
                    <td width="10%" height="20" align="center" >姓名</td>
                    <td width="5%" align="center" >年龄</td>
                    <td width="5%" align="center" >性别</td>
                    <td width="10%" align="center" >电话号码</td>
                    <td width="50%" align="center" >个性签名</td>                                     
                    <td width="10%" align="center" >操作</td>
                  </tr>
                 
                  <%
                    ArrayList<user_model> list = (ArrayList<user_model>)request.getAttribute("all_friend_list");
                     for(user_model friend : list){
                      out.println("<tr border='1' style='background-color: beige;'>"  
                      +"<td ><div id='yuan'><img src='./image/"+friend.getUser_image()+"' onerror=javascript:this.src='picture/moren.jpg'; style='width:100%;height:45'/></div></td>"           
                        +"<td align='center'>"+friend.getUser_name()+"</td>"               
                        +"<td align='center'>"+friend.getUser_age()+"</td>"
                        +"<td align='center'>"+friend.getUser_sex()+"</td>"
                        +"<td align='center'>"+friend.getUser_phonenumber()+"</td>"
                        +"<td >"+friend.getUser_signature()+"</td>"
                        
                        +"<td align='center'><a href=userinfo?friend_id="+friend.getUser_id()+">查看</a>/<a onclick='return del();' href=com?action=deleteFriend&friend_id="+friend.getUser_id()+">删除</a></td>"                                                                             
                        +"</tr>");
                  }                  
                 
                 
                 
                  %>
                 
                 
                 
                </table>
              
     <div id="fenye">  
            <a onclick="return check();" href="com?action=friend&num=<%=num-10%>">上一页</a>/<a onclick="return checked();" href="com?action=friend&num=<%=num+10%>">下一页</a>
           </div>
     
      
      </div>   
      
    </div>
    <div align="center">
        
      </div>
  </body>
</html>