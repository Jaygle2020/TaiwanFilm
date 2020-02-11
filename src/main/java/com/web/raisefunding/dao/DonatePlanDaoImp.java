package com.web.raisefunding.dao;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.raisefunding.model.DonatePlanBean;
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
	
	@Override
	public DonatePlanBean getSinglePlan(Integer projectId , Integer dpId) {
		Session session = factory.getCurrentSession();
		String hql = "from DonatePlanBean where projectId = :prjId and planId = :dpId";
		DonatePlanBean dpBean = (DonatePlanBean) session.createQuery(hql).setParameter("prjId", projectId).setParameter("dpId", dpId)
								.getSingleResult();
		return dpBean;
		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<DonatePlanBean> getAllPlan(Integer projectId) {
		List<DonatePlanBean> list = null;
		Session session = factory.getCurrentSession();
		String hql = "From DonatePlanBean where projectId = :prjId";
		try {
		list= session.createQuery(hql)
				.setParameter("prjId", projectId)
				.getResultList();
		} catch (NoResultException e) {
		}
		return list;
	}

	@Override
	public void donatingOnce(Integer planId) {
		Session session = factory.getCurrentSession();
		DonatePlanBean dpBean = session.get(DonatePlanBean.class, planId);
		dpBean.setLimitNum((dpBean.getLimitNum()-1));
	}

}
