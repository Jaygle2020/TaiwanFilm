package com.web.login.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.web.login.Model.MembersBean;
import com.web.login.Service.MembersService;
import com.web.message.model.MessageBean;


@Controller
@SessionAttributes({ "members", "Login" })
public class RegisterController {
	String noImage = "/WEB-INF/views/img/NoImage_Male.png";

	@Autowired
	MembersService service;
	@Autowired
	ServletContext context;

	@GetMapping("members/add")
	public String getAddNewMemberForm(Model model) {
		MembersBean member = new MembersBean();		
		member.setMemberMode("1");
		model.addAttribute("MembersBean", member);
		return "_01_register/registerNewMember";
	}
	
	@RequestMapping("/_01_register/MemberBackstage")
	public String MemberBackstage() {
		
		return "_01_register/MemberBackstage";
		
	}
	
	@ResponseBody
	@GetMapping("/emailChecker")
	public boolean emailChecker( 
			@RequestParam("email")
			String email) {
		boolean checker = false;
		if(service.emailExists(email)) {
			checker = true;
			return checker;	
		}else {			
			return checker;
		}				
		
	}

	@PostMapping("/_01_register/registerNewMember")
	public String processAddNewMemberForm(@ModelAttribute("MembersBean") MembersBean member, Model model) {
		member.setFileName("NoImage_Male.png");
		byte[] body = null;
		
		try {						
			String path = "/WEB-INF/views/img/NoImage_Male.png";
			body = fileToByteArray(path);
			Blob blob = new SerialBlob(body);
			member.setMemberImage(blob);

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());}
		try {
			service.saveMembers(member);
		} catch (org.hibernate.exception.ConstraintViolationException e) {
			System.out.println("org.hibernate.exception.ConstraintViolationException");
			return "_01_register/registerNewMember";
		} catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
			return "_01_register/registerNewMember";
		}

		return "redirect:/ToIndex";

	}
	


	@PostMapping("/Checklogin")
	public String memberCheckLogin(@ModelAttribute("MembersBean") MembersBean member, Model model, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Login頁面");
		MembersBean bean = service.login(request.getParameter("email"),request.getParameter("password"));
		System.out.println("這是BEAN" + bean);
		if (request.getParameter("email") == null || request.getParameter("password") == null) {
			model.addAttribute("errorMessage", "帳號或密碼欄不能為空");
			return "_01_register/register";}
		try {
			

		if (bean.getMemberMode().equals("2") || bean.getMemberMode().equals("1") ) {
			model.addAttribute("members", bean);
			System.out.println("登入成功");
			
			return "redirect:/";
		}
		} catch (Exception e) {
		
//		else if(bean.getMemberMode() == "0") {
//			System.out.println("非會員");
//			return "_01_register/MemberBackstage";
//		}		
			System.out.println("無帳號");
			return "_01_register/register";
		}
		// 記住原本的頁面, 登入後系統自動轉回原本的頁面。
//		String requestURI = (String) session.getAttribute("requestURI");
//		System.out.println("請求URI requestURI:"+requestURI);
//		if (requestURI != null) {
//			return "redirect:" + requestURI;
//		}
		return "_01_register/register";
	}

	@RequestMapping(value = "/UpdateMember")
	public String UpdateMember(Model model, @ModelAttribute("MembersBean") MembersBean member, HttpSession session) {
		member = service.getMemberByBean(member);
		model.addAttribute("members", member);
		return "_01_register/registerUpdateMember";
	}
	
	@RequestMapping(value = "/_01_register/DoNotMember",method = RequestMethod.POST)
	public String DoNotMember(
			HttpServletRequest request,
			Model model, 
			HttpSession session) {
			MembersBean member = new MembersBean();
			System.out.println(" controller控制台 取到ID"+request.getParameter("memberId"));
			System.out.println(" controller控制台 取到信箱"+request.getParameter("email"));
			System.out.println(" controller控制台 取到會員身分"+request.getParameter("memberMode"));
			member.setEmail(request.getParameter("email"));		
			member.setMemberMode(request.getParameter("memberMode"));

		
			if(service.modifyMembers(member)) {
				System.out.println("會員狀態修改成功");
				model.addAttribute("members", service.getAllMembers());
				return "_01_register/allMembers";
			} else {
				System.out.println("會員資料修改失敗");
				return "_01_register/DomodifyMember";
			}		
		
	}
	@RequestMapping(value = "/_01_register/DomodifyMember", method = RequestMethod.POST)
	public String DomodifyMember(@RequestParam("memImage")
	MultipartFile picture,
	HttpServletRequest request,
	Model model, 
	HttpSession session) {
		MembersBean member1 =(MembersBean) session.getAttribute("members");
		MembersBean member = new MembersBean(
			request.getParameter("memberName"),request.getParameter("email"),
			request.getParameter("gender"),request.getParameter("birthDay"));
		member.setPassword(member1.getPassword());
		if(member.getGender() == null) {
			member.setGender(member1.getGender());		
		}		
		String originalFilename = picture.getOriginalFilename();
		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
			member.setFileName(originalFilename);}

		if (!picture.isEmpty()) {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);		
				member.setMemberImage(blob);
				System.out.println("取到照片" + member.getMemberImage());
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());}
		}else {
			System.out.println("沒給照片");
			member.setFileName(member1.getFileName());
			member.setMemberImage(member1.getMemberImage());
		}
			model.addAttribute("members", member);

		if(service.updateMembers(member)) {
			System.out.println("會員資料修改成功");
			model.addAttribute("members", service.getAllMembers());
			return "_01_register/allMembers";
		} else {
			System.out.println("會員資料修改失敗");
			return "_01_register/DomodifyMember";
		}
		
	}

	@RequestMapping(value = "/_01_register/DoUpdateMember", method = RequestMethod.POST)
	public String DoUpdateMember(
//	@ModelAttribute("MembersBean") 
//	MembersBean member,
	@RequestParam("memImage")
	MultipartFile picture,
	HttpServletRequest request,
	Model model, 
	HttpSession session) throws ParseException {
		MembersBean member1 =(MembersBean) session.getAttribute("members");
		MembersBean member = new MembersBean(

				request.getParameter("memberName"),request.getParameter("email"),
				request.getParameter("gender"),request.getParameter("birthDay"));		
//		MultipartFile picture = (MultipartFile) (request.getParameter("memImage"));
		member.setMemberId(member1.getMemberId());
//		System.out.println("member.getmemImage() :照片"+member.getmemImage());
		String originalFilename = picture.getOriginalFilename();
		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
			member.setFileName(originalFilename);}
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				member.setMemberImage(blob);
				System.out.println("取到照片" + member.getMemberImage());
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());}
			
