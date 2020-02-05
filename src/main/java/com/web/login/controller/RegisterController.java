package com.web.login.controller;

import java.sql.Blob;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.web.login.Model.MembersBean;
import com.web.login.Service.MembersService;

@Controller
@SessionAttributes({ "members", "Login" })
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
		model.addAttribute("MembersBean", member);
		return "_01_register/registerNewMember";
	}

	@PostMapping("/_01_register/registerNewMember")
	public String processAddNewMemberForm(@ModelAttribute("MembersBean") MembersBean member, Model model) {
//		MultipartFile picture = (MultipartFile) member.getmemImage();
//		String originalFilename = picture.getOriginalFilename();
//		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
//			member.setFileName(originalFilename);
//		}
//		if (picture != null && !picture.isEmpty()) {
//			try {
//				byte[] b = picture.getBytes();
//				Blob blob = new SerialBlob(b);
//				member.setMemberImage(blob);
//			} catch (Exception e) {
//				e.printStackTrace();
//				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//			}
//		}
		try {
			service.saveMembers(member);
		} catch (org.hibernate.exception.ConstraintViolationException e) {
			System.out.println("org.hibernate.exception.ConstraintViolationException");
			return "_01_register/registerNewMember";
		} catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
			return "_01_register/registerNewMember";

		}
//		member = service.getMemberByBean(member);
//		model.addAttribute("members", member);
		return "index";
	}

	@RequestMapping("/register")
	public String register() {

		return "_01_register/register";
	}

	@RequestMapping("/members")
	public String memberpage(Model model) {
		return "index";
	}

	@PostMapping("/Checklogin")
	public String memberCheckLogin(@ModelAttribute("MembersBean") MembersBean member, Model model,
			HttpSession session) {
		System.out.println("Login頁面");
		MembersBean bean = service.login(member.getEmail(), member.getPassword());
		if (bean != null) {
			session.setAttribute("Login", bean);
		}
		member = service.getMemberByBean(member);
		model.addAttribute("members", member);
		// return "_01_register/LoginSuccessful";
		return "index";
	}

	@RequestMapping(value = "/UpdateMember")
	public String UpdateMember(Model model, @ModelAttribute("MembersBean") MembersBean member, HttpSession session) {
//		MembersBean bean = new MembersBean();
//		model.addAttribute("MembersBean", bean);
		member = service.getMemberByBean(member);
		model.addAttribute("members", member);
		return "_01_register/registerUpdateMember";
	}

	@RequestMapping(value = "/_01_register/DoUpdateMember", method = RequestMethod.POST)
	public String DoUpdateMember(@ModelAttribute("MembersBean") MembersBean member, Model model, HttpSession session) {
		MembersBean mem1 = (MembersBean) session.getAttribute("members");
		MultipartFile picture = (MultipartFile) member.getmemImage();
		String originalFilename = picture.getOriginalFilename();
		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
			member.setFileName(originalFilename);
		}
		if (picture != null && !picture.isEmpty()) {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				mem1.setmemImage(member.getmemImage());
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		mem1.setMemberName(member.getMemberName());
		mem1.setEmail(member.getEmail());
		mem1.setGender(member.getGender());
		mem1.setBirthDay(member.getBirthDay());
		mem1.setFileName(member.getFileName());

		if(service.updateMembers(mem1)) {
			System.out.println("會員資料修改成功");
			return "index";
		} else {
			System.out.println("會員資料修改失敗");
			return "index";
		}
	}


}
