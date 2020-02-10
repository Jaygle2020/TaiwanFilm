package com.web.login.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.activity.model.activityBean;
import com.web.activity.service.ActivityService;

@Controller
public class HomeController {

	@Autowired
	ActivityService service;
	
	@RequestMapping("/") // 看到斜線 就走去index
	public String home(Model model) {
		List<activityBean> activityList = service.getAllActivitiesExceptStatusEqualOne();
		model.addAttribute("activityList", activityList);
		
		List<activityBean> activityListViews = service.getAllActivitiesExceptStatusEqualOneViews();
		model.addAttribute("activitiesViews", activityListViews);
		
		List<activityBean> activityListStart = service.getAllActivitiesExceptStatusEqualOneStart();
		model.addAttribute("activitiesStart", activityListStart);
		
		List<activityBean> activityListEnd = service.getAllActivitiesExceptStatusEqualOneStart();
		model.addAttribute("activitiesEnd", activityListEnd);
		
		 
		
		return "index";
	}
	
	
}
