package com.cjo.jet.ratio.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjo.jet.ratio.mapper.RatioSQLMapper;

@Service
public class RatioServiceImpl {
	@Autowired
	private RatioSQLMapper ratioSQLMapper;
	//----------------------------------------------------------------------------------------통계
	public HashMap<String, Object> getAllUserCount(){
		
		return ratioSQLMapper.selectAllUserRatio();
	}
	
	public HashMap<String, Object> getFeMaleUserCount(){
		
		return ratioSQLMapper.selectFeMaleUserRatio();
	}
	
	public HashMap<String, Object> getMaleUserCount(){
		
		return ratioSQLMapper.selectMaleUserRatio();
	}
	public ArrayList<HashMap<String, Object>> getNewMemberCountByDate(){
		
		return ratioSQLMapper.selectNewMemberCountByDate();
	}
	
	public ArrayList<HashMap<String, Object>> getPostsCount(){
		
		ArrayList<HashMap<String, Object>> listMap = new ArrayList<HashMap<String,Object>>();
		
		HashMap<String, Object> freeCount = ratioSQLMapper.selectBoardFreeCount();
		int count_free = Integer.parseInt(String.valueOf(freeCount.get("COUNT")));
		freeCount.put("POSTS", "자유 게시판");
		
		//System.out.println("[map test]" + count_free);
		HashMap<String, Object> knowhowCount = ratioSQLMapper.selectBoardKnowhowCount();
		int knowhow_count = Integer.parseInt(String.valueOf(knowhowCount.get("COUNT")));
		knowhowCount.put("POSTS", "팁과 노하우");
		
		HashMap<String, Object> partyCount = ratioSQLMapper.selectBoardPartyCount();
		int party_count = Integer.parseInt(String.valueOf(partyCount.get("COUNT")));
		partyCount.put("POSTS", "여행 친구 찾기");
		
		HashMap<String, Object> reviewCount = ratioSQLMapper.selectBoardReviewCount();
		int review_count = Integer.parseInt(String.valueOf(reviewCount.get("COUNT")));
		reviewCount.put("POSTS", "리뷰 게시판");
		
		HashMap<String, Object> shareplanCount = ratioSQLMapper.selectShareplanCount();
		int shareplan_count = Integer.parseInt(String.valueOf(shareplanCount.get("COUNT")));
		shareplanCount.put("POSTS", "공유 게시판");
		
		
		HashMap<String, Object> countAll = new HashMap<String, Object>();
		int allCount = count_free + knowhow_count + party_count + review_count + shareplan_count;
		
		countAll.put("COUNT", allCount);
		countAll.put("POSTS", "전체");
		
		listMap.add(shareplanCount);
		listMap.add(freeCount);
		listMap.add(knowhowCount);
		listMap.add(reviewCount);
		listMap.add(partyCount);
		listMap.add(countAll);
		
		return listMap;
	}
	
	public ArrayList<HashMap<String, Object>> getCsCount(){
		ArrayList<HashMap<String, Object>> listMap = new ArrayList<HashMap<String,Object>>();
		
		HashMap<String, Object> m_cs_count = ratioSQLMapper.selectMCsCount();
		int mCsCount = Integer.parseInt(String.valueOf(m_cs_count.get("COUNT")));
		m_cs_count.put("CS", "문의글 수");
		HashMap<String, Object> a_cs_count = ratioSQLMapper.selectACsCount();
		int aCsCount = Integer.parseInt(String.valueOf(a_cs_count.get("COUNT")));
		a_cs_count.put("CS", "답변글 수");
		int unanswaredCount = mCsCount - aCsCount;
		
		HashMap<String, Object> unanswaredCs = new HashMap<String, Object>();
		unanswaredCs.put("COUNT",unanswaredCount);
		unanswaredCs.put("CS", "미답변 수");
		
		
		listMap.add(m_cs_count);
		listMap.add(a_cs_count);
		listMap.add(unanswaredCs);
		return listMap;
	}
	//각 게시판 글쓴 사람 성별 카운트
	public ArrayList<HashMap<String, Object>> getBoardGenderRatio(){
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		HashMap<String, Object> reviewGenderRatio = ratioSQLMapper.selectReviewGenderRatio();
		reviewGenderRatio.put("BOARD","리뷰게시판");
		HashMap<String, Object> partyGenderRatio = ratioSQLMapper.selectPartyGenderRatio();
		partyGenderRatio.put("BOARD","여행친구찾기");
		HashMap<String, Object> knowhowGenderRatio = ratioSQLMapper.selectKnowhowGenderRatio();
		knowhowGenderRatio.put("BOARD","팁과 노하우");
		HashMap<String, Object> freeGenderRatio = ratioSQLMapper.selectFreeBoardGenderRatio();
		freeGenderRatio.put("BOARD","자유게시판");
		HashMap<String, Object> shareplanGenderRatio = ratioSQLMapper.selectShareplanGenderRatio();
		shareplanGenderRatio.put("BOARD","공유게시판");
		
		resultList.add(reviewGenderRatio);
		resultList.add(partyGenderRatio);
		resultList.add(knowhowGenderRatio);
		resultList.add(freeGenderRatio);
		resultList.add(shareplanGenderRatio);
		
		return resultList;
	}
}
