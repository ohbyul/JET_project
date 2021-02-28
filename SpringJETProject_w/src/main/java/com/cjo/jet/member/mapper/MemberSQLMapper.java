package com.cjo.jet.member.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.cjo.jet.vo.FriendsVo;
import com.cjo.jet.vo.InterestVo;
import com.cjo.jet.vo.MemberStatusVo;
import com.cjo.jet.vo.MemberVo;
import com.sun.org.glassfish.gmbal.ParameterNames;

public interface MemberSQLMapper {
	//기본키
	public int createKey();
	//회원 가입 시 사용자 정보 추가
	public void insertMember(MemberVo vo);
	//회원 가입 시 관심사 정보 추가
	public void insertInterest(InterestVo vo);
	
	public void updateMemberInfo(MemberVo vo);
	
	public void updateMemberInterest(InterestVo vo);
	//로그인
	public MemberVo selectByIdAndPW(MemberVo vo);
	//비밀번호 확인 용
	public MemberVo selectByPw(MemberVo vo);
	//멤버 no 뽑아오기
	public MemberVo selectByNo(int no);
	//아이디 중복 확인
	public MemberVo selectById(String id);
	//관심사 no값 뽑아오기
	public ArrayList<InterestVo> selectInterestByNo(int no); //<==arrayList로 가져와 보기 0121
	//친구 찾기 본인 제외 리스트
	public ArrayList<MemberVo> selectMemberNotMe(@Param("page_num")int page_num, @Param("jet_member_no") int jet_member_no);
	//친구추가
	public void insertFriends(FriendsVo vo);
	//친구 찾기 닉네임 검색
	public ArrayList<MemberVo> selectByMemberNick(String search_word);
	//친구 찾기 카카오 아이디 검색
	public ArrayList<MemberVo> selectByKakao(String search_word);
	//나의 친구 리스트
	public ArrayList<FriendsVo> selectFriends(int page_num);
	
	public MemberVo selectNickByNo(int no);
	//이걸 써먹어야 되는데..
	public int selectNoByNick(String nick);
	//친구 삭제
	public void deleteByNo(int no);
	//친구 찾기 페이징
	public int getFindFriendCount();
	
	public int getPageCount();
	
	public MemberVo selectGradeByNo(int no);
	
	//회원관리
	public ArrayList<MemberVo> selectAll(int page_num);
	public int pageCount();
	//memberID로 검색
	public ArrayList<MemberVo> selectByMemberId(String search_word);
	
	//memberName로 검색
	public ArrayList<MemberVo> selectByName(String search_word);
	 
	//memberNick으로 검색
	public ArrayList<MemberVo> selectByNick(String search_word);
	
	//닉네임 존재 유무 체크
	public String checkByNick(String nick);
	
	//마이페이지 온리 닉네임만 변경 추가 0213 문제시 오별
	public void updateOnlyNick(MemberVo vo);
	//--------------------------------------------------------
	//회원관리
	//회원 상태 insert
	
	public void insertMemberStatus(MemberStatusVo vo);
	//회원 상태 선택
	public MemberStatusVo selectStatByNo(int no);
	//회원 활동 상태 선택
	public String selectActiveStatByNo(int no);
	public MemberStatusVo selectStopMember(int jet_member_no);
	//사용자 정지
	public void updateMemberStatusToN(@Param("jet_stopstate_period_no") int jet_stopstate_period_no,@Param("jet_stopstate_reason_no") int jet_stopstate_reason_no,@Param("jet_member_no") int jet_member_no);
	//사용자 활동
	public void updateMemberStatusToY(int jet_member_no);
	
	public MemberStatusVo selectStopState();
	
	//멤버 등급업
	public void memberUpgradeAply(int jet_member_no);
	//등급업 체크
	public void memberUpgradeAplyCheck(int jet_member_no);
}
