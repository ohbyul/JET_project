package com.cjo.jet.freeboard.mapper;

import java.util.*;

import com.cjo.jet.vo.FreeboardImageVo;
import com.cjo.jet.vo.FreeboardReportVo;

public interface FreeboardImageSQLMapper {
	
	public void insertImage(FreeboardImageVo vo);
	
	public ArrayList<FreeboardImageVo> selectByFreeboardNo(int jet_board_free_no);

	
	

}
