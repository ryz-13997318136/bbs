package bbs_ryz;



/*public class test {
	public String name;
	

	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public static void main(String[] args) {
		String str = "";
		str=str.trim();
		String str2="";
		if(str != null && !"".equals(str)){
		for(int i=0;i<str.length();i++){
		if(str.charAt(i)>=48 && str.charAt(i)<=57){
		str2+=str.charAt(i);
		}
		}

		}
		System.out.println(str2);
		
		
		
	        
	}

}*/



  
import java.text.SimpleDateFormat;
import java.util.Properties;  
  


import javax.mail.BodyPart;  
import javax.mail.Message;  
import javax.mail.Multipart;  
import javax.mail.Session;  
import javax.mail.Transport;  
import javax.mail.internet.InternetAddress;  
import javax.mail.internet.MimeBodyPart;  
import javax.mail.internet.MimeMessage;  
import javax.mail.internet.MimeMultipart;  
  
public class test {  
  
    /** 
     * @param args 
     */  
    public static void main(String[] args) {  
    	String name = "";
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh-mm-ss");  
    	java.util.Date date=new java.util.Date();  
    	String str=sdf.format(date); 
    	//name = str ; 
      System.out.println(str);
    }  
      
  
  
}  

























































