package com.cjo.jet.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjo.jet.mypage.service.MyPageServiceImpl;
import com.cjo.jet.partyboard.service.PartyBoardServiceImpl;
import com.cjo.jet.vo.MemberUpgradeVo;
import com.cjo.jet.vo.MemberVo;
import com.cjo.jet.vo.PartyRatingVo;
import com.cjo.jet.vo.PickBoardVo;

@Controller
@RequestMapping("/mypage/*")
@ResponseBody
public class RESTfulMyPageController {
	
	@Autowired
	private MyPageServiceImpl myPageService;
	
	@Autowired
	private PartyBoardServiceImpl partyBoardService;
	//0225 오별
	
	@RequestMapping("get_review_board.do")
	public ArrayList<HashMap<String, Object>> getReviewBoard(HttpSession session) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		int jet_member_no = sessionUser.getJet_member_no();
		
		ArrayList<HashMap<String, Object>> resultList = myPageService.get_Review_Board(jet_member_no);
		
		return resultList;
		
	}
	
	@RequestMapping("get_free_board.do")
	public ArrayList<HashMap<String, Object>> getFreeBoard(HttpSession session){
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		int jet_member_no = sessionUser.getJet_member_no();
		
		ArrayList<HashMap<String, Object>> freeList = myPageService.get_Free_Board(jet_member_no);
		
		return freeList;
	}
	
	@RequestMapping("get_know_board.do")
	public ArrayList<HashMap<String, Object>> getKnowBoard(HttpSession session){
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		int jet_member_no = sessionUser.getJet_member_no();
		
		ArrayList<HashMap<String, Object>> knowList = myPageService.get_knowhow_Board(jet_member_no);
		
		return knowList;
	}
	
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	@RequestMapping("get_notice_reple_list_process.do")
	public ArrayList<HashMap<String, Object>> getNoticeReple(HttpSession session) {
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		//로그인한 유저의 멤버 Vo
		int member_no = sessionUser.getJet_member_no();
		
		ArrayList<HashMap<String, Object>> resultNoticeList = myPageService.getNoticeWroteMyRepleList(member_no);
		
		return resultNoticeList;
	}
	
	@RequestMapping("get_free_reple_list_process.do")
	public ArrayList<HashMap<String, Object>> getFreeReple(HttpSession session) {
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		//로그인한 유저의 멤버 Vo
		int member_no = sessionUser.getJet_member_no();
		
		ArrayList<HashMap<String, Object>> resultFreeList = myPageService.getFreeWroteMyRepleList(member_no);
		
		return resultFreeList;
	}
	
	@RequestMapping("get_konwhow_reple_list_process.do")
	public ArrayList<HashMap<String, Object>> getKonwhowReple(HttpSession session) {
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		//로그인한 유저의 멤버 Vo
		int member_no = sessionUser.getJet_member_no();
		
		ArrayList<HashMap<String, Object>> resultKonwhowList = myPageService.getKonwhowWroteMyRepleList(member_no);
		
		return resultKonwhowList;
	}
	
	@RequestMapping("get_review_reple_list_process.do")
	public ArrayList<HashMap<String, Object>> getReviewReple(HttpSession session) {
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		//로그인한 유저의 멤버 Vo
		int member_no = sessionUser.getJet_member_no();
		
		ArrayList<HashMap<String, Object>> resultReviewList = myPageService.getReviewWroteMyRepleList(member_no);
		
		return resultReviewList;
	}
	
	@RequestMapping("get_party_reple_list_process.do")
	public ArrayList<HashMap<String, Object>> getPartyReple(HttpSession session) {
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		//로그인한 유저의 멤버 Vo
		int member_no = sessionUser.getJet_member_no();
		
		ArrayList<HashMap<String, Object>> resultPartyList = myPageService.getPartyWroteMyRepleList(member_no);
		
		return resultPartyList;
	}
	
	@RequestMapping("get_share_reple_list_process.do")
	public ArrayList<HashMap<String, Object>> getShareReple(HttpSession session) {
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		//로그인한 유저의 멤버 Vo
		int member_no = sessionUser.getJet_member_no();
		
		ArrayList<HashMap<String, Object>> resultShareList = myPageService.getShareWroteMyRepleList(member_no);
		
		return resultShareList;
	}
	
	@RequestMapping("get_pick_board.do")
	public ArrayList<HashMap<String, Object>> getPickBoard(HttpSession session){
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		int jet_member_no = sessionUser.getJet_member_no();
		
		ArrayList<HashMap<String, Object>> pickList = myPageService.get_pick_board(jet_member_no);
		
		return pickList;
			
	}

	//좋아영ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
	@RequestMapping("get_review_like_board.do")
	public ArrayList<HashMap<String, Object>> getReviewLikeBoard(HttpSession session) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		int jet_member_no = sessionUser.getJet_member_no();
		
		ArrayList<HashMap<String, Object>> reviewLikeList = myPageService.get_Review_Like(jet_member_no);
		
		return reviewLikeList;
		
	}
	
	@RequestMapping("get_free_like_board.do")
	public ArrayList<HashMap<String, Object>> getFreeLikeBoard(HttpSession session){
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		int jet_member_no = sessionUser.getJet_member_no();
		
		ArrayList<HashMap<String, Object>> freeLikeList = myPageService.get_Free_Like(jet_member_no);
		
		return freeLikeList;
	}
	
	@RequestMapping("get_know_like_board.do")
	public ArrayList<HashMap<String, Object>> getKnowLikeBoard(HttpSession session){
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		int jet_member_no = sessionUser.getJet_member_no();
		
		ArrayList<HashMap<String, Object>> knowLikeList = myPageService.get_knowhow_Like(jet_member_no);
		
		return knowLikeList;
	}
	
	@RequestMapping("get_shareplan_like_board.do")
	public ArrayList<HashMap<String, Object>> getSharePlanLikeBoard(HttpSession session){
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		int jet_member_no = sessionUser.getJet_member_no();
		
		ArrayList<HashMap<String, Object>> sharepLikelanList = myPageService.get_shareplan_Like(jet_member_no);
		
		return sharepLikelanList;
	}
	//파티
	@RequestMapping("get_party_board.do")
	public ArrayList<HashMap<String, Object>> getPartyBoard(HttpSession session){
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		int jet_member_no = sessionUser.getJet_member_no();
		
		ArrayList<HashMap<String, Object>> partyBoardList = myPageService.get_party_board(jet_member_no);
		
		return partyBoardList;
	}
	//모집중 파티
	@RequestMapping("get_attend_party.do")
	public ArrayList<HashMap<String, Object>> getAttendParty(HttpSession session){
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		int jet_member_no = sessionUser.getJet_member_no();
		
		ArrayList<HashMap<String, Object>> attendList = myPageService.get_attend_party(jet_member_no);
		
		return attendList;
	}
	

	
	@RequestMapping("get_shareplan_board.do")
	public ArrayList<HashMap<String, Object>> getSharePlanBoard(HttpSession session){
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		int jet_member_no = sessionUser.getJet_member_no();
		
		ArrayList<HashMap<String, Object>> shareplanList = myPageService.get_shareplan_Board(jet_member_no);
		
		return shareplanList;
	}
	
	
	//등급업
	@RequestMapping("mypage_process.do")
	public void myPageUpgrade(HttpSession session, MemberUpgradeVo param) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();
		System.out.println(jet_member_no);
		param.setJet_member_no(jet_member_no);
		
		myPageService.memberUpgrade(param);
		
		
	}
	//등급확인
	@RequestMapping("upgrade_check_process.do")
	public HashMap<String, Object> upgrdeCheck(HttpSession session){
		HashMap<String, Object> upgradeMap = new HashMap<String, Object>();
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		
		MemberUpgradeVo memberUpgradeVo = null;
		
		boolean upgradeChk = false;
		
		if(memberVo != null) {
			memberUpgradeVo = myPageService.upgradeCheck(memberVo);
			
			if(memberUpgradeVo != null) {
				upgradeChk = true;
			}else {
				upgradeChk = false;
			}
		}
		
		
		
		upgradeMap.put("upgradeChk",upgradeChk);
		
		
		return upgradeMap;
		
	}
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
		//참여 확정 인원 마이페이지 출력 오별 0225 
		@RequestMapping("get_approve_membervo_process.do")
		public ArrayList<HashMap<String,Object>> getApproveMemberProcess (int jet_board_party_no,HttpSession session){
			MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
			
			System.out.println("레스트풀 마이페이지 sessionUser 존재여부  : " + sessionUser.getJet_member_no());
			System.out.println("레스트풀 마이페이지 jet_board_party_no 존재여부  : " + jet_board_party_no);
			ArrayList<HashMap<String,Object>> approveMember = myPageService.getPartyRatingList(jet_board_party_no,sessionUser.getJet_member_no());
					
			return approveMember;
		}
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
		//친구 평가 점수 인서트 오별 0225
		@RequestMapping("insert_rating_process.do")
		public void ratingInsertProcess (int jet_member_no,int jet_board_party_no,String jet_party_rating_value,PartyRatingVo param ) {

			param.setJet_member_no(jet_member_no);
			param.setJet_board_party_no(jet_board_party_no);
			param.setJet_party_rating_value(jet_party_rating_value);
			
			partyBoardService.insertRating(param);
		}	
		//평가 체크
		@RequestMapping("check_rating_process.do")
		public HashMap<String, Object> ratingCheckProcess(int jet_board_party_no,int jet_member_no){
			HashMap<String,Object> map = new HashMap<String,Object>(); 
			System.out.println("가야대 가앧!!");
			PartyRatingVo partyRatingVo = null;
			
			boolean existRatingVo = false;
			
			partyRatingVo = partyBoardService.CheckRatingVo(jet_board_party_no, jet_member_no);
			
			if(partyRatingVo != null) {
				existRatingVo = true;
			}else {
				existRatingVo = false;
			}	
		
			map.put("existLikeVo",existRatingVo );
			
			return map;
		}
		
}
