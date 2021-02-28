package com.cjo.jet.knowhow.mapper;

import java.util.ArrayList;

import com.cjo.jet.vo.KnowhowBoardImageVo;

public interface KnowhowBoardImageSQLMapper {
	
	// 이미지 삽입
	public void insert(KnowhowBoardImageVo vo);
	
	// 이미지 보기
	public ArrayList<KnowhowBoardImageVo> selectByContentNo(int knowhowBoard_no);    // 외래키로 셀렉트할 것
}