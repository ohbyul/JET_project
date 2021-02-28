package com.cjo.jet.partyboard.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.cjo.jet.member.mapper.MemberSQLMapper;
import com.cjo.jet.partyboard.mapper.PartyBoardAttendSQLMapper;
import com.cjo.jet.partyboard.mapper.PartyBoardChatSQLMapper;
import com.cjo.jet.partyboard.mapper.PartyBoardImageSQLMapper;
import com.cjo.jet.partyboard.mapper.PartyBoardRatingSQLMapper;
import com.cjo.jet.partyboard.mapper.PartyBoardSQLMapper;
import com.cjo.jet.vo.MemberVo;
import com.cjo.jet.vo.PartyBoardAttendStateVo;
import com.cjo.jet.vo.PartyBoardAttendVo;
import com.cjo.jet.vo.PartyBoardImageVo;
import com.cjo.jet.vo.PartyBoardVo;
import com.cjo.jet.vo.PartyChatVo;
import com.cjo.jet.vo.PartyRatingVo;
import com.cjo.jet.vo.PartySingoVo;

@Service
public class PartyBoardServiceImpl {

	@Autowired
	private PartyBoardSQLMapper partyBoardSQLMapper;

	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	@Autowired
	private PartyBoardImageSQLMapper partyBoardImageSQLMapper;
	
	@Autowired
	private PartyBoardAttendSQLMapper partyBoardAttendSQLMapper;
	
	@Autowired
	private PartyBoardChatSQLMapper partyBoardChatSQLMapper;
	
	@Autowired
	private PartyBoardRatingSQLMapper partyBoardRatingSQLMapper;
	//오별 0225
	
	
	//글쓰기
	public void writePartyBoard(PartyBoardVo vo, ArrayList<PartyBoardImageVo> imageVoList) {
		
		int partyBoardPk = partyBoardSQLMapper.creatKey();
		vo.setJet_board_party_no(partyBoardPk);
		//프라이머리키 세팅
		
		partyBoardSQLMapper.insert(vo);
		
		//이미지 인서트 처리
		for(PartyBoardImageVo imageVo : imageVoList) {
			imageVo.setJet_board_party_no(partyBoardPk);

			partyBoardImageSQLMapper.insert(imageVo);
		}
	}
	
	//공유 비스무리한 글쓰기
/*	public void writePartyBoardByW(PartyBoardVo vo, int travelplanNo) {
		
		int partyBoardPk = partyBoardSQLMapper.creatKey();
		vo.setJet_board_party_no(partyBoardPk);
		vo.setJet_board_travelplan_no(travelplanNo);
		//프라이머리키 세팅
		
		partyBoardSQLMapper.insert(vo);
		
	}
*/
	//게시팔 글 리스트 출력
	public ArrayList<HashMap<String, Object>> getPartyBoardList(){
	
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<PartyBoardVo> partyBoardList = null;
		
		partyBoardList = partyBoardSQLMapper.selectAllNoPage();
		
		for(PartyBoardVo partyBoardVo :  partyBoardList) {
			int member_no = partyBoardVo.getJet_member_no();
			MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
			
			//리플갯수 출력
			int attendCount = partyBoardAttendSQLMapper.attendCount(partyBoardVo.getJet_board_party_no());
			
			//썸네일 처리
			ArrayList<PartyBoardImageVo> thumbnail = partyBoardImageSQLMapper.thumbnail(partyBoardVo.getJet_board_party_no());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("memberVo", memberVo);
			map.put("partyBoardVo", partyBoardVo);
			map.put("thumbnail", thumbnail);
			map.put("attendCount", attendCount);
			
			resultList.add(map);
		}
		return resultList;
	}
	
