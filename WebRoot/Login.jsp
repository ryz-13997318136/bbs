<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
           String info;
          if(request.getAttribute("info")==null){
           info="";
          }
          else{
          info=(String)request.getAttribute("info");
          }
          
          %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>登录</title>
    <link rel="stylesheet" href="css/about.css" />   
    <script type="text/javascript" src="js/zDialog.js"></script>
   <style type="text/css">
	form.margin {margin: 2cm 4cm 3cm 4cm}
	a.margin1 {margin: 2cm 4cm 3cm 27cm}
	</style>	
<script type="text/javascript">
function chick(){
//alert(document.login_form.user_name.value.length==0);
    if(document.login_form.user_name.value==""){
    
    alert("请输入用户名!");
    document.login_form.user_name.focus();
    return false;
    }
    if(document.login_form.user_password.value==""){
    alert("请输入密码!");
    document.login_form.user_password.focus();
    return false;
    }
    login_form.action='login';
    login_form.submit();
}

</script>	
	<script>
	function aaa(){
     var tip = '<%=info%>';
			if(tip=='您在其他地方已登录，不能二次登陆！')
			{
					 //document.getElementById("xiaxian").style.display = 'block';
					  var isSure = confirm("您在其他地方已经登陆，你要强行让对面下线吗？");
				   if (isSure) {
					location='com?action=xiaxian'
				     } else {
		
					return false;
				      }
			}
			if(tip=='您在其他地方已登录，被迫下线！'){
			alert(tip);
			}
    }
	
	</script>
  </head>
  <body id="w-body-aaaa" data-type="body" class="p-173886 n-widget w-body" onload="aaa()">
    <div id="w-area-aaab" data-type="area" class="p-173886 n-widget w-area">
    
      <div id="w-columnbox-aaac" data-type="columnbox" class="n-widget w-columnbox">
          <div class="w-col" style="width:30.769230769231%;">
          <div id="w-area-aaad" data-type="area" class="p-173886 n-widget w-area">
             
            <div id="w-image-aaae" data-type="image" class="n-widget w-image">
              <img src="picture/logo.jpg" />
            </div>
          </div>
          </div>
        </div>  
       
          
      </div>
     
       <div >
        <div align="center"><%=info%><a id="xiaxian" href="com?action=xiaxian" style="display:none;">让对面下线？</a></div>
		  <form name="login_form" action="" method="post" class="margin">
		  
           <table  align="center">
				 <tr>
					<th>用户名:</th>
					<th><input type="text" name="user_name"></th>
				</tr>
				<tr>
				   <td>密码:</td>
				   <td><input type="password" name="user_password"></td>
				</tr>
				
				   
				
			</table>
			<div align="center" id="login">
			&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="login" value="登录" onclick="chick()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" name="cancel" value="取消">
	      </div>
			</form>
         
        <a href="Register.jsp" align="center" class="margin1">现在去注册>></a>
           <a href="/study/index.jsp" align="center" class="margin1">管理员入口>></a>
   
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