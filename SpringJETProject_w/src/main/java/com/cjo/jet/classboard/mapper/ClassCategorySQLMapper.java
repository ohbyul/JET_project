package com.cjo.jet.classboard.mapper;

import java.util.ArrayList;

import com.cjo.jet.vo.ClassCategoryVo;
import com.cjo.jet.vo.ClassDetailVo;

public interface ClassCategorySQLMapper {
	
	public int createKey();
	
	// 원데이클래스의 카테고리 보기
	public ClassCategoryVo selectByNo(int category_no);
	
	public ArrayList<ClassDetailVo> selectAll();

}