	//글읽기
	public HashMap<String, Object> getPartyBoard(int contentNo){
		
		//partyBoardSQLMapper.increaseReadcount(contentNo);
		//조회수증가 완료 
		
		PartyBoardVo partyBoardVo = partyBoardSQLMapper.selectByNo(contentNo);

		//read 할때 엔터가 안되는거 고치기.
		String str = partyBoardVo.getJet_board_party_content();
		str = StringEscapeUtils.escapeHtml4(str);
		str = str.replaceAll("\n", "<br>");
		partyBoardVo.setJet_board_party_content(str);
		
		//글쓴사람의 Vo
		int member_no = partyBoardVo.getJet_member_no();
		MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
		
		//이미지 출력
		ArrayList<PartyBoardImageVo> imageVoList = partyBoardImageSQLMapper.selectByPartyNo(contentNo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("memberVo", memberVo);
		map.put("partyBoardVo", partyBoardVo);
		map.put("imageVoList", imageVoList);
		
		return map;
	}
	
	//글삭제 
	public void deletePartyBoard (int contentNo) {
		partyBoardSQLMapper.deleteByNo(contentNo);
	}
	
	//글수정
	public void updatePartyBoard(PartyBoardVo vo) {
		partyBoardSQLMapper.update(vo);
	}
	
	//------------------------------------------------
	//참여 (리플)쓰기
	public void writeAttendParty(PartyBoardAttendVo vo) {
		partyBoardAttendSQLMapper.insert(vo);
	}
	
	//참여 (리플) 출력
	public ArrayList<HashMap<String, Object>> getPartyBoardAttendList(int partyNo){
		
		ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<PartyBoardAttendVo> attendVoList = partyBoardAttendSQLMapper.selectByContentNo(partyNo);
		
		for(PartyBoardAttendVo partyBoardAttendVo : attendVoList) {
			
			//int categort_no =partyBoardAttendVo.getJet_party_attend_state_no();
			//카테고리 연동 매퍼 부터 해야함
			MemberVo memberVo = memberSQLMapper.selectByNo(partyBoardAttendVo.getJet_member_no());
			
			Object rating = partyBoardRatingSQLMapper.getMemberCredit(partyBoardAttendVo.getJet_member_no());
			//오별 0225
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("partyBoardAttendVo", partyBoardAttendVo);
			map.put("memberVo", memberVo);
			map.put("rating", rating);
			
			result.add(map);
		}
		return result;
	}

	//참여 갯수 출력
	public int getPartyAttendCount(int content_no) {
		return partyBoardAttendSQLMapper.attendCount(content_no);
	}
	
	//리플 삭제
	public void deleteAttend(int attendNo) {
		partyBoardAttendSQLMapper.deleteAttend(attendNo);
	}
	
	//리플삭제 참여인원 -1
	public void deleteAttendAndFixcount(int attendNo) {
		
		PartyBoardAttendVo partyBoardAttendVo = partyBoardAttendSQLMapper.selectByNo(attendNo);
		
		int party_no = partyBoardAttendVo.getJet_board_party_no();
		System.out.println("파티 서비스 티어 party_no 존재여부" + party_no);
		partyBoardSQLMapper.decreaseFixcount(party_no);
		//확정인원 먼저 감소시키공 
		
		
		partyBoardAttendSQLMapper.deleteAttend(attendNo);
		//댓글 삭제...? 이거 한줄만 밑으로 내리니까 됏다...얼탱이가 없네 진짜 ㅡㅡ 순서가 이리 중요한가 내가 2시간 동안 졸라 찾있는디 디지게 팰까 진짜 
	}
	
	//참가 신청 승인
	public void updateApprove(int attendNo) {
		partyBoardAttendSQLMapper.updateAttendStateApprove(attendNo);
		
		PartyBoardAttendVo partyBoardAttendVo =  partyBoardAttendSQLMapper.selectByNo(attendNo);
		//댓글Vo  에  댓글 no 넣었을떄 하나 출력
		int party_no = partyBoardAttendVo.getJet_board_party_no();
		//그 댓글 no의 댓글 vo 한줄에서 파티게시글 no출력 
		partyBoardSQLMapper.increaseFixcount(party_no);
		//승인시 자동fix카운트 증가 
	}
	
	//참가 신청 거절
	public void updateReject(int attendNo) {
		partyBoardAttendSQLMapper.updateAttendStateReject(attendNo);
		
	}	
	
	//승인 확정 된 사람들 리스트
	public ArrayList<HashMap<String, Object>> getApproveMember (int partyNo){
		
		ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<PartyBoardAttendVo> approveVoList = partyBoardAttendSQLMapper.selectApproveByCNo(partyNo);
		
		for(PartyBoardAttendVo partyBoardAttendVo : approveVoList) {
			
			MemberVo memberVo = memberSQLMapper.selectByNo(partyBoardAttendVo.getJet_member_no());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("partyBoardAttendVo", partyBoardAttendVo);
			map.put("memberVo", memberVo);
			
			result.add(map);
		}
		return result;
	}
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	//신고 인서트
	public void singoInsert(PartySingoVo vo) {
		partyBoardSQLMapper.insertSingo(vo);
	}
	
	//신고자 체크
	public PartySingoVo checksingo(int party_no,MemberVo singoMemberVo)  {
		
		PartySingoVo partySingoVo = partyBoardSQLMapper.selectSingoByNo(party_no,singoMemberVo.getJet_member_no());
		
		return partySingoVo;
	}
	
	//여행친구찾기게시판 글의 모든 신고 출력 [관리자 페이지에서]
	public ArrayList<HashMap<String, Object>> getPartySingoList() {
		
		ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<PartySingoVo> partySingoList = partyBoardSQLMapper.selectAllSingoNoPage();
		
		for(PartySingoVo partySingoVo : partySingoList) {
			int singoMember_no = partySingoVo.getJet_member_no();
			MemberVo singoMemberVo = memberSQLMapper.selectByNo(singoMember_no);
			
			int party_no = partySingoVo.getJet_board_party_no();
			PartyBoardVo partyBoardVo= partyBoardSQLMapper.selectByNo(party_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("partySingoVo", partySingoVo);
			map.put("singoMemberVo", singoMemberVo);
			map.put("partyBoardVo", partyBoardVo);
			
			
			result.add(map);
		}
		
		return result;
	}

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	//채팅 인서트
	public void writePartyChat(PartyChatVo vo) {
		partyBoardChatSQLMapper.insert(vo);
	}
	
	//채팅 출력
	public ArrayList<HashMap<String, Object>> getPartyChat(int partyNo){
		ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<PartyChatVo> chatVoList = partyBoardChatSQLMapper.selectAllChat(partyNo);
		
		for(PartyChatVo partyChatVo : chatVoList) {
			
			MemberVo chatMemberVo = memberSQLMapper.selectByNo(partyChatVo.getJet_member_no());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("partyChatVo", partyChatVo);
			map.put("chatMembernick", chatMemberVo.getJet_member_nick());
			
//			map.put("nick", chatMemberVo.getJet_member_nick());
//			map.put("chatContent", partyChatVo.getJet_party_chat_content());
//			map.put("writeDate", partyChatVo.getJet_party_chat_writedate());
			
			
			result.add(map);
		}
		return result;
	}
	
	//채팅 리스트 출력 내가 참여중인	 0225 오별 변경 
	public ArrayList<HashMap<String, Object>> getPartyChatList(int memberNo){
		ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<PartyBoardAttendVo> ApproveAttendList = partyBoardChatSQLMapper.selectChatList(memberNo);
		
		for(PartyBoardAttendVo partyBoardAttendVo : ApproveAttendList) {
			
			MemberVo chatMemberVo = memberSQLMapper.selectByNo(partyBoardAttendVo.getJet_member_no());
			//승인된 회원의 정보
			PartyBoardVo partyBoardVo = partyBoardSQLMapper.selectByNo(partyBoardAttendVo.getJet_board_party_no());
			//승인된 파티글 정보
			MemberVo writerMemberVo = memberSQLMapper.selectByNo(partyBoardVo.getJet_member_no());
			//글쓴이 닉네임
			ArrayList<PartyBoardImageVo> thumbnail = partyBoardImageSQLMapper.thumbnail(partyBoardAttendVo.getJet_board_party_no());
			//승인된 글의 썸네일
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("partyAttendVo", partyBoardAttendVo);
			map.put("chatMemberVo", chatMemberVo);
			map.put("partyBoardVo", partyBoardVo);
			
			map.put("thumbnail", thumbnail);
			map.put("writerMemberVo", writerMemberVo.getJet_member_nick());
			
			
			result.add(map);
		}
		return result;
	}

	//내가 개설한 채팅방...파티장일때	오별 0225
	public ArrayList<HashMap<String, Object>> getMyOpenedChatList(int jet_member_no){
		ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<PartyBoardVo> myOpenChatList = partyBoardChatSQLMapper.selectMyOpenedchatList(jet_member_no);
		
		for(PartyBoardVo partyBoardVo : myOpenChatList) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			MemberVo memberVo = memberSQLMapper.selectByNo(jet_member_no);
			//파티장 nick
			
			ArrayList<PartyBoardImageVo> thumbnail = partyBoardImageSQLMapper.thumbnail(partyBoardVo.getJet_board_party_no());
			//썸네일 처리
			
			map.put("thumbnail", thumbnail);
			map.put("partyBoardVo", partyBoardVo);
			map.put("memberVo", memberVo);
			result.add(map);
		}
		return result;
	}	

	
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    //조회수 증가 쿠가로 받아서 새로고침시 올라가지않게 오별 변경0225
    public void increaseReadCount(int jet_board_party_no, HttpServletRequest request, HttpServletResponse response) {
       
       Cookie [] cookies = request.getCookies();
       
       Cookie viewCookie = null;
       
         if (cookies != null && cookies.length > 0){
             for (int i = 0; i < cookies.length; i++){
                 // Cookie의 name이 cookie + reviewNo와 일치하는 쿠키를 viewCookie에 넣어줌 
                 if (cookies[i].getName().equals("cookie"+jet_board_party_no)){ 
                     System.out.println("처음 쿠키가 생성한 뒤 들어옴.");
                     viewCookie = cookies[i];
                 }
             }
         }
          // 만일 viewCookie가 null일 경우 쿠키를 생성해서 조회수 증가 로직을 처리함.
          if (viewCookie == null) {    
              System.out.println("cookie 없음");
              
              // 쿠키 생성(이름, 값)
              Cookie newCookie = new Cookie("cookie"+jet_board_party_no, "|" + jet_board_party_no + "|");
                              
              // 쿠키 추가
              response.addCookie(newCookie);

              // 쿠키를 추가 시키고 조회수 증가시킴
              partyBoardSQLMapper.increaseReadcount(jet_board_party_no);
          }
          // viewCookie가 null이 아닐경우 쿠키가 있으므로 조회수 증가 로직을 처리하지 않음.
          else {
              System.out.println("cookie 있음");
              // 쿠키 값 받아옴.
              String value = viewCookie.getValue();
              System.out.println("cookie 값 : " + value);
          }
      }
		
//--------------------------
	//친구 평가 점수 인서트	오별 0225
	public void insertRating(PartyRatingVo vo) {
		partyBoardRatingSQLMapper.insertRating(vo);
	}
	
	//친구 평가 Vo 평가 햇는지 안했는지 체크
	public PartyRatingVo CheckRatingVo(int jet_board_party_no,int jet_member_no) {
		
		PartyRatingVo partyRatingVo = partyBoardRatingSQLMapper.selectByNo(jet_board_party_no, jet_member_no);
		
		return partyRatingVo;
	}
		
	//친구 결과값...
/*	public void getFriendCredit(int jet_member_no) {
		int rating =partyBoardRatingSQLMapper.getMemberCredit(jet_member_no);
		
		MemberVo memberVo = memberSQLMapper.selectByNo(jet_member_no);
		memberVo.setJet_member_credit(rating);
		memberSQLMapper.updateCradit(memberVo);
		
		
	}
	*/
	
	public ArrayList<Object> newPartySingoList(){
		return partyBoardSQLMapper.selectSingoList();
	}
	
	
	
}
