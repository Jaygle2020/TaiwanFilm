package com.web.raisefunding.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.raisefunding.model.PurchaseBean;
@Repository
public class PurchaseBeanDaoImp implements PurchaseBeanDao {
	private static final long serialVersionUID = 1L;
	SessionFactory factory;
	
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	
	@Override
	public int createPurchaseData(PurchaseBean pcBean) {
		int n = 0 ;
		Session session = factory.getCurrentSession();
		session.save(pcBean);
		n++;
		return n;
	}
	

	@Override
	public PurchaseBean getPurchase(Integer purchaseId) {
		Session session = factory.getCurrentSession();
		PurchaseBean pcBean = session.get(PurchaseBean.class, purchaseId);
		return pcBean;
	}

	@Override
	public List<PurchaseBean> getAllPurchases() {
		
		return null;
	}

	@Override
	public List<PurchaseBean> getPurchases(Integer planId) {
		Session session = factory.getCurrentSession();
		String hql = "From PurchaseBean where planId = :planId";
		List<PurchaseBean> list = session.createQuery(hql)
		.setParameter("planId", planId)
		.getResultList();
		return list;
	}

	@Override
	public List<PurchaseBean> getPersonalPurchases(String buyerName) {
		Session session = factory.getCurrentSession();
		String hql = "From PurchaseBean where buyerName = :buyerName";
		List<PurchaseBean> list = session.createQuery(hql)
		.setParameter("buyerName", buyerName)
		.getResultList();
		return list;
	}

	

}
