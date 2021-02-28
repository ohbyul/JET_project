package com.cjo.jet.shareplan.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjo.jet.shareplan.service.SharePlanServiceImpl;
import com.cjo.jet.travelplan.service.TravelPlanServiceImpl;
import com.cjo.jet.vo.PickBoardVo;
import com.cjo.jet.vo.MemberVo;
import com.cjo.jet.vo.PartySingoVo;
import com.cjo.jet.vo.SharePlanLikeVo;
import com.cjo.jet.vo.SharePlanRepleVo;
import com.cjo.jet.vo.SharePlanReportVo;

@Controller
@RequestMapping("/shareplan_board/*")
@ResponseBody
public class RESTfulSharePlanController {
	
	@Autowired
	SharePlanServiceImpl sharePlanService;
	@Autowired
	TravelPlanServiceImpl travelPlanService;
	
	//댓글 불러오기
	@RequestMapping("get_reple_list.do")
	public ArrayList<HashMap<String, Object>> getRepleList(int jet_board_shareplan_no){
		ArrayList<HashMap<String, Object>> result = sharePlanService.getRepleList(jet_board_shareplan_no);
		System.out.println(jet_board_shareplan_no);
		return result;
	}
	//댓글 최신순 불러오기
	@RequestMapping("get_reple_list_desc.do")
	public ArrayList<HashMap<String, Object>> getRepleListDESC(int jet_board_shareplan_no){
		
		ArrayList<HashMap<String, Object>> result = sharePlanService.getRepleListDESC(jet_board_shareplan_no);
		
		return result;
	}
	
	//댓글 입력
	@RequestMapping("write_reple_process.do")
	public void writeRepleProcess(SharePlanRepleVo param, HttpSession session) {
		
		int member_no = ((MemberVo)session.getAttribute("sessionUser")).getJet_member_no();
		
		param.setJet_member_no(member_no);
		
		
		
		sharePlanService.writeReple(param);
	}
	
	//댓글삭제
	@RequestMapping("delete_reple_process.do")
	public void deleteRepleProcess(int jet_shareplan_reple_no) {
		sharePlanService.deleteReple(jet_shareplan_reple_no);
	}
	
	//추천입력
	@RequestMapping("shareplan_like_process.do")
	public void shareplanLikeProcess(SharePlanLikeVo param, HttpSession session, int jet_board_shareplan_no) {
		int member_no = ((MemberVo)session.getAttribute("sessionUser")).getJet_member_no();
		
		param.setJet_member_no(member_no);
		param.setJet_board_shareplan_no(jet_board_shareplan_no);
		
		sharePlanService.shareplanLike(param);
	}
	//추천취소
	@RequestMapping("shareplan_delete_like_process.do")
	public void shareplanDeleteLikeProcess(int jet_board_shareplan_no, HttpSession session) {
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		int jet_member_no = sessionUser.getJet_member_no();
		
		sharePlanService.deleteLike(jet_board_shareplan_no, jet_member_no);
	}
	
	@RequestMapping("shareplan_like_check_process.do")
	public HashMap<String, Object> shareplanLikeCheck(int jet_board_shareplan_no, HttpSession session){
		HashMap<String, Object> likeMap = new HashMap<String, Object>();
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		SharePlanLikeVo sharePlanLikeVo = null;
		
		boolean likeChk = false;
		
		if(memberVo != null) {
			sharePlanLikeVo = sharePlanService.getShareplanLikeVo(jet_board_shareplan_no, memberVo);
			
			if(sharePlanLikeVo != null) {
				likeChk = true;
			}else {
				likeChk = false;
			}
		}
		
		int likeCnt = sharePlanService.likeCount(jet_board_shareplan_no);
		
		likeMap.put("likeChk",likeChk);
		likeMap.put("likeCnt",likeCnt);
		
		return likeMap;
		
	}
	
