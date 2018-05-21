package model;

public class user_model {

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_age() {
		return user_age;
	}
	public void setUser_age(String user_age) {
		this.user_age = user_age;
	}
	public String getUser_sex() {
		return user_sex;
	}
	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}
	public String getUser_phonenumber() {
		return user_phonenumber;
	}
	public void setUser_phonenumber(String user_phonenumber) {
		this.user_phonenumber = user_phonenumber;
	}
	public String getUser_signature() {
		return user_signature;
	}
	public void setUser_signature(String user_signature) {
		this.user_signature = user_signature;
	}
	public String getUser_image() {
		return user_image;
	}
	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}
	public String user_id;
	public String user_name;
	public String user_password;
	public String user_age;
	public String user_sex;
	public String user_phonenumber;
	public String user_signature;
	public String user_image;
	public String user_qiandao;
	public String getUser_qiandao() {
		return user_qiandao;
	}
	public void setUser_qiandao(String user_qiandao) {
		this.user_qiandao = user_qiandao;
	}
	//������췽�����ڲ鿴�ҵ�һ������ʱ���õ�
	public  user_model(String user_id,String user_name,String user_age,String user_sex,String user_phonenumber,String user_signature,String user_image,String user_qiandao){
		this.user_name=user_name;
		this.user_age=user_age;
		this.user_sex=user_sex;
		this.user_id=user_id;
		
		this.user_phonenumber=user_phonenumber;
		this.user_signature=user_signature;
		this.user_image=user_image;
		this.user_qiandao = user_qiandao;
		
		
	}
}
