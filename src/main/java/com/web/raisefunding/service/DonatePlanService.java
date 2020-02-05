package com.web.raisefunding.service;


import java.util.List;

import com.web.raisefunding.model.DonatePlanBean;
import com.web.raisefunding.model.PurchaseBean;

public interface DonatePlanService {
	public int createNewPlan(DonatePlanBean dpBean);
	public int updatePlan(DonatePlanBean dpBean);
	public DonatePlanBean getDonateBean(Integer planId);
	public int createPurchaseData( PurchaseBean pcBean);
	public PurchaseBean getPurchase(Integer purchaseId);
	public List<PurchaseBean> getAllPurchases();
	public List<PurchaseBean> getPurchases(Integer planId);
	public List<PurchaseBean> getPersonalPurchases(String buyerName);
}
