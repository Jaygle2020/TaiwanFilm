package web.raisefunding.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import web.raisefunding.dao.CrowdFundingDao;
import web.raisefunding.dao.DonatePlanDao;
import web.raisefunding.dao.ProjectDao;
import web.raisefunding.model.CrowdFundingBean;
import web.raisefunding.model.DonatePlanBean;
import web.raisefunding.model.ProjectBean;

public class ProposalServieImp implements ProposalService {
	CrowdFundingDao cfDao; 
	DonatePlanDao dpDao;
	ProjectDao projDao;

	@Autowired
	public void setCfDao(CrowdFundingDao cfDao) {
		this.cfDao = cfDao;
	}

	public void setDpDao(DonatePlanDao dpDao) {
		this.dpDao = dpDao;
	}

	public void setProjDao(ProjectDao projDao) {
		this.projDao = projDao;
	}
	@Transactional
	@Override
	public int createProjectAndPlan(DonatePlanBean dpBean, CrowdFundingBean cfBean, ProjectBean projBean) {
		int n = 0;
		cfDao.createNewCrowdFunding(cfBean);
		dpDao.createNewPlan(dpBean);
		projDao.createProject(projBean);
		n++;
		return n;
	}
	@Transactional
	@Override
	public int updatePlan(DonatePlanBean dpBean, CrowdFundingBean cfBean, ProjectBean projBean) {
		int n = 0;
		
		n++;
		return n;
	}

}
