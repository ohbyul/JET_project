package com.cjo.jet.message.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjo.jet.member.mapper.MemberSQLMapper;
import com.cjo.jet.message.mapper.MessageSQLMapper;
import com.cjo.jet.vo.MemberVo;
import com.cjo.jet.vo.MessageVo;

@Service
public class MessageServiceImpl {
	
	@Autowired
	private MessageSQLMapper messageSQLMapper;
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	public void writeMessage(MessageVo vo) {
		//쪽지 보내기
		
		int messagePK = messageSQLMapper.createKey();
		vo.setJet_message_no(messagePK);
		
		messageSQLMapper.insertMessage(vo);
		
	}
	
	public ArrayList<HashMap<String, Object>> getSentMessageList(String search_word, String search_type,/*int search_nick,*/int page_num , int sender_no){
		
		ArrayList<HashMap<String, Object>> resultList = 
				new ArrayList<HashMap<String,Object>>();
		
		ArrayList<MessageVo> messageList = null;
		if(search_word == null || search_type == null) {
			messageList = messageSQLMapper.selectSentMessage(page_num,sender_no);
		}else {
			if(search_type.equals("title")) {
				messageList = messageSQLMapper.selectByTitleAndSender(search_word, sender_no);
			}else if(search_type.equals("content")) {
				messageList = messageSQLMapper.selectByContentAndSender(search_word, sender_no);
			}else if(search_type.equals("receiver")) {
				messageList = messageSQLMapper.selectByReceiver(search_word);
			}else {
				messageList = messageSQLMapper.selectSentMessage(page_num,sender_no);
			}
			
		}
		
		for(MessageVo messageVo : messageList) {
			int jet_member_no = messageVo.getJet_member_sender();
			int jet_receiver = messageVo.getJet_member_receiver();
			
			MemberVo memberVo = memberSQLMapper.selectByNo(jet_member_no);
			MemberVo memberReceiverNick = memberSQLMapper.selectNickByNo(jet_receiver); 
			System.out.println("[receiver nick]"+memberReceiverNick);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("messageVo", messageVo);
			map.put("memberReceiverNick", memberReceiverNick);
			
			resultList.add(map);
			
		}
		
		return resultList;
	}
		
	public ArrayList<HashMap<String, Object>> getSentMessageListForAdmin(int sender_no){
			
		ArrayList<HashMap<String, Object>> resultList = 
					new ArrayList<HashMap<String,Object>>();
			
		ArrayList<MessageVo> messageList = null;
		messageList = messageSQLMapper.selectSentMessageForAdmin(sender_no);
		
		for(MessageVo messageVo : messageList) {
			int jet_member_no = messageVo.getJet_member_sender();
			int jet_receiver = messageVo.getJet_member_receiver();
			
			MemberVo memberVo = memberSQLMapper.selectByNo(jet_member_no);
			MemberVo memberReceiverNick = memberSQLMapper.selectNickByNo(jet_receiver); 
			System.out.println("[receiver nick]"+memberReceiverNick);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("messageVo", messageVo);
			map.put("memberReceiverNick", memberReceiverNick);
			
			resultList.add(map);
			
		}
		
		return resultList;
	}
	//보낸 쪽지 보기
	public HashMap<String, Object> getSentMessage(int messageNo){
		
		MessageVo messageVo = messageSQLMapper.selectByMessageNo(messageNo);
		
		//html escape - html 문서 형식으로 전환
		String jet_message_content = messageVo.getJet_message_content();
		jet_message_content = StringEscapeUtils.escapeHtml4(jet_message_content);
		//jet_message_content = jet_message_content.replaceAll("\n","<br>");
		messageVo.setJet_message_content(jet_message_content);
		
		String jet_message_title = messageVo.getJet_message_title();
		jet_message_title = StringEscapeUtils.escapeHtml4(jet_message_title);
		messageVo.setJet_message_title(jet_message_title);
		
		int jet_receiver = messageVo.getJet_member_receiver();
		
		MemberVo memberVo = memberSQLMapper.selectByNo(messageVo.getJet_member_sender());
		
		MemberVo memberReceiverNick = memberSQLMapper.selectNickByNo(jet_receiver); 
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberVo", memberVo);
		map.put("messageVo", messageVo);
		map.put("memberReceiverNick", memberReceiverNick);
		
		return map;
	}
	//받은 쪽지함 리스트
	public ArrayList<HashMap<String, Object>> getMessageList(String search_word, String search_type, /*int searchNick,*/int page_num, int receiver_no){
		
		ArrayList<HashMap<String, Object>> resultList = 
				new ArrayList<HashMap<String,Object>>();
		
		ArrayList<MessageVo> messageList = null;
		if(search_word == null || search_type == null) {
			messageList = messageSQLMapper.selectMessage(page_num,receiver_no);
		}else {
			if(search_type.equals("title")) {
				messageList = messageSQLMapper.selectByTitleAndReceiver(search_word, receiver_no);
			}else if(search_type.equals("content")) {
				messageList = messageSQLMapper.selectByContentAndReceiver(search_word, receiver_no);
			}else if(search_type.equals("sender")) {
				messageList = messageSQLMapper.selectBySender(search_word);
			}else {
				messageList = messageSQLMapper.selectMessage(page_num,receiver_no);
			}
		}
		
		
		for(MessageVo messageVo : messageList) {
			int jet_member_no = messageVo.getJet_member_receiver();
			int jet_sender = messageVo.getJet_member_sender();
			
			MemberVo memberVo = memberSQLMapper.selectByNo(jet_member_no);
			MemberVo memberSenderNick = memberSQLMapper.selectNickByNo(jet_sender);
			MemberVo memberGrade = memberSQLMapper.selectGradeByNo(jet_sender);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("messageVo", messageVo);
			map.put("memberSenderNick", memberSenderNick);
			map.put("memberGrade", memberGrade);
			resultList.add(map);
		}
		
		return resultList;
	}
	
