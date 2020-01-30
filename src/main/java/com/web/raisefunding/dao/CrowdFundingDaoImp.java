package com.web.raisefunding.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.raisefunding.model.CrowdFundingBean;
import com.web.raisefunding.model.DonatePlanBean;
@Repository
public class CrowdFundingDaoImp implements CrowdFundingDao {
	SessionFactory factory;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.factory = sessionFactory;
	}

	@Override
	public int createNewCrowdFunding(CrowdFundingBean cfBean) {
	Session session = factory.getCurrentSession();
	int n = 0;
	session.save(cfBean);
	n++;
		return n;
	}

	@Override
	public int updateFund(CrowdFundingBean cfBean) {
	Session session = factory.getCurrentSession();
	int n = 0;
	session.saveOrUpdate(cfBean);
		return n;
	}

	@Override
	public CrowdFundingBean getCrowdFundingBean(Integer actionId) { //和projectId相同如果有問題要改成projectId
		Session session = factory.getCurrentSession();
		CrowdFundingBean cfBean = session.get(CrowdFundingBean.class,actionId);
		return cfBean;
	}
	
	@Override
	public List<CrowdFundingBean> getAllFunding() {
		Session session = factory.getCurrentSession();
		String hql = "From CrowdFundingBean";
		List<CrowdFundingBean> list= session.createQuery(hql).getResultList();
		for(CrowdFundingBean cfBean:list) {
			double num = (double)cfBean.getFundsNow()/cfBean.getFundsGoal();
			System.out.println(num);
			cfBean.setPercent((int)Math.round(num*100));
			System.out.println("-----------test--------:"+cfBean.getPercent());

		}
		return list;
	}
}
