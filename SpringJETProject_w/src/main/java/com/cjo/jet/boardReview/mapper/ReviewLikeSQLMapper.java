package com.cjo.jet.boardReview.mapper;

import org.apache.ibatis.annotations.Param;

import com.cjo.jet.vo.ReviewLikeVo;

public interface ReviewLikeSQLMapper {
	//추천
	public void insertLike(ReviewLikeVo vo);
	
	//추천수
	public int likeCount(int review_no);
	
	//추천 취소
	public void deleteLike(@Param("jet_board_review_no") int jet_board_review_no, @Param("jet_member_no") int jet_member_no);
	//ㅅㅂ
	//public ArrayList<ReviewLikeVo> selectByMemberNo(int review_no);
	
	public ReviewLikeVo selectByno(@Param("jet_board_review_no") int jet_board_review_no,@Param("jet_member_no") int jet_member_no);
}
