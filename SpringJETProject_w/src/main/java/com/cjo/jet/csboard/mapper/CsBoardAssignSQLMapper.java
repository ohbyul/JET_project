package com.cjo.jet.csboard.mapper;

import java.util.ArrayList;

import com.cjo.jet.vo.AdminAssignVo;

public interface CsBoardAssignSQLMapper {
	
	public void insertAssign(AdminAssignVo vo);
	//관리자 배정 테이블에 인서트...
	
	public int selectByAssignAdminNo();
	//관리자 배정 번호....
	
	public ArrayList<AdminAssignVo> selectByAdminNo(int admin_no);
	//배정된 리스트 출력...
	
	
	
	
}
