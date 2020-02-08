package com.web.raisefunding.dao;

import java.util.List;

import com.web.raisefunding.model.CrowdFundingBean;
import com.web.raisefunding.model.PurchaseBean;

public interface CrowdFundingDao {
	public int createNewCrowdFunding(CrowdFundingBean cfBean);

	public int updateFund(CrowdFundingBean cfBean);

	public CrowdFundingBean getCrowdFundingBean(Integer ActionId);

	List<CrowdFundingBean> getAllFunding();

	public void addNewBacker(PurchaseBean pcBean);
	public void addDonateToFund(PurchaseBean pcBean);
}
