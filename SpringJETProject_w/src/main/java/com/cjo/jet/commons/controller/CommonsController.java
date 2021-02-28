package com.cjo.jet.commons.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.cjo.jet.mypage.service.MyPageServiceImpl;
import com.cjo.jet.vo.MemberVo;

@Controller
@RequestMapping("/commons/*")
public class CommonsController {

	@Autowired
	private MyPageServiceImpl myPageService;

	
	@RequestMapping("global_nav.do")
	public String getProfilePic(Model model, HttpSession session) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();
		
		HashMap<String, Object> memberProfileResult = myPageService.getMyProfile(jet_member_no);
		//프로필 사진 출력 
		
		model.addAttribute("result", memberProfileResult);
		
		return "commons/global_nav";
	}
	
}
