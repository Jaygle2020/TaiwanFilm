package web.raisefunding.dao;


import web.raisefunding.model.DonatePlanBean;

public interface DonatePlanDao {
	public int createNewPlan(DonatePlanBean dpBean);

	public int updatePlan(DonatePlanBean dpBean);

	public DonatePlanBean getPlan(Integer planId);
}
