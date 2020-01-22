package com.web.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/") // 看到斜線 就走去index
	public String home() {
		return "index";
	}
}
