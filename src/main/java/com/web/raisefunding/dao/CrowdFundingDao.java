package com.web.raisefunding.dao;

import java.util.List;

import com.web.raisefunding.model.CrowdFundingBean;

public interface CrowdFundingDao {
	public int createNewCrowdFunding(CrowdFundingBean cfBean);

	public int updateFund(CrowdFundingBean cfBean);

	public CrowdFundingBean getCrowdFundingBean(Integer ActionId);

	List<CrowdFundingBean> getAllFunding();

}
