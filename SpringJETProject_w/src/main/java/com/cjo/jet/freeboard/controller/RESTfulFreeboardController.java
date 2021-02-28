package com.cjo.jet.freeboard.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjo.jet.classboard.service.ClassboardServiceImpl;
import com.cjo.jet.freeboard.mapper.FreeboardImageSQLMapper;
import com.cjo.jet.freeboard.mapper.FreeboardSQLMapper;
import com.cjo.jet.freeboard.service.FreeboardServiceImpl;
import com.cjo.jet.vo.*;

@Controller
@RequestMapping("/freeboard/*")
@ResponseBody
public class RESTfulFreeboardController {
	
	@Autowired
	FreeboardServiceImpl freeboardService;
	
	@RequestMapping("freeboard_like_process.do")
	public void freeboardLikeProcess(HttpSession session, int jet_board_free_no, FreeboardLikeVo param) {
		//좋아요가 없는 태이므로 여기서 insert를 실행. // board_no 랑 session_member_no 넣기.
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();
		
		param.setJet_member_no(jet_member_no);	//LikeVo에 현재 m_no 넣어주고.
		param.setJet_board_free_no(jet_board_free_no);	//LikeVo에 현재 b_no 넣기
		
		freeboardService.likeFreeboard(param);
		
	}
	
	@RequestMapping("freeboard_dislike_process.do")
	public void freeboardDislikeProcess(HttpSession session, int jet_board_free_no, FreeboardLikeVo param) {
		//좋아요가 있는 상태이므로 여기서 delete를 실행.

		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();
		
		param.setJet_member_no(jet_member_no);	//LikeVo에 현재 m_no 넣어주고.
		param.setJet_board_free_no(jet_board_free_no);	//LikeVo에 현재 b_no 넣기
		
		freeboardService.dislikeFreeboard(param);
		
	}
	
	@RequestMapping("freeboard_like_map.do")
	public HashMap<String, Object> freeboardLikeMap(int jet_board_free_no, HttpSession session) {
		HashMap<String, Object> likeMap = new HashMap<String, Object>();
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		FreeboardLikeVo freeboardLikeVo = null;
		
		boolean likeCheck = false;
		
		if(memberVo != null) {
			freeboardLikeVo = freeboardService.getLikeVo(jet_board_free_no, memberVo);
			
			if(freeboardLikeVo != null) {
				likeCheck = true;
			}else {
				likeCheck = false;
			}
		}
		
		int likeCount = freeboardService.getLikeCount(jet_board_free_no);
		
		likeMap.put("likeCount", likeCount);
		likeMap.put("likeCheck", likeCheck);
		
		return likeMap;
	}

	
	//댓글기능 - 삽입, 조회, (추후에 삭제, 수정 추가하기)
	@RequestMapping("write_free_board_reple_process.do")
	public void writeFreeboardRepleProcess(HttpSession session, FreeboardRepleVo param, int jet_board_free_no) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");	//세션객체에서 접속한 사람 가져오기.
		
		int jet_member_no = sessionUser.getJet_member_no();	//그 사람의 멤버 넘버 가져오기
		
		param.setJet_member_no(jet_member_no);			//세션 객체의 멤버 넘버랑 param 객체 합치기
		param.setJet_board_free_no(jet_board_free_no);	//param에 또 지금 접속한 글 넘버 넣어주기.
		
		freeboardService.writeRepleProcess(param);
		
	}	
	
	@RequestMapping("get_free_board_reple_list.do")
	public ArrayList<HashMap<String, Object>> getRepleList(int jet_board_free_no) {
		
		ArrayList<HashMap<String, Object>> repleResult = freeboardService.readFreeboardReple(jet_board_free_no);
		
		return repleResult;
	}
	
	
	public void updateReple(FreeboardRepleVo vo) {
		
		freeboardService.updateReple(vo);
	}
	
	//댓글 삭제 기능
	@RequestMapping("delete_free_board_reple_process.do")
	public void deleteReple(HttpSession session, int jet_board_free_reple_no) {
		
		freeboardService.deleteReple(jet_board_free_reple_no);
		
	}
	
	//신고 기능
	@RequestMapping("freeboard_report_process.do")
	public void reportProcess(HttpSession session, FreeboardReportVo vo) {
		
		int jet_member_no = ((MemberVo)session.getAttribute("sessionUser")).getJet_member_no();
		
		vo.setJet_member_no(jet_member_no);
		
		freeboardService.insertReport(vo);
	}
	
	@RequestMapping("check_report_process.do")
	public HashMap<String, Object> checkReportProcess(int jet_board_free_no, HttpSession session){
		MemberVo membervo = (MemberVo)session.getAttribute("sessionUser");
		FreeboardReportVo freeboardReportVo = null;
		
		boolean checkReport = false;
		
		if(membervo != null) {
			freeboardReportVo = freeboardService.checkReport(jet_board_free_no, membervo);
			
			if(freeboardReportVo != null) {
				checkReport  = true;
			}else {
				checkReport = false;
			}
			
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("checkReport", checkReport);
		
		return map;
	}
	
	
	
	
	
	
		
	

}
