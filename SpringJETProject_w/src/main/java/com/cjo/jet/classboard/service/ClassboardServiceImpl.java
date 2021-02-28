package com.cjo.jet.classboard.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjo.jet.classboard.mapper.ClassCategorySQLMapper;
import com.cjo.jet.classboard.mapper.ClassDetailSQLMapper;
import com.cjo.jet.classboard.mapper.ClassImageSQLMapper;
import com.cjo.jet.classboard.mapper.ClassMySQLMapper;
import com.cjo.jet.classboard.mapper.ClassReserveSQLMapper;
import com.cjo.jet.classboard.mapper.ClassReviewSQLMapper;
import com.cjo.jet.classboard.mapper.ClassboardSQLMapper;
import com.cjo.jet.member.mapper.MemberSQLMapper;
import com.cjo.jet.vo.*;

@Service
public class ClassboardServiceImpl {

	@Autowired
	private ClassboardSQLMapper classboardSQLMapper;

	@Autowired
	private ClassImageSQLMapper classimageSQLMapper;

	@Autowired
	private ClassDetailSQLMapper classDetailSQLMapper;

	@Autowired
	private MemberSQLMapper memberSQLMapper;

	@Autowired
	private ClassCategorySQLMapper classCategorySQLMapper;

	@Autowired
	private ClassReserveSQLMapper classReserveSQLMapper;

	@Autowired
	private ClassMySQLMapper classMySQLMapper;

	@Autowired
	private ClassReviewSQLMapper classReviewSQLMapper;

	// 원데이클래스 개설
	public void openClass(ClassboardVo vo, ArrayList<ClassImageVo> classImageVo) {

		int classPK = classboardSQLMapper.createKey();
		vo.setJet_class_no(classPK);
		classboardSQLMapper.insertClass(vo);

		// 이미지 업로드
		for (ClassImageVo imageVo : classImageVo) {
			imageVo.setJet_class_no(classPK);
			classimageSQLMapper.insertImage(imageVo);
		}
	}

	// 원데이클래스 세부정보
	public void detailClass(ClassDetailVo detail) {

		int detailPK = classDetailSQLMapper.createKey();
		detail.setJet_class_detail_no(detailPK);
		classDetailSQLMapper.insertDetail(detail);

	}

	// 글 목록 보기. 원데이클래스 목록 보기
	public ArrayList<HashMap<String, Object>> getClassList(int page_num) {
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();

		ArrayList<ClassDetailVo> detailList = classDetailSQLMapper.selectAll(page_num);

		for (ClassDetailVo classDetailVo : detailList) {
			int class_no = classDetailVo.getJet_class_no();
			
			ClassboardVo classboardVo = classboardSQLMapper.selectByNo(class_no); // ClassVo에 detailVo에 있는 class_no 세팅

			int jet_member_no = classboardVo.getJet_member_no();
			MemberVo memberVo = memberSQLMapper.selectByNo(jet_member_no); // 멤버 넘버 추출.
			
			ArrayList<ClassImageVo> classImageVo = classimageSQLMapper.selectByNo(classboardVo.getJet_class_no());

			int jet_class_category_no = classboardVo.getJet_class_category_no();
			ClassCategoryVo classCategoryVo = classCategorySQLMapper.selectByNo(jet_class_category_no);
			
			//별점
			float starRating = classReviewSQLMapper.selectStarRatingByClassNo(class_no);

			// 예약 현황
			int countReserve = classReserveSQLMapper.countReserve(classDetailVo.getJet_class_detail_no());

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("classboardVo", classboardVo);
			map.put("classDetailVo", classDetailVo);
			map.put("classCategoryVo", classCategoryVo);
			map.put("imageVoList", classImageVo);
			map.put("memberVo", memberVo);
			map.put("starRating", starRating);
			map.put("countReserve", countReserve);

			resultList.add(map);
			
		}
		
		return resultList;
	}
	
	//페이징
	public int getPageCount() {
		return classDetailSQLMapper.getPageCount();
	}

