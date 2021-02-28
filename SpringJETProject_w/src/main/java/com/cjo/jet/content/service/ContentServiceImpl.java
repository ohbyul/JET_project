package com.cjo.jet.content.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjo.jet.classboard.mapper.ClassCategorySQLMapper;
import com.cjo.jet.classboard.mapper.ClassDetailSQLMapper;
import com.cjo.jet.classboard.mapper.ClassImageSQLMapper;
import com.cjo.jet.classboard.mapper.ClassReserveSQLMapper;
import com.cjo.jet.classboard.mapper.ClassReviewSQLMapper;
import com.cjo.jet.classboard.mapper.ClassboardSQLMapper;
import com.cjo.jet.content.mapper.ContentSQLMapper;
import com.cjo.jet.member.mapper.MemberSQLMapper;
import com.cjo.jet.partyboard.mapper.PartyBoardAttendSQLMapper;
import com.cjo.jet.partyboard.mapper.PartyBoardImageSQLMapper;
import com.cjo.jet.partyboard.mapper.PartyBoardSQLMapper;
import com.cjo.jet.shareplan.mapper.SharePlanLikeSQLMapper;
import com.cjo.jet.shareplan.mapper.SharePlanRepleSQLMapper;
import com.cjo.jet.shareplan.mapper.SharePlanSQLMapper;
import com.cjo.jet.vo.ClassCategoryVo;
import com.cjo.jet.vo.ClassDetailVo;
import com.cjo.jet.vo.ClassImageVo;
import com.cjo.jet.vo.ClassboardVo;
import com.cjo.jet.vo.MemberVo;
import com.cjo.jet.vo.PartyBoardImageVo;
import com.cjo.jet.vo.PartyBoardVo;
import com.cjo.jet.vo.SharePlanBoardVo;
import com.cjo.jet.vo.SharePlanImageVo;

@Service
public class ContentServiceImpl {
	@Autowired
	private ContentSQLMapper contentSQLMapper;
	@Autowired
	private SharePlanSQLMapper sharePlanSQLMapper;
	@Autowired
	private SharePlanRepleSQLMapper sharePlanRepleSQLMapper;
	@Autowired
	private SharePlanLikeSQLMapper sharePlanLikeSQLMapper;
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	@Autowired
	private PartyBoardSQLMapper partyBoardSQLMapper;
	@Autowired
	private PartyBoardAttendSQLMapper partyBoardAttendSQLMapper;
	@Autowired
	private PartyBoardImageSQLMapper partyBoardImageSQLMapper;
	
	@Autowired
	private ClassDetailSQLMapper classDetailSQLMapper;
	@Autowired
	private ClassboardSQLMapper classboardSQLMapper;
	@Autowired
	private ClassImageSQLMapper classimageSQLMapper;
	@Autowired
	private ClassCategorySQLMapper classCategorySQLMapper;
	@Autowired
	private ClassReserveSQLMapper classReserveSQLMapper;
	@Autowired
	private ClassReviewSQLMapper classReviewSQLMapper;
	
	   //제트기 전체
	   public ArrayList<HashMap<String, Object>> getSharePlanList(){
	      ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
	      
	      ArrayList<SharePlanBoardVo> sharePlanList = sharePlanSQLMapper.selectAll();
	             
	      for(SharePlanBoardVo sharePlanBoardVo : sharePlanList) {
	         int member_no = sharePlanBoardVo.getJet_member_no();
	         
	         int repleCount = sharePlanRepleSQLMapper.repleCount(sharePlanBoardVo.getJet_board_shareplan_no());
	         
	         int likeCount = sharePlanLikeSQLMapper.likeCount(sharePlanBoardVo.getJet_board_shareplan_no());
	         
	         int category = sharePlanBoardVo.getJet_board_shareplan_category();
	         
	         ArrayList<SharePlanImageVo> thumbnail = sharePlanSQLMapper.thumbnail(sharePlanBoardVo.getJet_board_shareplan_no());
	         
	         MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
	         
	         HashMap<String, Object> map = new HashMap<String, Object>();
	         map.put("memberVo",memberVo);
	         map.put("sharePlanBoardVo",sharePlanBoardVo);
	         map.put("repleCount",repleCount);
	         map.put("likeCount",likeCount);
	         map.put("thumbnail",thumbnail);
	         
	         resultList.add(map);
	         
	      }
	      
	      return resultList;
	   }
	   
	//최신글 공유 게시판
	public ArrayList<Object> newSharePlanBoard(){
		return contentSQLMapper.newSharePlanBoard();
	}
	public ArrayList<Object> newNotice(){
		return contentSQLMapper.newNoticeBoard();
	}
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ	
	//여행 친구찾기 전체 출력
	public ArrayList<HashMap<String, Object>> getPartyBoardList(){
	
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<PartyBoardVo> partyBoardList = null;
		
		partyBoardList = partyBoardSQLMapper.selectAllNoPage();
		
		for(PartyBoardVo partyBoardVo :  partyBoardList) {
			int member_no = partyBoardVo.getJet_member_no();
			MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
			
			//리플갯수 출력
			int attendCount = partyBoardAttendSQLMapper.attendCount(partyBoardVo.getJet_board_party_no());
			
			//썸네일 처리
			ArrayList<PartyBoardImageVo> thumbnail = partyBoardImageSQLMapper.thumbnail(partyBoardVo.getJet_board_party_no());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("memberVo", memberVo);
			map.put("partyBoardVo", partyBoardVo);
			map.put("thumbnail", thumbnail);
			map.put("attendCount", attendCount);
			
			resultList.add(map);
		}
		return resultList;
	}
	//최신글 공유 게시판
	public ArrayList<Object> newPartyBoard(){
		return contentSQLMapper.newPartyBoard();
	}
	
	//클래스 추천 메인
	public ArrayList<HashMap<String, Object>> getClassList() {
		ArrayList<HashMap<String, Object>> ClassList = new ArrayList<HashMap<String, Object>>();

		ArrayList<ClassDetailVo> detailList = classDetailSQLMapper.selectAllNoPaging();

		for (ClassDetailVo classDetailVo : detailList) {
			int class_no = classDetailVo.getJet_class_no();
			
			ClassboardVo classboardVo = classboardSQLMapper.selectByNo(class_no); // ClassVo에 detailVo에 있는 class_no 세팅

			int jet_member_no = classboardVo.getJet_member_no();
			MemberVo memberVo = memberSQLMapper.selectByNo(jet_member_no); // 멤버 넘버로 글쓴이 추출할 것.
			
			ArrayList<ClassImageVo> classImageVo = classimageSQLMapper.selectByNo(classboardVo.getJet_class_no());

			int jet_class_category_no = classboardVo.getJet_class_category_no();
			ClassCategoryVo classCategoryVo = classCategorySQLMapper.selectByNo(jet_class_category_no);
			
			float starRating = classReviewSQLMapper.selectStarRatingByClassNo(class_no);
				
			int countReserve = classReserveSQLMapper.countReserve(classDetailVo.getJet_class_detail_no());

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("classboardVo", classboardVo);
			map.put("classDetailVo", classDetailVo);
			map.put("classCategoryVo", classCategoryVo);
			map.put("imageVoList", classImageVo);
			map.put("memberVo", memberVo);
			map.put("countReserve", countReserve);
			map.put("starRating", starRating);

			ClassList.add(map);
			
		}
		
		return ClassList;
	}	
	
	public ArrayList<Object> threeClasses(){
		return contentSQLMapper.recommendClassBoard();
	}
	
		
}
