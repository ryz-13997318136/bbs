<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page language="java" errorPage="error.jsp"%>
<%@page import="bbs_control.sub_topic"%>
<%@page import="model.sub_topic_model"%>
<%@page import="model.topic_model"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    
    <title>帖子详情</title>
    <link rel="stylesheet" href="css/contact.css" />
    
    <script language="javascript">
	function addElement() {
	//创建TextNode节点
	var local_user = '<%=request.getAttribute("local_user")%>';
	var person = document.createTextNode(local_user);
	var content = document.createTextNode(form1.content.value);	
	//创建td类型的Element节点
	var td_person = document.createElement("td"); 
	var td_content = document.createElement("td");	
	var tr = document.createElement("tr"); //创建一个tr类型的Element节点
	var tbody = document.createElement("tbody"); //创建一个tbody类型的Element节点
	//alert(td_person);
	//将TextNode节点加入到td类型的节点中
	td_person.appendChild(person);
	td_content.appendChild(content);	
	//将td类型的节点添加到tr节点中
	tr.appendChild(td_person);
	tr.appendChild(td_content);	
	tbody.appendChild(tr); //将tr节点加入tbody中
	var tComment = document.getElementById("comment"); //获取table对象
	tComment.appendChild(tbody); //将节点tbody加入节点尾部
	form1.content.value="";		//清空评论内容文本框
}
</script>
<script>
     
    window.onload =function()
    {
        document.getElementById("bt").disabled=true;
         
        //密码框失去焦点时判断。验证码自己加吧。
        document.getElementById("sub_topic_content").onblur = function()
        {
            if(document.getElementById("sub_topic_content").value==""||this.value=="")
            {
                document.getElementById("bt").disabled=true;
            }else
            {
                document.getElementById("bt").disabled=false;
            }
        }
    }
    </script>
<script>
function reset1(){

      document.getElementById("sub_topic_content").value="";
      document.getElementById("bt").disabled=true;
            
}
function  comment(){
    form1.action='sub_topic';
    form1.submit();
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
            <div style="text-align: center;"><span style="color: rgb(197, 223, 196); font-size: x-large; line-height: 1.6;"><font face="arial, helvetica, sans-serif">帖子详情</font></span></div>
          </div>
        </div>
        <div class="back">
        <a href="JavaScript:history.go(-1)"><img src="picture/go_back.png"/></a></div>
        <div id="w-area-aaas1" data-type="area" class="p-173886 n-widget w-area" align="center">
          	
			<table border="1"width="800" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#666666" bordercolordark="#FFFFFF">
                 <tr>
                    <th width="10%" align="center" bgcolor="#E5BB93">帖主</th>
                    <th width="75%" align="center" bgcolor="#E5BB93">帖子内容</th>
                    <th width="15%" align="center" bgcolor="#E5BB93">发布时间</th>
					
                 </tr>
                  <%             
                  ArrayList<topic_model> list2=(ArrayList<topic_model>)session.getAttribute("list2");   
                                            
                  for(topic_model topic : list2){                 
                       out.println("<tr>"
                       +"<td align='center' >"+topic.getUser_name()+"</td>"
                       +"<td>"+topic.getTopic_content()+"</td>"   
                       +"<td align='center'>"+topic.getTopic_date()+"</td>"                                                                         
                       +"</tr>");
                  }                 
                   %>
            </table>
         <br>
<table width="800" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#666666" bordercolordark="#FFFFFF" id="comment">
  <tr>
	<td width="10%" height="27" align="center" bgcolor="#E5BB93">评论人</td>
	<td width="85%" align="center" bgcolor="#E5BB93">评论内容</td>
	<td width="5%" align="center" bgcolor="#E5BB93">#</td>
  </tr>
     <%             
                  ArrayList<sub_topic_model> list3=(ArrayList<sub_topic_model>)session.getAttribute("list3");   
                  int i=0;                    
                  for(sub_topic_model sub_topic : list3){   
                       System.out.println(i);       
                       out.println("<tr>"
                       +"<td align='center'>"+sub_topic.getSub_user_name()+"</td>"
                       +"<td>"+sub_topic.getSub_topic_content()+"</td>" 
                       +"<td>"+(list3.indexOf(sub_topic)+1)+"楼</td>"                                                                           
                       +"</tr>");
                       i=i++;
                  }                 
                   %>
  
</table>
<form name="form1" method="post" action="">    
  <table width="600" height="122" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="119" height="14">&nbsp;</td>
      <td width="481">&nbsp;</td>
    </tr>
    <tr>
   
    </tr>
    <tr>
      <td align="center">评论内容：</td>
      <td><textarea name="sub_topic_content" id="sub_topic_content"cols="50" rows="5" id="content"></textarea></td>
    </tr>
  
    <tr>
    <td><input name="topic_id" type="text" value=<%=list2.get(0).getTopic_id()%>  style="display:none;"/></td>
    </tr>
    <tr>
      <td height="40">&nbsp;</td>
      <td align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input name="Button" type="button" id="bt" class="btn_grey" value="评论" onClick="comment()">
      &nbsp;
      <input name="Button" type="button" class="btn_grey" value="重置" onClick="reset1()">
      </td>
    </tr>
  </table>
  </form>
  
        
        </div>
      </div>
      
     
          
          <div id="w-area-aabj" data-type="area" class="aabb" align="center">
            <div id="w-text-aabk" data-type="text" class="n-widget w-text" align="center">
              Â© 2023 by NOMAD ON THE ROAD. Proudly created with Wix.com
            </div>
          </div>
         
     
  

  </body>
</html>