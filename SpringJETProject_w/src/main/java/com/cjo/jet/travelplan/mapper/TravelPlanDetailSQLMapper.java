package com.cjo.jet.travelplan.mapper;

import java.util.ArrayList;

import com.cjo.jet.vo.TravelPlanDetailCategoryVo;
import com.cjo.jet.vo.TravelPlanDetailVo;

public interface TravelPlanDetailSQLMapper {

	
	public int travelPlanDetailPK();
	//여행계획 페이지 내에서 한줄추가 
	public void insertDetails(TravelPlanDetailVo vo);
	
	public ArrayList<TravelPlanDetailVo> selectDetailsByPlanNo(int no);
	
	public ArrayList<TravelPlanDetailCategoryVo> selectCategoryByNo(int no);
	
	public TravelPlanDetailVo selectByNo(int no);
	
	public TravelPlanDetailCategoryVo selectNameByNo(int no);
	
	public void deletePlanDetail(int no);
	
}
