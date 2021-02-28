package com.cjo.jet.classboard.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.cjo.jet.vo.ClassReservationVo;

public interface ClassReserveSQLMapper {
	
	// 예약 여부 확인
	public ClassReservationVo checkReservation(@Param("jet_class_detail_no")int jet_class_detail_no, @Param("jet_member_no") int jet_member_no);
	public int isReservedByUser(ClassReservationVo vo);
	
	// 예약 (예약 삽입)
	public void insertReserve(ClassReservationVo vo);
	
	// 예약 취소 (예약 삭제)
	public void deleteReserve(ClassReservationVo vo);
	
	// 클래스 당 예약 개수
	public int countReserve(int classDetailNo);
	
	// 나의 예약 리스트 보기
	public ArrayList<ClassReservationVo> selectMyReservations(int jet_member_no);
}