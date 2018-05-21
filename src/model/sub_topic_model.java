package model;

public class sub_topic_model {
public String topic_id,sub_topic_id,sub_topic_content,sub_user_name;

public String getSub_user_name() {
	return sub_user_name;
}
public void setSub_user_name(String sub_user_name) {
	this.sub_user_name = sub_user_name;
}
public String getTopic_id() {
	return topic_id;
}
public void setTopic_id(String topic_id) {
	this.topic_id = topic_id;
}
public String getSub_topic_id() {
	return sub_topic_id;
}
public void setSub_topic_id(String sub_topic_id) {
	this.sub_topic_id = sub_topic_id;
}
public String getSub_topic_content() {
	return sub_topic_content;
}
public void setSub_topic_content(String sub_topic_content) {
	this.sub_topic_content = sub_topic_content;
}
public  sub_topic_model(){}
public  sub_topic_model(String topic_id,String sub_topic_id,String sub_topic_content,String sub_user_name){ 
	this.topic_id=topic_id;
	this.sub_topic_id=sub_topic_id;
	this.sub_topic_content=sub_topic_content;
	this.sub_user_name=sub_user_name;
}
}
