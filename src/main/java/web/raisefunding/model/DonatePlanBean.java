package web.raisefunding.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.support.MultipartFilter;

@Entity
@Table(name="donatePlan")
public class DonatePlanBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer planId;
	private Integer projectId;
	private Integer donateMoney;
	private String donateDescription;
	private Blob picture;
	private String shipping;
	private String dliverDate;
	private Integer limit;
	@Transient
	private MultipartFilter pictureStr;
	public Integer getPlanId() {
		return planId;
	}
	public void setPlanId(Integer planId) {
		this.planId = planId;
	}
	public Integer getProjectId() {
		return projectId;
	}
	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}
	public Integer getDonateMoney() {
		return donateMoney;
	}
	public void setDonateMoney(Integer donateMoney) {
		this.donateMoney = donateMoney;
	}
	public String getDescription() {
		return donateDescription;
	}
	public void setDescription(String description) {
		this.donateDescription = description;
	}
	public Blob getPicture() {
		return picture;
	}
	public void setPicture(Blob picture) {
		this.picture = picture;
	}
	
	public String getShipping() {
		return shipping;
	}
	public void setShipping(String shipping) {
		this.shipping = shipping;
	}
	public String getDliverDate() {
		return dliverDate;
	}
	public void setDliverDate(String dliverDate) {
		this.dliverDate = dliverDate;
	}
	public Integer getLimit() {
		return limit;
	}
	public void setLimit(Integer limit) {
		this.limit = limit;
	}
	public MultipartFilter getPictureStr() {
		return pictureStr;
	}
	public void setPictureStr(MultipartFilter pictureStr) {
		this.pictureStr = pictureStr;
	}
	
	
	
}
