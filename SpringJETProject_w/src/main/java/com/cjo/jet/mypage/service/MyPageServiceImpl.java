package com.cjo.jet.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjo.jet.boardReview.mapper.BoardReviewSQLMapper;
import com.cjo.jet.boardReview.mapper.ReviewRepleSQLMapper;
import com.cjo.jet.classboard.mapper.ClassDetailSQLMapper;
import com.cjo.jet.classboard.mapper.ClassReserveSQLMapper;
import com.cjo.jet.classboard.mapper.ClassboardSQLMapper;
import com.cjo.jet.freeboard.mapper.FreeboardSQLMapper;
import com.cjo.jet.knowhow.mapper.KnowhowBoardSQLMapper;
import com.cjo.jet.member.mapper.MemberImageSQLMapper;
import com.cjo.jet.member.mapper.MemberSQLMapper;
import com.cjo.jet.mypage.mapper.MyPagePickSQLMapper;
import com.cjo.jet.mypage.mapper.MyPageSQLMapper;
import com.cjo.jet.noticeboard.mapper.NoticeBoardSQLMapper;
import com.cjo.jet.partyboard.mapper.PartyBoardSQLMapper;
import com.cjo.jet.shareplan.mapper.SharePlanSQLMapper;
import com.cjo.jet.vo.BoardReviewVo;
import com.cjo.jet.vo.ClassDetailVo;
import com.cjo.jet.vo.ClassReservationVo;
import com.cjo.jet.vo.ClassboardVo;
import com.cjo.jet.vo.FreeboardLikeVo;
import com.cjo.jet.vo.FreeboardRepleVo;
import com.cjo.jet.vo.FreeboardVo;
import com.cjo.jet.vo.KnowhowBoardLikeVo;
import com.cjo.jet.vo.KnowhowBoardRepleVo;
import com.cjo.jet.vo.KnowhowBoardVo;
import com.cjo.jet.vo.MemberImageVo;
import com.cjo.jet.vo.MemberUpgradeVo;
import com.cjo.jet.vo.MemberVo;
import com.cjo.jet.vo.NoticeBoardVo;
import com.cjo.jet.vo.NoticeRepleVo;
import com.cjo.jet.vo.PartyBoardAttendVo;
import com.cjo.jet.vo.PartyBoardVo;
import com.cjo.jet.vo.ReviewCategoryVo;
import com.cjo.jet.vo.ReviewLikeVo;
import com.cjo.jet.vo.ReviewRepleVo;
import com.cjo.jet.vo.SharePlanBoardVo;
import com.cjo.jet.vo.SharePlanLikeVo;
import com.cjo.jet.vo.SharePlanRepleVo;

@Service
public class MyPageServiceImpl {
	
	@Autowired
	private ReviewRepleSQLMapper reviewRepleSQLMapper;
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	@Autowired
	private MemberImageSQLMapper memberImageSQLMapper;
	
	
	@Autowired
	private MyPageSQLMapper myPageSQLMapper;
	@Autowired
	private FreeboardSQLMapper freeBoardSQLMapper;
	@Autowired
	private KnowhowBoardSQLMapper knowhowBoardSQLMapper;  
	
	@Autowired
	private NoticeBoardSQLMapper noticeBoardSQLMapper;
	
	@Autowired
	private BoardReviewSQLMapper boardReviewSQLMapper;
	
	@Autowired
	private PartyBoardSQLMapper partyBoardSQLMapper;	
	
	@Autowired
	private SharePlanSQLMapper sharePlanSQLMapper;
	
	@Autowired
	private MyPagePickSQLMapper myPagePickSQLMapper;
	@Autowired
	private ClassDetailSQLMapper classDetailSQLMapper;
	
	@Autowired
	private ClassboardSQLMapper classboardSQLMapper;
	@Autowired
	private ClassReserveSQLMapper classReserveSQLMapper;
	
	//마이페이지 메인에서 프로필 사진 출력 오별
	public HashMap<String, Object> getMyProfile(int jet_member_no){
		
		MemberVo memberVo = memberSQLMapper.selectByNo(jet_member_no);
		//멤버 정보 출력
		
		ArrayList<MemberImageVo> imageVoList = memberImageSQLMapper.selectByMemberNo(jet_member_no);
		//이미지 리스트 출력
		
		//csBoardVo + memberVo  뽑아오기 이제 hashMap으로 엮자
		HashMap<String, Object> map = new HashMap<String, Object>();
	
		map.put("memberVo", memberVo);
		map.put("imageVoList", imageVoList);
		
		return map;	
		
	}
		
