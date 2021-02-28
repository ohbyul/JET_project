package com.cjo.jet.boardReview.mapper;

import java.util.ArrayList;

import com.cjo.jet.vo.BoardReviewVo;
import com.cjo.jet.vo.ReviewCategoryVo;

public interface BoardReviewSQLMapper {
	//프라이머리키
	public int createKey();
	//게시글 작성
	public void insertBoardReview(BoardReviewVo vo);
	//게시글 출력
	public ArrayList<BoardReviewVo>selectAll(int page_num);
	//게시글 확인
	public BoardReviewVo selectByNo(int no);
	//삭제
	public void deleteByNo(int no);
	//수정
	public int updateByNo(BoardReviewVo vo);
	//조회수
	public int increaseReadCount(int no);
	//페이징
	public int getPageCount();
	//리뷰 소분류 웨한걸까?!
	public ReviewCategoryVo selectCategoryNo(int no);
	
	
	//제목검색
	public ArrayList<BoardReviewVo> selectByTitle(String search_word);
	//내용검색
	public ArrayList<BoardReviewVo> selectByContent(String search_word);
	//작성자 검색
	public ArrayList<BoardReviewVo> selectByWriter(String search_word);
	//카테고리 찾자 
	public ArrayList<BoardReviewVo> selectCategory(int category_no);
	
}
