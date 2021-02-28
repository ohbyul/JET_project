package com.cjo.jet.classboard.mapper;


import com.cjo.jet.vo.ClassImageVo;
import com.cjo.jet.vo.ClassboardVo;

public interface ClassboardSQLMapper {
	
	// 기본키 생성
	public int createKey();
	
	// 원데이클래스 개설
	public void insertClass(ClassboardVo vo);
	
	// 글 읽기. 원데이클래스 상세 페이지 보기
	public ClassboardVo selectClassJoinDetail(int jet_class_no);
	
	//detail_no로 classVo가져오기
	public ClassboardVo selectByNo(int class_no);
	
	
	// 원데이클래스 삭제
	public void deleteClass(ClassboardVo vo);
	
	// 원데이클래스 수정
	public void updateClass(ClassboardVo vo);
		
}