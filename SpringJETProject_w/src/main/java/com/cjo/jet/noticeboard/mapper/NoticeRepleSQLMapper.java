package com.cjo.jet.noticeboard.mapper;

import java.util.ArrayList;

import com.cjo.jet.vo.NoticeRepleVo;

public interface NoticeRepleSQLMapper {

	public void insert(NoticeRepleVo vo);
	
	public ArrayList<NoticeRepleVo> selectByContentNo(int content_no);
	
	//글리스트에서 리플 갯수 출력 
	public int repleCount(int content_no);
	
	//댓글 삭제
	public void deleteReple(int no);
	

	
}
