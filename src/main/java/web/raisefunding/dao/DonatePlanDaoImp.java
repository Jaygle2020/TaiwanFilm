package web.raisefunding.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.raisefunding.model.DonatePlanBean;
@Repository
public class DonatePlanDaoImp implements DonatePlanDao {
	SessionFactory factory;
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	@Override
	public int createNewPlan(DonatePlanBean dpBean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(dpBean);
		n++;
		return n;
	}

	@Override
	public int updatePlan(DonatePlanBean dpBean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.update(dpBean);
		return n;
	}

	@Override
	public DonatePlanBean getPlan(Integer planId) {
		Session session = factory.getCurrentSession();
		DonatePlanBean dpBean = session.get(DonatePlanBean.class, planId);
		return dpBean;
	}

}