	@RequestMapping("get_travel_plan.do")
	private ArrayList<HashMap<String, Object>> writeSharePlanPage(int jet_board_travelplan_no) {
		
		ArrayList<HashMap<String, Object>> resultList = travelPlanService.getDetailList(jet_board_travelplan_no);
		
		return resultList;
	}
	//찜
	@RequestMapping("shareplan_pick_process.do")
	public void sharePlanPickProcess(PickBoardVo param, HttpSession session, int jet_board_shareplan_no) {
		System.out.println("찍혀라!!!" + jet_board_shareplan_no);
		int member_no = ((MemberVo)session.getAttribute("sessionUser")).getJet_member_no();
		
		param.setJet_member_no(member_no);
		param.setJet_board_shareplan_no(jet_board_shareplan_no);
		
		sharePlanService.insertPick(param);
	}
	//찜취소
	@RequestMapping("shareplan_pick_delete_process.do")
	public void sharePlanPickDelete(int jet_board_shareplan_no, HttpSession session) {
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		int jet_member_no = sessionUser.getJet_member_no();
		
		sharePlanService.deletePick(jet_board_shareplan_no, jet_member_no);
	}
	//찜찾기
	
	@RequestMapping("shareplan_pick_check_process.do")
	public HashMap<String, Object> shareplanPickCheck(int jet_board_shareplan_no, HttpSession session){
		HashMap<String, Object> pickMap = new HashMap<String, Object>();
		System.out.println("체크체크"+ jet_board_shareplan_no);
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		PickBoardVo pickBoardVo = null;
		
		boolean pickChk = false;
		
		if(memberVo != null) {
			pickBoardVo = sharePlanService.getlikeBoardPickNo(jet_board_shareplan_no, memberVo);
			
			if(pickBoardVo != null) {
				pickChk = true;
			}else {
				pickChk = false;
			}
		}
		
		
		
		pickMap.put("pickChk",pickChk);
		
		
		return pickMap;
		
	}
	
	@RequestMapping("get_travelplan_share.do")
	public ArrayList<HashMap<String, Object>> getTravelPlan_share(int jet_board_shareplan_no){
		
		ArrayList<HashMap<String, Object>> detailList = sharePlanService.getDetailList(jet_board_shareplan_no);
		
		return detailList;
	}
	
	@RequestMapping("get_recommend_class.do")
	public ArrayList<HashMap<String, Object>> getRecommendClass(int jet_board_shareplan_no){
		
		ArrayList<HashMap<String, Object>> getRecommendClassList = sharePlanService.getRecommendClass(jet_board_shareplan_no);
		
		//HashMap<String, Object> recommendClassList = sharePlanService.getShareplan(jet_board_shareplan_no);

		//getRecommendClassList.add(recommendClassList);
		
		return getRecommendClassList;
	}
	@RequestMapping("get_recommend_class_all.do")
	public ArrayList<HashMap<String, Object>> getRecommendClassAll(int jet_board_shareplan_no){
		
		ArrayList<HashMap<String, Object>> getRecommendClassList = sharePlanService.getRecommendClassAll(jet_board_shareplan_no);
		
		//HashMap<String, Object> recommendClassList = sharePlanService.getShareplan(jet_board_shareplan_no);

		//getRecommendClassList.add(recommendClassList);
		
		return getRecommendClassList;
	}
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ	
		@RequestMapping("report_shareplan_process.do")
		public void reportInsertProcess (SharePlanReportVo param, HttpSession session) {
			
			int reportMemberNo = ((MemberVo)session.getAttribute("sessionUser")).getJet_member_no();
			
			//세션뽑아서 신고자의 no 출력
			
			param.setJet_member_no(reportMemberNo);
			
			sharePlanService.reportInsert(param);
		}
		
		@RequestMapping("check_report_process.do")
		public HashMap<String, Object> checkSingoProcess(int jet_board_shareplan_no, HttpSession session) {
			//예외처리에 사용 하려 햇는데 디버그 나서 아직 못사용중 0208
			MemberVo singoMemberVo = (MemberVo)session.getAttribute("sessionUser");
			
			//미리 예외처리
			SharePlanReportVo sharePlanReportVo = null;
			
			boolean existSingoVo = false;
			
			if(singoMemberVo != null) {
				sharePlanReportVo = sharePlanService.checksingo(jet_board_shareplan_no, singoMemberVo);
				if(sharePlanReportVo!=null) {
					existSingoVo = true;
				}else {
					existSingoVo = false;
				}
			}
			
			HashMap<String,Object> map = new HashMap<String,Object>(); 

			map.put("existSingoVo", existSingoVo);
			
			return map;
		}	
	
}