	 public ArrayList<HashMap<String, Object>> get_Review_Board(int jet_member_no){
			
		 ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
			
			ArrayList<BoardReviewVo> boardReviewList = myPageSQLMapper.selectReview(jet_member_no);
			
			System.out.println("서비스 멤버넘버 :" + jet_member_no);
			
			for(BoardReviewVo boardReviewVo : boardReviewList) {
				
				int member_no = boardReviewVo.getJet_member_no();

				MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
				
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("memberVo", memberVo);
				map.put("boardReviewVo", boardReviewVo);
				
			
				
				resultList.add(map);
				
			}
			return resultList;
	 }
	 
	 public ArrayList<HashMap<String, Object>> get_Free_Board(int jet_member_no){
		 ArrayList<HashMap<String, Object>> freeList = new ArrayList<HashMap<String,Object>>();
		 
		 ArrayList<FreeboardVo> boardFreeList = myPageSQLMapper.selectFree(jet_member_no);
		 
		 for(FreeboardVo freeboardVo : boardFreeList) {
			 
			 int member_no = freeboardVo.getJet_member_no();
			 
			 MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
			 
			 HashMap<String, Object> map = new HashMap<String, Object>();
			 
			 map.put("freeboardVo",freeboardVo);
			 map.put("memberVo",memberVo);
			 
			 freeList.add(map);
			 
		 }
		 return freeList;
	 }
	 
	 
	 public ArrayList<HashMap<String, Object>> get_knowhow_Board(int jet_member_no){
		 ArrayList<HashMap<String, Object>> knowList = new ArrayList<HashMap<String,Object>>();
		 
		 ArrayList<KnowhowBoardVo> boardKnowList = myPageSQLMapper.selectKnow(jet_member_no);
		 
		 for(KnowhowBoardVo knowhowBoardVo : boardKnowList) {
			 
			 int member_no = knowhowBoardVo.getJet_member_no();
			 
			 MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
			 
			 HashMap<String, Object> map = new HashMap<String, Object>();
			 
			 map.put("knowhowBoardVo",knowhowBoardVo);
			 map.put("memberVo",memberVo);
			 
			 knowList.add(map);
			 
		 }
		 return knowList;
	 }
	 //찜출력
	 public ArrayList<HashMap<String, Object>> get_pick_board(int jet_member_no){
		 ArrayList<HashMap<String, Object>> pickList = new ArrayList<HashMap<String,Object>>();
		 
		 ArrayList<SharePlanBoardVo> boardPickList = myPagePickSQLMapper.selectPickBoard(jet_member_no);
		 
		 for(SharePlanBoardVo sharePlanBoardVo : boardPickList) {
			 
			 int member_no = sharePlanBoardVo.getJet_member_no();
			 
			 MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
			 
			 HashMap<String, Object> map = new HashMap<String, Object>();
			 
			 map.put("sharePlanBoardVo",sharePlanBoardVo);
			 map.put("memberVo",memberVo);
			 
			 pickList.add(map);
		 }
		 return pickList;
		 
	 }
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	 //공지사항에서 내가 쓴 댓글
	 public ArrayList<HashMap<String, Object>> getNoticeWroteMyRepleList(int memberNo) {
		 ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String, Object>>();
		 
		 ArrayList<NoticeRepleVo> repleVoList = myPageSQLMapper.selectRepleNotice(memberNo);
		 
		 for(NoticeRepleVo noticeRepleVo : repleVoList) {
			 //멤버 안뽑아옴 내가쓴 댓글임으로 닉네임 필요없어
			
			 NoticeBoardVo noticeBoardVo = noticeBoardSQLMapper.selectByNo(noticeRepleVo.getJet_board_notice_no());
			 //글 제목 뽑아와야함
			 
			 HashMap<String, Object> map = new HashMap<String, Object>();
			 
			 map.put("noticeRepleVo", noticeRepleVo);
			 map.put("noticeBoardVo", noticeBoardVo);
			 
			 result.add(map);
		 }
		 return result;
	}

	 //자유게시판에서 내가 쓴 댓글
	 public ArrayList<HashMap<String, Object>> getFreeWroteMyRepleList(int memberNo) {
		 ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String, Object>>();
		 
		 ArrayList<FreeboardRepleVo> repleVoList = myPageSQLMapper.selectRepleFree(memberNo);
		 
		 for(FreeboardRepleVo freeboardRepleVo : repleVoList) {
			 //멤버 안뽑아옴 내가쓴 댓글임으로 닉네임 필요없어
			
			 FreeboardVo freeboardVo = freeBoardSQLMapper.selectByNo(freeboardRepleVo.getJet_board_free_no());
			 //글 제목 뽑아와야함
			 
			 HashMap<String, Object> map = new HashMap<String, Object>();
			 
			 map.put("freeboardRepleVo", freeboardRepleVo);
			 map.put("freeboardVo", freeboardVo);
			 
			 result.add(map);
		 }
		 return result;
	}	 
	
