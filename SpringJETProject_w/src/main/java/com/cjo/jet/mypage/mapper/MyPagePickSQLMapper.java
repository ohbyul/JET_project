package com.cjo.jet.mypage.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.cjo.jet.vo.SharePlanBoardVo;

public interface MyPagePickSQLMapper {
	//찜 출력
	public ArrayList<SharePlanBoardVo> selectPickBoard(int jet_member_no);
	
}
