<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page language="java" errorPage="error.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String qiandao = session.getAttribute("user_qiandao").toString();
 int huoyuedu = (Integer.parseInt(qiandao))/2;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>about</title>
    <link rel="stylesheet" href="css/about.css" />
    <script>
    function GoEdit(){
    location='edit.jsp'  
    }   
    </script>
    <script>
    function MyPost(){
    location='mypost'   
    }
    function MyFriend(){
    location='com?action=friend&num=0'
    }
    </script>
    <script>
    function MyLiuyan(){
    location='com?action=myliuyan'   
    }
    
    </script>
    <script language="javascript"> 
    function refresh(){
		window.opener.document.location.reload()
     }
	</script>
    		
  </head>
  <body id="w-body-aaaa" data-type="body" class="p-173886 n-widget w-body" onload="refresh()">
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
      <div id="w-columnbox-aaap1" data-type="columnbox" class="n-widget w-columnbox" style="margin-left: 121px;">
       <div id="w-area-aaar1" data-type="area" class="p-173886 n-widget w-area">
              <div id="w-text-aaas" data-type="text" class="n-widget w-text">
                <div style="text-align: center;"><span style="color: rgb(197, 223, 196); font-size: x-large; line-height: 1.6;"><font face="arial, helvetica, sans-serif">个人资料</font></span></div>
              </div>
            </div>
      
      
      <div class="w-col" style="width:38%;">
          <div id="w-area-aaav" data-type="area" class="p-173886 n-widget w-area">
            <div id="w-image-aaaw" data-type="image" class="n-widget w-image">
              <img src="./image/<%=(String)session.getAttribute("imageid")%>" onerror="javascript:this.src='picture/head.png';" height="200" width="150">
              <div class="huoyuedu">活跃度：<%=huoyuedu %></div>
              
            </div>
            
          </div>
          </div>
      
          <div class="w-col" style="width:62%;">
          <img src="picture/friend.png" height="30" width="30"  title="我的好友" align="right" onclick="MyFriend()"/> 
          <img src="picture/mytitle1.png" height="30" width="30"  title="我的帖子" align="right" onclick="MyPost()"/> 
           <img src="picture/mytitle.png" height="30" width="30"  title="我的留言" align="right" onclick="MyLiuyan()"/> 
          <div id="w-area-aaaq" data-type="area" class="p-173886 n-widget w-area">
       <img src="picture/edit.png" height="30" width="30"  title="编辑" align="right" onclick="GoEdit()"/>  
           
 <div id="w-text-aaat" data-type="text" class="n-widget w-text" align="center">
 
     <form name="myinfo_form" action="" methd="post">
     <table>
     <tr>
     <th>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</th>
     <th><%=(String)session.getAttribute("user_name")%>    </th>
     </tr>  
      <tr>
     <th>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</th>
     <th>   <%=(String)session.getAttribute("user_sex")%>   </th>
     </tr>
      <tr>
     <th>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄:</th>
     <th>   <%=(String)session.getAttribute("user_age")%>   </th>
     </tr>
      <tr>
     <th>联系方式:</th>
     <th>   <%=(String)session.getAttribute("user_phonenumber")%>   </th>
     </tr>
      <tr>
     <th>个性签名:</th>
     <th  width="300px" style="word-break:break-all">  <%=(String)session.getAttribute("user_signature")%>    </th>
     </tr>
     </table>    
     </form>        
</div>
            
          </div>
          </div>
          
      </div>
      <div id="w-columnbox-aaax" data-type="columnbox" class="n-widget w-columnbox" align="center">
          <div class="w-col" style="width:100%;">
          <div id="w-area-aaay" data-type="area" class="p-173886 n-widget w-area">
            <div id="w-text-aaaz" data-type="text" class="n-widget w-text">
               2016 by NOMAD ON THE ROAD. Proudly created with RYZ
            </div>
          </div>
          </div>
          
      </div>
    </div>
  </body>
</html>