package com.cjo.jet.travelplan.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjo.jet.travelplan.service.TravelPlanServiceImpl;
import com.cjo.jet.vo.MemberVo;
import com.cjo.jet.vo.TravelPlanDetailVo;
import com.cjo.jet.vo.TravelPlanVo;

@Controller
@RequestMapping("/travelplan/*")
class TravelPlanController {
	
	@Autowired
	private TravelPlanServiceImpl travelPlanService;
	
	@RequestMapping("travelplan_board_page.do")
	public String myTravelPlanPage(HttpSession session, Model model) {
		System.out.println("여행계획페이지 실행");
		//로그인 페이지 이동용으로 넣어놓음(임시)
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		
		
		ArrayList<HashMap<String, Object>> resultList = travelPlanService.getContentList(memberVo.getJet_member_no());
		
		model.addAttribute("resultList", resultList);
		
		return "travelplan/travelplan_board_page";
	}
	
	@RequestMapping("write_travel_plan_detail_page.do")
	public String writeTravelPlanDetailPage() {
		System.out.println("writeTravelPlanDetailPage 실행");
	
		return "travelplan/write_travel_plan_detail_page";
	}
	
	
	
	
	
	@RequestMapping("write_travel_plan_process.do")
	public String writeTravelPlanProcess(TravelPlanVo param,HttpSession session ,
			int [] jet_board_tp_detail_ctgr_no,
			double [] jet_board_tp_detail_latitude,
			double [] jet_board_tp_detail_longitude,
			int [] jet_board_tp_detail_day,
			int [] jet_board_tp_detail_starthours,
			int [] jet_board_tp_detail_startmin,
			String [] jet_board_tp_detail_placename,
			String [] jet_board_tp_detail_adress,
			String [] jet_board_tp_detail_content
			) {
		
		System.out.println("어디서 걸리냐 controller1");
		
		ArrayList<TravelPlanDetailVo> travelPlanDetailVoList = new ArrayList<TravelPlanDetailVo>();
		
		for(int i = 0 ; i < jet_board_tp_detail_ctgr_no.length ; i++) {
			
			travelPlanDetailVoList.add(new TravelPlanDetailVo(
					0,
					0,
					jet_board_tp_detail_ctgr_no[i],
					jet_board_tp_detail_latitude[i],
					jet_board_tp_detail_longitude[i],
					jet_board_tp_detail_day[i],
					jet_board_tp_detail_starthours[i],
					jet_board_tp_detail_startmin[i],
					jet_board_tp_detail_placename[i],
					jet_board_tp_detail_adress[i],
					jet_board_tp_detail_content[i]
					));
		}
		System.out.println("어디서 걸리냐 controller2");
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		int jet_member_no = sessionUser.getJet_member_no();
		
		System.out.println("여행플랜 글쓴사람 의 no :" +jet_member_no);
		
		param.setJet_member_no(jet_member_no);
		
		travelPlanService.writeTravelPlan(param, travelPlanDetailVoList);
		
		return "redirect:./travelplan_board_page.do";
	}
	//글 읽기
	@RequestMapping("read_travelplan_page.do")
	public String readPlanPage(Model model, int jet_board_travelplan_no) {
		
		HashMap<String, Object> resultMap = travelPlanService.getPlanContent(jet_board_travelplan_no);
		ArrayList<HashMap<String, Object>> resultList = travelPlanService.getDetailList(jet_board_travelplan_no);
		
		model.addAttribute("result", resultMap);
		model.addAttribute("resultList", resultList);
		
		return "travelplan/read_travelplan_page";
		
	}
	@RequestMapping("delete_travelplan_process.do")
	public String deleteTravelPlanProcess(int jet_board_travelplan_no) {
		System.out.println("travelplan_no : "+jet_board_travelplan_no);
		travelPlanService.deletePlanAndDetails(jet_board_travelplan_no);
		
		return "redirect:./travelplan_board_page.do";
	}
	@RequestMapping("update_travelplan_page.do")
	public String updateTravelPlanPage(Model model, int jet_board_travelplan_no) {
		HashMap<String, Object> resultMap = travelPlanService.getPlanContent(jet_board_travelplan_no);
		ArrayList<HashMap<String, Object>> resultList = travelPlanService.getDetailList(jet_board_travelplan_no);
		
		
		model.addAttribute("result", resultMap);
		model.addAttribute("resultList", resultList);
		
		return "travelplan/update_travelplan_page";
	}
	
	@RequestMapping("update_travelplan_process.do")
	public String updateTravelPlanProcess(TravelPlanVo param) {
		//나의 여행 계획 글 수정
		travelPlanService.updatePlanTitle(param);
		
		return"redirect:./travelplan_board_page.do";
	}
	
	@ResponseBody
	@RequestMapping("update_sharestatus_process.do")
	public String ShareProcess(int jet_board_travelplan_no) {
		//공유 상태 변경
		travelPlanService.updateShareStatus(jet_board_travelplan_no);
		
		return "redirect:./write_shareplan_board_page.do";
	}
}
