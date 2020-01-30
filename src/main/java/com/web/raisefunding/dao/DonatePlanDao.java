package com.web.raisefunding.dao;


import java.util.List;

import com.web.raisefunding.model.DonatePlanBean;

public interface DonatePlanDao {
	public int createNewPlan(DonatePlanBean dpBean);

	public int updatePlan(DonatePlanBean dpBean);

	public DonatePlanBean getPlan(Integer planId);
	
	public List<DonatePlanBean>getAllPlan(Integer projectId);
}
