package web.raisefunding.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.raisefunding.model.CrowdFundingBean;
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
	public CrowdFundingBean getCrowdFundingBean(Integer actionId) {
		Session session = factory.getCurrentSession();
		CrowdFundingBean cfBean = session.get(CrowdFundingBean.class,actionId);
		return cfBean;
	}

}
