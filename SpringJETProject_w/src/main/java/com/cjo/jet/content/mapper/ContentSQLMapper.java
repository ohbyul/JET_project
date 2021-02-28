package com.cjo.jet.content.mapper;

import java.util.ArrayList;

public interface ContentSQLMapper {
	
	//최신 글 3개 공유게시판
	public ArrayList<Object> newSharePlanBoard();
	
	//메인 출력 최신글 3개 파티 찾기 게시판
	public ArrayList<Object> newPartyBoard();
	//메인 최신 공지 4개
	public ArrayList<Object> newNoticeBoard();
	
	//메인 출력 원데이클래스 3개
	public ArrayList<Object> recommendClassBoard();
	
}
