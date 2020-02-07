package com.web.raisefunding.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.raisefunding.model.DonatePlanBean;
import com.web.raisefunding.model.PurchaseBean;
import com.web.raisefunding.service.DonatePlanService;

@Controller
public class UserTradeController {
	@Autowired
	DonatePlanService dpService;
	@Autowired
	ServletContext context;

	@GetMapping("/donatePlan{id}")
	public String donatePlanToPurchase(@PathVariable("id") Integer planId,DonatePlanBean dpBean,PurchaseBean pcBean , Model model ) {
		model.addAttribute("PurchaseBean",pcBean);
		dpBean = dpService.getDonateBean(planId);
		model.addAttribute("dpBean",dpBean);
		return "purchase";
	}
	
	@PostMapping("/newPurchase")
	public String createNewPurchase(@ModelAttribute("PurchaseBean") PurchaseBean pcBean ,@RequestParam("planId") Integer planId ){
		pcBean.setDpBean(dpService.getDonateBean(planId));
		dpService.createPurchaseData(pcBean);
		return "thankSupport";
	}
}
