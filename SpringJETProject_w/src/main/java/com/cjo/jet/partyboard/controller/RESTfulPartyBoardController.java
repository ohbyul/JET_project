package com.cjo.jet.partyboard.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjo.jet.partyboard.service.PartyBoardServiceImpl;
import com.cjo.jet.travelplan.service.TravelPlanServiceImpl;
import com.cjo.jet.vo.MemberVo;
import com.cjo.jet.vo.PartyBoardAttendVo;
import com.cjo.jet.vo.PartyChatVo;
import com.cjo.jet.vo.PartySingoVo;

@Controller
@RequestMapping("/party_board/*")
@ResponseBody
public class RESTfulPartyBoardController {

	@Autowired
	private PartyBoardServiceImpl partyBoardService;
	
	@Autowired
	private TravelPlanServiceImpl travelPlanService;
	
	@RequestMapping("get_travelplan_list.do")
	public ArrayList<HashMap<String, Object>> getTravelDetail(int jet_board_travelplan_no) {
		
		ArrayList<HashMap<String, Object>> resultList = travelPlanService.getDetailList(jet_board_travelplan_no);
				
		return resultList;
	}
	
	
	@RequestMapping("write_attend_party_board_process.do")
	public void writeAttendPartyProcess(PartyBoardAttendVo param ,HttpSession session) {
		System.out.println("[writeAttendPartyProcess]실행 /에이작스 리플 인서트");
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		int member_no = memberVo.getJet_member_no();
		
		System.out.println("jet_party_attend_state_no" + param.getJet_party_attend_state_no());
		
		param.setJet_member_no(member_no);
		
		partyBoardService.writeAttendParty(param);
	}
	
	@RequestMapping("get_party_attend_list.do")
	public ArrayList<HashMap<String, Object>> getPartyBoardAttendList(int jet_board_party_no){
		
		ArrayList<HashMap<String, Object>> result = partyBoardService.getPartyBoardAttendList(jet_board_party_no);
		
		return result;
	}
	
	@RequestMapping("delete_attend_process.do")
	public void deleteAttendProcess(int jet_party_attend_no) {
		partyBoardService.deleteAttend(jet_party_attend_no);
	}

	@RequestMapping("delete_attend_and_fixcount_process.do")
	public void deleteAttendAndFixcountProcess(int jet_party_attend_no) {
		System.out.println("파티 레스트 풀 컨트롤러 jet_party_attend_no : 존재 여부"+jet_party_attend_no);
		partyBoardService.deleteAttendAndFixcount(jet_party_attend_no);
	}
	
	@RequestMapping("check_attend_process.do")
	public ArrayList<HashMap<String, Object>> checkAttendProcess(int jet_board_party_no){
		ArrayList<HashMap<String, Object>> checkAttend = partyBoardService.getPartyBoardAttendList(jet_board_party_no);
		
		return checkAttend;
	}
	
	@RequestMapping("update_approve_proces.do")
	public void updateApproveProcess(int jet_party_attend_no) {
		partyBoardService.updateApprove(jet_party_attend_no);
	}
	
	@RequestMapping("update_reject_proces.do")
	public void updateRejectProcess(int jet_party_attend_no) {
		partyBoardService.updateReject(jet_party_attend_no);
	}
	
	@RequestMapping("get_approve_membervo_process.do")
	public ArrayList<HashMap<String,Object>> getApproveMemberProcess (int jet_board_party_no){
		ArrayList<HashMap<String,Object>> approveMember = partyBoardService.getApproveMember(jet_board_party_no);
		
		return approveMember;
	}
	
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ	
	@RequestMapping("singo_party_process.do")
	public void singoInsertProcess (PartySingoVo param, HttpSession session) {
		
		int singoMemberNo = ((MemberVo)session.getAttribute("sessionUser")).getJet_member_no();
		//세션뽑아서 신고자의 no 출력
		
		param.setJet_member_no(singoMemberNo);
		
		partyBoardService.singoInsert(param);
	}
	
	@RequestMapping("check_singo_process.do")
	public HashMap<String, Object> checkSingoProcess(int jet_board_party_no,HttpSession session) {
		//예외처리에 사용 하려 햇는데 디버그 나서 아직 못사용중 0208
		MemberVo singoMemberVo = (MemberVo)session.getAttribute("sessionUser");
		
		//미리 예외처리
		PartySingoVo partySingoVo = null;
		
		boolean existSingoVo = false;
		
		if(singoMemberVo != null) {
			partySingoVo=partyBoardService.checksingo(jet_board_party_no, singoMemberVo);
			if(partySingoVo!=null) {
				existSingoVo = true;
			}else {
				existSingoVo = false;
			}
		}
		
		HashMap<String,Object> map = new HashMap<String,Object>(); 

		map.put("existSingoVo", existSingoVo);
		
		return map;
	}
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ		
	@RequestMapping("write_chat_process.do")
	public void writeChatProcess(PartyChatVo param,HttpSession session) {
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		int member_no = memberVo.getJet_member_no();
		
		param.setJet_member_no(member_no);
		partyBoardService.writePartyChat(param);
	}
	@RequestMapping("get_chat_list_process.do")
	public ArrayList<HashMap<String, Object>> chatListProcess(int jet_member_no){
		ArrayList<HashMap<String, Object>> result = partyBoardService.getPartyChatList(jet_member_no);
		// 참여중인 채팅 리스트
		return result;
	}
	
	@RequestMapping("get_open_chat_list_process.do")
	public ArrayList<HashMap<String, Object>> openchatListProcess(int jet_member_no){
		ArrayList<HashMap<String, Object>> result = partyBoardService.getMyOpenedChatList(jet_member_no);
		//내가 개설한 채팅 리스트
		return result;
	}
	
	
	@RequestMapping("get_chat_process.do")
	public ArrayList<HashMap<String, Object>> chatcontentProcess(int jet_board_party_no){
		ArrayList<HashMap<String, Object>> result = partyBoardService.getPartyChat(jet_board_party_no);
		//채팅 내용 
		System.out.println("레스트풀 채팅 내용 가져오기 jet_board_party_no : " + jet_board_party_no);
		return result;
	}
	
	@RequestMapping("get_chat_title.do")
	public HashMap<String, Object> getPartyBoardForChat(int jet_board_party_no){
		
		HashMap<String, Object> map = partyBoardService.getPartyBoard(jet_board_party_no);
		return map;
	}

	
	@RequestMapping("get_current_state.do")
	public HashMap<String, Object> getCurrentChatState(HttpSession session){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("state", session.getAttribute("state"));
		map.put("chatNum", session.getAttribute("chatNum"));
		
		return map;
	}
	
	@RequestMapping("set_current_state.do")
	public void setCurrentChatState(HttpSession session, @RequestParam(value="state" , defaultValue = "0") int state , @RequestParam(value="chatNum" , defaultValue = "0")int chatNum){
		//0 = 닫힘
		//1 = 리스트
		//2 = 채팅 방
		//chatNum = 방번호
		
		session.setAttribute("state", state);
		session.setAttribute("chatNum", chatNum);
	}
	
	
	
	
	
	
	
	
	
}
