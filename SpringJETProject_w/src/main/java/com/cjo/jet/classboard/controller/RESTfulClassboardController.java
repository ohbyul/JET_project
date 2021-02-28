package com.cjo.jet.classboard.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjo.jet.classboard.service.ClassboardServiceImpl;
import com.cjo.jet.vo.ClassPickVo;
import com.cjo.jet.vo.ClassReservationVo;
import com.cjo.jet.vo.ClassReviewVo;
import com.cjo.jet.vo.ClassSingoVo;
import com.cjo.jet.vo.MemberVo;

@Controller
@RequestMapping("/classboard/*")
@ResponseBody
public class RESTfulClassboardController {
	
	@Autowired
	ClassboardServiceImpl classboardService;

	
	// 클래스 예약하기
	@RequestMapping("reserve_class_process.do")
	public void reserveClassProcess(HttpSession session, ClassReservationVo reserveVo, int jet_class_detail_no) {
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();
		reserveVo.setJet_member_no(jet_member_no);
		
		classboardService.insertReserve(reserveVo);
	
	}
	
	// 클래스 예약 취소하기
	@RequestMapping("cancel_class_process.do")
	public void deleteReserveClassProcess(HttpSession session, ClassReservationVo reserveVo, int jet_class_detail_no) {
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();
		reserveVo.setJet_member_no(jet_member_no);

		classboardService.deleteReserve(reserveVo);
		
	}
	
	//클래스 예약 true false
	@RequestMapping("classboard_reserve_map.do")
	public HashMap<String, Object> ClassboardReserveMap(int jet_class_detail_no, HttpSession session){
		HashMap<String, Object> ReserveMap = new HashMap<String, Object>();
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		ClassReservationVo classReservationVo = null;
		
		boolean checkReserve = false;
		if(memberVo != null) {
			classReservationVo = classboardService.checkReservation(memberVo, jet_class_detail_no);
			
			if(classReservationVo != null) {
				checkReserve = true;
			}else {
				checkReserve = false;
			}
		}
		
		int countReserve = classboardService.countReserve(jet_class_detail_no);
		
		ReserveMap.put("checkReserve", checkReserve);
		ReserveMap.put("countReserve", countReserve);
		
		return ReserveMap;
	}
	
	
	//찜 기능
	@RequestMapping("classboard_pick_process.do")
	public void pickClassProcess(ClassPickVo vo, HttpSession session, int jet_class_detail_no) {
		
		int jet_member_no = ((MemberVo)session.getAttribute("sessionUser")).getJet_member_no();
		
		vo.setJet_member_no(jet_member_no);
		vo.setJet_class_detail_no(jet_class_detail_no);
		
		classboardService.insertPick(vo);
	}
	
	@RequestMapping("classboard_unpick_process.do")
	public void unpickClassProcess(HttpSession session, int jet_class_detail_no) {
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();
		
		classboardService.deletePick(jet_class_detail_no, jet_member_no);
	}
	
	@RequestMapping("classboard_pick_check_process.do")
	public HashMap<String, Object> classboardPickMap(int jet_class_detail_no, HttpSession session){
		
		HashMap<String, Object> pickMap = new HashMap<String, Object>();
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		ClassPickVo classPickVo = null;
		
		boolean pickCheck = false;
		
		if(memberVo != null) {
			classPickVo = classboardService.checkPick(jet_class_detail_no, memberVo);
			
			if(classPickVo != null) {
				pickCheck = true;
			}else {
				pickCheck = false;
			}
		
		}
		
		pickMap.put("pickCheck", pickCheck);
		
		return pickMap;
	}
	
	
	// 원데이클래스 리뷰 작성 프로세스로
	@RequestMapping("write_class_review_process.do")
	public void writeClassReviewProcess(ClassReviewVo reviewVo, HttpSession session) {
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		int member_no = memberVo.getJet_member_no();
		reviewVo.setJet_member_no(member_no);
		
		classboardService.writeClassReview(reviewVo);
		
	}
	
	
	// 원데이클래스 리뷰 리스트
	@RequestMapping("get_class_review.do")
	public HashMap<String, Object> getMyReview(HttpSession session, int jet_class_detail_no) {
		//System.out.println("[getMyReview] 실행 / 에이작스 셀렉트 ");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();
		
		ClassReviewVo reviewVo = classboardService.getReview(jet_member_no, jet_class_detail_no);

		map.put("reviewVo", reviewVo);
		
		//System.out.println("레스트풀 ~~ test : " + jet_class_detail_no);
		return map;
	}
		
	
	
	// 게시글 신고 프로세스 
	@RequestMapping("singo_class_process.do")
	public void singoInsertProcess (ClassSingoVo param, HttpSession session) {
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser"); 
		int jet_member_no = sessionUser.getJet_member_no();
		param.setJet_member_no(jet_member_no);
		
		classboardService.singoInsert(param);
		//디테일서비스?? ㅅㅂ 머
		
	}
	
	// 신고 여부 확인... 
	@RequestMapping("check_singo_process.do")
	public HashMap<String, Object> checkSingoProcess(ClassSingoVo vo, HttpSession session) {
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser"); 
		int jet_member_no = sessionUser.getJet_member_no();
		vo.setJet_member_no(jet_member_no);
		
		
		int countSingo = classboardService.isSingoClassBoard(vo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("countSingo", countSingo);
			
		return map;
	}
	



}