	//받은 쪽지 보기
	public HashMap<String, Object> getMessage(int messageNo){
		
		MessageVo messageVo = messageSQLMapper.selectByMessageNo(messageNo);
		//html escape - html 문서 형식으로 전환
		String jet_message_content = messageVo.getJet_message_content();
		jet_message_content = StringEscapeUtils.escapeHtml4(jet_message_content);
		//jet_message_content = jet_message_content.replaceAll("\n","<br>");
		messageVo.setJet_message_content(jet_message_content);
		
		String jet_message_title = messageVo.getJet_message_title();
		jet_message_title = StringEscapeUtils.escapeHtml4(jet_message_title);
		messageVo.setJet_message_title(jet_message_title);
		
		MemberVo memberVo = memberSQLMapper.selectByNo(messageVo.getJet_member_receiver());
		int jet_sender = messageVo.getJet_member_sender();
		MemberVo memberSenderNick = memberSQLMapper.selectNickByNo(jet_sender);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberVo", memberVo);
		map.put("messageVo", messageVo);
		map.put("memberSenderNick", memberSenderNick);
		
		return map;
	}
	
	public HashMap<String, Object> getMessageForReply(int messageNo){
		
		MessageVo messageVo = messageSQLMapper.selectByMessageNoForReply(messageNo);
		MemberVo memberVo = memberSQLMapper.selectByNo(messageVo.getJet_member_sender());
		
		int jet_sender = messageVo.getJet_member_sender();
		MemberVo memberSenderNick = memberSQLMapper.selectNickByNo(jet_sender);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("messageVo", messageVo);
		map.put("memberVo", memberVo);
		map.put("memberSenderNick", memberSenderNick);
		return map;
	}
	
	public void replyMessage(MessageVo vo) {
		//쪽지 보내기
		
		int messagePK = messageSQLMapper.createKey();
		vo.setJet_message_no(messagePK);
		
		messageSQLMapper.replyMessage(vo);
		
	}
	
	public void deleteMessage(int messageNo) {
		messageSQLMapper.deleteMessageByNo(messageNo);
	}
	
	//페이지 갯수 처리
	public int getPageCount() {
		return messageSQLMapper.getPageCount();
	}
	
	public int getNoByNick(String jet_member_nick) {
		return memberSQLMapper.selectNoByNick(jet_member_nick);
	}
	
	public String existNick(String nick,String sessionNick) {
		
		String vo = memberSQLMapper.checkByNick(nick);
		
		if(vo != null && sessionNick.equals(vo)) {
			return "myNick";
		}else if(vo != null && sessionNick != vo){
			return "agree";
		}else if(vo == null){
			return "disagree";
		}else {
			return "blank";
		}
	}
}
