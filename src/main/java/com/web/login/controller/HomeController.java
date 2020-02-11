package com.web.login.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.activity.model.activityBean;
import com.web.activity.service.ActivityService;
import com.web.booking.model.movieBean;
import com.web.booking.service.bookingService;

@Controller
public class HomeController {

	@Autowired
	ActivityService service;
	
	@Autowired
	bookingService service2;
	
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
		
		List<movieBean> list = service2.getAllMovies();
		model.addAttribute("movies", list);
		
		 
		
		return "index";
	}
	
	
}
