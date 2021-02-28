package com.cjo.jet.boardReview.mapper;

import java.util.ArrayList;


import com.cjo.jet.vo.ReviewRepleVo;

public interface ReviewRepleSQLMapper {
	
	//댓글입력
	public void insert(ReviewRepleVo vo);
	//등록순
	public ArrayList<ReviewRepleVo> selectByReViewNo(int review_no);
	//최신순
	public ArrayList<ReviewRepleVo> selectByReViewNoDESC(int review_no);
	
	//댓글 수
	public int repleCount(int review_no);
	//댓글 삭제
	public void deleteReple(int no);
	//댓글 번호 추출
	public ReviewRepleVo selectByNo(int no);
}