	// 글 읽기. 클래스 상세 페이지 보기
	public HashMap<String, Object> getClassDetail(int jet_class_detail_no) {
		
		ClassboardVo classboardVo = classboardSQLMapper.selectClassJoinDetail(jet_class_detail_no);
		
		int jet_member_no = classboardVo.getJet_member_no();
		MemberVo memberVo = memberSQLMapper.selectByNo(jet_member_no);
		
		String str = classboardVo.getJet_class_content();
		str = StringEscapeUtils.escapeHtml4(str);
		str = str.replaceAll("\n", "<br>");		//Enter를 br로 바꾸기.
		classboardVo.setJet_class_content(str);

		ArrayList<ClassImageVo> imageVoList = classimageSQLMapper.selectByNo(classboardVo.getJet_class_no());
		// 카테고리 
		ClassCategoryVo categoryVo = classCategorySQLMapper.selectByNo(classboardVo.getJet_class_category_no());
		ClassDetailVo detailVo = classDetailSQLMapper.selectByNo(jet_class_detail_no);
		
		float starRating = classReviewSQLMapper.selectStarRatingByClassNo(classboardVo.getJet_class_no());

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("classboardVo", classboardVo);
		map.put("memberVo", memberVo);
		map.put("imageVoList", imageVoList);
		map.put("categoryVo", categoryVo);
		map.put("starRating", starRating);

		map.put("detailVo", detailVo);

		return map;
	}
	
	public ArrayList<HashMap<String, Object>> getReviewDetail(int jet_class_detail_no){
		
		ArrayList<HashMap<String, Object>> map2 = new ArrayList<HashMap<String,Object>>();
		//클래스 리뷰
		ArrayList<ClassReviewVo> classReviewVo = classReviewSQLMapper.selectReviews(jet_class_detail_no);
		
		for(ClassReviewVo reviewVo : classReviewVo) {
			
			int member_no = reviewVo.getJet_member_no();
			MemberVo memberVo = memberSQLMapper.selectByNo(member_no);

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("reviewVo", reviewVo);

			map2.add(map);
		}
		
		return map2;
		
	}

	// 예약
	public void insertReserve(ClassReservationVo vo) {
		classReserveSQLMapper.insertReserve(vo);
	}

	// 예약 취소
	public void deleteReserve(ClassReservationVo vo) {
		classReserveSQLMapper.deleteReserve(vo);
	}

	// 클래스 당 예약 개수
	public int countReserve(int classDetailNo) {
		return classReserveSQLMapper.countReserve(classDetailNo);
	}

	// 예약 여부 확인
	public ClassReservationVo checkReservation(MemberVo session, int jet_class_detail_no) {
		 ClassReservationVo classReservationVo = classReserveSQLMapper.checkReservation(jet_class_detail_no, session.getJet_member_no());
		 return classReservationVo;
	}
	
	//찜기능
	public void insertPick(ClassPickVo vo) {
		classDetailSQLMapper.insertPick(vo);
	}
	
	public void deletePick(int jet_class_detail_no, int jet_member_no) {
		classDetailSQLMapper.deletePick(jet_class_detail_no, jet_member_no);
	}
	

	public ClassPickVo checkPick(int jet_class_detail_no, MemberVo session) {
		ClassPickVo classPickVo = classDetailSQLMapper.checkPick(jet_class_detail_no, session.getJet_member_no());
		return classPickVo;
	}


