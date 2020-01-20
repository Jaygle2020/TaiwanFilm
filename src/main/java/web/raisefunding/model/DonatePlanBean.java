package web.raisefunding.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;




@Entity
@Table(name="donatePlan")
public class DonatePlanBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="planId")
	private Integer planId;
	private Integer donateMoney;
	private String donateDescription;
	private String pictureFileName;
	private Blob picture;
	private String shipping;
	private String dliverDate;
	private Integer limit;
	@OneToOne(cascade=CascadeType.ALL)
    @JoinColumn(name="projectId", referencedColumnName="projectId")
	private ProjectBean projBean;

	public ProjectBean getProjBean() {
		return projBean;
	}

	public void setProjBean(ProjectBean projBean) {
		this.projBean = projBean;
	}

	public DonatePlanBean() {}
	
	public DonatePlanBean(Integer donateMoney,String donateDescription,String shipping,String dliverDate,Integer limit) {
		this.donateMoney = donateMoney;
		this.donateDescription = donateDescription;
		this.shipping = shipping;
		this.dliverDate = dliverDate;
		this.limit = limit;
	}
	
	
	public Integer getPlanId() {
		return planId;
	}
	public void setPlanId(Integer planId) {
		this.planId = planId;
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

	public String getPictureFileName() {
		return pictureFileName;
	}

	public void setPictureFileName(String pictureFileName) {
		this.pictureFileName = pictureFileName;
	}

	
	
	
}