	 //노하우에서 내가 쓴 댓글
	 public ArrayList<HashMap<String, Object>> getKonwhowWroteMyRepleList(int memberNo) {
		 ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String, Object>>();
		 
		 ArrayList<KnowhowBoardRepleVo> repleVoList = myPageSQLMapper.selectRepleKnowhow(memberNo);
		 
		 for(KnowhowBoardRepleVo knowhowBoardRepleVo : repleVoList) {
			 //멤버 안뽑아옴 내가쓴 댓글임으로 닉네임 필요없어
			
			 KnowhowBoardVo knowhowBoardVo = knowhowBoardSQLMapper.selectByNo(knowhowBoardRepleVo.getJet_board_knowhow_no());
			 //글 제목 뽑아와야함
			 
			 HashMap<String, Object> map = new HashMap<String, Object>();
			 
			 map.put("knowhowBoardRepleVo", knowhowBoardRepleVo);
			 map.put("knowhowBoardVo", knowhowBoardVo);
			 
			 result.add(map);
		 }
		 return result;
	}

	 //리뷰게시판에서 내가 쓴 댓글
	 public ArrayList<HashMap<String, Object>> getReviewWroteMyRepleList(int memberNo) {
		 ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String, Object>>();
		 
		 ArrayList<ReviewRepleVo> repleVoList = myPageSQLMapper.selectRepleReview(memberNo);
		 
		 for(ReviewRepleVo reviewRepleVo : repleVoList) {
			 //멤버 안뽑아옴 내가쓴 댓글임으로 닉네임 필요없어
			
			 BoardReviewVo boardReviewVo = boardReviewSQLMapper.selectByNo(reviewRepleVo.getJet_board_review_no());
			 //글 제목 뽑아와야함
			 
			 HashMap<String, Object> map = new HashMap<String, Object>();
			 
			 map.put("reviewRepleVo", reviewRepleVo);
			 map.put("boardReviewVo", boardReviewVo);
			 
			 result.add(map);
		 }
		 return result;
	 }

	 //여행 친구 찾기 에서 내가 쓴 댓글
	 public ArrayList<HashMap<String, Object>> getPartyWroteMyRepleList(int memberNo) {
		 ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String, Object>>();
		 
		 ArrayList<PartyBoardAttendVo> repleVoList = myPageSQLMapper.selectRepleParty(memberNo);
		 
		 for(PartyBoardAttendVo partyBoardAttendVo : repleVoList) {
			 //멤버 안뽑아옴 내가쓴 댓글임으로 닉네임 필요없어
			
			 PartyBoardVo partyBoardVo = partyBoardSQLMapper.selectByNo(partyBoardAttendVo.getJet_board_party_no());
			 //글 제목 뽑아와야함
			 
			 HashMap<String, Object> map = new HashMap<String, Object>();
			 
			 map.put("partyBoardAttendVo", partyBoardAttendVo);
			 map.put("partyBoardVo", partyBoardVo);
			 
			 result.add(map);
		 }
		 return result;
	}	 
	 
	 //여행 계획 공유 게시판 에서 내가 쓴 댓글
	 public ArrayList<HashMap<String, Object>> getShareWroteMyRepleList(int memberNo) {
		 ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String, Object>>();
		 
		 ArrayList<SharePlanRepleVo> repleVoList = myPageSQLMapper.selectRepleSharePlan(memberNo);
		 
		 for(SharePlanRepleVo sharePlanRepleVo : repleVoList) {
			 //멤버 안뽑아옴 내가쓴 댓글임으로 닉네임 필요없어
			
			 SharePlanBoardVo sharePlanBoardVo = sharePlanSQLMapper.selectByNo(sharePlanRepleVo.getJet_board_shareplan_no());
			 //글 제목 뽑아와야함
			 
			 HashMap<String, Object> map = new HashMap<String, Object>();
			 
			 map.put("sharePlanRepleVo", sharePlanRepleVo);
			 map.put("sharePlanBoardVo", sharePlanBoardVo);
			 
			 result.add(map);
		 }
		 return result;
	}		 
	 
