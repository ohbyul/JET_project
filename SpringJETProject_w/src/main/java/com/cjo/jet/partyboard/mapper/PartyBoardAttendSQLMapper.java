package com.cjo.jet.partyboard.mapper;

import java.util.ArrayList;

import com.cjo.jet.vo.PartyBoardAttendVo;

public interface PartyBoardAttendSQLMapper {

	//참가신청 인서트
	public void insert(PartyBoardAttendVo vo);
	
	//참여 댓글 출력
	public ArrayList<PartyBoardAttendVo> selectByContentNo(int partyNo);
	
	//댓글 한개의 vo출력
	public PartyBoardAttendVo selectByNo(int attend_no);
	
	//삭제
	public void deleteAttend(int no);
	
	//참여 갯수 출력
	public int attendCount(int contentNo);
	
	//승인
	public void updateAttendStateApprove(int attendNo);
	
	//거절
	public void updateAttendStateReject(int attendNo);
	
	//승인된 사람들의 리스트 출력
	public ArrayList<PartyBoardAttendVo> selectApproveByCNo(int partyNo);
	
}
