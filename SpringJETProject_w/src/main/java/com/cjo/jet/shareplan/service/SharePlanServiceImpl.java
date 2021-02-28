package com.cjo.jet.shareplan.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjo.jet.classboard.mapper.ClassCategorySQLMapper;
import com.cjo.jet.classboard.mapper.ClassDetailSQLMapper;
import com.cjo.jet.classboard.mapper.ClassImageSQLMapper;
import com.cjo.jet.classboard.mapper.ClassboardSQLMapper;
import com.cjo.jet.member.mapper.MemberSQLMapper;
import com.cjo.jet.shareplan.mapper.SharePlanImageSQLMapper;
import com.cjo.jet.shareplan.mapper.SharePlanLikeSQLMapper;
import com.cjo.jet.shareplan.mapper.SharePlanRepleSQLMapper;
import com.cjo.jet.shareplan.mapper.SharePlanSQLMapper;
import com.cjo.jet.travelplan.mapper.TravelPlanDetailSQLMapper;
import com.cjo.jet.travelplan.mapper.TravelPlanSQLMapper;
import com.cjo.jet.vo.PickBoardVo;
import com.cjo.jet.vo.ClassCategoryVo;
import com.cjo.jet.vo.ClassDetailVo;
import com.cjo.jet.vo.ClassImageVo;
import com.cjo.jet.vo.ClassboardVo;
import com.cjo.jet.vo.MemberVo;
import com.cjo.jet.vo.PartyBoardVo;
import com.cjo.jet.vo.PartySingoVo;
import com.cjo.jet.vo.SharePlanBoardVo;
import com.cjo.jet.vo.SharePlanImageVo;
import com.cjo.jet.vo.SharePlanLikeVo;
import com.cjo.jet.vo.SharePlanRepleVo;
import com.cjo.jet.vo.SharePlanReportVo;
import com.cjo.jet.vo.TravelPlanDetailCategoryVo;
import com.cjo.jet.vo.TravelPlanDetailVo;
import com.cjo.jet.vo.TravelPlanVo;
@Service
public class SharePlanServiceImpl {

	@Autowired
	private SharePlanSQLMapper sharePlanSQLMapper;
	
	@Autowired
	private SharePlanImageSQLMapper sharePlanImageSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	@Autowired
	private SharePlanRepleSQLMapper sharePlanRepleSQLMapper;
	
	@Autowired
	private SharePlanLikeSQLMapper sharePlanLikeSQLMapper;
	
	@Autowired
	private TravelPlanSQLMapper travelPlanSQLMapper;
	
	@Autowired
	private TravelPlanDetailSQLMapper travelPlanDetailSQLMapper;
	
	@Autowired
	private ClassboardSQLMapper classboardSQLMapper;
	
	@Autowired
	private ClassImageSQLMapper classimageSQLMapper;
	
	@Autowired
	private ClassCategorySQLMapper classCategorySQLMapper;
	
//	@Autowired
//	private ClassDetailSQLMapper classDetailSQLMapper;
	   //글쓰기
	   public void writeSharePlanByNo(SharePlanBoardVo vo, ArrayList<SharePlanImageVo> imageVoList, int travelplanNo) {
	      
//	      int shareplanPK = sharePlanSQLMapper.sharePlanPK();
//	      System.out.println("[test travelplan no]"+travelplanNo);
//	      vo.setJet_board_shareplan_no(shareplanPK);
//	      vo.setJet_board_travelplan_no(travelplanNo);
//	      System.out.println("[test shardplan vo]" + vo);
//	      sharePlanSQLMapper.insertSharePlan(vo);
//	      
//	      for(SharePlanImageVo imageVo : imageVoList) {
//	         imageVo.setJet_board_shareplan_no(shareplanPK);
//	         
//	         sharePlanImageSQLMapper.insert(imageVo);
//	      }
	   }
	   