	// 나의 예약 리스트
	public ArrayList<HashMap<String, Object>> getMyReservation(int jet_member_no) {

		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();

		ArrayList<ClassReservationVo> reserveVoList = classReserveSQLMapper.selectMyReservations(jet_member_no);

		System.out.println("* 서비스 * reserveVoList" + reserveVoList);
		for (ClassReservationVo reserveVo : reserveVoList) {

			// reserveVo 에서 class_detail_no 가져오기
			int jet_class_detail_no = reserveVo.getJet_class_detail_no();
			
			// class_detail_no -> detailVo 에 넣고 jet_class_no 가져오기 
			ClassDetailVo detailVo = classDetailSQLMapper.selectByNo(jet_class_detail_no);

			int jet_class_no = detailVo.getJet_class_no();

			// jet_class_no -> classVo 에 넣고 category_no 가져오기
			ClassboardVo classVo = classboardSQLMapper.selectByNo(jet_class_no);
			int category_no = classVo.getJet_class_category_no();
			
			// category_no -> categoryVo 에 넣고 cagory_name 가져오기
			ClassCategoryVo categoryVo = classCategorySQLMapper.selectByNo(category_no);
			String category_name = categoryVo.getJet_class_category_name();
			
			// 이미지
			ArrayList<ClassImageVo> imageVo = classimageSQLMapper.selectByNo(jet_class_no);
			
			
			
			
			// 리뷰 전체 리스트 아예 땋 나오게 
			// ????class_detail_no -> reviewVo 에 넣기 ??
			// ArrayList<ClassReviewVo> reviewVo = classReviewSQLMapper.selectReviews(jet_member_no);
			//ClassReviewVo reviewVo = reviewVo.getJet_class_detail_no(jet_class_detail_no);
			
			ClassReviewVo reviewVo = classReviewSQLMapper.selectReviewsByMemberNo(jet_member_no, jet_class_detail_no);
			
			// 내가 작성한 예약....
			//ClassReviewVo reviewVo = classReviewSQLMapper.selectReviewsByMemberNo(jet_member_no, jet_class_detail_no);
			

			HashMap<String, Object> map = new HashMap<String, Object>();

			map.put("reserveVo", reserveVo);
			map.put("detailVo", detailVo);
			map.put("classVo", classVo);
			map.put("categoryVo", categoryVo);
			map.put("imageVo", imageVo);
			
			
			map.put("reviewVo", reviewVo);
			
			/*
			// 리뷰 셀렉트 후... 맵에 풋....
			ClassReviewVo reviewVo = classReviewSQLMapper.selectReviewsByMemberNo(jet_member_no);
			map.put("reviewVo", reviewVo);
			System.out.println("**###%%***^^^ test test reviewVo " + reviewVo);
			 */

			System.out.println("* 서비스 * 나의 예약. 5");
			resultList.add(map);
			
		}
		return resultList;
	}
	// MyClassPage 리스트
	public ArrayList<HashMap<String, Object>> getMyClassList(int jet_member_no) {

		ArrayList<HashMap<String, Object>> myresultList = new ArrayList<HashMap<String, Object>>();

		ArrayList<ClassboardVo> classboardList = classMySQLMapper.selectMyClass(jet_member_no);

		for (ClassboardVo classboardVo : classboardList) {

			MemberVo memberVo = memberSQLMapper.selectByNo(jet_member_no);

			int category_no = classboardVo.getJet_class_category_no();
			ClassCategoryVo classCategoryVo = classCategorySQLMapper.selectByNo(category_no);

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("classCategoryVo", classCategoryVo);
			map.put("classboardVo", classboardVo);

			myresultList.add(map);
		}

		return myresultList;
	}

	// 마이 클래스 날짜별 리스트
	public ArrayList<HashMap<String, Object>> getMyClassDatesList(int jet_class_no) {

		ArrayList<HashMap<String, Object>> myresultDates = new ArrayList<HashMap<String, Object>>();
		ArrayList<ClassDetailVo> detailList = classMySQLMapper.selectByNo(jet_class_no);

		for (ClassDetailVo classDetailVo : detailList) {
			ClassboardVo classboardVo = classboardSQLMapper.selectByNo(jet_class_no);

			int category_no = classboardVo.getJet_class_category_no();
			ClassCategoryVo classCategoryVo = classCategorySQLMapper.selectByNo(category_no);

			int detail_no = classDetailVo.getJet_class_detail_no();
			int reserveCount = classReserveSQLMapper.countReserve(detail_no);

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("classDetailVo", classDetailVo);
			map.put("classboardVo", classboardVo);
			map.put("classCategoryVo", classCategoryVo);
			map.put("reserveCount", reserveCount);

			myresultDates.add(map);
		}

		return myresultDates;
	}

