<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import=" java.sql.ResultSet"%>
<%@page import="model.topic_model"%>
<%@page import="model.friend_model"%>
<%@page import="model.notice_model" %>
<%@page import="model.advertisement_model" %>
<%@page language="java" errorPage="error.jsp"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String qiandaotimes = session.getAttribute("user_qiandao").toString();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>首页</title>
    <link rel="stylesheet" href="css/main.css" />	
    <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="js/slider.js"></script>
   <link href="css/common.css" rel="stylesheet" type="text/css" />
   <link href="css/index.css" rel="stylesheet" type="text/css" />

	<script>
	function qiandao(){
	     var xmlhttp;
		 if (window.XMLHttpRequest) {
				xmlhttp = new XMLHttpRequest();
			} else {
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
		xmlhttp.open("GET", "com?action=qiandao", true);
		xmlhttp.send();
		xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var result = xmlhttp.responseText;
				if(result==0){
				alert("今天您已经签到过了~");				
				return false;
				}
				alert("成功签到"+result+"次了")
				var str = "您已经签到"+result+"次了~"
				document.getElementById("qiandaotimes").innerHTML=str;
				}
			}
			
        return true;
	}
	</script>
	<%
	int cp = Integer.parseInt(request.getAttribute("cp").toString());
	int tp = Integer.parseInt(request.getAttribute("tp").toString());
	
	 %>
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
                    <div style="text-align: center;" class="d_out" onmouseover="this.className='d_over'" onmouseout="this.className='d_out'"><span style="line-height: 1.6;"><a href="main">HOME</a></span></div>
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
	  
	  
	  <div class="w-col" style="width:16%;">
          <div id="w-area-aaas" data-type="area" class="p-173886 n-widget w-area">
            <div id="w-area-aaat" data-type="area" class="p-173886 n-widget w-area">
              <div id="w-image-aaav" data-type="image" class="n-widget w-image">
               <img src="./image/<%=(String)session.getAttribute("imageid")%>" onerror="javascript:this.src='picture/head.png';" height="200" width="180">
              </div>
              <div id="w-text-aaax" data-type="text" class="n-widget w-text">
                最近通知
              </div>
              <div id="w-divider-aaay" data-type="divider" class="n-widget w-divider">
                <hr />
              </div>
             <div class="notice">
             
     
           <marquee loop="-1" direction="up" onMouseOver="this.stop()" onMouseOut="this.start()" align="center"   >
               
           
                 <%             
                  ArrayList<notice_model> notice_list=(ArrayList<notice_model>)request.getAttribute("notice_list");   
                                            
                  for(notice_model notice : notice_list){
                       out.println("<a style='text-decoration:underline;color: #621E73;';} href=check_notice?notice_id="+notice.getNotice_id()+">"+notice.getNotice_name()+"</a><br>");
                  }                 
                  %>
           
           
           
           
           
           
           </marquee>   
             </div>
             <div class="content_right">
                 <div class="ad">        
                 <ul class="slider" >
                 <%             
                  ArrayList<advertisement_model> adv_list=(ArrayList<advertisement_model>)request.getAttribute("adv_list");   
                                            
                  for(advertisement_model adv : adv_list){
                    out.println(
                       "<li><a href='//"+adv.getUrl()+"' target='_blank'><img  src='http://localhost:8080/study/image/"+adv.getImage_url()+"'/></a></li>"
                       
                      ); 
                        
                  }
                  %>
                  </ul>
                  <ul class="num">
                  <% 
                  int i = 0;
                   for(i=0;i<adv_list.size();i++){
                    out.println(
                       "<li>"+(i+1)+"</li>"
                       
                      ); 
                        
                  }                  
                  %>
                </ul>
             </div>
             </div>
             
             
             

             
                    
            </div>
          </div>
      </div>
	  <!-- 下面是显示话题的区域>-->
          <div class="w-col" style="width:70%;">
          <div id="w-area-aaaq" data-type="area" class="p-173886 n-widget w-area" align="center">
            
			<form name=form1 action='' method='post' >
			<table border="" class="bordered" width="700">
                 <tr bgcolor="#E5BB93">
                    <th width="10%">帖主</th>
                    <th width="13%">标题</th>
                    <th width="54%">内容</th>
                    <th width="15%">日期</th>
                    <th width="8%">操作</th>
                 </tr>
                  <%             
                  ArrayList<topic_model> list=(ArrayList<topic_model>)request.getAttribute("topic_list");   
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
                   
                       out.println("<tr height=50px style='background-color: floralwhite;'>"
                       +"<td width='90px'><a href=com?action=checkinfo&user_id='"+topic.getUser_id()+"'>"+topic.getUser_name()+"</a></td>"
                       +"<td width='90px'>"+topic_name+"</td>"
                       +"<td width='350px' style='word-break:break-all'>"+content+"</td>"
                       +"<td width='90px'>"+topic.getTopic_date()+"</td>"
                       +"<td align='center'><a href=check?topic_id="+topic.getTopic_id()+">查看</a></td>"                                                                             
                       +"</tr>");
                  }                 
                   %>
                 
            </table>
            第<%=cp%>/<%=tp%>页
            <a href="main?p=<%=cp<=1?1:(cp-1)%>">上一页</a><a href="main?p=<%=cp>=tp?tp:(cp+1)%>">下一页</a>
			</form>
          </div>
          </div>
          <div class="w-col" style="width:14%;">
          <div style="width: 136px;height: 41px;"><a href="search.jsp"><img src="picture/bg32.jpg"/></a></div>
       <div  data-type="image" class="friend">
            <div class="myf">我的好友</div>
       <table border="1" width="135" style="background-color: #D4E6B0;">
         <%             
                  ArrayList<friend_model> friend_list=(ArrayList<friend_model>)request.getAttribute("friend_list");   
                                        
                  for(friend_model friend : friend_list){
                       out.println("<tr>"
                       +"<td>"+friend.getFriend_name()+"</td>"                   
                       +"<td><a href=userinfo?friend_id="+friend.getFriend_id()+">查看</a></td>"                                                                             
                       +"</tr>");
                  }                 
                   %>
       </table>
               
              </div>
              <div style="width: 135px;">
              <button type="button" class="pbut" onclick="qiandao()">
              <img src="picture/qiandao.png">
              </button>
              <div id="qiandaotimes" class="qiandaotimes">你已经签到<%=qiandaotimes %>次了~       </div>
              
              </div>
       </div>
      </div>
      
       </div>
     
  </body>
</html>
