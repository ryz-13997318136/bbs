package model;

public class liuyan_model {
public String message_id;
public String getMessage_id() {
	return message_id;
}
public void setMessage_id(String message_id) {
	this.message_id = message_id;
}
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
public String getUser_to_name() {
	return user_to_name;
}
public void setUser_to_name(String user_to_name) {
	this.user_to_name = user_to_name;
}
public String getUser_to_id() {
	return user_to_id;
}
public void setUser_to_id(String user_to_id) {
	this.user_to_id = user_to_id;
}
public String getMessage_content() {
	return message_content;
}
public void setMessage_content(String message_content) {
	this.message_content = message_content;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}

public liuyan_model(String message_id, String user_id, String user_name,
		String user_to_name, String user_to_id, String message_content,
		String date) {
	super();
	this.message_id = message_id;
	this.user_id = user_id;
	this.user_name = user_name;
	this.user_to_name = user_to_name;
	this.user_to_id = user_to_id;
	this.message_content = message_content;
	this.date = date;
}

public String user_id;
public String user_name;
public String user_to_name;
public String user_to_id;
public String message_content;
public String date;
}
