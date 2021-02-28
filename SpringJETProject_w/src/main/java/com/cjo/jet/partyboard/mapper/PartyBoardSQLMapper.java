package com.cjo.jet.partyboard.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.cjo.jet.vo.PartyBoardVo;
import com.cjo.jet.vo.PartySingoVo;

public interface PartyBoardSQLMapper {

	//프라이머리 키 생성
	public int creatKey();
	
	//글쓰기
	public void insert(PartyBoardVo vo);
	
	//게시판 출력 (페이지 처리 전)
	public ArrayList<PartyBoardVo> selectAllNoPage();
	
	//글 읽기
	public PartyBoardVo selectByNo(int no);
	
	//글삭제
	public void deleteByNo(int no);
	
	//글수정
	public void update(PartyBoardVo vo);
	
	//글조회수 증가
	public void increaseReadcount(int no);
	
	//승인시 확정 인원 증가
	public void increaseFixcount(int partyNo);

	//참여 탈퇴 시 확정 인원 감소 
	public void decreaseFixcount(int partyNo);
	
	//신고
	public void insertSingo(PartySingoVo vo);
	
	//신고는 한사람당 한명만 하게 체크 
	public PartySingoVo selectSingoByNo(@Param("jet_board_party_no") int jet_board_party_no,@Param("jet_member_no") int jet_member_no);
	
	//노티스글의 모든 신고 출력 
	public ArrayList<PartySingoVo> selectAllSingoNoPage();
	
	public ArrayList<Object> selectSingoList();
	
}
