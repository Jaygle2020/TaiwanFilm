package com.web.raisefunding.controller;

import java.sql.Blob;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.web.config.ControllerUtil;
import com.web.raisefunding.model.CrowdFundingBean;
import com.web.raisefunding.model.DonatePlanBean;
import com.web.raisefunding.model.ProjectBean;
import com.web.raisefunding.model.ProjectInfoBean;
import com.web.raisefunding.service.ProposalService;

@Controller
@SessionAttributes("ProjectBean")
public class FundsController {
	String noImage = "/WEB-INF/views/image/noImage.jpg";

	@Autowired
	ProposalService propService;
	@Autowired
	ServletContext context;
	@Autowired
	ControllerUtil util;

	// 開啟目前有開募資的列表頁
	@GetMapping("/getAllProject")
	public String getProject(Model model) {
		List<CrowdFundingBean> list = propService.getAllProjectAndFunding();
		model.addAttribute("Fundings", list);
		return "fundsCategory";
	}

	// 開啟建立募資的專案頁
	@GetMapping("/createProjectFirst")
	public String proposalPage(Model model) {
		return "createProjectFirst";
	}

	// 建立專案回傳資料
	@PostMapping("/submitProject")
	public String createProposal(Model model,  CrowdFundingBean cfBean,
			HttpServletRequest request, @RequestParam("photoStr") MultipartFile photoStr,
		 @RequestParam("dateBegin") String dateBegin,@RequestParam("dateEnd")String dateEnd,
		 @RequestParam("fundsGoal")Integer fundsGoal
			) {
		cfBean.setDateBegin(dateBegin);
		cfBean.setDateEnd(dateEnd);
		cfBean.setFundsGoal(fundsGoal);
		ProjectBean projBean = new ProjectBean(request.getParameter("projectName"),
				request.getParameter("projDescript"), util.vedioLinkCut(request.getParameter("vedio")));
		if (!photoStr.isEmpty()) {
			projBean.setPhoto(util.fileTransformBlob(photoStr));
			projBean.setPhotoFileName(util.getFileName(photoStr));
		} else {
			projBean.setPhoto(util.fileToBlob(noImage));
			projBean.setPhotoFileName("noImage.jpg");
		}
		propService.createProjectAndPlan( cfBean, projBean);
		model.addAttribute("ProjectBean",projBean);
		model.addAttribute("CrowdFundingBean",cfBean);
		return "createProject";
	}
	
	@GetMapping("/createProject")
	public String updateProject(HttpSession session ,Model model) {
		ProjectBean projBean = (ProjectBean) session.getAttribute("ProjectBean");
		model.addAttribute("ProjectBean",projBean);
		return "createProject";
	}
	@PostMapping(value="/createDonatePlan",produces = { "text/html;charset=utf-8" })
	public @ResponseBody String createDonatePlan(DonatePlanBean dpBean , Model model,
			@RequestParam("donateMoney") Integer donateMoney,
			@RequestParam("donateDescription") String description,
			@RequestParam("donatePhoto") MultipartFile donatePhoto,
			@RequestParam("shipping") String shipping,
			@RequestParam("dliverDate") String dliverDate,
			@RequestParam("limit") Integer limit,
			@RequestParam("projectId") Integer projectId,
			Gson gson
			) {
//		if(!pictureStr.isEmpty()) {
//		dpBean.setPicture(util.fileTransformBlob(pictureStr));
//		dpBean.setPictureFileName(util.getFileName(pictureStr));
//		}else {
//		projBean.setPhoto(util.fileToBlob(noImage) );
//		projBean.("noImage.jpg");
//}
		dpBean.setDliverDate(dliverDate);
		dpBean.setDonateDescription(description);
		dpBean.setDonateMoney(donateMoney);
		dpBean.setLimit(limit);
		dpBean.setShipping(shipping);
		dpBean.setPicture(util.fileTransformBlob(donatePhoto));
		dpBean.setPictureFileName(util.getFileName(donatePhoto));
		dpBean.setProjBean(propService.GetProjBean(projectId));
		System.out.println(ReflectionToStringBuilder.toString(dpBean));
		propService.createDonatePlan(dpBean);
		List<DonatePlanBean> dpBeans = propService.getAllDonatePlanBean(projectId);
		String jsonDpBean = gson.toJson(dpBeans);
		System.out.println(ReflectionToStringBuilder.toString(jsonDpBean));
		return jsonDpBean;
	}
	// 點擊募資方塊進入個別募資
	@GetMapping("/project{id}")
	public String getProjectPage(@PathVariable("id") Integer id, Model model) {
		CrowdFundingBean cfBean = propService.getCrowdFundingBean(id);
		List<DonatePlanBean> list = propService.getAllDonatePlanBean(id);
		model.addAttribute("dpBeans", list);
		System.out.println(ReflectionToStringBuilder.toString(list.get(0)));
		model.addAttribute("cfBean", cfBean);
		return "crowdFunds";
	}

