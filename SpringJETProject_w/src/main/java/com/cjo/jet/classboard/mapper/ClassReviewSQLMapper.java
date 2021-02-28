package com.cjo.jet.classboard.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.cjo.jet.vo.ClassReviewVo;

public interface ClassReviewSQLMapper {
	
	// 별점 및 후기 작성하기
	public void insertReview(ClassReviewVo vo);
	
	// 특정 원데이클래스의 리뷰 리스트 뽑기
	public ArrayList<ClassReviewVo> selectReviewsByClassNo(int jet_class_no);
	
	// 특정 원데이클래스의 별점 평균 구하기
	public float selectStarRatingByClassNo(int jet_class_no);
	
	// 내가 작성한 원데이클래스 리뷰 보기
	//public ClassReviewVo selectReviewsByMemberNo(int jet_member_no);
	public ClassReviewVo selectReviewsByMemberNo(@Param("jet_member_no") int jet_member_no, @Param("jet_class_detail_no") int jet_class_detail_no);
	//public ClassReviewVo selectReviewsByMemberNo(int jet_member_no, @Param("jet_class_detail_no") int jet_class_detail_no);
	
	// 그냥 원데이클래스 리뷰 쫙 ..
	public ArrayList<ClassReviewVo> selectReviews(int jet_class_detail_no);
}