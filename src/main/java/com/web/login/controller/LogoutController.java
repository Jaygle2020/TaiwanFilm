package com.web.login.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

@Controller
public class LogoutController {

	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request, SessionStatus session){
	    session.setComplete();
	    request.getSession().invalidate();
	    System.out.println("會員登出");
	    return "index";
	}

}
