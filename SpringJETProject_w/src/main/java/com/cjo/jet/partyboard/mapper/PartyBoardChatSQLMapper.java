package com.cjo.jet.partyboard.mapper;

import java.util.ArrayList;

import com.cjo.jet.vo.PartyBoardAttendVo;
import com.cjo.jet.vo.PartyBoardVo;
import com.cjo.jet.vo.PartyChatVo;

public interface PartyBoardChatSQLMapper {

	//채팅인서트
	public void insert(PartyChatVo vo);
	
	//전체 채팅 출력
	public ArrayList<PartyChatVo> selectAllChat (int partyNo);
	
	//채팅 리스트 출력 - 회원마다 승인된
	public ArrayList<PartyBoardAttendVo> selectChatList (int memberNo);
	
	//내가 개설한 글 목록 = 내가 개설한 채팅 방 픽스인원이 2명 이상일때만..
	public ArrayList<PartyBoardVo> selectMyOpenedchatList(int memberNo);
		
	
	
	
	
}
