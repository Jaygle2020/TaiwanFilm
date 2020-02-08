package com.web.raisefunding.dao;

import java.io.Serializable;
import java.util.List;

import com.web.raisefunding.model.PurchaseBean;

public interface PurchaseBeanDao extends Serializable {
	public int createPurchaseData( PurchaseBean pcBean);
	public PurchaseBean getPurchase(Integer purchaseId);
	
	public List<PurchaseBean> getProjMemberByPurchase(Integer projectId);
	public List<PurchaseBean> getAllPurchases();

	public List<PurchaseBean> getPurchases(Integer planId);

	public List<PurchaseBean> getPersonalPurchases(String buyerName);

	public boolean checkProjectMember(PurchaseBean pcBean);
	
	public List<PurchaseBean> getProjectMember(Integer projectId);
}
