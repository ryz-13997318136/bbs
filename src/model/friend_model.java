package model;

public class friend_model {
public String friend_id;
public String getFriend_id() {
	return friend_id;
}
public void setFriend_id(String friend_id) {
	this.friend_id = friend_id;
}
public String getFriend_name() {
	return friend_name;
}
public void setFriend_name(String friend_name) {
	this.friend_name = friend_name;
}
public String friend_name;
public friend_model(){}
public friend_model(String id,String name){
	this.friend_id=id;
	this.friend_name=name;
}
}
