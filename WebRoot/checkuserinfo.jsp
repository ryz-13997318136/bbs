<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page language="java" errorPage="error.jsp"%>
<%@page import="model.user_model" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
      <%
        ArrayList<user_model> user_list = (ArrayList<user_model>)session.getAttribute("user_list");
    
        user_model user = (user_model)user_list.get(0);
        String huoyue = user.getUser_qiandao();
        int huoyuedu = Integer.parseInt(huoyue)/2;
    
     %>  
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>about</title>
    <link rel="stylesheet" href="css/about.css" />
    <script type="text/javascript" src="js/zDialog.js"></script>
    <script>
    var diag;
    function addfriend(){
    diag = new Dialog();
	diag.Width = 400;
	diag.Height = 180;
	diag.Title = "验证窗口";
	diag.URL = "yanzheng.jsp";
	diag.show();   
    }
    
    </script>
    <script language="javascript"> 
   
	</script>
   <style>
    .btn11
   {
	width:143px;
	height:40px;
	background:url("picture/bg11.jpg") no-repeat left top;
	color:#FFF
     }
    </style>
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
       <div id="w-area-aaar" data-type="area" class="p-173886 n-widget w-area">
              <div id="w-text-aaas" data-type="text" class="n-widget w-text">
                <div style="text-align: center;"><span style="color: rgb(197, 223, 196); font-size: x-large; line-height: 1.6;"><font face="arial, helvetica, sans-serif">个人资料</font></span></div>
              </div>
            </div>
      

      <div class="w-col" style="width:49.78021978022%;">
          <div id="w-area-aaav" data-type="area" class="p-173886 n-widget w-area">
            <div id="w-image-aaaw" data-type="image" class="n-widget w-image">
              <img src="./image/<%=user.getUser_image()%>" onerror="javascript:this.src='picture/head.png';" height="200" width="150">
            </div>
          </div>
          </div>
      
          <div class="w-col" style="width:50.21978021978%;">
          <div id="w-area-aaaq" data-type="area" class="p-173886 n-widget w-area">    
     
             
 <div id="w-text-aaat" data-type="text" class="n-widget w-text" align="center">
 
     <form name="myinfo_form" action="" methd="post">
     <table border="0">
     <tr>
     <th>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</th>
     <th><%=user.getUser_name()%></th>
     </tr>
     <tr>
     <th>活跃度:</th>
     <th><%=huoyuedu%></th>
     </tr>
      <tr>
     <th>个性签名:</th>
     <th><%=user.getUser_signature()%></th>
     </tr>
     
     </table>    
     </form>    
      
     添加为好友后才可以查看更多信息
     <input type="button" class="btn11" onmouseover="this.style.backgroundPosition='left -40px'" onmouseout="this.style.backgroundPosition='left top'" value="添加好友" onclick="addfriend()"/>
        
</div>
            
          </div>
          </div>
          
      </div>
      <div id="w-columnbox-aaax" data-type="columnbox" class="n-widget w-columnbox" align="center">
          <div class="w-col" style="width:100%;">
          <div id="w-area-aaay" data-type="area" class="p-173886 n-widget w-area">
            <div id="w-text-aaaz" data-type="text" class="n-widget w-text">
               2023 by NOMAD ON THE ROAD. Proudly created with Wix.com
            </div>
          </div>
          </div>
          
      </div>
    </div>
  </body>
</html>