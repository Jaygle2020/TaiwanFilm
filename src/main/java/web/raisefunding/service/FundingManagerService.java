package web.raisefunding.service;

import web.raisefunding.model.CrowdFundingBean;

public interface FundingManagerService {
public int createNewCrowdFunding(CrowdFundingBean cfBean);
public int updateFund(CrowdFundingBean cfBean);
public CrowdFundingBean getCrowdFundingBean(Integer ActionId);
}
