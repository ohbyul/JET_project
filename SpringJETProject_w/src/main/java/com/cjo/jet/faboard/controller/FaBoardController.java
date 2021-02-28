package com.cjo.jet.faboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/faboard/*")
public class FaBoardController {

	@RequestMapping("faboard_page.do")
	public String faBoardPage() {
		return "faboard/faboard_page";
	}
}
