package com.cjo.jet.travelplan.mapper;

import java.util.ArrayList;

import com.cjo.jet.vo.TravelPlanVo;

public interface TravelPlanSQLMapper {
	
	public int createKey();
	//글 쓰기
	public void insert(TravelPlanVo vo);
	
	public TravelPlanVo selectByPlanNo(int no);
	
	public ArrayList<TravelPlanVo> selectAllPlanByW(int jet_member_no);
	//별이 누나가 작성하신 리스트
	public ArrayList<TravelPlanVo> selectAllPlan();
	
	public void deletePlan(int no);
	
	public void updateShareStatus(int no);
	
	public void updateShareStatusToN(int no);
	
	public void updatePlan(TravelPlanVo vo);
	
	//할까 말까
	public ArrayList<TravelPlanVo> selectByShareStatusY();
}
