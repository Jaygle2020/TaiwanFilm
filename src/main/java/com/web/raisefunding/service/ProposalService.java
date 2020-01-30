package com.web.raisefunding.service;

import java.util.List;

import com.web.raisefunding.model.CrowdFundingBean;
import com.web.raisefunding.model.DonatePlanBean;
import com.web.raisefunding.model.ProjectBean;

public interface ProposalService {
	public int createProjectAndPlan(DonatePlanBean dpBean, CrowdFundingBean cfBean, ProjectBean projBean );
	public int updatePlan(DonatePlanBean dpBean , CrowdFundingBean cfBean, ProjectBean projBean);
	public ProjectBean GetProjBean(Integer id);
	public List<CrowdFundingBean> getAllProjectAndFunding();
	public CrowdFundingBean getCrowdFundingBean(Integer projectId);
	DonatePlanBean GetDonatePlanBean(Integer id);
	List<DonatePlanBean> getAllDonatePlanBean(Integer projectId);
	
	
}
