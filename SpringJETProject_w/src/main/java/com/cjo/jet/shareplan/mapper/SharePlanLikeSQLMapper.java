package com.cjo.jet.shareplan.mapper;

import org.apache.ibatis.annotations.Param;

import com.cjo.jet.vo.SharePlanLikeVo;



public interface SharePlanLikeSQLMapper {
	//추천
	public void insertLike(SharePlanLikeVo vo);
	
	//추천수
	public int likeCount(int shareplan_no);
	
	//추천 취소
	public void deleteLike(@Param("jet_board_shareplan_no") int jet_board_shareplan_no, @Param("jet_member_no") int jet_member_no);

	
	public SharePlanLikeVo selectByno(@Param("jet_board_shareplan_no") int jet_board_shareplan_no,@Param("jet_member_no") int jet_member_no);
}
