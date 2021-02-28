package com.cjo.jet.shareplan.mapper;

import java.util.ArrayList;

import com.cjo.jet.vo.SharePlanRepleVo;

public interface SharePlanRepleSQLMapper {

	//댓글입력
	public void insert(SharePlanRepleVo vo);
	//등록순
	public ArrayList<SharePlanRepleVo> selectByShareplanNo(int shareplan_no);
	//최신순
	public ArrayList<SharePlanRepleVo> selectByShareplanNoDESC(int shareplan_no);
	
	//댓글 수
	public int repleCount(int shareplan_no);
	//댓글 삭제
	public void deleteReple(int no);
	//댓글 번호 추출
	public SharePlanRepleVo selectByNo(int no);
	
}
