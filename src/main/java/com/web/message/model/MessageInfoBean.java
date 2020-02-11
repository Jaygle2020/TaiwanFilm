package com.web.message.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
@Entity
public class MessageInfoBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name="mesInfoId")
private Integer mesInfoId;
@Column(columnDefinition="TEXT")
private String innerText;
private Integer photoCount;
private String img01;
private Blob image01;
private String img02;
private Blob image02;
private String img03;
private Blob image03;
@OneToOne(cascade=CascadeType.ALL, fetch=FetchType.EAGER)
@JoinColumn(name="messageId", referencedColumnName="messageId")
private MessageBean messageBean;



public Integer getMesInfoId() {
	return mesInfoId;
}
public void setMesInfoId(Integer mesInfoId) {
	this.mesInfoId = mesInfoId;
}
public String getInnerText() {
	return innerText;
}
public void setInnerText(String innerText) {
	this.innerText = innerText;
}

public String getImg01() {
	return img01;
}
public void setImg01(String img01) {
	this.img01 = img01;
}
public String getImg02() {
	return img02;
}
public void setImg02(String img02) {
	this.img02 = img02;
}
public String getImg03() {
	return img03;
}
public void setImg03(String img03) {
	this.img03 = img03;
}
public MessageBean getMessageBean() {
	return messageBean;
}
public void setMessageBean(MessageBean messageBean) {
	this.messageBean = messageBean;
}
public String getImg04() {
	return img04;
}
public void setImg04(String img04) {
	this.img04 = img04;
}
public Blob getImage01() {
	return image01;
}
public void setImage01(Blob image01) {
	this.image01 = image01;
}

public Blob getImage02() {
	return image02;
}
public void setImage02(Blob image02) {
	this.image02 = image02;
}

public Blob getImage03() {
	return image03;
}
public void setImage03(Blob image03) {
	this.image03 = image03;
}

public Blob getImage04() {
	return image04;
}
public void setImage04(Blob image04) {
	this.image04 = image04;
}
public Integer getPhotoCount() {
	return photoCount;
}
public void setPhotoCount(Integer photoCount) {
	this.photoCount = photoCount;
}
private String img04;
private Blob image04;
}
