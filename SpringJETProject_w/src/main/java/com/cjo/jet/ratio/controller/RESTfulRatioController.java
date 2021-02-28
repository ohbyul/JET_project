package com.cjo.jet.ratio.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjo.jet.ratio.service.RatioServiceImpl;

@ResponseBody
@Controller
@RequestMapping("/ratio/*")
public class RESTfulRatioController {
	@Autowired
	private RatioServiceImpl ratioService;
	
	
	//성비 통계
	@RequestMapping("get_ratio_count.do")
	public ArrayList<HashMap<String, Object>> getRatioCount(){
		HashMap<String, Object> femaleUserCount = ratioService.getFeMaleUserCount();
		HashMap<String, Object> maleUserCount = ratioService.getMaleUserCount();
		ArrayList<HashMap<String, Object>> map = new ArrayList<HashMap<String,Object>>();
		//map.add(userCount);
		map.add(femaleUserCount);
		map.add(maleUserCount);
		
		return map;
	}
	//일별 가입자 수
	@RequestMapping("get_new_member_count_by_date")
	public ArrayList<HashMap<String, Object>> getNewMemberCountByDate(){
		return ratioService.getNewMemberCountByDate();
	}
	
	@RequestMapping("get_posts_count")
	public ArrayList<HashMap<String, Object>> getPostsCount(){
		return ratioService.getPostsCount();
	}
	//문의글 수, 답변 수, 미답변 수
	@RequestMapping("get_cs_count")
	public ArrayList<HashMap<String, Object>> getCsCounts(){
		ArrayList<HashMap<String, Object>> cs =  ratioService.getCsCount();
		System.out.println("[cs map test]"+cs);
		return cs;
	}
	@RequestMapping("board_gender_ratio")
	public ArrayList<HashMap<String, Object>> BoardGenderRatio(){
		
		ArrayList<HashMap<String, Object>> boardGenderRatio = ratioService.getBoardGenderRatio();
		System.out.println("[test boardGenderRatio]" + boardGenderRatio);
		return boardGenderRatio;
	}
}
