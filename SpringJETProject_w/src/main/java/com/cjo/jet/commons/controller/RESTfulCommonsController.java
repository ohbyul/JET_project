package com.cjo.jet.commons.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjo.jet.mypage.service.MyPageServiceImpl;
import com.cjo.jet.vo.MemberVo;

@Controller
@RequestMapping("/commons/*")
@ResponseBody
public class RESTfulCommonsController {

	@Autowired
	private MyPageServiceImpl myPageService;

	
	@RequestMapping("get_profile_navi.do")
	public HashMap<String, Object> getProfilePic(int jet_member_no) {
		
		HashMap<String, Object> memberProfileResult = myPageService.getMyProfile(jet_member_no);
		//프로필 사진 출력 
	
		return memberProfileResult;
	}
	
}
