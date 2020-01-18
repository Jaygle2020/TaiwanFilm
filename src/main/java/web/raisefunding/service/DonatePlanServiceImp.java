package web.raisefunding.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import web.raisefunding.dao.DonatePlanDao;
import web.raisefunding.model.DonatePlanBean;

public class DonatePlanServiceImp implements DonatePlanService {
	DonatePlanDao Dao;
	@Autowired
	public void setDao(DonatePlanDao dao) {
		Dao = dao;
	}
	@Transactional
	@Override
	public int createNewPlan(DonatePlanBean dpBean) {
		return Dao.createNewPlan(dpBean);
	}
	@Transactional
	@Override
	public int updatePlan(DonatePlanBean dpBean) {

		return Dao.updatePlan(dpBean);
	}
	@Transactional
	@Override
	public DonatePlanBean getPlan(Integer planId) {
		return Dao.getPlan(planId);
	}

}
