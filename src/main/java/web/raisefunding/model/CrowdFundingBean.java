package web.raisefunding.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="crowdfunding")
public class CrowdFundingBean implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer actionId;
	private Integer projectId;
	private String dateBegin;
	private String 	dateEnd;
	private Integer fundsNow;
	private Integer fundsGoal;
	private Integer backerNum;
	
	
	public Integer getActionId() {
		return actionId;
	}
	public void setActionId(Integer actionId) {
		this.actionId = actionId;
	}
	public Integer getProjectId() {
		return projectId;
	}
	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}
	public String getDateBegin() {
		return dateBegin;
	}
	public void setDateBegin(String dateBegin) {
		this.dateBegin = dateBegin;
	}
	public String getDateEnd() {
		return dateEnd;
	}
	public void setDateEnd(String dateEnd) {
		this.dateEnd = dateEnd;
	}
	public Integer getFundsNow() {
		return fundsNow;
	}
	public void setFundsNow(Integer fundsNow) {
		this.fundsNow = fundsNow;
	}
	public Integer getFundsGoal() {
		return fundsGoal;
	}
	public void setFundsGoal(Integer fundsGoal) {
		this.fundsGoal = fundsGoal;
	}
	public Integer getBackerNum() {
		return backerNum;
	}
	public void setBackerNum(Integer backerNum) {
		this.backerNum = backerNum;
	}
	
	
}
