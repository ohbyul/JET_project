package com.cjo.jet.csboard.mapper;

import java.util.ArrayList;

import com.cjo.jet.vo.CsBoardAnswerVo;

public interface CsBoardAnswerSQLMapper {

	//답변글쓰기
	public void insert(CsBoardAnswerVo vo);
	
	//답변 글 보기
	public CsBoardAnswerVo selectByNo(int no);
	
	//답변리스트 출력??이거 맵퍼에 없는디?..
	public ArrayList<CsBoardAnswerVo> selectAll();
	
	//포린
	public CsBoardAnswerVo foreignKey(int no);
	
	//조회수
	public void increaseReadcount(int no);
	
	//글삭제
	public void deleteByNo(int no);
}
