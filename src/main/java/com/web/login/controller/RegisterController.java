package com.web.login.controller;

import java.sql.Blob;

import javax.servlet.ServletContext;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.web.store.Model.MembersBean;
import com.web.store.Service.MembersService;



@Controller
@SessionAttributes({"members","account"})  
public class RegisterController {
	String noImage = "/images/NoImage.png";
	String noImageFemale = "/images/NoImage_Female.jpg";
	String noImageMale = "/images/NoImage_Male.png";
	
	@Autowired
	MembersService service;	
	@Autowired
	ServletContext context;

	@GetMapping("members/add")
	public String getAddNewMemberForm(Model model) {
		MembersBean member = new MembersBean();
		model.addAttribute("MembersBean",member);
		return "_01_register/registerNewMember";
	}

	@PostMapping("/_01_register/registerNewMember")
	public String processAddNewMemberForm(
			@ModelAttribute("MembersBean")
			MembersBean member,
			Model model
			) {
		//System.out.println(result.toString());
		MultipartFile picture = (MultipartFile) member.getmemImage();
		String originalFilename = picture.getOriginalFilename();
		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
			member.setFileName(originalFilename);
		}
		if (picture != null && !picture.isEmpty()) {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				member.setMemberImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		try {
			service.saveMembers(member);
		} catch (org.hibernate.exception.ConstraintViolationException e) {
			System.out.println("org.hibernate.exception.ConstraintViolationException");
			return "_01_register/registerNewMember";
		} catch (Exception ex) {
			System.out.println(ex.getClass().getName() + 
					", ex.getMessage()=" + ex.getMessage());
			return "_01_register/registerNewMember";
			
		}
		member = service.getMemberByBean(member);
		model.addAttribute("members", member);
		return "index";
	}
	@RequestMapping("/register")
	 public String register(Model model) {
		return "_01_register/register";		
	}
	
	
	@RequestMapping("/members")
	public String memberpage(Model model) {
		return "index";
	}
	@PostMapping("/login")
	public String memberLogin(Model model) {
		return "index";
	}
//	@PostMapping("modifyMember/{id}")
//	public String editMemberForm(Model model,
//			@PathVariable 
//			Integer id) {
//		
//		MembersBean bean = service.getMemberById(id);
//
//		return noImage;
//		
//	}
}
			
	