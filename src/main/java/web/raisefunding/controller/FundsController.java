package web.raisefunding.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.raisefunding.model.CrowdFundingBean;
import web.raisefunding.service.FundingManagerService;

@Controller
public class FundsController {
	FundingManagerService service ;
	@Autowired
	public void setService(FundingManagerService service) {
		this.service = service;
	}
	
//	@RequestMapping("/")
//	public String homepage() {
//		return "index";
//	}
//	

	@RequestMapping(value="/crowdFundingPage",method=RequestMethod.GET)
	public String crowdFundingPage(Model model) {
		CrowdFundingBean cfBean = new CrowdFundingBean();
		model.addAttribute("CrowdFundingBean",cfBean);
		return "crowdFundingPage";
	}
	@GetMapping("/fundsCategory")
	public String getAllFunds() {
		return "fundsCategory";
	}
	
	@RequestMapping(value="/crowdFundingPage",method=RequestMethod.POST)
	public String createNewFund(
			@ModelAttribute("CrowdFundingBean") CrowdFundingBean cfBean,
			Model model
			) {
		int n = service.createNewCrowdFunding(cfBean);
		model.addAttribute("check",(n>0)?"true":"false");
		return "crowdFundingPage";
	}
	@GetMapping("/createProject")
	public CrowdFundingBean proposalPage(Model model) {
		CrowdFundingBean cfBean = new CrowdFundingBean();
		model.addAttribute("CrowdFundingBean",cfBean);
		return cfBean ;
	}
	@PostMapping("/submitProject")
	public String createProposal(@ModelAttribute("CrowdFundingBean") CrowdFundingBean cfBean,
			Model model
			) {
		
		return "index";
	}
}
