package com.cjo.jet.classboard.mapper;

import java.util.ArrayList;

import com.cjo.jet.vo.ClassImageVo;

public interface ClassImageSQLMapper {
	
	// 이미지 삽입
	public void insertImage(ClassImageVo vo);
	
	// 이미지 보기
	public ArrayList<ClassImageVo> selectByNo(int classNo);

}