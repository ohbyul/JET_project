package com.cjo.jet.travelplan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjo.jet.travelplan.service.TravelPlanServiceImpl;

@Controller
@ResponseBody
@RequestMapping("travelplan")
public class RESTfulTravelPlanController {
	@Autowired
	private TravelPlanServiceImpl travelPlanService;
	
	
}
