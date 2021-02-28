package com.cjo.jet.knowhow.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.cjo.jet.vo.KnowhowBoardCategoryVo;
import com.cjo.jet.vo.KnowhowBoardVo;

public interface KnowhowBoardCategorySQLMapper {
	
	// 글 카테고리 보기
	public KnowhowBoardCategoryVo selectByNo(int jet_board_knowhow_category_no);
	
	// 글 카테고리 수정
	public void update(KnowhowBoardVo vo);
	
	// 카테고리로 글 검색
	public ArrayList<KnowhowBoardVo> selectByCategory(int jet_board_knowhow_category_no);
	
	// 카테고리 + 제목 검색
	public ArrayList<KnowhowBoardVo> selectByCategoryTitle(@Param("jet_board_knowhow_category_no") int jet_board_knowhow_category_no, @Param("search_word") String search_word);
	
	// 카테고리 + 내용 검색
	public ArrayList<KnowhowBoardVo> selectByCategoryContent(@Param("jet_board_knowhow_category_no") int jet_board_knowhow_category_no, @Param("search_word") String search_word);
	
	// 카테고리 + 작성자 검색
	public ArrayList<KnowhowBoardVo> selectByCategoryWriter(@Param("jet_board_knowhow_category_no") int jet_board_knowhow_category_no, @Param("search_word") String search_word);
}