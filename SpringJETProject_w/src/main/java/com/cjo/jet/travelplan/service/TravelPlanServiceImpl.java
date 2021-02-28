package com.cjo.jet.travelplan.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.server.reactive.JettyHttpHandlerAdapter;
import org.springframework.stereotype.Service;

import com.cjo.jet.member.mapper.MemberSQLMapper;
import com.cjo.jet.travelplan.mapper.TravelPlanDetailSQLMapper;
import com.cjo.jet.travelplan.mapper.TravelPlanSQLMapper;
import com.cjo.jet.vo.MemberVo;
import com.cjo.jet.vo.TravelPlanDetailCategoryVo;
import com.cjo.jet.vo.TravelPlanDetailVo;
import com.cjo.jet.vo.TravelPlanVo;

@Service
public class TravelPlanServiceImpl {
	
	@Autowired
	private TravelPlanSQLMapper travelPlanSQLMapper;
	
	@Autowired
	private TravelPlanDetailSQLMapper travelPlanDetailSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	//여행계획 글쓰기
	public void writeTravelPlan(TravelPlanVo vo, ArrayList<TravelPlanDetailVo> travelPlanDetailVoList) {
		
		int travelPlanPk = travelPlanSQLMapper.createKey();
		System.out.println("[travelPlanPk test]" + travelPlanPk);
		vo.setJet_board_travelplan_no(travelPlanPk);
		
		travelPlanSQLMapper.insert(vo);
		System.out.println("[test plan vo]"+ vo);
		
		for(TravelPlanDetailVo detailVo : travelPlanDetailVoList) {
//			int travelPlanDetailPk =  travelPlanDetailSQLMapper.travelPlanDetailPK();
//			detailVo.setJet_board_tp_detail_no(travelPlanDetailPk);
			detailVo.setJet_board_travelplan_no(travelPlanPk);
			System.out.println("[test detailVo]"+detailVo);
			
			travelPlanDetailSQLMapper.insertDetails(detailVo);
		}
			
	}
	//글 리스트 출력  - 별이 누나가 작성하신 것
	public ArrayList<HashMap<String, Object>> getContentListByB(){
		
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<TravelPlanVo> planList = travelPlanSQLMapper.selectAllPlan();
		
		for(TravelPlanVo travelPlanVo :planList) {
			int member_no = travelPlanVo.getJet_member_no();
			MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("travelPlanVo", travelPlanVo);
			
			resultList.add(map);
		}
		
		return resultList;
	}
	
	public ArrayList<HashMap<String, Object>> getContentList(int jet_member_no){
		
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<TravelPlanVo> planList = travelPlanSQLMapper.selectAllPlanByW(jet_member_no);
		
		for(TravelPlanVo travelPlanVo :planList) {
			MemberVo memberVo = memberSQLMapper.selectByNo(jet_member_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("travelPlanVo", travelPlanVo);
			
			resultList.add(map);
		}
		
		return resultList;
	}
	//글 내용 가져오기
	public HashMap<String, Object> getPlanContent(int travelplanNo){
		System.out.println("1");
		TravelPlanVo  travelplanVo = travelPlanSQLMapper.selectByPlanNo(travelplanNo);
		
		MemberVo memberVo = memberSQLMapper.selectByNo(travelplanVo.getJet_member_no());
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("travelplanVo", travelplanVo);
		map.put("memberVo", memberVo);
		
		
		return map;
	}
	//글 세부 내용 가져오기
	public ArrayList<HashMap<String, Object>> getDetailList(int travelplanNo){
		
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		ArrayList<TravelPlanDetailVo> detailList = travelPlanDetailSQLMapper.selectDetailsByPlanNo(travelplanNo);
		
		for(TravelPlanDetailVo detailVo : detailList) {
			
			int ctgr_no = detailVo.getJet_board_tp_detail_ctgr_no();
			System.out.println("[카테고리 번호 이름]"+ctgr_no);
			TravelPlanDetailCategoryVo categoryName = travelPlanDetailSQLMapper.selectNameByNo(ctgr_no);
			System.out.println("[카테고리 이름]"+categoryName);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("detailVo", detailVo);
			map.put("categoryName",categoryName);
			
			resultList.add(map);
		}
		return resultList;
	}
	
	public void deletePlanAndDetails(int travelNo) {
		
		travelPlanSQLMapper.deletePlan(travelNo);
		travelPlanDetailSQLMapper.deletePlanDetail(travelNo);
		
	}
	
	public void updateShareStatus(int travelplanNo) {
		travelPlanSQLMapper.updateShareStatus(travelplanNo);
	}
	public void updatePlanTitle(TravelPlanVo travelplanVo) {
		travelPlanSQLMapper.updatePlan(travelplanVo);
	}
}
