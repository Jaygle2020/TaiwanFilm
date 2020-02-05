package com.web.raisefunding.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.web.config.ControllerUtil;
import com.web.raisefunding.model.CrowdFundingBean;
import com.web.raisefunding.model.DonatePlanBean;
import com.web.raisefunding.model.ProjectBean;
import com.web.raisefunding.service.ProposalService;

@Controller
public class FundsController {
	String noImage = "/WEB-INF/views/image/noImage.jpg";
	
	@Autowired
	ProposalService propService;
	@Autowired
	ServletContext context;
	@Autowired
	ControllerUtil util;

	
	//開啟目前有開募資的列表頁
    @GetMapping("/getAllProject")
	public  String getProject( Model model) {
		List<CrowdFundingBean> list = propService.getAllProjectAndFunding();
    	model.addAttribute("Fundings",list);
			return "fundsCategory";
	}
    

	
	
	//開啟建立募資的專案頁
	@GetMapping("/createProject")
	public CrowdFundingBean proposalPage(Model model) {
		CrowdFundingBean cfBean = new CrowdFundingBean();
		model.addAttribute("CrowdFundingBean", cfBean);
		return cfBean;
	}
	
	//建立專案回傳資料
	@PostMapping("/submitProject")
	public @ResponseBody String createProposal( Model model,@ModelAttribute("CrowdFundingBean") CrowdFundingBean cfBean,
			HttpServletRequest request, @RequestParam("photoStr") MultipartFile photoStr,
			@RequestParam("pictureStr") MultipartFile pictureStr ){
		ProjectBean projBean = new ProjectBean(request.getParameter("projectName"),
				request.getParameter("projDescript"), util.vedioLinkCut(request.getParameter("vedio")));
		System.out.println(ReflectionToStringBuilder.toString(util.fileToBlob(noImage)));
		
		
		if(!photoStr.isEmpty()) {
			projBean.setPhoto(util.fileTransformBlob(photoStr));	
			projBean.setPhotoFileName(util.getFileName(photoStr));
		}else {
			projBean.setPhoto(util.fileToBlob(noImage) );
			projBean.setPhotoFileName("noImage.jpg");
		}
		DonatePlanBean dpBean = new DonatePlanBean(Integer.parseInt(request.getParameter("donateMoney")),
				request.getParameter("donateDescription"), request.getParameter("shipping"),
				request.getParameter("dliverDate"), Integer.parseInt(request.getParameter("limit")));
		if(!pictureStr.isEmpty()) {
		dpBean.setPicture(util.fileTransformBlob(pictureStr));
		dpBean.setPictureFileName(util.getFileName(pictureStr));
		}else {
			projBean.setPhoto(util.fileToBlob(noImage) );
			projBean.setPhotoFileName("noImage.jpg");
		}
		System.out.println(ReflectionToStringBuilder.toString(projBean));		
		propService.createProjectAndPlan(dpBean, cfBean, projBean);
		return "Success";
	}
	
	

    
    //點擊募資方塊進入個別募資
    @GetMapping("/project{id}")
    public String getProjectPage(@PathVariable("id") Integer id , Model model) {
    	CrowdFundingBean cfBean = propService.getCrowdFundingBean(id);
    	List<DonatePlanBean> list = propService.getAllDonatePlanBean(id);
    	model.addAttribute("dpBeans",list);
    	System.out.println(ReflectionToStringBuilder.toString(list.get(0)));
    	model.addAttribute("cfBean",cfBean);
    	return "crowdFunds";
    }
    
    //募資的圖片SRC
    @GetMapping("/getProject/photo/{id}")
    public ResponseEntity<byte[]> getPicture(@PathVariable("id") Integer id){
    	byte[] body = null;
    	ResponseEntity<byte[]> re = null;
    	MediaType mediaType = null;
    	HttpHeaders headers = new HttpHeaders();
    	headers.setCacheControl(CacheControl.noCache().getHeaderValue());
    	
    	ProjectBean projBean = propService.GetProjBean(id);
    	if(projBean == null) return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
    	String fileName = projBean.getPhotoFileName();
    	if(fileName.toLowerCase().endsWith("jfif")) {
    		mediaType = MediaType.valueOf(context.getMimeType("dummy.jpeg"));
    	}else {
    		mediaType = MediaType.valueOf(context.getMimeType(fileName));
    		headers.setContentType(mediaType);
    	}
    	Blob blob = projBean.getPhoto();
    	if(blob!=null) {
    		body = util.blobToByteArray(blob);
    	}
    	return new ResponseEntity<byte[]>(body , headers , HttpStatus.OK);
    }
    
    //回饋方案的圖片SRC
    @GetMapping("/getDonatePlan/photo/{id}")
    public ResponseEntity<byte[]> getDonatePicture(@PathVariable("id") Integer id){
    	byte[] body = null;
    	ResponseEntity<byte[]> re = null;
    	MediaType mediaType = null;
    	HttpHeaders headers = new HttpHeaders();
    	headers.setCacheControl(CacheControl.noCache().getHeaderValue());
    	
    	DonatePlanBean dpBean = propService.GetDonatePlanBean(id);
    	if(dpBean == null) return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
    	String fileName = dpBean.getPictureFileName();
    	if(fileName.toLowerCase().endsWith("jfif")) {
    		mediaType = MediaType.valueOf(context.getMimeType("dummy.jpeg"));
    	}else {
    		mediaType = MediaType.valueOf(context.getMimeType(fileName));
    		headers.setContentType(mediaType);
    	}
    	Blob blob = dpBean.getPicture();
    	if(blob!=null) {
    		body = util.blobToByteArray(blob);
    	}
    	return new ResponseEntity<byte[]>(body , headers , HttpStatus.OK);
    }
    
    
//    @GetMapping("donatePlan{id}")
//    public String getPlan(Integer planId,Model model) {
//    	DonatePlanBean dpBean = propService.GetDonatePlanBean(planId);
//    	model.addAttribute("dpBean",dpBean);
//    	return "purchase";
//    }
    //測試Spring form tag
//  @RequestMapping(value = "/crowdFundingPage", method = RequestMethod.GET)
//  public String crowdFundingPage(Model model) {
//  	CrowdFundingBean cfBean = new CrowdFundingBean();
//  	model.addAttribute("CrowdFundingBean", cfBean);
//  	return "crowdFundingPage";
//  }
	//實驗HIBERNATE的測試
//	@RequestMapping(value = "/crowdFundingPage", method = RequestMethod.POST)
//	public String createNewFund(@ModelAttribute("CrowdFundingBean") CrowdFundingBean cfBean, Model model) {
//		int n = FMservice.createNewCrowdFunding(cfBean);
//		model.addAttribute("check", (n > 0) ? "true" : "false");
//		return "crowdFundingPage";
//	}    
   
    
  
    
    
    
    
    
    
    
    

}
