package leader;

public class ParseResult {
private int classId;
private boolean success;
private String picURL;
private String severinf;
private String modelname;
private String hint;


public String getHint() {
	return hint;
}
public void setHint(String hint) {
	this.hint = hint;
}
public String getSeverinf() {
	return severinf;
}
public void setSeverinf(String severinf) {
	this.severinf = severinf;
}
public String getModelname() {
	return modelname;
}
public void setModelname(String modelname) {
	this.modelname = modelname;
}
public int getClassId() {
	return classId;
}
public void setClassId(int classId) {
	this.classId = classId;
}
public boolean isSuccess() {
	return success;
}
public void setSuccess(boolean success) {
	this.success = success;
}
public String getPicURL() {
	return picURL;
}
public void setPicURL(String picURL) {
	this.picURL = picURL;
}

}
