package com.cjo.jet.classboard.mapper;

import java.util.ArrayList;

import com.cjo.jet.vo.ClassDetailVo;
import com.cjo.jet.vo.ClassReservationVo;
import com.cjo.jet.vo.ClassboardVo;
import com.cjo.jet.vo.MemberVo;

public interface ClassMySQLMapper {
	
	//마이클래스 페이지 가져오기
	public ArrayList<ClassboardVo> selectMyClass(int jet_member_no);
	
	//class_no로 detailVo 정보 가져오기.
	public ArrayList<ClassDetailVo> selectByNo(int jet_class_no);
	//detail_no로 detailVo 정보 가져오기.
	public ClassDetailVo selectByDNo(int jet_class_detail_no);
	//예약자들 MemberVo 가져오기
	public ArrayList<MemberVo> selectByMNo(int no);
	//예약 리스트 reserve_no로 뽑아오기
	public ArrayList<ClassReservationVo> selectRByNo(int jet_class_detail_no);
	
}
