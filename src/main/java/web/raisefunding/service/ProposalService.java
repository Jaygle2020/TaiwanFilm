package web.raisefunding.service;

import web.raisefunding.model.CrowdFundingBean;
import web.raisefunding.model.DonatePlanBean;
import web.raisefunding.model.ProjectBean;

public interface ProposalService {
	public int createProjectAndPlan(DonatePlanBean dpBean, CrowdFundingBean cfBean, ProjectBean projBean );
	public int updatePlan(DonatePlanBean dpBean , CrowdFundingBean cfBean, ProjectBean projBean);
	
}
