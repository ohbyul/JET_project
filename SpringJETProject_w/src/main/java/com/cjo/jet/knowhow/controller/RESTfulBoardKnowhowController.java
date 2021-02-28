package com.cjo.jet.knowhow.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjo.jet.knowhow.service.KnowhowBoardServiceImpl;
import com.cjo.jet.vo.KnowhowBoardRepleVo;
import com.cjo.jet.vo.MemberVo;
import com.cjo.jet.vo.KnowhowSingoVo;

@Controller
@RequestMapping("/knowhowboard/*")
@ResponseBody
public class RESTfulBoardKnowhowController {
	
	@Autowired
	KnowhowBoardServiceImpl knowhowBoardService;
	
	// 댓글 작성
	@RequestMapping("write_reple_process.do")
	public void writeRepleProcess(KnowhowBoardRepleVo param, HttpSession session) {
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser"); 
		int jet_member_no = sessionUser.getJet_member_no();
		param.setJet_member_no(jet_member_no);
		
		knowhowBoardService.writeRepleKnowhowBoard(param);
	}
	
	// 댓글 삭제
	@RequestMapping("delete_reple_process.do")
	public void deleteRepleProcess(int jet_board_knowhow_reple_no) {

		knowhowBoardService.deleteRepleKnowhowBoard(jet_board_knowhow_reple_no);		

	}
	
	// 댓글 보기
	@RequestMapping("get_reple_list.do")
	public ArrayList<HashMap<String, Object>> getRpleList(int jet_board_knowhow_no) {
		ArrayList<HashMap<String, Object>> repleVoList = knowhowBoardService.getRepleByNo(jet_board_knowhow_no);
		
		return repleVoList;
	}
	
	
	
	
	
	
	// 게시글 신고 프로세스 
	@RequestMapping("singo_knowhow_process.do")
	public void singoInsertProcess (KnowhowSingoVo param, HttpSession session) {
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser"); 
		int jet_member_no = sessionUser.getJet_member_no();
		param.setJet_member_no(jet_member_no);
		
		knowhowBoardService.singoInsert(param);
		
	}
	
	// 신고 여부 확인... 
	@RequestMapping("check_singo_process.do")
	public HashMap<String, Object> checkSingoProcess(KnowhowSingoVo vo, HttpSession session) {
		
		
		
		//isSingoKnowhowBoard
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser"); 
		int jet_member_no = sessionUser.getJet_member_no();
		vo.setJet_member_no(jet_member_no);
		
		
		int countSingo = knowhowBoardService.isSingoKnowhowBoard(vo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		
		map.put("countSingo", countSingo);
		//map.put("singoVo", singoVo);
		
		return map;
	}
	
	
}