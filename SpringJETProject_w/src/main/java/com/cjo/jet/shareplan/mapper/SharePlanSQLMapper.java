package com.cjo.jet.shareplan.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.cjo.jet.vo.ClassboardVo;
import com.cjo.jet.vo.PartySingoVo;
import com.cjo.jet.vo.PickBoardVo;
import com.cjo.jet.vo.SharePlanBoardVo;
import com.cjo.jet.vo.SharePlanImageVo;
import com.cjo.jet.vo.SharePlanLikeVo;
import com.cjo.jet.vo.SharePlanReportVo;
import com.cjo.jet.vo.TravelPlanDetailVo;

public interface SharePlanSQLMapper {
	//pk
	public int sharePlanPK();
	//글쓰기
	public void insertSharePlan(SharePlanBoardVo vo);
	//게시글 출력
	public ArrayList<SharePlanBoardVo>selectAll();
	//게시글 확인
	public SharePlanBoardVo selectByNo(int no);
	//삭제
	public void deleteByNo(int no);
	//수정
	public void updateByNo(SharePlanBoardVo vo);
	//조회수
	public int increaseReadCount(int no);
	//페이징
	public int getPageCount();
	//트레블번호뽑기
	public SharePlanBoardVo getTravelNo(int no);


	//제목검색
	public ArrayList<SharePlanBoardVo> selectByTitle(String search_word);
	//내용검색
	public ArrayList<SharePlanBoardVo> selectByContent(String search_word);
	//작성자 검색
	public ArrayList<SharePlanBoardVo> selectByWriter(String search_word);
	//카테고리 찾자 
	public ArrayList<SharePlanBoardVo> selectCategory(int category_no);
	
	//썸네일
	public ArrayList<SharePlanImageVo> thumbnail(int jet_board_shareplan_no);
	//핫게뽑기
	public ArrayList<Object> hotBoard();
	
	//제트기 찜하기
	public void insertPick(PickBoardVo vo);
	//찜 취소
	public void deletePick(@Param("jet_board_shareplan_no") int jet_board_shareplan_no, @Param("jet_member_no") int jet_member_no);
	//찜 번호뽑기
	public PickBoardVo selectByPickNo(@Param("jet_board_shareplan_no") int jet_board_shareplan_no,@Param("jet_member_no") int jet_member_no);
	//찜목록 가져오기
	public ArrayList<PickBoardVo> selectPickBoard(int jet_member_no);
	
	//추천 원데이클래스
	public ArrayList<ClassboardVo> selectRecommendClass(int jet_board_travelplan_no);
	//추천 원데이 클래스 전부
	public ArrayList<ClassboardVo> selectRecommendClassAll(int jet_board_travelplan_no);
	
	//신고
	public void insertReport(SharePlanReportVo vo);
	
	//신고는 한사람당 한명만 하게 체크 
	public SharePlanReportVo selectReportByNo(@Param("jet_board_shareplan_no") int jet_board_shareplan_no,@Param("jet_member_no") int jet_member_no);
	
	//노티스글의 모든 신고 출력 
	public ArrayList<SharePlanReportVo> selectAllReportNoPage();
	
	public ArrayList<Object> selectReportList();
	
}
