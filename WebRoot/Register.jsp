<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="utf-8" />
    <base href="<%=basePath%>"> 
    <title>注册</title>
    <link rel="stylesheet" href="css/about.css" />   
    <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
   <style type="text/css">
	form.margin {margin: -1cm 4cm 3cm 4cm}
	a.margin1 {margin: 2cm 4cm 3cm 27cm}
	p.margin1 {margin: 2cm 4cm 3cm 19cm}
	</style>
	<script type="text/javascript">
	function re(){
	if(document.register_form.user_name.value==""||document.register_form.sex.value==""||
	document.register_form.age.value==""||document.register_form.phone_number.value==""||
	document.register_form.password_one.value==""||document.register_form.password_two.value==""||
	document.register_form.signature.value==""){
	alert("填写信息不完整,请仔细检查···");
	return false;
	}
	if(!document.register_form.password_one.value==document.register_form.password_two.value){
	alert("两次输入的密码不一致···");
	return false;
	}
	if(document.register_form.signature.value.length>20){
	alert("您的个性签名太长了，只能是20个字符长度哦！");
	return false;
	}
	if(document.register_form.phone_number.value.length!=11){
	
	alert("请输入正确的11位手机号码！");
	return false;
	}
	//检查结束，跳转页面
	register_form.action='register';
    register_form.submit();
	}
	</script>	
	<script type="text/javascript">
	//对输入的验证码的检验
	function test(){ 
        var xmlhttp;
        var str = document.register_form.yanzheng.value;
        if(str==""){
        return;
        }
		 if (window.XMLHttpRequest) {
				xmlhttp = new XMLHttpRequest();
			} else {
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
		xmlhttp.open("GET", "com?action=test&str="+str+"", true);
		xmlhttp.send();
		xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var result = xmlhttp.responseText;
				if(result==1){
				alert("输入的验证码错误!");
				document.register_form.register.disabled = true;
				return false;
				}
				document.register_form.register.disabled = false;
				}
			}
			
        return true;
		}
		function reloadImage() {
		$('#identity').attr("src", 'randstring_model?ts=' + new Date().getTime());
	}
	
	</script>	
  </head>
  <body id="w-body-aaaa" data-type="body" class="p-173886 n-widget w-body">
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
        
		 <% 
           String state;
          if(request.getAttribute("state")==null){
           state="";
          }
          else{
          state=(String)request.getAttribute("state");
          }
          
          %>



   <form name="register_form" action="" method="post"class="margin">
   <p class="margin1"><%=state%></p>
   
    <table  align="center">
     <tr align="center">
        <th>用户名:</th>
        <th><input type="text" name="user_name"></th>
    </tr>
    <tr align="center">
       <td>性别:</td>
       <td>
         <div>
            <input type="radio" name="sex" checked="checked" value="男"/>男
            <input type="radio" name="sex" value="女"/>女
         </div>      
       </td>
    </tr>
     <tr align="center">
        <th>年龄:</th>
        <th><input type="text" name="age"></th>
    </tr>
     <tr align="center">
        <th>电话号:</th>
        <th><input type="text" name="phone_number"></th>
    </tr>
    <tr align="center">
       <td>密码:</td>
       <td><input type="password" name="password_one"></td>
    </tr>
    <tr align="center">
       <td>再次输入密码:</td>
       <td><input type="password" name="password_two"></td>
    </tr>
     <tr align="center">
        <th>个性签名:</th>
        <th><textarea rows="2" cols="22" name="signature"></textarea></th>
    </tr>
      <tr align="center">
        <th>请输入验证码:</th>
        <th width="22px"><input type="text" name="yanzheng" onBlur="test()"></th>
        <th><img src="randstring_model" id="identity"/></th>
        <th><a  onclick="reloadImage()">看不清？换一个</a></th>
    </tr>
    <tr align="center">
       <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="register" value="注册" onclick="re()" id="register"/></td>
       <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset"  value="重置" /></td>
    </tr>
    </table>
    </form>
     <a href="Login.jsp" class="margin1">返回登录>></a>
           
   
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