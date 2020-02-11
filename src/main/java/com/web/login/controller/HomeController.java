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
import com.web.raisefunding.model.ProjectBean;
import com.web.raisefunding.service.ProposalService;

@Controller
public class HomeController {

	@Autowired
	ActivityService ActiveService;
	
	@Autowired
	bookingService bookingService;
	
	@Autowired
	ProposalService PropService;
	@RequestMapping("/") // 看到斜線 就走去index
	public String home(Model model) {
		List<activityBean> activityList = ActiveService.getAllActivitiesExceptStatusEqualOne();
		model.addAttribute("activityList", activityList);
		
		List<activityBean> activityListViews = ActiveService.getAllActivitiesExceptStatusEqualOneViews();
		model.addAttribute("activitiesViews", activityListViews);
		
		List<activityBean> activityListStart = ActiveService.getAllActivitiesExceptStatusEqualOneStart();
		model.addAttribute("activitiesStart", activityListStart);
		
		List<activityBean> activityListEnd = ActiveService.getAllActivitiesExceptStatusEqualOneStart();
		model.addAttribute("activitiesEnd", activityListEnd);
		
		List<movieBean> list = bookingService.getAllMovies();
		model.addAttribute("movies", list);
		
		ProjectBean projBean = PropService.GetProjBean(1);
		model.addAttribute("projectBean",projBean);
		return "index";
	}
	
	
}
