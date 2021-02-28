package com.cjo.jet.mypage.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.cjo.jet.vo.BoardReviewVo;
import com.cjo.jet.vo.ClassDetailVo;
import com.cjo.jet.vo.FreeboardLikeVo;
import com.cjo.jet.vo.FreeboardRepleVo;
import com.cjo.jet.vo.FreeboardVo;
import com.cjo.jet.vo.KnowhowBoardLikeVo;
import com.cjo.jet.vo.KnowhowBoardRepleVo;
import com.cjo.jet.vo.KnowhowBoardVo;
import com.cjo.jet.vo.MemberUpgradeVo;
import com.cjo.jet.vo.MemberVo;
import com.cjo.jet.vo.NoticeRepleVo;
import com.cjo.jet.vo.PartyBoardAttendVo;
import com.cjo.jet.vo.PartyBoardVo;
import com.cjo.jet.vo.ReviewCommentVo;
import com.cjo.jet.vo.ReviewLikeVo;
import com.cjo.jet.vo.ReviewRepleVo;
import com.cjo.jet.vo.SharePlanBoardVo;
import com.cjo.jet.vo.SharePlanLikeVo;
import com.cjo.jet.vo.SharePlanRepleVo;

public interface MyPageSQLMapper {

	//리뷰 게시글 출력
	public ArrayList<BoardReviewVo>selectReview(int jet_member_no);
	//자유게시판 출력
	public ArrayList<FreeboardVo>selectFree(int jet_member_no);
	//노하우 출력
	public ArrayList<KnowhowBoardVo> selectKnow(int jet_member_no);
	//제트기 출력
	public ArrayList<SharePlanBoardVo> selectJet(int jet_member_no);
	//좋아용
	public ArrayList<ReviewLikeVo>selectReview_like(int jet_member_no);
	
	public ArrayList<SharePlanLikeVo>selectSharePlan_like(int jet_member_no);
	
	public ArrayList<FreeboardLikeVo>selectFree_like(int jet_member_no);
	
	public ArrayList<KnowhowBoardLikeVo>selectKnowhow_like(int jet_member_no);
	
	//내가 모집중인 파티
	public ArrayList<PartyBoardVo>selectParty(int jet_member_no);
	//참여중인 파티
	public ArrayList<PartyBoardAttendVo>selectAttend(int jet_member_no);
	
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	//공지사항에서 내가쓴 댓글
	public ArrayList<NoticeRepleVo> selectRepleNotice(int jet_member_no);
	
	//자유게시판에서 내가쓴 댓글
	public ArrayList<FreeboardRepleVo> selectRepleFree(int jet_member_no);
	
	//노하우 에서 내가쓴 댓글
	public ArrayList<KnowhowBoardRepleVo> selectRepleKnowhow(int jet_member_no);
	
	//리뷰 게시판에서 내가쓴 댓글
	public ArrayList<ReviewRepleVo> selectRepleReview(int jet_member_no);
	
	//친구찾기에서 내가쓴 댓글
	public ArrayList<PartyBoardAttendVo> selectRepleParty(int jet_member_no);
	
	//여행공유에서 내가쓴 댓글
	public ArrayList<SharePlanRepleVo> selectRepleSharePlan(int jet_member_no);
	
	//내가 쓴 글 수
	public int myWriteBoardCT(int jet_member_no);
	//내가 쓴 댓글 수
	public int myWriteRepleCT(int jet_member_no);
	
	//등급업 입력
	public void memberUpgrade(MemberUpgradeVo vo);
	//등급업 체크
	public MemberUpgradeVo selectMemberNo(int jet_member_no);
	//등급업 신청 리스트
	public ArrayList<MemberUpgradeVo> memberUpgradeAply();
	//등급원 인원수
	public int memberUpgradeCt();
	
	//나의 클래스
	public ArrayList<ClassDetailVo> selectMydetailClassList(int member_no);
	//나를 제외한 파티 참가자들의 MemnerVo 오별
	public ArrayList<MemberVo> selectPartyAttendMemberVo(@Param("jet_board_party_no") int jet_board_party_no,@Param("jet_member_no") int jet_member_no);
}
