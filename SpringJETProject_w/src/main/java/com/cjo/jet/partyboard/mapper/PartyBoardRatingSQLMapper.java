package com.cjo.jet.partyboard.mapper;

import org.apache.ibatis.annotations.Param;

import com.cjo.jet.vo.PartyRatingVo;

public interface PartyBoardRatingSQLMapper {
	
	//점수 인서트
	public void insertRating(PartyRatingVo vo);
	
	//평가 체크
	public PartyRatingVo selectByNo(@Param("jet_board_party_no") int jet_board_party_no,@Param("jet_member_no") int jet_member_no);

	//친구 평가 값
	public Object getMemberCredit(int jet_member_no);

}
