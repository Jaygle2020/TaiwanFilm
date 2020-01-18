package com.web.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

//	@RequestMapping("register")
//	public String register(Model model) {			
//		return "_01_register/register" ;
//	}           
//	
	@RequestMapping("/") // 看到斜線 就走去index
	public String home() {
		return "index";
	}

}
