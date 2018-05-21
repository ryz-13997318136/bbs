<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page language="java" errorPage="error.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="model.user_model"%>
<%@page import="model.topic_model"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>about</title>
    <link rel="stylesheet" href="css/about.css" />
    
<link rel="stylesheet" type="text/css" media="all" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/zDialog.js"></script>
<script src="js/jquery.soChange.js" type="text/javascript"></script>
    
    <script type="text/javascript">

$(function () {


//在选项卡上的运用
$(".eachBox li").click(function(){
	$(".eachBox li").removeClass("active");
	$(this).addClass("active");
	var cls = $(this).children("a").attr("ref");
	$(".eachBox .box").hide();
	$(".eachBox").find("."+cls).show();
});

	$('#change_6 .tzit').soChange({
		thumbObj:'#change_6 .title',
		slideTime:0,
		thumbOverEvent:false,
		autoChange:false//自动切换为 false，默认为true
		
	});

});

</script>
  
  <script type="text/javascript">
  function liuyan(){
  if(document.liuyan_form.content.value==""){
  alert("请输入留言信息！");
  return false
  }
  else{
  liuyan_form.action='liuyan';
  liuyan_form.submit();
  
  }
  
  }
  </script>

       
    
    		
  </head>
  <body id="w-body-aaaa" data-type="body" class="p-173886 n-widget w-body" >
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
       <div id="w-area-aaarr" data-type="area" class="p-173886 n-widget w-area">
              <div id="w-text-aaas" data-type="text" class="n-widget w-text">
                <div style="text-align: center;"><span style="color: rgb(197, 223, 196); font-size: x-large; line-height: 1.6;"><font face="arial, helvetica, sans-serif">好友资料</font></span></div>
              </div>
            </div>
    
    <%
    
     ArrayList<user_model> friend_list = (ArrayList<user_model>)session.getAttribute("my_one_friend_list");
     user_model  friend =(user_model)friend_list.get(0);
 String qiandao = friend.getUser_qiandao();
 int huoyuedu = (Integer.parseInt(qiandao))/2;
     %>
    
    
    
    
    
 
    
<div id="wrapper" >


<div class="eachBox">
	<div class='menu'>
		<ul>
			<li  class="active"><a href="#" ref="userinfo">基本信息</a></li>
			<li><a href="#" ref="new">他的动态</a></li>
			<li><a href="#" ref="comment">给他留言</a></li>
			<li><a href="#" ref="qmd">亲密度</a></li>
		</ul>
	</div>
	<div class='contentbox'>
		<div class="box userinfo">
			<div class="img">
				<img src="./image/<%=friend.getUser_image()%>" onerror="javascript:this.src='picture/head.png';" height="200" width="180">
				<div class="huoyuedu1">活跃度：<%=huoyuedu %></div>				 
			</div>
			
		<div class="description">
			<table  border="0" width="250">
                 <tr>
                 <td>姓名：</td>
                 <td><%=friend.getUser_name()%>
                 </tr>
                  <tr>
                 <td>年龄：</td>
                 <td><%=friend.getUser_age()%>
                 </tr>
                  <tr>
                 <td>性别：</td>
                 <td><%=friend.getUser_sex()%>
                 </tr>
                  <tr>
                 <td>电话号：</td>
                 <td><%=friend.getUser_phonenumber()%>
                 </tr>
                  <tr>
                 <td>签名：</td>
                 <td><%=friend.getUser_signature()%>
                 </tr>
                 
                   
                 
            </table>
		
		
		
		
		</div>
	</div>
	
	<div class="box new">
	
		<div class='title'>
                 
                    <span class='user' width="50px">帖主</span>
                    <span class='topic'>标题</span>
                    <span class='content'>内容</span>
                    <span class='time'>日期</span>  
                    <span class='chakan'>查看</span>                 
                 
         </div>
         <div class='cnt'>
                  <%             
                  ArrayList<topic_model> list=(ArrayList<topic_model>)session.getAttribute("friend_topic_list");   
                                          
                  for(topic_model my_topic : list){                
                       out.println("<div class='row'>"
                       +"<div class='user fleft'>"+my_topic.getUser_name()+"</div>"
                       +"<div class='topic fleft'>"+my_topic.getTopic_name()+"</div>"
                       +"<div class='content fleft'>"+my_topic.getTopic_content()+"</div>"
                       +"<div class='time fleft'>"+my_topic.getTopic_date()+"</div>"
                       +"<div class='chakan fleft'><a href=check?topic_id="+my_topic.getTopic_id()+"><img class='chakan' src='picture/chakan.png'></a></div>"                                                                            
                       +"</div>");
                  }                 
                   %>
          </div>

	</div>
	
	<div class="box comment">
	
		<form name="liuyan_form" action="" method="post">
	<div style="vertical-align:middle;text-align:center;"><textarea name="content"  rows="6" style="width: 75%;margin-top:40px;margin-left: -54px;"></textarea></div>
	<input type="hidden" name="friend_name" value=<%=friend.getUser_name()%>>
	
	<input type="hidden" name="friend_id" value=<%=friend.getUser_id()%>>
	<div class="liuyan">
	<input type="button" value="留言" onclick="liuyan()">
	<input type="reset" value="清空">
	</div>
</form>		
	</div>
	
	<div class="box qmd">此处为预留板块</div>
</div>





</div>

</div>
      
      
 
      
    
      <div id="w-columnbox-aaaxx" data-type="columnbox" class="n-widget w-columnbox" align="center">
          <div class="w-col" style="width:100%;">
          <div id="w-area-aaay" data-type="area" class="p-173886 n-widget w-area">
            <div id="w-text-aaaz" data-type="text" class="n-widget w-text">
               2016 by NOMAD ON THE ROAD. Proudly created with RYZ
            </div>
          </div>
          </div>
          
      </div>
    </div>
    </div>
  </body>
</html>