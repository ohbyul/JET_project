package com.cjo.jet.member.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjo.jet.member.service.MemberServiceImpl;
import com.cjo.jet.vo.MemberStatusVo;
import com.cjo.jet.vo.MemberVo;

@ResponseBody//ajax 아이디 중복확인 //<- ajax로 부터 호출되는 요청의 응답을 데이터만 보낼 때 이 어노테이션을 사용 - 포워딩 하지 않는 방식
@Controller
@RequestMapping("/member/*")
public class RESTfulMemberController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	
	
	@RequestMapping("exist_id.do")
	public String existId(String id) {
		System.out.println("[ajax server test]" + id);//테스트 코드
		String jet_member_id = id.replaceAll(",", "");
		boolean existId = memberService.existId(jet_member_id);
		
		if(existId == true) {//ajax로 부터 호출되는 명령의 응답은 순수하게 데이터만 리턴되어야 함.
			return "true"; //나중에 null도 추가해서 테스트해 볼 것
		}else if(existId == false){
			return "false";
		}else {
			return "null";
		}
	}
	
	@RequestMapping("exist_member_nick.do")
	public String existReceiver(String jet_member_nick) {
		
		System.out.println("[test]" + jet_member_nick);
		String existNick = memberService.existNick(jet_member_nick);
		
		if(existNick == "true") {
			return "true";
		}else {
			return "false";
		}
	}
	
	
	@RequestMapping("login_process.do")
	public String loginProcess(MemberVo param, HttpSession session) {
		
		MemberVo sessionUser = memberService.login(param);
		
		if(sessionUser == null){
			return "loginFail";
		}
		
		//멤버 활동상태 체크
		MemberStatusVo vo = memberService.checkMemberState(sessionUser.getJet_member_no());
		System.out.println("[test stat]" + vo.getJet_member_status_active());
		
		System.out.println("[test]" + sessionUser);
		
		if(sessionUser != null && vo.getJet_member_status_active().equals("Y")) {
			session.setAttribute("sessionUser", sessionUser);
//여기 관리자 페이지 예외처리 오별		
			String memberGrade = sessionUser.getJet_member_grade();
			System.out.println("memberGrade =" +memberGrade);
			
			if(memberGrade.contains("9")){
				return "admin";
			}else {
				return "commonUser";
			}
		}else{//활동상태가 N일 경우 임시적으로 test페이지로 넘김
			return "rejectedUser";	
		}
	}
	
	//-------------------------------------------------------
	@RequestMapping("getSessionNo.do")
	public HashMap<String,Object> getCurrentSessionMemberNo(HttpSession session){
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		
		
		HashMap<String,Object> result = new HashMap<String,Object>(); 

		if(memberVo != null) {
			result.put("result", "success");
			result.put("sessionNo" , memberVo.getJet_member_no());
		}else {
			result.put("result", "fail");
			result.put("reason", "로그인을 하지 않았습니다.");
		}
		
		return result;
	}
	//사용자 스테이터스 수정
	@RequestMapping("update_member_status_process")
	public String updateMemberStatusToNProcess(int jet_stopstate_period_no,int jet_stopstate_reason_no,int jet_member_no) {//사용자 활동 상태 수정
		System.out.println("[test status_update] 되나되나");
		
		if(jet_stopstate_period_no != 0 && jet_stopstate_reason_no != 0) {
			System.out.println("[test status_update peri no]" + jet_stopstate_period_no);
			System.out.println("[test status_update reason no]" + jet_stopstate_reason_no);
			System.out.println("[test status_update member no]" + jet_member_no);
			
			memberService.updateMemberStatusToN(jet_stopstate_period_no, jet_stopstate_reason_no, jet_member_no);
			
			return "reject";
		}else {
			System.out.println("[test status_update Y 되나 되나");
			MemberStatusVo vo = memberService.checkMemberState(jet_member_no);
			
			System.out.println("[test status_update Y 되나 되나" + vo);
			Date updateDay = vo.getJet_member_status_updateday();
			int stopPeriod = vo.getJet_stopstate_period_no();
			System.out.println("[asdfgsd]" + updateDay);
			System.out.println("[asdfgsd]" + stopPeriod);
			
			Date today = new Date();
			// '/'없이 날짜 형변환
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
			String sdfUpdateDay = sdf.format(updateDay);
			String sdfToday = sdf.format(today);
			System.out.println("[asdfgsd]" +sdfUpdateDay);
			// String로 변환된 날짜를 다시 int로 형변환
			int parsedUpdateDay = Integer.parseInt(sdfUpdateDay);
			int parsedToday = Integer.parseInt(sdfToday);
			int allStopPeriod = parsedUpdateDay+stopPeriod;
			
			System.out.println("[더하기]"+allStopPeriod);
			
			if(parsedToday <= allStopPeriod) {
				return "rejectActive";
			}else {
				memberService.updateMemberStatusToY(jet_member_no);
				return "active";
			}
			
		}
		
	}
	//상태 강제 변경
	@RequestMapping("update_member_status_force_process")
	public String updateMemberStatusForceProcess(int jet_member_no) {
		
		memberService.updateMemberStatusToY(jet_member_no);
		return "redirect:../admin/admin_member_detailstate_page.do?jet_member_no="+jet_member_no+"";
	}
	
}
