package com.cjo.jet.content.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cjo.jet.content.service.ContentServiceImpl;
import com.cjo.jet.noticeboard.service.NoticeBoardServiceImpl;

@Controller
@RequestMapping("/content/*")
public class MainPageController {
	
	@Autowired
	private ContentServiceImpl contentService;
	@Autowired
	private NoticeBoardServiceImpl noticeBoardService;
	
	@RequestMapping("main_page.do")
	public String mainPage(Model model) {
		
		//쉐어 + 공지사항
		
		ArrayList<HashMap<String, Object>> noticeList = noticeBoardService.getNoticeBoardList(1);
		ArrayList<Object> newNotice = contentService.newNotice();
		ArrayList<Object> newSharePlan = contentService.newSharePlanBoard();
		ArrayList<HashMap<String, Object>> resultList = contentService.getSharePlanList();
		
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("newNotice",newNotice);
		model.addAttribute("resultList",resultList);
		model.addAttribute("newSharePlan",newSharePlan);
	
		//친구 찾기 게시판
		ArrayList<HashMap<String, Object>> resultListParty = contentService.getPartyBoardList();
		ArrayList<Object> newPartyBoard = contentService.newPartyBoard();
		
		model.addAttribute("resultListParty",resultListParty);
		model.addAttribute("newPartyBoard",newPartyBoard);
		
		ArrayList<HashMap<String, Object>> ClassList = contentService.getClassList();
		ArrayList<Object> threeClasses = contentService.threeClasses();
		
		model.addAttribute("ClassList", ClassList);
		model.addAttribute("threeClasses", threeClasses);
		
		
		return "content/main_page";
	}
	
	@RequestMapping("Terms_of_service.do")
	public String getTermsOfService() {
		return "content/Terms_of_service";
	}
	
	@RequestMapping("Privacy_Policy.do")
	public String getPrivacyPolicy() {
		return "content/Privacy_Policy";
	}
	
	@RequestMapping("operation_policy.do")
	public String getoperation_policy() {
		return "content/operation_policy";
	}
	
	
	
	
}
