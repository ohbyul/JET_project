package com.cjo.jet.ratio.mapper;

import java.util.ArrayList;
import java.util.HashMap;

public interface RatioSQLMapper {
	//남녀 성비
	public HashMap<String, Object> selectAllUserRatio();
	//여성 성비
	public HashMap<String, Object> selectFeMaleUserRatio();
	//남성 성비
	public HashMap<String, Object> selectMaleUserRatio();
	//일별 가입자 수
	public ArrayList<HashMap<String, Object>> selectNewMemberCountByDate();
	//게시판 별 게시물 수
	public HashMap<String, Object> selectShareplanCount();
	public HashMap<String, Object> selectBoardPartyCount();
	public HashMap<String, Object> selectBoardKnowhowCount();
	public HashMap<String, Object> selectBoardReviewCount();
	public HashMap<String, Object> selectBoardFreeCount();
	
	//문의 수, 답변 수
	public HashMap<String, Object> selectMCsCount();
	public HashMap<String, Object> selectACsCount();
	
	//게시판별 성비
	public HashMap<String, Object> selectReviewGenderRatio();
	public HashMap<String, Object> selectPartyGenderRatio();
	public HashMap<String, Object> selectKnowhowGenderRatio();
	public HashMap<String, Object> selectFreeBoardGenderRatio();
	public HashMap<String, Object> selectShareplanGenderRatio();
	
}
