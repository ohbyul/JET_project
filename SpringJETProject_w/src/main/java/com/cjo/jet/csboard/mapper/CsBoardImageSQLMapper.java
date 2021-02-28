package com.cjo.jet.csboard.mapper;

import java.util.ArrayList;

import com.cjo.jet.vo.CsBoardImageVo;

public interface CsBoardImageSQLMapper {

	public void insert(CsBoardImageVo vo);
	
	public ArrayList<CsBoardImageVo> selectByContentNo(int csBoard_no);
	
}
