package com.cjo.jet.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.*;


@Controller
public class TestController {

	
	@RequestMapping("/test/test_page.do")
	public String testPage() {
		return "/test/test_page";
	}

	@RequestMapping("/test/test_process.do")
	public String testProcess(Date tttt) {
		
		System.out.println(tttt);
		
		
		return "qqqqq";
	}
	
	
}