	 //////////////////////////////////////////////////////////////////////////좋지않아요
	 public ArrayList<HashMap<String, Object>> get_Review_Like(int jet_member_no){
			ArrayList<HashMap<String, Object>> reviewLikeList = new ArrayList<HashMap<String,Object>>();
			
			ArrayList<ReviewLikeVo> boardReviewLikeList = myPageSQLMapper.selectReview_like(jet_member_no);
			
			
			for(ReviewLikeVo reviewLikeVo : boardReviewLikeList) {
				
				BoardReviewVo boardReviewVo = boardReviewSQLMapper.selectByNo(reviewLikeVo.getJet_board_review_no());
				
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("reviewLikeVo", reviewLikeVo);
				map.put("boardReviewVo", boardReviewVo);
				
			
				
				reviewLikeList.add(map);
				
			}
			return reviewLikeList;
	 }
	 
	 public ArrayList<HashMap<String, Object>> get_Free_Like(int jet_member_no){
		 ArrayList<HashMap<String, Object>> freeLikeList = new ArrayList<HashMap<String,Object>>();
		 
		 ArrayList<FreeboardLikeVo> boardFreeLikeList = myPageSQLMapper.selectFree_like(jet_member_no);
		 
		 for(FreeboardLikeVo freeboardLikeVo : boardFreeLikeList) {
			 
			 FreeboardVo freeBoardVo = freeBoardSQLMapper.selectByNo(freeboardLikeVo.getJet_board_free_no());
			 
			 
			 HashMap<String, Object> map = new HashMap<String, Object>();
			 
			 map.put("freeboardLikeVo",freeboardLikeVo);
			 map.put("freeBoardVo",freeBoardVo);
			 
			 freeLikeList.add(map);
			 
		 }
		 return freeLikeList;
	 }
	 
	 
	 public ArrayList<HashMap<String, Object>> get_knowhow_Like(int jet_member_no){
		 ArrayList<HashMap<String, Object>> knowLikeList = new ArrayList<HashMap<String,Object>>();
		 
		 ArrayList<KnowhowBoardLikeVo> boardKnowList = myPageSQLMapper.selectKnowhow_like(jet_member_no);
		 
		 for(KnowhowBoardLikeVo knowhowBoardLikeVo : boardKnowList) {
			 
			 KnowhowBoardVo knowhowBoardVo = knowhowBoardSQLMapper.selectByNo(knowhowBoardLikeVo.getJet_board_knowhow_no());
			 
			 HashMap<String, Object> map = new HashMap<String, Object>();
			 
			 map.put("knowhowBoardLikeVo",knowhowBoardLikeVo);
			 map.put("knowhowBoardVo",knowhowBoardVo);
			 
			 knowLikeList.add(map);
			 
		 }
		 return knowLikeList;
	 }
	 
	 public ArrayList<HashMap<String, Object>> get_shareplan_Like(int jet_member_no){
		 ArrayList<HashMap<String, Object>> sharepLikelanList = new ArrayList<HashMap<String,Object>>();
		 
		 ArrayList<SharePlanLikeVo> shareplanBoardList = myPageSQLMapper.selectSharePlan_like(jet_member_no);
		 
		 for(SharePlanLikeVo sharePlanLikeVo : shareplanBoardList) {
			 
			 SharePlanBoardVo sharePlanBoardVo = sharePlanSQLMapper.selectByNo(sharePlanLikeVo.getJet_board_shareplan_no());

			 HashMap<String, Object> map = new HashMap<String, Object>();
			 
			 map.put("sharePlanLikeVo",sharePlanLikeVo);
			 map.put("sharePlanBoardVo",sharePlanBoardVo);
			 
			 sharepLikelanList.add(map);
			 
		 }
		 return sharepLikelanList;
	 }
	 public ArrayList<HashMap<String, Object>> get_shareplan_Board(int jet_member_no){
		 ArrayList<HashMap<String, Object>> shareplanList = new ArrayList<HashMap<String,Object>>();
		 
		 ArrayList<SharePlanBoardVo> shareplanBoardList = myPageSQLMapper.selectJet(jet_member_no);
		 
		 for(SharePlanBoardVo sharePlanBoardVo : shareplanBoardList) {
			 
			 int member_no = sharePlanBoardVo.getJet_member_no();
			 
			 MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
			 
			 HashMap<String, Object> map = new HashMap<String, Object>();
			 
			 map.put("sharePlanBoardVo",sharePlanBoardVo);
			 map.put("memberVo",memberVo);
			 
			 shareplanList.add(map);
			 
		 }
		 return shareplanList;
	 }
	 
