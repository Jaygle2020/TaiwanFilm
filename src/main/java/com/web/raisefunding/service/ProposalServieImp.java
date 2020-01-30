package com.web.raisefunding.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.raisefunding.dao.CrowdFundingDao;
import com.web.raisefunding.dao.DonatePlanDao;
import com.web.raisefunding.dao.ProjectDao;
import com.web.raisefunding.model.CrowdFundingBean;
import com.web.raisefunding.model.DonatePlanBean;
import com.web.raisefunding.model.ProjectBean;
@Service
public class ProposalServieImp implements ProposalService {
	CrowdFundingDao cfDao; 
	DonatePlanDao dpDao;
	ProjectDao projDao;

	@Autowired
	public void setCfDao(CrowdFundingDao cfDao) {
		this.cfDao = cfDao;
	}
	@Autowired
	public void setDpDao(DonatePlanDao dpDao) {
		this.dpDao = dpDao;
	}
	@Autowired
	public void setProjDao(ProjectDao projDao) {
		this.projDao = projDao;
	}
	@Transactional
	@Override
	public int createProjectAndPlan(DonatePlanBean dpBean, CrowdFundingBean cfBean, ProjectBean projBean) {
		int n = 0;
		projDao.createProject(projBean);
		dpBean.setProjBean(projBean);
		cfBean.setProjBean(projBean);
		cfBean.setFundsNow(0);
		cfBean.setBackerNum(0);
		cfDao.createNewCrowdFunding(cfBean);
		dpDao.createNewPlan(dpBean);
		
		n++;
		return n;
	}
	@Transactional
	@Override
	public CrowdFundingBean getCrowdFundingBean(Integer projectId) {
		return cfDao.getCrowdFundingBean(projectId);
	}
	
	@Transactional
	@Override
	public int updatePlan(DonatePlanBean dpBean, CrowdFundingBean cfBean, ProjectBean projBean) {
		int n = 0;
		
		n++;
		return n;
	}
	@Transactional
	@Override
	public DonatePlanBean GetDonatePlanBean(Integer id) {
		DonatePlanBean dpBean = dpDao.getPlan(id);
		return dpBean;
	}
	
	@Transactional
	@Override
	public ProjectBean GetProjBean(Integer id) {
		ProjectBean projBean  =  projDao.getProject(id);
		return projBean;
	}
	@Transactional
	@Override
	public List<CrowdFundingBean> getAllProjectAndFunding() {
		return cfDao.getAllFunding();
	}
	
	@Transactional
	@Override
	public List<DonatePlanBean> getAllDonatePlanBean(Integer projectId){
		return dpDao.getAllPlan(projectId);
	}
	


}
