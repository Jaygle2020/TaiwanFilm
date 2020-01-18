package web.raisefunding.dao;

import web.raisefunding.model.CrowdFundingBean;

public interface CrowdFundingDao {
	public int createNewCrowdFunding(CrowdFundingBean cfBean);

	public int updateFund(CrowdFundingBean cfBean);

	public CrowdFundingBean getCrowdFundingBean(Integer ActionId);

}
