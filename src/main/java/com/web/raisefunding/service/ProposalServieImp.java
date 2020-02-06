package com.web.raisefunding.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.raisefunding.dao.CrowdFundingDao;
import com.web.raisefunding.dao.DonatePlanDao;
import com.web.raisefunding.dao.ProjectDao;
import com.web.raisefunding.dao.ProjectInfoDao;
import com.web.raisefunding.model.CrowdFundingBean;
import com.web.raisefunding.model.DonatePlanBean;
import com.web.raisefunding.model.ProjectBean;
import com.web.raisefunding.model.ProjectInfoBean;
@Service
public class ProposalServieImp implements ProposalService {
	CrowdFundingDao cfDao; 
	DonatePlanDao dpDao;
	ProjectDao projDao;
	ProjectInfoDao infoDao;
	
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
	@Autowired
	public void setInfoDao(ProjectInfoDao infoDao) {
		this.infoDao = infoDao;
	}
	@Transactional
	@Override  //依次建立整個專案跟贊助(測試用)
	public int createProjectAndPlan( CrowdFundingBean cfBean, ProjectBean projBean) {
		int n = 0;
		projDao.createProject(projBean);
		cfBean.setProjBean(projBean);
		cfBean.setFundsNow(0);
		cfBean.setBackerNum(0);
		cfDao.createNewCrowdFunding(cfBean);
		n++;
		return n;
	}
	@Transactional
	@Override   //測Spring form tag 用
	public CrowdFundingBean getCrowdFundingBean(Integer projectId) {
		CrowdFundingBean cfBean = cfDao.getCrowdFundingBean(projectId);
		double num = (double)cfBean.getFundsNow()/cfBean.getFundsGoal();
		cfBean.setPercent((int)Math.round(num*100));
		return cfBean;
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
	
	@Transactional
	@Override
	public List<ProjectInfoBean> getProjectInfo(Integer projectId) {
		return infoDao.getProjectInfo(projectId);
	}
	
	@Transactional
	@Override
	public int createProjInfo(ProjectInfoBean infoBean) {
		return infoDao.createProjInfo(infoBean);
	}
	
	@Transactional
	@Override
	public int updateProjInfo(ProjectInfoBean infoBean) {
		return infoDao.updateProjInfo(infoBean);
	}
	@Transactional
	@Override
	public int createDonatePlan(DonatePlanBean dpBean) {
		int n = 0;
		dpDao.createNewPlan(dpBean);
		n++;
		return n;
	}
	


}