//			member = service.getMemberByBean(member);
			model.addAttribute("members", member);

		if(service.updateMembers(member)) {
			System.out.println("會員資料修改成功");
			return "redirect:/ToIndex";
		} else {
			System.out.println("會員資料修改失敗");
			return "redirect:/ToIndex";
		}
	}

	@SuppressWarnings("unused")
	@GetMapping("/crm/picture/{id}")
	public ResponseEntity<byte[]> getPicture(@PathVariable("id") Integer id) {
		System.out.println("!!!!!");		
		byte[] body = null;
		ResponseEntity<byte[]> re = null;
		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());

		MembersBean member = service.getMemberById(id);
		System.out.println(" 照片"+member.getMemberImage());
		if (member == null) {
			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		}
		String filename = member.getFileName();
		if (filename != null) {
			if (filename.toLowerCase().endsWith("jfif")) {
				mediaType = MediaType.valueOf(context.getMimeType("dummy.jpeg"));
			} else {
				mediaType = MediaType.valueOf(context.getMimeType(filename));
				headers.setContentType(mediaType);
			}
		}
		Blob blob = member.getMemberImage();
		System.out.println(member.getMemberImage());
		if (blob != null) {
			body = blobToByteArray(blob);
		} else {
			String path = null;
			if (member.getGender() == null || member.getGender().length() == 0) {
//				path = noImageMale;
			} else if (member.getGender().equals("M")) {
//				path = noImageMale;
			} else {
//				path = noImageFemale;
				;
			}
			body = fileToByteArray(path);
		}
		re = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);

		return re;
	}
	public byte[] blobToByteArray(Blob blob) {
		byte[] result = null;
		try (InputStream is = blob.getBinaryStream(); ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			byte[] b = new byte[819200];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			result = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}
	private byte[] fileToByteArray(String path) {
		byte[] result = null;
		try (InputStream is = context.getResourceAsStream(path);
				ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			byte[] b = new byte[819200];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			result = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
@GetMapping("/ShowAllMembers")
public String list(Model model) {
		model.addAttribute("members", service.getAllMembers());
	 return "_01_register/allMembers";
 }
 
 @GetMapping("/_01_register/modify/{id}")
 public String modifyMembers(Model model,
		 @PathVariable
		 Integer id) {
	 MembersBean mem = service.getMemberById(id);
	 model.addAttribute("members",mem);
	 return "_01_register/modifyMemberDetail";
 	}
 
	@GetMapping("/ToIndex")
	public String returnToIndex() {	
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

	@GetMapping("/FuzzyQuery")
	public String FuzzyQuery(String keyword,Model model)  {
		List<MembersBean> list = service.getMemberByEmail(keyword); 
		model.addAttribute("members", list);
		System.out.println("keyword 是:" + keyword);
		return "_01_register/FuzzyQuery";
	}

 
}
