<%@page import="java.io.PrintWriter"%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page language="java" errorPage="error.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

request.setCharacterEncoding("UTF-8");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>publish</title>
    <link rel="stylesheet" href="css/contact.css" />	
    <script>
    function publish(){
    var title = document.getElementById("title").value;
    var content =  document.getElementById("content").value;
    if(title==''){
    alert("帖子标题不能为空！");
    return false;
    }
      if(title.length>=10){
    alert("帖子标题长度不能超过10！");
    return false;
    }
    if(content==''){
    alert("帖子内容不能为空！");
    return false;
    }
    if(content.length>=200){
    alert("帖子内容不能超过100个汉字！");
    return false;
    }
    publish_form.action='publish';
    publish_form.submit();
    }
    function reset(){
    document.getElementById("title").value='';
    document.getElementById("content").value='';
    }
</script>    
    <script>
    function count(){
    var content = document.getElementById("content");
    var len = content.value.length;
    if(len>=200){
   // content.disabled=true;
    alert("您的字数已经超限了~~~");
    var newcontent = content.value.substring(0,199);
    document.getElementById("content").value=newcontent;
    return true;
    }
    var tip = '剩余字数'+len +'/200'
    document.getElementById("tip").value=tip;
    
    }
    </script>	
  </head>
  <body id="w-body-aaaa" data-type="body" class="p-173886 n-widget w-body">
    <div id="w-area-aaab" data-type="area" class="p-173886 n-widget w-area">
    <p align="right">当前用户：<%=(String)session.getAttribute("user_name") %> &nbsp;&nbsp;&nbsp; <a href="com?action=logout">退出</a></p>
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
            <div style="text-align: center;"><span style="color: rgb(197, 223, 196); font-size: x-large; line-height: 1.6;"><font face="arial, helvetica, sans-serif">发布帖子</font></span></div>
           
          </div>
        </div>
        <div id="w-area-aaas" data-type="area" class="p-173886 n-widget w-area">
          <div id="w-text-aaat" data-type="text" class="n-widget w-text">
          <% 
           String state;
          if(request.getAttribute("state")==null){
           state="发布一条信息";
          }
          else{
          state=(String)request.getAttribute("state");
          }
          
          %>
            <div style="text-align: center;"><span style="line-height: 1.6;"><%=state%></span></div>
          </div>
          <div id="w-columnbox-aaau" data-type="columnbox" class="n-widget w-columnbox">
              <div class="w-col" style="width:21.264367816092%;">
              <div id="w-area-aaav" data-type="area" class="p-173886 n-widget w-area">
               
                <div id="w-text-aaax" data-type="text" class="n-widget w-text">
                  <div style="text-align: right;"><span style="font-family: 'Microsoft YaHei'; font-size: large; line-height: 1.6;"><font color="#282828">标题:</font></span></div>
                </div>
                <div id="w-text-aaay" data-type="text" class="n-widget w-text">
                  <div style="text-align: right;"><span style="font-family: 'Microsoft YaHei'; font-size: large; line-height: 1.6;"><font color="#282828"></font></span><span style="color: rgb(40, 40, 40); font-family: 'Microsoft YaHei'; font-size: large; line-height: 1.6;"></span></div>
                </div>
                <div id="w-text-aaaz" data-type="text" class="n-widget w-text">
                  <div style="text-align: right;"><span style="font-family: 'Microsoft YaHei'; font-size: large; line-height: 1.6;"><font color="#282828">内容:</font></span></div>
                </div>
              </div>
              </div>
              <div class="w-col" style="width:78.735632183908%;">
              <div id="w-area-aaba" data-type="area" class="p-173886 n-widget w-area">
                <div id="w-100002-form-aabb" data-type="100002.form" class="n-widget w-100002-form">
                
 <form name="publish_form" method="post" diy="0" action="" method="post">
  <h2> </h2>
  <div id="w-area-aabc" data-type="area" class="p-173886 n-widget w-area">
  <div id="w-100002-text-aabd" data-type="100002.text" class="n-widget w-100002-text">
    <div class="form-group" data-comid="1" data-title=" " data-required="0">
  <label>  <span class="required"></span></label>
  </div>
  </div>
  <div id="w-100002-text-aabe" data-type="100002.text" class="n-widget w-100002-text">
    <div class="form-group" data-comid="2" data-title=" " data-required="0">
  <label>  <span class="required"></span></label>
  <input type="text" name="title" id="title" class="form-control input" value="" style="width: 75%">
  </div>
  </div>
  <div id="w-100002-text-aabf" data-type="100002.text" class="n-widget w-100002-text">
    <div class="form-group" data-comid="3" data-title=" " data-required="0">
  <label>  <span class="required"></span></label>
  
  </div>
  
  </div>
  <div><input type="text" readonly="true" id="tip" id="tip"/></div>
  
  <div id="w-100002-textarea-aabg" data-type="100002.textarea" class="n-widget w-100002-textarea">
    <div class="form-group" data-comid="4" data-title=" " data-required="0">
  <label>  <span class="required"></span></label>
  <textarea name="content" id="content" class="form-control textarea" rows="5" style="width: 75%" onKeyDown="count()"></textarea>
  </div>
  </div>
</div>
  <div id="w-button-aabh" data-type="button" class="n-widget w-button t-button-m04">
  <a href="javascript:void(0);" class="w-button-container" id="w-button-aabh-b">
  <span class="w-button-text"><i class="middle"></i><input type="button" class="text" value="清空" onclick="reset()"/></span><i class="w-button-right"></i>
  </a>
  <a href="javascript:void(0);" class="w-button-container" id="w-button-aabh-b">
  <span class="w-button-text"><i class="middle"></i><input type="button" class="text" value="发表" onclick="publish()"/></span><i class="w-button-right"></i>
  </a>
</div>
  </form>
                </div>
              </div>
              </div>
          </div>
        </div>
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