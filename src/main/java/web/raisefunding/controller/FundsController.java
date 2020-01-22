package web.raisefunding.controller;

import java.sql.Blob;

import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import web.raisefunding.model.CrowdFundingBean;
import web.raisefunding.model.DonatePlanBean;
import web.raisefunding.model.ProjectBean;
import web.raisefunding.service.ProposalService;

@Controller
public class FundsController {
	ProposalService propService;

	@Autowired
	public void setService(ProposalService service) {
		this.propService = service;
	}

//	@RequestMapping("/")
//	public String homepage() {
//		return "index";
//	}
//	

	@RequestMapping(value = "/crowdFundingPage", method = RequestMethod.GET)
	public String crowdFundingPage(Model model) {
		CrowdFundingBean cfBean = new CrowdFundingBean();
		model.addAttribute("CrowdFundingBean", cfBean);
		return "crowdFundingPage";
	}

	@GetMapping("/fundsCategory")
	public String getAllFunds() {
		return "fundsCategory";
	}
	//實驗HIBERNATE的測試
//	@RequestMapping(value = "/crowdFundingPage", method = RequestMethod.POST)
//	public String createNewFund(@ModelAttribute("CrowdFundingBean") CrowdFundingBean cfBean, Model model) {
//		int n = FMservice.createNewCrowdFunding(cfBean);
//		model.addAttribute("check", (n > 0) ? "true" : "false");
//		return "crowdFundingPage";
//	}

	@GetMapping("/createProject")
	public CrowdFundingBean proposalPage(Model model) {
		CrowdFundingBean cfBean = new CrowdFundingBean();
		model.addAttribute("CrowdFundingBean", cfBean);
		return cfBean;
	}

	@PostMapping("/submitProject")
	public @ResponseBody String createProposal( Model model,@ModelAttribute("CrowdFundingBean") CrowdFundingBean cfBean,
			HttpServletRequest request, @RequestParam("photoStr") MultipartFile photoStr,
			@RequestParam("pictureStr") MultipartFile pictureStr){
		ProjectBean projBean = new ProjectBean(request.getParameter("projectName"),
				request.getParameter("projDescript"), vedioLinkCut(request.getParameter("vedio")));
		projBean.setPhoto(fileTransformBlob(photoStr));	
		projBean.setPhotoFileName(getFileName(photoStr));
		DonatePlanBean dpBean = new DonatePlanBean(Integer.parseInt(request.getParameter("donateMoney")),
				request.getParameter("donateDescription"), request.getParameter("shipping"),
				request.getParameter("dliverDate"), Integer.parseInt(request.getParameter("limit")));
		dpBean.setPicture(fileTransformBlob(pictureStr));
		dpBean.setPictureFileName(getFileName(pictureStr));
		System.out.println(ReflectionToStringBuilder.toString(projBean));
		System.out.println(ReflectionToStringBuilder.toString(dpBean));
		System.out.println(ReflectionToStringBuilder.toString(cfBean));
		propService.createProjectAndPlan(dpBean, cfBean, projBean);
		
		
		return "Success";
	}

	
	//上船的FILE檔案轉成圖檔
	public Blob fileTransformBlob(MultipartFile file) {
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		Blob blob = null;
		if (file != null && !file.isEmpty()) {
			try {
				byte[] b = file.getBytes();
				blob = new SerialBlob(b);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		return blob;
	}
	// 取得上傳圖片的檔案名稱
	public String getFileName(MultipartFile file) {
		String fileName = file.getOriginalFilename();
		if (fileName.length() > 0 && fileName.lastIndexOf(".") > -1) {
			return fileName;
		}
		return "UnknownImage";
	}
	//把影片網址擷取等號後段
	public String vedioLinkCut(String fullUrl) {
		if(fullUrl.startsWith("https://www.youtube.com/")||fullUrl.startsWith("www.youtube.com/")) {
		String url = fullUrl.substring(fullUrl.indexOf("="));
		return url;}
		return "no vedio";
	}
}