	 //모집중파티
	 public ArrayList<HashMap<String, Object>> get_party_board(int jet_member_no){
		 ArrayList<HashMap<String, Object>> partyList = new ArrayList<HashMap<String,Object>>();
		 
		 ArrayList<PartyBoardVo> partyBoardList = myPageSQLMapper.selectParty(jet_member_no);
		 
		 for(PartyBoardVo partyBoardVo : partyBoardList) {
			 
			 HashMap<String, Object> map = new HashMap<String, Object>();
			 
			 map.put("partyBoardVo",partyBoardVo);
			 
			 partyList.add(map);
		 }
		 return partyList;
	 }
	 //참가중인 파티
	 public ArrayList<HashMap<String, Object>> get_attend_party(int jet_member_no){
		 ArrayList<HashMap<String, Object>> attendList = new ArrayList<HashMap<String,Object>>();
		 
		 ArrayList<PartyBoardAttendVo> partyAttendList = myPageSQLMapper.selectAttend(jet_member_no);
		 
		 for(PartyBoardAttendVo partyBoardAttendVo : partyAttendList) {
			 
			 PartyBoardVo partyBoardVo = partyBoardSQLMapper.selectByNo(partyBoardAttendVo.getJet_board_party_no());
			 
			 HashMap<String, Object> map = new HashMap<String, Object>();
			 
			 map.put("partyBoardAttendVo",partyBoardAttendVo);
			 map.put("partyBoardVo",partyBoardVo);
			 
			 attendList.add(map);
			 
		 }
		 return attendList;
	 
	 }
	 
	 public int myWriteBoardCT (int jet_member_no) {
		 
		 return myPageSQLMapper.myWriteBoardCT(jet_member_no);
	 }
	 
	 public int myWriteRepleCT (int jet_member_no) {
		 
		 return myPageSQLMapper.myWriteRepleCT(jet_member_no);
				 
	 }
	 //등업신청
	 public void memberUpgrade(MemberUpgradeVo vo) {
		 
		 myPageSQLMapper.memberUpgrade(vo);
	 }
	 //등업확인
	 public MemberUpgradeVo upgradeCheck(MemberVo sessionMemberVo) {
		 
		 MemberUpgradeVo memberUpgradeVo =  myPageSQLMapper.selectMemberNo(sessionMemberVo.getJet_member_no());
		 return memberUpgradeVo;
	 }
	 
	// 글 목록 보기. 원데이클래스 목록 보기
		public ArrayList<HashMap<String, Object>> myDetailClassList(int jet_member_no) {
			ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();

			ArrayList<ClassDetailVo> detailList = myPageSQLMapper.selectMydetailClassList(jet_member_no);

			for (ClassDetailVo classDetailVo : detailList) {
				int class_no = classDetailVo.getJet_class_no();
				
				ClassboardVo classboardVo = classboardSQLMapper.selectByNo(class_no); // ClassVo에 detailVo에 있는 class_no 세팅
				
				// 예약 현황
				int countReserve = classReserveSQLMapper.countReserve(classDetailVo.getJet_class_detail_no());

				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("classboardVo", classboardVo);
				map.put("classDetailVo", classDetailVo);
				map.put("countReserve", countReserve);

				resultList.add(map);
				
			}
			System.out.println("[sdasfzxvzx]"+resultList);
			return resultList;
		}
		
		// 나의 예약 리스트
		public ArrayList<HashMap<String, Object>> myReservationList(int jet_member_no) {

			ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();
			ArrayList<ClassReservationVo> reserveVoList = classReserveSQLMapper.selectMyReservations(jet_member_no);

			for (ClassReservationVo reserveVo : reserveVoList) {

				int jet_class_detail_no = reserveVo.getJet_class_detail_no();
				ClassDetailVo classDetailVo = classDetailSQLMapper.selectByNo(jet_class_detail_no);

				int jet_class_no = classDetailVo.getJet_class_no();
				ClassboardVo classboardVo = classboardSQLMapper.selectByNo(jet_class_no);

				HashMap<String, Object> map = new HashMap<String, Object>();

				map.put("reserveVo", reserveVo);
				map.put("classDetailVo", classDetailVo);
				map.put("classboardVo", classboardVo);
				
				resultList.add(map);
				
			}
			return resultList;
		}	
		
		//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
		 //파티 참가중인 멤버들 나 빼고 오별0225
		 public ArrayList<HashMap<String, Object>> getPartyRatingList(int jet_board_party_no,int jet_member_no){
			 
			 ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String,Object>>();
			 
			 ArrayList<MemberVo> memberList = myPageSQLMapper.selectPartyAttendMemberVo(jet_board_party_no, jet_member_no);
			 
			 for(MemberVo memberVo : memberList) {
				
				 HashMap<String, Object> map = new HashMap<String, Object>();
					
				map.put("memberVo", memberVo);
				
				result.add(map);
			 }
			 
			 return result;
		 }
}