	   //null 예외처리 글쓰기
	   public void writeSharePlan(SharePlanBoardVo vo, ArrayList<SharePlanImageVo> imageVoList) {
	      
	      int shareplanPK = sharePlanSQLMapper.sharePlanPK();
	      
	      vo.setJet_board_shareplan_no(shareplanPK);
	      
	      System.out.println("[test shardplan vo]" + vo);
	      sharePlanSQLMapper.insertSharePlan(vo);
	      
	      for(SharePlanImageVo imageVo : imageVoList) {
	         imageVo.setJet_board_shareplan_no(shareplanPK);
	         
	         sharePlanImageSQLMapper.insert(imageVo);
	      }
	   }
	   //제트기 전체
	   public ArrayList<HashMap<String, Object>> getSharePlanList(String search_word, String search_type){
	      ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
	      
	      ArrayList<SharePlanBoardVo> sharePlanList = null;
	      
	      if(search_word == null || search_type == null) {
	         sharePlanList = sharePlanSQLMapper.selectAll();
	      }else {
	         if(search_type.equals("title")) {
	            sharePlanList = sharePlanSQLMapper.selectByTitle(search_word);
	         }else if(search_type.equals("content")) {
	            sharePlanList = sharePlanSQLMapper.selectByContent(search_word);
	         }else if(search_type.equals("writer")) {
	            sharePlanList = sharePlanSQLMapper.selectByWriter(search_word);
	         }else {
	            sharePlanList = sharePlanSQLMapper.selectAll();
	         }
	      }
	         
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
	   
	//   //페이지 카운트
	//   public int getPageCount() {
//	      return sharePlanSQLMapper.getPageCount();
	//   }
	   //핫게
	   public ArrayList<Object> hotBoard(){
	      return sharePlanSQLMapper.hotBoard();
	   }   
	   //읽기
	   public HashMap<String, Object> getShareplan(int jet_board_shareplan_no){
	      
	      //sharePlanSQLMapper.increaseReadCount(jet_board_shareplan_no);
	      System.out.println("서비스" + jet_board_shareplan_no);
	      SharePlanBoardVo sharePlanBoardVo = sharePlanSQLMapper.selectByNo(jet_board_shareplan_no);
	      
	      String str = sharePlanBoardVo.getJet_board_shareplan_content();
	      str = StringEscapeUtils.escapeHtml4(str);
	      str = str.replaceAll("\n", "<br>");
	      sharePlanBoardVo.setJet_board_shareplan_content(str);
	      
	      int member_no = sharePlanBoardVo.getJet_member_no();
	      MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
	      
	      ArrayList<SharePlanImageVo> imageVoList = sharePlanImageSQLMapper.selectByShareplanNo(jet_board_shareplan_no);
	      
	      int travelplanNo = sharePlanBoardVo.getJet_board_travelplan_no();
	      System.out.println("[test 글 보기 travelplan no]" +travelplanNo );
	      TravelPlanVo travelPlanVo = travelPlanSQLMapper.selectByPlanNo(travelplanNo);
	      
	      ArrayList<HashMap<String, Object>> detailList = new ArrayList<HashMap<String,Object>>();
	      ArrayList<TravelPlanDetailVo> detailPlan = travelPlanDetailSQLMapper.selectDetailsByPlanNo(travelplanNo);
	      
	      
	      for(TravelPlanDetailVo travelPlanDetailVo : detailPlan) {
	         
	         int ctgr_no = travelPlanDetailVo.getJet_board_tp_detail_ctgr_no();
	         
	         
	         TravelPlanDetailCategoryVo categoryName = travelPlanDetailSQLMapper.selectNameByNo(ctgr_no);
	         
	         HashMap<String, Object> map = new HashMap<String, Object>();
	         map.put("travelPlanDetailVo",travelPlanDetailVo);
	         map.put("categoryName",categoryName);
	         
	         detailList.add(map);
	         
	      }

	      
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("memberVo",memberVo);
	      map.put("sharePlanBoardVo",sharePlanBoardVo);
	      map.put("travelPlanVo",travelPlanVo);
	      map.put("imageVoList",imageVoList);
	      map.put("detailList",detailList);

	      
	      System.out.println("[map test]"+map);
	      return map;
	   }
	   //추천클래스 4개
	   public ArrayList<HashMap<String, Object>> getRecommendClass(int jet_board_shareplan_no){
		   
		   	  SharePlanBoardVo sharePlanBoardVo = sharePlanSQLMapper.selectByNo(jet_board_shareplan_no);
		   
		      int travelplanNo = sharePlanBoardVo.getJet_board_travelplan_no();
		   
		      ArrayList<HashMap<String, Object>> recommendList = new ArrayList<HashMap<String,Object>>();
		      
		      ArrayList<ClassboardVo> recommendClass = sharePlanSQLMapper.selectRecommendClass(travelplanNo);

		      for(ClassboardVo classboardVo : recommendClass) {
		    	
		    	  int class_no = classboardVo.getJet_class_no();
		    	  
		    	  ClassboardVo classboard = classboardSQLMapper.selectByNo(class_no);
		    	  ArrayList<ClassImageVo> classImageList = classimageSQLMapper.selectByNo(class_no);
		    	  
		    	  int jet_class_category_no = classboard.getJet_class_category_no();
		    	  ClassCategoryVo classCategoryVo = classCategorySQLMapper.selectByNo(jet_class_category_no);
		    	  
		    	  HashMap<String, Object> map = new HashMap<String, Object>();
		    	  map.put("classboard",classboard);
		    	  //map.put("classboardVo",classboardVo);
		    	  map.put("classImageList",classImageList);
		    	  map.put("classCategoryVo",classCategoryVo);
		    	  
		    	  recommendList.add(map);
		      }		   
		      return recommendList;
	   }
	   //추천클래스 전부
	   public ArrayList<HashMap<String, Object>> getRecommendClassAll(int jet_board_shareplan_no){
		   
		   	  SharePlanBoardVo sharePlanBoardVo = sharePlanSQLMapper.selectByNo(jet_board_shareplan_no);
		   
		      int travelplanNo = sharePlanBoardVo.getJet_board_travelplan_no();
		   
		      ArrayList<HashMap<String, Object>> recommendList = new ArrayList<HashMap<String,Object>>();
		      
		      ArrayList<ClassboardVo> recommendClass = sharePlanSQLMapper.selectRecommendClassAll(travelplanNo);

		      for(ClassboardVo classboardVo : recommendClass) {
		    	
		    	  int class_no = classboardVo.getJet_class_no();
		    	  
		    	  ClassboardVo classboard = classboardSQLMapper.selectByNo(class_no);
		    	  ArrayList<ClassImageVo> classImageList = classimageSQLMapper.selectByNo(class_no);
		    	  
		    	  int jet_class_category_no = classboard.getJet_class_category_no();
		    	  ClassCategoryVo classCategoryVo = classCategorySQLMapper.selectByNo(jet_class_category_no);
		    	  
		    	  HashMap<String, Object> map = new HashMap<String, Object>();
		    	  map.put("classboard",classboard);
		    	  //map.put("classboardVo",classboardVo);
		    	  map.put("classImageList",classImageList);
		    	  map.put("classCategoryVo",classCategoryVo);
		    	  
		    	  recommendList.add(map);
		      }		   
		      return recommendList;
	   }
	   
	   //글 세부 내용 가져오기
	   public ArrayList<HashMap<String, Object>> getDetailList(int shareplanNo){
	      
	      SharePlanBoardVo sharePlanBoardVo = sharePlanSQLMapper.selectByNo(shareplanNo);
	      int travelplanNo = sharePlanBoardVo.getJet_board_travelplan_no();
	      
	      
	      ArrayList<HashMap<String, Object>> detailList = new ArrayList<HashMap<String,Object>>();
	      ArrayList<TravelPlanDetailVo> detailPlan = travelPlanDetailSQLMapper.selectDetailsByPlanNo(travelplanNo);
	      
	      for(TravelPlanDetailVo travelPlanDetailVo : detailPlan) {
	         
	         int ctgr_no = travelPlanDetailVo.getJet_board_tp_detail_ctgr_no();
	      
	         TravelPlanDetailCategoryVo categoryName = travelPlanDetailSQLMapper.selectNameByNo(ctgr_no);
	      
	         
	         HashMap<String, Object> map = new HashMap<String, Object>();
	         map.put("travelPlanDetailVo", travelPlanDetailVo);
	         map.put("categoryName",categoryName);
	         
	         detailList.add(map);
	      }
	      return detailList;
	   }
	   
	   //조회수 증가
	   public void increaseReadCount(int jet_board_shareplan_no, HttpServletRequest request, HttpServletResponse response) {
		   
		   Cookie [] cookies = request.getCookies();
		   
		   Cookie viewCookie = null;
		   
	        if (cookies != null && cookies.length > 0) 
	        {
	            for (int i = 0; i < cookies.length; i++)
	            {
	                // Cookie의 name이 cookie + reviewNo와 일치하는 쿠키를 viewCookie에 넣어줌 
	                if (cookies[i].getName().equals("cookie"+jet_board_shareplan_no))
	                { 
	                    System.out.println("처음 쿠키가 생성한 뒤 들어옴.");
	                    viewCookie = cookies[i];
	                }
	            }
	        }
	        
            // 만일 viewCookie가 null일 경우 쿠키를 생성해서 조회수 증가 로직을 처리함.
            if (viewCookie == null) {    
                System.out.println("cookie 없음");
                
                // 쿠키 생성(이름, 값)
                Cookie newCookie = new Cookie("cookie"+jet_board_shareplan_no, "|" + jet_board_shareplan_no + "|");
                                
                // 쿠키 추가
                response.addCookie(newCookie);
 
                // 쿠키를 추가 시키고 조회수 증가시킴
                sharePlanSQLMapper.increaseReadCount(jet_board_shareplan_no);

            }
            // viewCookie가 null이 아닐경우 쿠키가 있으므로 조회수 증가 로직을 처리하지 않음.
            else {
                System.out.println("cookie 있음");
                
                // 쿠키 값 받아옴.
                String value = viewCookie.getValue();
                
                System.out.println("cookie 값 : " + value);
        
            }
		   
		   //sharePlanSQLMapper.increaseReadCount(jet_board_shareplan_no);
	   }
	   
	   //삭제
	   public void deleteShareplan(int jet_board_shareplan_no) {
	      sharePlanSQLMapper.deleteByNo(jet_board_shareplan_no);
	   }
	   //수정
	   public void updateShareplan(SharePlanBoardVo vo) {
		   
	      sharePlanSQLMapper.updateByNo(vo);
	   }
	   //댓글수
	   public int repleCount(int shareplan_no) {
	      return sharePlanRepleSQLMapper.repleCount(shareplan_no);
	   }
	   //댓글쓰기
	   public void writeReple(SharePlanRepleVo vo) {
	      sharePlanRepleSQLMapper.insert(vo);
	   }
	   //댓글 삭제
	   public void deleteReple(int shareplanRepleNo) {
	      sharePlanRepleSQLMapper.deleteReple(shareplanRepleNo);
	   }
	   //댓글 보이기
	   public ArrayList<HashMap<String, Object>> getRepleList(int shareplanNo){
	      ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String,Object>>();
	      ArrayList<SharePlanRepleVo> repleVoList = sharePlanRepleSQLMapper.selectByShareplanNo(shareplanNo);
	      
	      for(SharePlanRepleVo sharePlanRepleVo : repleVoList) {
	         
	         MemberVo memberVo = memberSQLMapper.selectByNo(sharePlanRepleVo.getJet_member_no());
	         
	         HashMap<String, Object> map = new HashMap<String, Object>();
	         map.put("memberVo",memberVo);
	         map.put("sharePlanRepleVo",sharePlanRepleVo);
	         
	         result.add(map);
	      }
	      
	      return result;
	   }
	   //댓글 최신순
	   public ArrayList<HashMap<String, Object>> getRepleListDESC(int shareplanNo){
		   ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String,Object>>();
		   ArrayList<SharePlanRepleVo> repleVoList = sharePlanRepleSQLMapper.selectByShareplanNoDESC(shareplanNo);
		   
		   for(SharePlanRepleVo sharePlanRepleVo : repleVoList) {
			   MemberVo memberVo = memberSQLMapper.selectByNo(sharePlanRepleVo.getJet_member_no());
			   
			   HashMap<String, Object> map = new HashMap<String, Object>();
			   map.put("memberVo",memberVo);
			   map.put("sharePlanRepleVo",sharePlanRepleVo);
			   
			   result.add(map);
		   }
		   
		   
		   return result;
	   }
	   //추천
	   public void shareplanLike(SharePlanLikeVo vo) {
	      sharePlanLikeSQLMapper.insertLike(vo);
	   }
	   //추천수
	   public int likeCount(int shareplan_no) {
	      return sharePlanLikeSQLMapper.likeCount(shareplan_no);
	   }
	   //추천 취소
	   public void deleteLike(int jet_board_shareplan_no, int jet_member_no) {
	      sharePlanLikeSQLMapper.deleteLike(jet_board_shareplan_no, jet_member_no);
	   }
	   //추천번호뽑기
	   public SharePlanLikeVo getShareplanLikeVo(int shareplan_no, MemberVo sessionMemberVo) {
	      SharePlanLikeVo sharePlanLikeVo = sharePlanLikeSQLMapper.selectByno(shareplan_no, sessionMemberVo.getJet_member_no());
	      
	      return sharePlanLikeVo;
	   }
	//찜하기
	public void insertPick(PickBoardVo vo) {
		sharePlanSQLMapper.insertPick(vo);
	}
	//찜취소
	public void deletePick(int jet_board_shareplan_no, int jet_member_no) {
		sharePlanSQLMapper.deletePick(jet_board_shareplan_no, jet_member_no);
	}
	//찜번호뽑기
	public PickBoardVo getlikeBoardPickNo(int shareplan_no, MemberVo sessionMemberVo) {
		PickBoardVo pickBoardVo = sharePlanSQLMapper.selectByPickNo(shareplan_no, sessionMemberVo.getJet_member_no());
		System.out.println("서비스 테스트" + shareplan_no);
		return pickBoardVo;
	}
	//전체 가져오기
		public ArrayList<HashMap<String, Object>> selectPickBoard(int jet_member_no) {
			ArrayList<HashMap<String, Object>> shareAllList = new ArrayList<HashMap<String,Object>>();
			ArrayList<PickBoardVo> shareList = sharePlanSQLMapper.selectPickBoard(jet_member_no);
			
			for(PickBoardVo pickBoardVo : shareList) {
				int member_no = pickBoardVo.getJet_member_no();
				MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
				//찜한 게시글 가져오고
				SharePlanBoardVo sharePlanBoardVo = sharePlanSQLMapper.selectByNo(pickBoardVo.getJet_board_shareplan_no());
				
				ArrayList<TravelPlanVo> travelPlanlVo = travelPlanSQLMapper.selectAllPlan();
				
				HashMap<String, Object> map = new HashMap<String, Object>();
				
				map.put("memberVo",memberVo);
				map.put("pickBoardVo",pickBoardVo);
				map.put("sharePlanBoardVo",sharePlanBoardVo);
				map.put("travelPlanlVo",travelPlanlVo);
				
				shareAllList.add(map);
				
			}
			return shareAllList;
		}
///////////////////////////////////신고
		//신고 인서트
		public void reportInsert(SharePlanReportVo vo) {
			sharePlanSQLMapper.insertReport(vo);
		}
		
		//신고자 체크
		public SharePlanReportVo checksingo(int jet_board_shareplan_no,MemberVo reportMemberVo)  {
			
			SharePlanReportVo sharePlanReportVo = sharePlanSQLMapper.selectReportByNo(jet_board_shareplan_no,reportMemberVo.getJet_member_no());
			
			return sharePlanReportVo;
		}
		
		public ArrayList<Object> newPartySingoList(){
			return sharePlanSQLMapper.selectReportList();
		}
		
		//여행친구찾기게시판 글의 모든 신고 출력 [관리자 페이지에서]
		public ArrayList<HashMap<String, Object>> getPartySingoList() {
			
			ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String,Object>>();
			
			ArrayList<SharePlanReportVo> shareplanReportList = sharePlanSQLMapper.selectAllReportNoPage();
			
			for(SharePlanReportVo sharePlanReportVo : shareplanReportList) {
				int singoMember_no = sharePlanReportVo.getJet_member_no();
				MemberVo singoMemberVo = memberSQLMapper.selectByNo(singoMember_no);
				
				int jet_board_shareplan_no = sharePlanReportVo.getJet_board_shareplan_no();
				SharePlanBoardVo sharePlanBoardVo= sharePlanSQLMapper.selectByNo(jet_board_shareplan_no);
				
				HashMap<String, Object> map = new HashMap<String, Object>();
				
				map.put("sharePlanReportVo", sharePlanReportVo);
				map.put("singoMemberVo", singoMemberVo);
				map.put("sharePlanBoardVo", sharePlanBoardVo);
				
				
				result.add(map);
			}
			
			return result;
		}		
		
		
		
}
