package com.cjo.jet.noticeboard.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;
import javax.swing.text.StyledEditorKit.BoldAction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjo.jet.noticeboard.service.NoticeBoardServiceImpl;
import com.cjo.jet.vo.MemberVo;
import com.cjo.jet.vo.NoticeLikeVo;
import com.cjo.jet.vo.NoticeRepleVo;
import com.cjo.jet.vo.NoticeSingoVo;


@Controller
@RequestMapping("/notice_board/*")
@ResponseBody
public class RESTfulNoticeRepleController {

	@Autowired
	private NoticeBoardServiceImpl noticeBoardService;
	
	@RequestMapping("write_notice_reple_process.do")
	public void writeNoticeRepleprocess(NoticeRepleVo param , HttpSession sessoin) {
		System.out.println("[writeRepleprocess] 실행됨");
		//...
		MemberVo memberVo = (MemberVo)sessoin.getAttribute("sessionUser");
		int member_no = memberVo.getJet_member_no();
		
		//int member_no = ((MemberVo)sessoin.getAttribute("sessionUser")).getJet_member_no();
		
		param.setJet_member_no(member_no);
		
		noticeBoardService.writeNoticeReple(param);
	}
	
	@RequestMapping("get_notice_reple_list.do")
	public ArrayList<HashMap<String, Object>> getNoticeRepleList(int jet_board_notice_no){
		
		ArrayList<HashMap<String, Object>> result = noticeBoardService.getNoticeRepleList(jet_board_notice_no);
		
		
		return result;
	}
	
	//댓글삭제
	@RequestMapping("delete_reple_process.do")
	public void deleteReplepRocess(int jet_notice_reple_no) {
		noticeBoardService.deleteReple(jet_notice_reple_no);
	}
//---------좋아요 에이작스 도전-------------------------------------------------------------	

	@RequestMapping("like_notice_process.do")
	public void likeNoticeProcess(int jet_board_notice_no,NoticeLikeVo param, HttpSession session) {
		
		int likemember_no = ((MemberVo)session.getAttribute("sessionUser")).getJet_member_no();
		
		param.setJet_board_notice_no(jet_board_notice_no);
		param.setJet_member_no(likemember_no);
		
		noticeBoardService.noticeLikeInsert(param);
		
	}
	
	@RequestMapping("delete_like_notice_process.do")
	public void deleteLikeNoticeProcess(int jet_board_notice_no,HttpSession session) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();
		
		noticeBoardService.deleteLikeNotice(jet_board_notice_no,jet_member_no);
		
	}
	
	@RequestMapping("like_check_process.do")
	public HashMap<String,Object>  likeCheckProcess(int jet_board_notice_no,HttpSession session) {
		HashMap<String,Object> map = new HashMap<String,Object>(); 

		MemberVo memberLikeVo = (MemberVo) session.getAttribute("sessionUser");
		//서비스 티어로 데리고갈 세션 받기...
		
		NoticeLikeVo noticeLikeVo = null;
		
		boolean existLikeVo = false;
		
		//예외처리
		if(memberLikeVo != null) {
		
			noticeLikeVo = noticeBoardService.getNoticeLikeVo(jet_board_notice_no, memberLikeVo);
			
			if(noticeLikeVo != null) {
				 existLikeVo = true;
			}else {
				 existLikeVo = false;
			}	
		}	
		
		map.put("existLikeVo",existLikeVo );
		
		int cnt = noticeBoardService.getNoticeLikeCount(jet_board_notice_no);
		
		map.put("likeCount",cnt );
		
		return map;
	}
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ	
	@RequestMapping("singo_notice_process.do")
	public void singoInsertProcess (NoticeSingoVo param, HttpSession session) {
		
		int singoMemberNo = ((MemberVo)session.getAttribute("sessionUser")).getJet_member_no();
		//세션뽑아서 신고자의 no 출력
		System.out.println("레스트풀 singoMemberNo : " + singoMemberNo);
		System.out.println("레스트 풀 공지사항no :" + param.getJet_board_notice_no());
		System.out.println("레스트 풀 신고 이우 :" + param.getJet_board_notice_singo_reason());
		
		param.setJet_member_no(singoMemberNo);
		
		noticeBoardService.singoInsert(param);
	}
	
	@RequestMapping("check_singo_process.do")
	public HashMap<String, Object> checkSingoProcess(int jet_board_notice_no,HttpSession session) {
		//예외처리에 사용 하려 햇는데 디버그 나서 아직 못사용중 0208
		MemberVo singoMemberVo = (MemberVo)session.getAttribute("sessionUser");
		
		//미리 예외처리
		NoticeSingoVo noticeSingoVo = null;
		
		boolean existSingoVo = false;
		
		if(singoMemberVo != null) {
			noticeSingoVo=noticeBoardService.checksingo(jet_board_notice_no, singoMemberVo);
			if(noticeSingoVo!=null) {
				existSingoVo = true;
			}else {
				existSingoVo = false;
			}
		}
		
		HashMap<String,Object> map = new HashMap<String,Object>(); 

		map.put("existSingoVo", existSingoVo);
		
		return map;
	}

//------------------------------------------------------------
	@RequestMapping("test.do")
	public HashMap<String,Object> test(){
		HashMap<String,Object> map = new HashMap<String,Object>(); 
		
		map.put("xxx", true);
		map.put("likeCount", 15);
		
		return map;
	}
	
	
}
