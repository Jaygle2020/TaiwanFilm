package com.web.raisefunding.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.raisefunding.dao.DonatePlanDao;
import com.web.raisefunding.dao.PurchaseBeanDao;
import com.web.raisefunding.model.DonatePlanBean;
import com.web.raisefunding.model.PurchaseBean;
@Service
public class DonatePlanServiceImp implements DonatePlanService {
	DonatePlanDao dpDao;
	PurchaseBeanDao pcDao;
	@Autowired
	public void setDpDao(DonatePlanDao dpDao) {
		this.dpDao = dpDao;
	}
	@Autowired
	public void setPcDao(PurchaseBeanDao pcDao) {
		this.pcDao = pcDao;
	}
	
	@Transactional
	@Override
	public DonatePlanBean getDonateBean(Integer planId) {
		return dpDao.getPlan(planId);
	}
	
	@Transactional
	@Override
	public int createNewPlan(DonatePlanBean dpBean) {
		int n = 0;
		dpDao.createNewPlan(dpBean);
		n++;
		return n;
	}
	@Transactional
	@Override
	public int updatePlan(DonatePlanBean dpBean) {
		int n = 0;
		dpDao.updatePlan(dpBean);
		n++;
		return n;
	}
	@Transactional
	@Override
	public int createPurchaseData(PurchaseBean pcBean) {
		int n = 0;
		pcDao.createPurchaseData(pcBean);
		n++;
		return n;
	}
	@Transactional
	@Override
	public PurchaseBean getPurchase(Integer purchaseId) {
		return  pcDao.getPurchase(purchaseId);
	}
	
	@Transactional
	@Override
	public List<PurchaseBean> getAllPurchases() {
		return pcDao.getAllPurchases();
	}
	@Transactional
	@Override
	public List<PurchaseBean> getPurchases(Integer planId) {
		return pcDao.getAllPurchases();
	}
	@Transactional
	@Override
	public List<PurchaseBean> getPersonalPurchases(String buyerName) {
		return pcDao.getPersonalPurchases(buyerName);
	}


}
