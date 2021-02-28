package com.cjo.jet.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjo.jet.csboard.service.CsBoardServiceImpl;
import com.cjo.jet.member.service.MemberServiceImpl;
import com.cjo.jet.noticeboard.service.NoticeBoardServiceImpl;

@Controller
@RequestMapping("/admin/*")
@ResponseBody
public class RESTfullAdminController {

	@Autowired
	private CsBoardServiceImpl csBoardService;
	@Autowired
	private MemberServiceImpl memberService;
	
//	@RequestMapping("admin_csboard_before_page.do")
	public ArrayList<HashMap<String, Object>> adminCsboardBeforePage(String search_word,String search_type) {
		System.out.println("[adminCsboardBeforePage] 실행됨");

		//cs 보드 전체 글 출력 no페이징 페이지 오류떄문에
		ArrayList<HashMap<String, Object>> resultList = csBoardService.getCsBoardListNoPage(search_word, search_type);
		
		return resultList;
	}
	
	
	
//------------------------------test 페이지------------------------------------	
	@RequestMapping("admin_csboard_page_test.do")
	public HashMap<String, Object> adminCsBoardPage(String search_word,String search_type,@RequestParam(value="page_num",defaultValue = "1") int page_num) {
		
		//cs 보드 전체 글 출력
		ArrayList<HashMap<String, Object>> resultList = csBoardService.getCsBoardList(search_word, search_type, page_num);
		
		//페이지 출력
		int pageCount = csBoardService.getPageCount();
	 	//페이지 갯수 받자
	 	int currentPage = page_num ;
	 	int beginPage = ((currentPage-1)/5) * 5 + 1;
	 	int endPage = ((currentPage-1)/5 + 1) * (5);
	 	//페이지 계산하기 정수나누기임 1/5 = 0 이됨.. 나머지값 버림 인트니까
	 	
	 	if(endPage > pageCount) {
	 		endPage = pageCount;
	 	}
	 	
	 	HashMap<String, Object> map = new HashMap<String, Object>();
	 	
	 	map.put("resultList", resultList);
	 	map.put("pageCount", pageCount);
	 	map.put("currentPage", currentPage);
	 	map.put("beginPage", beginPage);
	 	map.put("endPage", endPage);
	 	//인트 값이여서 안들어감.. 휴...심한말 심한말..
	 	
		return map;
	}

	@RequestMapping("admin_csboard_before_page_test.do")
	public ArrayList<HashMap<String, Object>> test(String search_word,String search_type) {
		System.out.println("[adminCsboardBeforePage] 실행됨");

		//cs 보드 전체 글 출력 no페이징 페이지 오류떄문에
		ArrayList<HashMap<String, Object>> resultList = csBoardService.getCsBoardListNoPage(search_word, search_type);
		
		return resultList;
	}
	

	@RequestMapping("admin_csboard_answer_write_page_tset.do")
	public HashMap<String, Object> admincsboardAnswerWritePage(int jet_board_m_cs_no) {

		HashMap<String, Object> result =new HashMap<String, Object>();
		
		//업데이트 코드 그대로..
		HashMap<String, Object> map = csBoardService.getCsBoard(jet_board_m_cs_no);
		//해쉬맵에 해쉬맵을 넣는다? 의문.....*********
		
		result.put("map", map);
		
		return result;
	}
	@RequestMapping("member_upgrade_aply_process.do")
	public void memberUpgradeAply(int jet_member_no) {
		System.out.println("테스트다 ㅅㅂ아"+jet_member_no);
		memberService.memberUpgradeAply(jet_member_no);
		memberService.memberUpgradeAplyCheck(jet_member_no);
	}

//----------test끝 --------------------------------------------------------------	
}
