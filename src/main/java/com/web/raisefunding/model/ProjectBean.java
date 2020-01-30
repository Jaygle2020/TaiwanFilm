package com.web.raisefunding.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class ProjectBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name="projectId")
private Integer projectId;
private String projectName;
@Column(length=500)
private String projDescript;
private String photoFileName;
private Blob photo;
private String videoLink;



public ProjectBean() {}
public ProjectBean(String projectName,String projDescript,String videoLink) {
	this.projectName = projectName;
	this.projDescript = projDescript;
	this.videoLink = videoLink;
	
}



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
public String getPhotoFileName() {
	return photoFileName;
}
public void setPhotoFileName(String photoFileName) {
	this.photoFileName = photoFileName;
}


}
