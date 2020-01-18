package com.web.login.Model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="members")
public class MembersBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer memberId;
	private String memberName;
	private String account;
	private String password;
	@Transient
	private String password1;
	private String email;
	private String gender;
	private Date birthDay;
	private String address;
	private String phone;
	private String fileName;
	
	private Blob memberImage;
	private String createDay;
	private String updateDay;
	
	@Transient
	private MultipartFile	memImage;  	
	public MultipartFile getmemImage() {
		return memImage;
	}

	public void setmemImage(MultipartFile productImage) {
		this.memImage = productImage;
	}
	
	
	
	public Integer getMemberId() {return memberId;}
	public String getMemberName() {return memberName;}
	public String getAccount() {return account;}
	public String getPassword() {return password;}
	public String getPassword1() {return password1;}
	public String getEmail() {return email;}
	public String getGender() {return gender;}
	public Date getBirthDay() {return birthDay;}
	public String getAddress() {return address;}
	public String getPhone() {return phone;}
	public String getFileName() {return fileName;}
	public Blob getMemberImage() {return memberImage;}
	public String getCreateDay() {return createDay;}
	public String getUpdateDay() {return updateDay;}
	
	public void setMemberId(Integer memberId) {this.memberId = memberId;}
	public void setMemberName(String memberName) {this.memberName = memberName;}
	public void setAccount(String account) {this.account = account;}
	public void setPassword(String password) {this.password = password;}
	public void setPassword1(String password1) {this.password1 = password1;}
	public void setEmail(String email) {this.email = email;}
	public void setGender(String gender) {this.gender = gender;}
	public void setBirthDay(Date birthDay) {this.birthDay = birthDay;}
	public void setAddress(String address) {this.address = address;}
	public void setPhone(String phone) {this.phone = phone;}
	public void setFileName(String fileName) {this.fileName = fileName;}
	public void setMemberImage(Blob memberImage) {this.memberImage = memberImage;}
	public void setCreateDay(String createDay) {this.createDay = createDay;}
	public void setUpdateDay(String updateDay) {this.updateDay = updateDay;}
	
	
	
}
