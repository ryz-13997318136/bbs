<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page language="java" errorPage="error.jsp"%>
<%@page import="model.user_model" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'yanzheng.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
      <%
        ArrayList<user_model> user_list = (ArrayList<user_model>)session.getAttribute("user_list");
    
        user_model user = (user_model)user_list.get(0);
        
    
     %> 
     <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
  </head>
  
  <body>
   <script>
	$(function(){
		$('#ok').click(function(e){
			e.preventDefault();
			var randStr =  $('#randString').val();
			 if(randStr ==''){
			   alert('请输入验证码！')
			   return false;	
			  }
			 var url ='com?action=addfriend&randString='+randStr+'&user_id=<%=user.getUser_id()%>&user_name=<%=user.getUser_name()%>';
			 $.get(url, function(r) {
			 	if(r === '0') {
			 		alert("验证码错误！");
			 	} else if(r == 1){
			 	  alert("添加成功！");
			 		closeParentWin();
			 	} else {
			 		alert(r);
			 	}
			 });
		});
	});
		
		
		

	function reloadImage() {
		$('#btn').attr("disabled", true);
		$('#identity').attr("src", 'randstring_model?ts=' + new Date().getTime());
	}
	function closeParentWin()
	{
		console.log(parent);
		parent.top.diag.close();
	}
	
	</script>
	    请输入验证码：<form name="form1" action="" medth="post">
        <input type="text" name="randString" id="randString"><br>
		<img src="randstring_model" id="identity" onload="btn.disabled = false; " />
		<input type=button value=" 换个图片 " onclick="reloadImage()" id="btn"></br>
		<input type=button value=" 确认 " id="ok">
		<input onclick="closeParentWin()"  type="button" value="关闭" />
		</form>
  </body>
</html>
