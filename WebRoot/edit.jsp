<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page language="java" errorPage="error.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("UTF-8");
String name = session.getAttribute("user_name").toString();
String sex = session.getAttribute("user_sex").toString();
String age = session.getAttribute("user_age").toString();
String phone_number = session.getAttribute("user_phonenumber").toString();
String signature = session.getAttribute("user_signature").toString();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="GBK" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>编辑个人信息</title>
    <script type="text/javascript" src="js/zDialog.js"></script>
    <link rel="stylesheet" href="css/about.css" />
    <script>
    function edit(){  
    if(check()==true&&CheckFileType()==true){
    form1.action='edit';
    form1.submit();
    }
   
    }   
    </script>
    <script type="text/javascript">
    function check(){
    if(document.form1.name.value==""||document.form1.sex.value==""||
	document.form1.age.value==""||document.form1.phonenumber.value==""||
	document.form1.file.value==""){
	alert("修改信息不完整,请仔细检查···");
	return false;
	}
	if(document.form1.signature.value.length>20){
	alert("您的个性签名太长了，只能是20个字符长度哦！");
	return;
	}
	
	else{
	return true;
	}
    }
    function CheckFileType()
     {
       var obj=document.getElementById('file');
        var stuff=obj.value.match(/^(.*)(.)(.{1,8})$/)[0]; //这个文件类型正则很有用：）    
       var a = stuff.lastIndexOf('.');       
        var b = stuff.substring(a+1).toLowerCase();     
        if(b!='png'&& b!='jpg')
        {
           Dialog.alert('上传的头像文件类型不正确！');
           return false;
        }
        return true;
     }
    </script>
    <script>
    function init(){
    var name='<%=name%>';
    var age='<%=age%>';
    var sex='<%=sex%>';
    var phone_number='<%=phone_number%>';
    var signature='<%=signature%>';
    
    document.getElementById("name").value=name;
    document.getElementById("age").value=age;
    document.getElementById("phone_number").value=phone_number;
    document.getElementById("signature").value=signature;
    
     var ridaolen=document.form1.sex.length;
        for(var i=0;i<ridaolen;i++){
            if(sex==document.form1.sex[i].value){
                document.form1.sex[i].checked=true
            }
        }  
    }
    
    
    </script>
    		
  </head>
  <body id="w-body-aaaa" data-type="body" class="p-173886 n-widget w-body" onload="init()">
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
       <div id="w-area-aaar4" data-type="area" class="p-173886 n-widget w-area">
              <div id="w-text-aaas" data-type="text" class="n-widget w-text">
                <div style="text-align: center;"><span style="color: rgb(197, 223, 196); font-size: x-large; line-height: 1.6;"><font face="arial, helvetica, sans-serif">编辑资料</font></span></div>
              </div>
            </div>         
      </div>
      
     
      
      
      
   <div class="clearfix">   
      
       <div style="float:left;margin-left:138px">
      
      <img src="./image/<%=(String)session.getAttribute("imageid")%>" onerror="javascript:this.src='picture/head.png';" height="200" width="150">
      </div>
      
      <div  style="float:left;margin-left:150px;">
      <form name="form1" action="" method="post" enctype="multipart/form-data">
      <table align="center" border="1">
        <tr >
           <td align="center">名称:</td>
           <td align="center"><input type="text" name="name" id="name"></td>
       </tr>
        <tr>
           <td align="center">年龄:</td>
           <td align="center"><input type="text" name="age" id="age"></td>
       </tr>
         <tr>
           <td align="center">性别:</td>
           <td align="center">
              <div>
                 <input type="radio" name="sex" id="sex"  value="男"/>男
                 <input type="radio" name="sex" id="sex" value="女"/>女
              </div>  
            </td>
       </tr>
       <tr>
           <td align="center">手机号码:</td>
           <td align="center"><input type="text" name="phonenumber" id="phone_number"></td>
       </tr>
       <tr>
           <td align="center">个性签名:</td>
           <td align="center"><textarea rows="2" cols="22" name="signature" id="signature"></textarea></td>
       </tr>
       <tr>
           <td align="center">头像:</td>
           <td align="center"><input type="file" id="file" size="20" name="file"/></td>
       </tr>
     <tr>
       <td align="center"><input type="button"  value="保存" onclick="edit()"/></td>
       <td align="center"><input type="reset"  value="重置" /></td>
    </tr>
      
      </table>
      </form>     
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