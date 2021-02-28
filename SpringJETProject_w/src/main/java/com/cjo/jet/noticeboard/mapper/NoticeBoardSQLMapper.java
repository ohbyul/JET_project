package com.cjo.jet.noticeboard.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.cjo.jet.vo.NoticeBoardVo;
import com.cjo.jet.vo.NoticeSingoVo;

public interface NoticeBoardSQLMapper {

	//프라이머리 키 생성
	public int creatKey();
	
	//글 쓰기
	public void insert(NoticeBoardVo vo);
	
	//공지사항 리스트 출력
	public ArrayList<NoticeBoardVo> selectAll(int page_num);
	
	//페이지  갯수
	public int getPageCount();
		
	//글 읽기
	public NoticeBoardVo selectByNo(int no);
		
	//글삭제
	public void deleteByNo(int no);

	//글수정
	public void update(NoticeBoardVo vo);

	//글 조회수 증가
	public void increaseReadcount(int no);
		
	//신고
	public void insertSingo(NoticeSingoVo vo);
	
	//신고는 한사람당 한명만 하게 체크 
	public NoticeSingoVo selectSingoByNo(@Param("jet_board_notice_no") int jet_board_notice_no,@Param("jet_member_no") int jet_member_no);
	
	//노티스글의 모든 신고 출력 
	public ArrayList<NoticeSingoVo> selectAllSingoNoPage();

}
