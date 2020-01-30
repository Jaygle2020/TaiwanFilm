package com.web.raisefunding.service;


import com.web.raisefunding.model.DonatePlanBean;

public interface DonatePlanService {
	public int createNewPlan(DonatePlanBean dpBean);
	public int updatePlan(DonatePlanBean dpBean);
	public DonatePlanBean getPlan(Integer planId);
}
