package com.cjo.jet.shareplan.mapper;

import java.util.ArrayList;

import com.cjo.jet.vo.SharePlanImageVo;

public interface SharePlanImageSQLMapper {

	public void insert(SharePlanImageVo vo);
	
	public ArrayList<SharePlanImageVo> selectByShareplanNo(int shareplan_no);
}
