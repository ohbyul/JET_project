package com.cjo.jet.message.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjo.jet.member.service.MemberServiceImpl;
import com.cjo.jet.message.service.MessageServiceImpl;
import com.cjo.jet.vo.MemberVo;
import com.cjo.jet.vo.MessageVo;

@Controller
@RequestMapping("/message/*")
public class MessageController {
	@Autowired
	private MessageServiceImpl messageService;
	@Autowired
	private MemberServiceImpl memberService;
	
	//받은 쪽지 페이지 리스트
	@RequestMapping("message_page.do")//sender
	public String messagePage(Model model, String search_word, String search_type, /*String jet_member_sender,*/
			@RequestParam(value = "page_num", defaultValue = "1") int page_num , HttpSession session) {
		
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		
		//int searchNick = messageService.getNoByNick(jet_member_sender);
		
		//보낸 쪽지함
		System.out.println("[보낸 메시지함test]");
		ArrayList<HashMap<String, Object>> messageList = messageService.getMessageList(search_word, search_type, /*searchNick,*/page_num, memberVo.getJet_member_no());
		
		
		System.out.println("[messageList test ]"+messageList.size());
		
		//페이지 갯수 처리
		int pageCount = messageService.getPageCount();
		int currentPage = page_num;
		int beginPage = (currentPage-1/5)*5 + 1;
		int endPage = (currentPage-1/5 + 1)*(5);
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		model.addAttribute("messageList",messageList);
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("beginPage",beginPage);
		model.addAttribute("endPage", endPage);
		
		return "message/message_page";
	}
	
	//보낸 쪽지 리스트 페이지
	@RequestMapping("sent_message_page.do")
	public String sentMessagePage(Model model, String search_word, String search_type,
			@RequestParam(value = "page_num", defaultValue = "1") int page_num, HttpSession session) {
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		
		//int searchNick = messageService.getNoByNick(search_nick);
		//보낸 쪽지함
		System.out.println("[보낸 메시지함test]");
		ArrayList<HashMap<String, Object>> messageList = messageService.getSentMessageList(search_word,search_type,/*searchNick,*/page_num,memberVo.getJet_member_no());
		System.out.println("[messageList test ]"+messageList.size());
		//페이지 갯수 처리
		int pageCount = messageService.getPageCount();
		int currentPage = page_num;
	 	int beginPage = ((currentPage-1)/5) * 5 + 1;
	 	int endPage = ((currentPage-1)/5 + 1) * (5);
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		model.addAttribute("messageList",messageList);
		
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("beginPage",beginPage);
		model.addAttribute("endPage", endPage);
	
		return "message/sent_message_page";
	}
	
	
	
	@RequestMapping("write_message_page.do")
	public String writeMessagePage() {
		//쪽지 보내기
		return "message/write_message_page";
	}
	
	@RequestMapping("write_message_process.do")
	public String writeMessageProcess(MessageVo param, String jet_member_nick, HttpSession session) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();
		
		System.out.println("[nick test]"+jet_member_nick);
		
		int jet_member_receiver = messageService.getNoByNick(jet_member_nick);
		System.out.println("[receiver test]" + jet_member_receiver);
		
		param.setJet_member_sender(jet_member_no);
		param.setJet_member_receiver(jet_member_receiver);
		
		
		System.out.println("[message send]"+param);
		messageService.writeMessage(param);
		System.out.println("[message send complete]"+param);
		
		return "redirect:./sent_message_page.do";
		
	}
	//보낸 쪽지 읽기
	@RequestMapping("read_sent_message_page.do")
	public String readSentMessage(Model model, int jet_message_no) {
		
		HashMap<String, Object> resultMap = messageService.getSentMessage(jet_message_no);
		
		model.addAttribute("result", resultMap);
		
		return "message/read_sent_message_page";
	}
	//받은 쪽지 읽기
	@RequestMapping("read_message_page.do")
	public String readMessage(Model model, int jet_message_no) {
		
		HashMap<String, Object> resultMap = messageService.getMessage(jet_message_no);
		
		model.addAttribute("result", resultMap);
		
		return "message/read_message_page";
	}
	//답장 부분 <- 일반적인 글 쓰기와 다를 바 없음<-아닌 것 같음 좀 빡셈
	@RequestMapping("reply_message_page.do")
	public String replyMessagePage(Model model, @RequestParam(value="jet_message_no") int jet_message_no) {
		System.out.println("[reply jet_member_nick]");
		
		HashMap<String, Object> map = messageService.getMessageForReply(jet_message_no);
		
		model.addAttribute("result", map);
		
		return "message/reply_message_page";
	}
	
	@RequestMapping("reply_message_process.do")
	public String replyMessageProcess(MessageVo param, HttpSession session, int jet_message_no) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();
		
		param.setJet_member_sender(jet_member_no);
		
		System.out.println("[message reply]"+param);
		messageService.replyMessage(param);
		System.out.println("[message reply complete]"+param);
				
		return "redirect:./sent_message_page.do";
	}
	
	@RequestMapping("delete_message_process.do")
	public String deleteMessageProcess(int jet_message_no) {
		
		messageService.deleteMessage(jet_message_no);
		
		return "redirect:./message_page.do";
	}
	
	@ResponseBody
	@RequestMapping("exist_receiver.do")
	public String existReceiver(String jet_member_nick, HttpSession session) {
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		String sessionNick = memberVo.getJet_member_nick();
		System.out.println("[test]" + jet_member_nick);
		
		String existReceiver = messageService.existNick(jet_member_nick,sessionNick);
		
		if(existReceiver == "myNick") {
			return "myNick";
		}else if(existReceiver == "agree"){
			return "agree";
		}else if(existReceiver == "disagree") {
			return "disagree";
		}else {
			return "blank";
		}
	}
}
