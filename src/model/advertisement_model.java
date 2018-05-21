package model;

public class advertisement_model {
public String url,image_url;

public String getUrl() {
	return url;
}

public void setUrl(String url) {
	this.url = url;
}

public String getImage_url() {
	return image_url;
}

public void setImage_url(String image_url) {
	this.image_url = image_url;
}

public advertisement_model(String url, String image_url) {
	super();
	this.url = url;
	this.image_url = image_url;
}

public advertisement_model() {
	super();
}

}
