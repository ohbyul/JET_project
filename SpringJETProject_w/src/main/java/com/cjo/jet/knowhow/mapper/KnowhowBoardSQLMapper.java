package com.cjo.jet.knowhow.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.cjo.jet.vo.KnowhowBoardLikeVo;
import com.cjo.jet.vo.KnowhowBoardVo;
import com.cjo.jet.vo.KnowhowSingoVo;

public interface KnowhowBoardSQLMapper {
	
		// 기본키 생성
		public int createKey();
		
		// 글 쓰기
		public void insert(KnowhowBoardVo vo);
		
		// 글 목록 보기
		public ArrayList<KnowhowBoardVo> selectAll(int page_num);
		
		// 글 읽기
		public KnowhowBoardVo selectByNo(int no);
		
		// 글 삭제
		public void deleteByNo(int no);
		
		// 글 수정
		public void update(KnowhowBoardVo vo);
		
		// 글 조회수 증가
		public void increaseReadCount(int no);
		
		// 글 제목 검색
		public ArrayList<KnowhowBoardVo> selectByTitle(String search_word);
		
		// 글 내용 검색
		public ArrayList<KnowhowBoardVo> selectByContent(String search_word);
		
		// 글 작성자 검색
		public ArrayList<KnowhowBoardVo> selectByWriter(String search_word);
		
		// 페이지 수
		public int countPage();
		
		
		
		//신고
		public void insertSingo(KnowhowSingoVo vo);
		
		// 게시글 당 신고 클릭 여부 확인
		public int isSingoByUser(KnowhowSingoVo vo);
		
		
		
		
		
		//신고는 한사람당 한명만 하게 체크 
		public KnowhowSingoVo selectSingoByNo(@Param("jet_board_knowhow_no") int jet_board_knowhow_no, @Param("jet_member_no") int jet_member_no);
		
		
		
		//노티스글에 모든 신고 출력 
		public ArrayList<KnowhowSingoVo> selectAllSingoNoPage();
		
}