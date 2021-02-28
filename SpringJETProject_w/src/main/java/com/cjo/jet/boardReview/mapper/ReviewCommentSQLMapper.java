package com.cjo.jet.boardReview.mapper;

import java.util.ArrayList;

import com.cjo.jet.vo.ReviewCommentVo;

public interface ReviewCommentSQLMapper {
	
	public void insertComment(ReviewCommentVo vo);
	
	public ArrayList<ReviewCommentVo> selectByRepleNo(int reple_no);
}
