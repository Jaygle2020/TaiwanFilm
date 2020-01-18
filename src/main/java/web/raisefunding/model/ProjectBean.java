package web.raisefunding.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
public class ProjectBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Integer projectId;
private String projectName;
private String projDescript;
private Blob photo;
private String videoLink;
@Transient
private MultipartFile photoStr;
public Integer getProjectId() {
	return projectId;
}
public void setProjectId(Integer projectId) {
	this.projectId = projectId;
}
public String getProjectName() {
	return projectName;
}
public void setProjectName(String projectName) {
	this.projectName = projectName;
}
public String getProjDescript() {
	return projDescript;
}
public void setProjDescript(String projDescript) {
	this.projDescript = projDescript;
}
public Blob getPhoto() {
	return photo;
}
public void setPhoto(Blob photo) {
	this.photo = photo;
}
public String getVideoLink() {
	return videoLink;
}
public void setVideoLink(String videoLink) {
	this.videoLink = videoLink;
}
public MultipartFile getPhotoStr() {
	return photoStr;
}
public void setPhotoStr(MultipartFile photoStr) {
	this.photoStr = photoStr;
}

}
