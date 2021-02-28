package com.cjo.jet.freeboard.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.cjo.jet.vo.FreeboardCategoryVo;
import com.cjo.jet.vo.FreeboardLikeVo;
import com.cjo.jet.vo.FreeboardRepleVo;
import com.cjo.jet.vo.FreeboardReportVo;
import com.cjo.jet.vo.FreeboardVo;

public interface FreeboardSQLMapper {
	
	public int createKey();
	
	public void insert(FreeboardVo vo);
	
	//전체 출력..
	public ArrayList<FreeboardVo> selectAll(int page_num);
	//검색 기능들.... 제목,내용,작성자 검색
	public ArrayList<FreeboardVo> selectByTitle(String search_word);
	public ArrayList<FreeboardVo> selectByContent(String search_word);
	public ArrayList<FreeboardVo> selectByWriter(String search_word);
	//글보기...
	public FreeboardVo selectByNo(int no);
	//카테고리 넘버로 글뽑기
	public ArrayList<FreeboardVo> selectByCategoryNo(int jet_board_free_category_no);
	//카테고리 넘버
	public FreeboardCategoryVo selectByCNo(int jet_board_free_category_no);
	//글 삭제
	public void deleteByNo(int no);	
	//글 수정
	public void update(FreeboardVo vo);
	//조회수 증가
	public void increaseReadCount(int no);	
	//댓글 쓰기..
	public void insertReple(FreeboardRepleVo vo);
	//댓글 보기.. (글 번호 뽑아와야함)
	public ArrayList<FreeboardRepleVo> selectReple(int jet_board_free_no);	
	//댓글 삭제
	public void deleteReple(int jet_board_free_reple_no);
	//댓글 수정
	public void updateReple(FreeboardRepleVo vo);
	//페이지 세기
	public int getPageCount();
	//댓글 갯수 세기
	public int getRepleCount(int jet_board_free_no);
	//좋아요 확인
	public FreeboardLikeVo checkLike(@Param("jet_board_free_no")int jet_board_free_no, @Param("jet_member_no")int jet_member_no);
	//좋아요 개수 표시
	public void insertLike(FreeboardLikeVo vo);
	//좋아요 취소
	public void deleteLike(FreeboardLikeVo vo);
	//좋아요 갯수
	public int getLikeCount(int jet_board_free_no);
	//신고 기능
	public void insertReport(FreeboardReportVo vo);
	//신고 중복 불가하게
	public FreeboardReportVo selectReportByNo(@Param("jet_board_free_no") int jet_board_free_no, @Param("jet_member_no") int jet_member_no);
	
	
	
	
}