	// 募資的圖片SRC
	@GetMapping("/getProject/photo/{id}")
	public ResponseEntity<byte[]> getPicture(@PathVariable("id") Integer id) {
		byte[] body = null;
		ResponseEntity<byte[]> re = null;
		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());

		ProjectBean projBean = propService.GetProjBean(id);
		if (projBean == null)
			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		String fileName = projBean.getPhotoFileName();
		if (fileName.toLowerCase().endsWith("jfif")) {
			mediaType = MediaType.valueOf(context.getMimeType("dummy.jpeg"));
		} else {
			mediaType = MediaType.valueOf(context.getMimeType(fileName));
			headers.setContentType(mediaType);
		}
		Blob blob = projBean.getPhoto();
		if (blob != null) {
			body = util.blobToByteArray(blob);
		}
		return new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);
	}

	// 回饋方案的圖片SRC
	@GetMapping("/getDonatePlan/photo/{id}")
	public ResponseEntity<byte[]> getDonatePicture(@PathVariable("id") Integer id) {
		byte[] body = null;
		ResponseEntity<byte[]> re = null;
		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());

		DonatePlanBean dpBean = propService.GetDonatePlanBean(id);
		if (dpBean == null)
			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		String fileName = dpBean.getPictureFileName();
		if (fileName.toLowerCase().endsWith("jfif")) {
			mediaType = MediaType.valueOf(context.getMimeType("dummy.jpeg"));
		} else {
			mediaType = MediaType.valueOf(context.getMimeType(fileName));
			headers.setContentType(mediaType);
		}
		Blob blob = dpBean.getPicture();
		if (blob != null) {
			body = util.blobToByteArray(blob);
		}
		return new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);
	}

	@PostMapping("/createPjInfo")
	public String createProjectInfo(@RequestParam("textTittle") String textTittle,@RequestParam("projectId") Integer projectId,
			@RequestParam("innerText") String innerText, @RequestParam("photoCount") Integer photoCount,
			@RequestParam(value = "image0", required = false) MultipartFile file0,
			@RequestParam(value = "image1", required = false) MultipartFile file1,
			@RequestParam(value = "image2", required = false) MultipartFile file2,
			@RequestParam(value = "image3", required = false) MultipartFile file3, ProjectInfoBean infoBean,
			Model model) {
		infoBean.setInnerText(innerText);
		infoBean.setProjectTittle(textTittle);
		infoBean.setPhotoCount(photoCount);
		infoBean.setImage01(util.fileTransformBlob(file0));
		infoBean.setImgName01(util.getFileName(file0));
		infoBean.setImage02(util.fileTransformBlob(file1));
		infoBean.setImgName02(util.getFileName(file1));
		infoBean.setImage03(util.fileTransformBlob(file2));
		infoBean.setImgName03(util.getFileName(file2));
		infoBean.setImage04(util.fileTransformBlob(file3));
		infoBean.setImgName04(util.getFileName(file3));
		ProjectBean projBean = propService.GetProjBean(projectId);
		infoBean.setProjBean(projBean);
		propService.createProjInfo(infoBean);
		model.addAttribute("ProjectBean",projBean);
		
		return "createProject";
	}

//    @GetMapping("donatePlan{id}")
//    public String getPlan(Integer planId,Model model) {
//    	DonatePlanBean dpBean = propService.GetDonatePlanBean(planId);
//    	model.addAttribute("dpBean",dpBean);
//    	return "purchase";
//    }
	// 測試Spring form tag
//  @RequestMapping(value = "/crowdFundingPage", method = RequestMethod.GET)
//  public String crowdFundingPage(Model model) {
//  	CrowdFundingBean cfBean = new CrowdFundingBean();
//  	model.addAttribute("CrowdFundingBean", cfBean);
//  	return "crowdFundingPage";
//  }
	// 實驗HIBERNATE的測試
//	@RequestMapping(value = "/crowdFundingPage", method = RequestMethod.POST)
//	public String createNewFund(@ModelAttribute("CrowdFundingBean") CrowdFundingBean cfBean, Model model) {
//		int n = FMservice.createNewCrowdFunding(cfBean);
//		model.addAttribute("check", (n > 0) ? "true" : "false");
//		return "crowdFundingPage";
//	}    

}
