<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page language="java" errorPage="error.jsp"%>
<%@page import="model.topic_model"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String key  = request.getParameter("key");
String scope  = request.getParameter("scope");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Search</title>
    <link rel="stylesheet" href="css/about.css" />
 
    <script>
  
    function searchM(){
    if(document.form1.key.value==""){
    alert("关键词为空！");
    return false;
    }
     if(document.form1.scope.value==""){
    alert("请选择查找范围！");
    return false;
    }
   form1.action='search?type=M';
   form1.submit();
    }
    function searchJ(){
    if(document.form1.key.value==""){
    alert("关键词为空！");
    return false;
    }
    if(document.form1.scope.value==""){
    alert("请选择查找范围！");
    return false;
    }
   form1.action='search?type=J';
   form1.submit();
    }
    </script>
    <script>
  
    function setValue(){
    var  key ='<%=key%>';
    if(key=='null'){key=''}
    var  scope ='<%=scope%>';
    if(key=='null'){key=''}
   document.getElementById("key").value=key;
   document.getElementById("scope").value=scope;
    }
    </script> 		
  </head>
  <body id="w-body-aaaa" data-type="body" class="p-173886 n-widget w-body" onload="setValue()">
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
                <div style="text-align: center;"><span style="color: rgb(197, 223, 196); font-size: x-large; line-height: 1.6;"><font face="arial, helvetica, sans-serif">检索帖子</font></span></div>
              </div>
            </div>
      <div class="tiaojian">
      <form action="" name="form1" method="post">
      关键词：<input type="text" name="key" id="key"> &nbsp;&nbsp;&nbsp;查找范围：<select name="scope" id="scope"><option value='0'>全局检索</option><option value='1'>按帖主</option>
      <option value='2'>按标题</option></select>&nbsp;&nbsp;&nbsp;<input type="button"  onclick="searchM()" value="模糊查找"/>&nbsp;&nbsp;&nbsp;<input type="button"  onclick="searchJ()" value="精确查找"/>
      </form>      
      </div>
      <div class="searched">
      <table border="" width="850">
                 <tr bgcolor="#E5BB93">
                    <th width="10%">帖主</th>
                    <th width="13%">标题</th>
                    <th width="60%">内容</th>
                    <th width="11%">日期</th>
                    <th width="6%">操作</th>
                 </tr>
                  <%             
                  
                  try{ArrayList<topic_model> list=(ArrayList<topic_model>)request.getAttribute("searched_list");   
                  String content=null;
                  String topic_name=null;                           
                  for(topic_model topic : list){
                  if(topic.getTopic_name().length()>10){
                  topic_name=topic.getTopic_name().substring(0, 10)+"...";
                   }
                   else{
                   topic_name=topic.getTopic_name();
                   }
                  if(topic.getTopic_content().length()>60){
                  content=topic.getTopic_content().substring(0, 60)+"...";                
                    }
                  else{
                  content=topic.getTopic_content();
                  }
                   
                       out.println("<tr height=50px>"
                       +"<td width='90px'><a href=com?action=checkinfo&user_id='"+topic.getUser_id()+"'>"+topic.getUser_name()+"</a></td>"
                       +"<td width='90px'>"+topic_name+"</td>"
                       +"<td width='350px' style='word-break:break-all'>"+content+"</td>"
                       +"<td width='90px'>"+topic.getTopic_date()+"</td>"
                       +"<td align='center'><a href=check?topic_id="+topic.getTopic_id()+">查看</a></td>"                                                                             
                       +"</tr>");
                  }  }catch(NullPointerException e){
                  
                  }               
                   %>
                 
            </table>
      
      
      
      
      
      
      
      
      
      
      </div>
      
      
          
     
     
           
          
          
      </div>
    </div>
  </body>
</html>