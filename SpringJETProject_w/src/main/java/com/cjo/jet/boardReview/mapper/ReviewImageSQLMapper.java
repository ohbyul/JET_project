package com.cjo.jet.boardReview.mapper;

import java.util.ArrayList;

import com.cjo.jet.vo.ReviewImageVo;

public interface ReviewImageSQLMapper {
	
	//이미지
	public void insert(ReviewImageVo vo);
	
	public ArrayList<ReviewImageVo> selectByReviewNo(int jet_board_review_no);
}
