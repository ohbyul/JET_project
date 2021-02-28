package com.cjo.jet.csboard.mapper;

import java.util.ArrayList;

import com.cjo.jet.vo.CsBoardCategoryVo;
import com.cjo.jet.vo.CsBoardVo;


public interface CsBoardSQLMapper {
	//프라이머리 키 생성
	public int creatKey();
	
	//글 쓰기
	public void insert(CsBoardVo vo);
	
	//게시판 리스트 출력
	public ArrayList<CsBoardVo> selectAll(int page_num);

	//no페이지 처리 게시판 리스트 출력 (관리자 페이지에서 필요 )
	public ArrayList<CsBoardVo> selectAllNoPage();
	
	//제목 검색
	public ArrayList<CsBoardVo> selectByTitle(String search_word);
	
	//내용검색
	public ArrayList<CsBoardVo> selectByContent(String search_word);
	 
	//작성자 검색
	public ArrayList<CsBoardVo> selectByWriter(String search_word);
	
	//글 읽기
	public CsBoardVo selectByNo(int no);
	
	//글삭제
	public void deleteByNo(int no);

	//글수정
	public void update(CsBoardVo vo);

	//글 조회수 증가
	public void increaseReadcount(int no);
		
	//페이지  갯수
	public int getPageCount();
	

}
