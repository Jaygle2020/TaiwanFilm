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
    @GetMapping("/getAllProject")
	public  String getProject( Model model) {
		List<CrowdFundingBean> list = propService.getAllProjectAndFunding();
    	model.addAttribute("Fundings",list);
//			System.out.println(ReflectionToStringBuilder.toString(list));
			return "testPage";
	}
    @GetMapping("/project{id}")
    public String getProjectPage(@PathVariable("id") Integer id , Model model) {
    	CrowdFundingBean cfBean = propService.getCrowdFundingBean(id);
    	List<DonatePlanBean> list = propService.getAllDonatePlanBean(id);
    	model.addAttribute("dpBeans",list);
    	model.addAttribute("cfBean",cfBean);
    	return "crowdFunds";
    }
    
    
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
    
   
    
  
    
    
    
    
    
    
    
    
    
    //抓image內的圖檔轉成串流
//    public Blob fileToBlob(String path) {
//    	byte[] result = null;
//    	Blob blob = null;
//    	try(InputStream is = context.getResourceAsStream(path);
//    			ByteArrayOutputStream baos = new ByteArrayOutputStream();){
//    				byte[] b = new byte[819200];
//    				int len = 0;
//    				while((len = is.read(b))!=-1) {
//    					baos.write(b,0,len);
//    				}
//    				result = baos.toByteArray();
//    				blob = new SerialBlob(result);
//    	}catch (Exception e) {
//    		e.printStackTrace();
//    		throw new RuntimeException("資料夾檔案轉blob失敗" + e.getMessage());
//    	}
//    	return blob;
//    }
//    public byte[] blobToByteArray(Blob blob) {
//    	byte[] result = null;
//    	try {
//			InputStream is = blob.getBinaryStream(); ByteArrayOutputStream baos = new ByteArrayOutputStream();
//		    byte[] b = new byte[819200];
//		    int len = 0;
//		    while((len = is.read(b))!=-1) {
//		    	baos.write(b,0,len);
//		    }
//		    result = baos.toByteArray();
//    	} catch (Exception e) {
//			e.printStackTrace();
//		}
//    	return result;
//    }
//	//上船的FILE檔案轉成圖檔
//	public Blob fileTransformBlob(MultipartFile file) {
//		// 建立Blob物件，交由 Hibernate 寫入資料庫
//		Blob blob = null;
//		if (file != null && !file.isEmpty()) {
//			try {
//				byte[] b = file.getBytes();
//				blob = new SerialBlob(b);
//			} catch (Exception e) {
//				e.printStackTrace();
//				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//			}
//		}
//		return blob;
//	}
//	// 取得上傳圖片的檔案名稱
//	public String getFileName(MultipartFile file) {
//		String fileName = file.getOriginalFilename();
//		if (fileName.length() > 0 && fileName.lastIndexOf(".") > -1) {
//			return fileName;
//		}
//		return "UnknownImage";
//	}
//	//把影片網址擷取等號後段
//	public String vedioLinkCut(String fullUrl) {
//		if(fullUrl.startsWith("https://www.youtube.com/")||fullUrl.startsWith("www.youtube.com/")) {
//		String url = fullUrl.substring((fullUrl.indexOf("=")+1));
//		return url;}
//		return "no vedio";
//	}
}
