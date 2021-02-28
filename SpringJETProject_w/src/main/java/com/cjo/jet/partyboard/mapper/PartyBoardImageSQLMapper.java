package com.cjo.jet.partyboard.mapper;

import java.util.ArrayList;

import com.cjo.jet.vo.PartyBoardImageVo;

public interface PartyBoardImageSQLMapper {

	//이미지 인서트
	public void insert(PartyBoardImageVo vo);
	
	//이미지 출력
	public ArrayList<PartyBoardImageVo> selectByPartyNo(int party_no);
	
	//썸네일
	public ArrayList<PartyBoardImageVo> thumbnail(int jet_board_party_no);
}
