package model;


public class notice_model {
	public String notice_id,notice_content;
	public String notice_name;
	public String getNotice_name() {
		return notice_name;
	}
	public void setNotice_name(String notice_name) {
		this.notice_name = notice_name;
	}
	public String getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(String notice_id) {
		this.notice_id = notice_id;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_Date() {
		return notice_Date;
	}
	public void setNotice_Date(String notice_Date) {
		this.notice_Date = notice_Date;
	}
	public String notice_Date;

	//public void notice_control(){}
	public notice_model(String notice_id, String notice_name,String notice_content, String notice_Date) {
		this.notice_id = notice_id;
		this.notice_content = notice_content;
		this.notice_Date = notice_Date;
		this.notice_name = notice_name;
	}
}
