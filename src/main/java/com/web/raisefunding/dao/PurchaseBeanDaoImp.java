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
	public List<PurchaseBean> getProjMemberByPurchase(Integer projectId) {
		String hql = "From PurchaseBean where projectId = :projectId group by memberId";
		Session session = factory.getCurrentSession();
		List<PurchaseBean> list = session.createQuery(hql).setParameter("projectId", projectId).getResultList();
		return list;
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
	//檢查會員是不是有買過: 是回傳true
	@Override
	public boolean checkProjectMember(PurchaseBean psBean) {
		String hql = "From PurchaseBean  where memberId = :memberId and projectId = :projectId";
		Session session = factory.getCurrentSession();
		List<PurchaseBean> list = session.createQuery(hql).setParameter("memberId", psBean.getMbBean().getMemberId())
								.setParameter("projectId", psBean.getProjBean().getProjectId())
								.getResultList();
		if(list.size()<2) {
			return false;
		}else
		return true;
	}

	public List<PurchaseBean> getProjectMember(Integer projectId) {
		String hql = "From PurchaseBean where projectId = :projectId";
		Session session = factory.getCurrentSession();
		List<PurchaseBean> list = session.createQuery(hql).setParameter("projectId", projectId)
								.getResultList();
		return list;
	}

}
