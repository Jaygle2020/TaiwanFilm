package com.web.raisefunding.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.raisefunding.dao.CrowdFundingDao;
import com.web.raisefunding.model.CrowdFundingBean;
@Service
public class FundingManagerServiceImp implements FundingManagerService {
	CrowdFundingDao dao;
	
	@Autowired
	public void setDao(CrowdFundingDao Dao) {
		dao = Dao;
	}
	@Transactional
	@Override
	public int createNewCrowdFunding(CrowdFundingBean cfBean) {
		return dao.createNewCrowdFunding(cfBean);
	}
	@Transactional
	@Override
	public int updateFund(CrowdFundingBean cfBean) {
		return dao.updateFund(cfBean);
	}
	@Transactional
	@Override
	public CrowdFundingBean getCrowdFundingBean(Integer ActionId) {
		return dao.getCrowdFundingBean(ActionId);
	}

}