	public HashMap<String, Object> getMyClassDetailPage(int jet_class_detail_no) {
		HashMap<String, Object> result = new HashMap<String, Object>();

		ClassDetailVo classDetailVo = classMySQLMapper.selectByDNo(jet_class_detail_no);

		int class_no = classDetailVo.getJet_class_no();
		ClassboardVo classboardVo = classboardSQLMapper.selectByNo(class_no);

		int category_no = classboardVo.getJet_class_category_no();
		ClassCategoryVo classCategoryVo = classCategorySQLMapper.selectByNo(category_no);
		
		String str = classboardVo.getJet_class_content();
		str = StringEscapeUtils.escapeHtml4(str);
		str = str.replaceAll("\n", "<br>");   
		classboardVo.setJet_class_content(str);

		ArrayList<ClassImageVo> imageVo = classimageSQLMapper.selectByNo(class_no);
		int reserveCount = classReserveSQLMapper.countReserve(jet_class_detail_no);

		result.put("classDetailVo", classDetailVo);
		result.put("classboardVo", classboardVo);
		result.put("reserveCount", reserveCount);
		result.put("classCategoryVo", classCategoryVo);
		result.put("imageVo", imageVo);

		return result;
	}

	public ArrayList<HashMap<String, Object>> getReserveList(int jet_class_detail_no) {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		ArrayList<ClassReservationVo> reservationVo = classMySQLMapper.selectRByNo(jet_class_detail_no);

		for (ClassReservationVo vo : reservationVo) {

			int member_no = vo.getJet_member_no();
			MemberVo memberVo = memberSQLMapper.selectByNo(member_no);

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("reservationVo", vo);

			list.add(map);
		}

		return list;

	}

	// 별점 및 후기 작성
	public void writeClassReview(ClassReviewVo vo) {
		classReviewSQLMapper.insertReview(vo);
	}
	
	
	//내가 작성한 특정 원데이클래스 리뷰 보기ddd
	public ClassReviewVo getReview(int jet_member_no, int jet_class_detail_no) {
		//System.out.println("%서비스 getReview  jet_member_no =" + jet_member_no);
		
		ClassReviewVo reviewVo = classReviewSQLMapper.selectReviewsByMemberNo(jet_member_no, jet_class_detail_no);

		return reviewVo;
	}

	//신고 인서트
	public void singoInsert(ClassSingoVo vo) {
		classDetailSQLMapper.insertSingo(vo);
	}
		
	// 신고자 체크
	public int isSingoClassBoard(ClassSingoVo vo) {
		
		return classDetailSQLMapper.isSingoByUser(vo);
	}


	// 원데이클래스 게시판 글의 모든 신고 출력 [관리자 페이지에서]
	public ArrayList<HashMap<String, Object>> getClassSingoList() {
		
		ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<ClassSingoVo> classSingoList = classDetailSQLMapper.selectAllSingoNoPage();
		
		for(ClassSingoVo classSingoVo : classSingoList) {
			int singoMember_no = classSingoVo.getJet_member_no();
			MemberVo singoMemberVo = memberSQLMapper.selectByNo(singoMember_no);
			
			int class_detail_no = classSingoVo.getJet_board_class_detail_no();
			ClassDetailVo classDetailVo = classDetailSQLMapper.selectByNo(class_detail_no);
			
			
			// 원데이 클래스 제목 구하기: class_no -> classVo 에 넣기
			int class_no = classDetailVo.getJet_class_no();
			ClassboardVo classVo = classboardSQLMapper.selectByNo(class_no);
			
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("classSingoVo", classSingoVo);
			map.put("singoMemberVo", singoMemberVo);
			map.put("classDetailVo", classDetailVo);
			map.put("classVo", classVo);
			System.out.println("classDetailVo + " + classDetailVo);
			System.out.println("classVo + " + classVo);
			
			result.add(map);
			
		}
		
		return result;
	}
}