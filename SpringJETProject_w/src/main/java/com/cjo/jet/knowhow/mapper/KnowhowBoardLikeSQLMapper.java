package com.cjo.jet.knowhow.mapper;

import com.cjo.jet.vo.KnowhowBoardLikeVo;

public interface KnowhowBoardLikeSQLMapper {
	
	// 좋아요 클릭 여부 확인
	public int isLikedByUser(KnowhowBoardLikeVo vo);
	
	// 좋아요 삽입
	public void insertLike(KnowhowBoardLikeVo vo);
	
	// 좋아요 삭제
	public void deleteLike(KnowhowBoardLikeVo vo);
	
	// 게시글 당 좋아요 개수
	public int countLike(int no);
}