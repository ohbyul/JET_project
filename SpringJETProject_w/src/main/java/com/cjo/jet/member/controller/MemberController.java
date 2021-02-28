package com.cjo.jet.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjo.jet.member.service.MemberServiceImpl;
import com.cjo.jet.vo.FriendsVo;
import com.cjo.jet.vo.MemberStatusVo;
import com.cjo.jet.vo.MemberVo;
import com.sun.org.glassfish.gmbal.ParameterNames;

@Controller
@RequestMapping("/member/*")
public class MemberController{
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping("login_page.do")
	public String loginPage() {
		
		return "member/login_page";
	}
	
	@RequestMapping("join_member_page.do")
	public String joinMemberPage() {
		return "member/join_member_page";
	}
	
	@RequestMapping("join_member_process.do")
	public String joinMemberProcess(MemberVo param, String [] jet_interest_name) {
		String id = param.getJet_member_id();
		String jet_member_id = id.replaceAll(",", "");
		param.setJet_member_id(jet_member_id);
		
		memberService.joinMember(param, jet_interest_name);

		return "member/join_member_complete";
	}
	
	@RequestMapping("test_page.do")
	public String testPage() {
		return "member/test_page";
	}
	@RequestMapping("logout_process.do")
	public String logoutProcess(HttpSession session, HttpServletRequest request) {
		
		session.invalidate();
		
		String referer = request.getHeader("Referer");
		if(referer != null && !referer.equals("")) {
			if(referer.contains("admin")) {
				return "redirect:../content/main_page.do";
			}else {
				return "redirect:"+referer;
			}
			
		}else {
			return "redirect:/";
		}
		
	}
	
	
//-----------------------------------------------------------------------------------------------------------------------------//
	@RequestMapping("add_friends_process.do")
	public String addFriendsProcess(HttpSession session, int jet_friends_member_no) throws Exception{
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		int member_no = memberVo.getJet_member_no();
		
		memberService.insertFriends(member_no,jet_friends_member_no);
		
		return "redirect:./my_friendList_page.do";
	}
	
	@RequestMapping("find_friends_page.do")
	public String findFriendsPage(HttpSession session, Model model,String search_word, String search_type 
			,@RequestParam(value = "page_num", defaultValue = "1") int page_num) {
			
			MemberVo vo = (MemberVo)session.getAttribute("sessionUser");
			int jet_member_no = vo.getJet_member_no();//친구찾기 페이지에서 로그아웃하면 NPE발생
			System.out.println("[test member no]"+jet_member_no);
			ArrayList<MemberVo> memberList = memberService.getMemberList(jet_member_no, search_word, search_type,page_num);
			
			int listCount = memberService.getFindFriendPageCount();
			int currentPage = page_num;
			int beginPage = ((currentPage-1)/5)*5 +1;
			int endPage = ((currentPage-1)/5 +1)*(5);
			
			if(endPage > listCount) {
				endPage = listCount;
			}
			
			model.addAttribute("memberList", memberList);
			model.addAttribute("listCount",listCount);
			model.addAttribute("currentPage",currentPage);
			model.addAttribute("beginPage",beginPage);
			model.addAttribute("endPage",endPage);
			
			return "/member/find_friends_page";
	}
	
	@RequestMapping("my_friendList_page.do")
	public String myFriendListPage(Model model, 
			@RequestParam(value = "page_num", defaultValue = "1") int page_num) throws Exception{
		
		ArrayList<HashMap<String, Object>> resultList = memberService.getFriendList(page_num);
		System.out.println("[test friend list]" + resultList.size());
		
		int pageCount = memberService.getPageCount();
		int currentPage = page_num;
		int beginPage = ((currentPage-1)/5)*5 + 1;
		int endPage = ((currentPage-1)/5 + 1)*(5);
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
	
		
		return "member/my_friendList_page";
	}
	@RequestMapping("delete_friend_process.do")
	public String DeleteFriendProcess(int jet_friends_no) {
		
		memberService.deleteFriend(jet_friends_no);
		
		return "redirect:./my_friendList_page.do";
	}
	@RequestMapping("page_for_nullpointerexception.do")
	public String pageForNullPointerException() {
		
		return "member/page_for_nullpointerexception";
	}
	
	@RequestMapping("update_member_info_page.do")
	public String updateMemberInfoPage(Model model, HttpSession session) {
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();
		
		HashMap<String, Object> resultMap = memberService.getMemberInfo(jet_member_no);
		
		model.addAttribute("result", resultMap);
		
		return "member/update_member_info_page";
	}
	
	@RequestMapping("update_member_info_process.do")
	public String updateMemberInfoProcess(MemberVo param, String [] jet_interest_name, HttpSession session) {
		
		MemberVo vo = (MemberVo)session.getAttribute("sessionUser");
		System.out.println("[test interest name]"+jet_interest_name);
		
		int jet_member_no = vo.getJet_member_no();
		param.setJet_member_no(jet_member_no);
		
		memberService.updateMember(param, jet_interest_name);
		
		return "member/update_member_info_complete";
	}
	
	@RequestMapping("check_pw_page.do")
	public String checkPwPage() {
		
		return "member/check_pw_page";
	}
	
	@RequestMapping("check_pw_fail_page.do")
	public String checkPwFailPage() {
		return "member/check_pw_fail_page";
	}
	@RequestMapping("check_pw_process.do")
	public String checkPwProcess(MemberVo param) {
		
		MemberVo check = memberService.checkPw(param);
		
		
		if(check != null) {
			return "redirect: ../mypage/security_mypage.do";
		}else {
			return "redirect:./check_pw_fail_page.do";
		}
	}
	
}
