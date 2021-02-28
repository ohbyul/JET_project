package com.cjo.jet.member.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjo.jet.member.mapper.MemberImageSQLMapper;
import com.cjo.jet.member.mapper.MemberSQLMapper;
import com.cjo.jet.mypage.mapper.MyPageSQLMapper;
import com.cjo.jet.util.FBMessageDigest;
import com.cjo.jet.vo.FriendsVo;
import com.cjo.jet.vo.InterestVo;
import com.cjo.jet.vo.MemberImageVo;
import com.cjo.jet.vo.MemberStatusVo;
import com.cjo.jet.vo.MemberUpgradeVo;
import com.cjo.jet.vo.MemberVo;

@Service
public class MemberServiceImpl {
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	@Autowired
	private MemberImageSQLMapper memberImageSQLMapper;
	@Autowired
	private MyPageSQLMapper myPageSQLMapper;
	
	public void joinMember(MemberVo vo, String [] interest_name) {
		
		MemberStatusVo statVo = new MemberStatusVo();
		//String hashCode = FBMessageDigest.messageDigest(vo.getJet_member_pw());
		//vo.setJet_member_pw(hashCode);
		
		//멤버 기본키 생성
		int memberPK = memberSQLMapper.createKey();
		//멤버 키본키 세팅
		vo.setJet_member_no(memberPK);
		statVo.setJet_member_no(memberPK);
		
		memberSQLMapper.insertMemberStatus(statVo);
		memberSQLMapper.insertMember(vo);
		//여행 관심사 부분
		System.out.println("[join member log]" + interest_name);
		if(interest_name != null) {
			System.out.println("[join member log]"+ interest_name);
			for(String interest : interest_name) {
				InterestVo interestVo = new InterestVo();
				interestVo.setjet_interest_name(interest);
				interestVo.setjet_member_no(memberPK);
				
				memberSQLMapper.insertInterest(interestVo);
			}
			
		}
		
	}
	public void updateMember(MemberVo vo, String [] interest_name) {
		
		//String hashCode = FBMessageDigest.messageDigest(vo.getJet_member_pw());
		//vo.setJet_member_pw(hashCode);
		
		System.out.println("[test service interest name]"+ interest_name);
		memberSQLMapper.updateMemberInfo(vo);
		
		if(interest_name != null) {
			for(String interest: interest_name) {
				System.out.println("[test forEach interest]"+interest);
				InterestVo interestVo = new InterestVo();
				interestVo.setjet_interest_name(interest);
				
				memberSQLMapper.updateMemberInterest(interestVo);
			}
		}
		
	}
	
	public MemberVo login(MemberVo param) {
		
		//String hashCode = FBMessageDigest.messageDigest(param.getJet_member_pw());
		//param.setJet_member_pw(hashCode);
		
		MemberVo login =  memberSQLMapper.selectByIdAndPW(param);
		
		return login;
		
		
	}
	public MemberStatusVo checkMemberState(int jet_member_no) {
		return memberSQLMapper.selectStatByNo(jet_member_no);
	}
	public MemberVo checkPw(MemberVo param) {
		
		//String hashCode = FBMessageDigest.messageDigest(param.getJet_member_pw());
		//param.setJet_member_pw(hashCode);
		
		MemberVo checkPw = memberSQLMapper.selectByPw(param);
		
		return checkPw;
	}
	
	//아이디 중복 확인
	public boolean existId(String id) {
		MemberVo vo = memberSQLMapper.selectById(id);
		
		if(vo != null) {
			return true;
		}else {
			return false;
		}
	}
	//닉네임 중복 확인
	public String existNick(String nick) {
		
		String vo = memberSQLMapper.checkByNick(nick);
		
		if(vo != null) {
			return "true";
		}else {
			return "false";
		}
	}
	public ArrayList<MemberVo> getMemberList(int memberNo, String search_word, String search_type, int page_num){
		
		ArrayList<MemberVo> memberList = null; 
		if(search_word == null || search_type == null) {
			memberList = memberSQLMapper.selectMemberNotMe(page_num,memberNo);
		}else {
			if(search_type.equals("member_nick")) {
				memberList = memberSQLMapper.selectByMemberNick(search_word);
						
			}else if(search_type.equals("member_kakao")){
				memberList = memberSQLMapper.selectByKakao(search_word);
			}else {
				memberList = memberSQLMapper.selectMemberNotMe(page_num,memberNo);
			}
		}
		
		return memberList;
	}
	
	public int getFindFriendPageCount() {
		return memberSQLMapper.getFindFriendCount();
	}
	
	public void insertFriends(int member_no, int jet_friends_member_no) {
				
		FriendsVo friendsVo = new FriendsVo();
		friendsVo.setJet_member_no(member_no);
		friendsVo.setJet_friends_member_no(jet_friends_member_no);
		
		memberSQLMapper.insertFriends(friendsVo);
		
	}
	
	public ArrayList<HashMap<String, Object>> getFriendList(int page_num){
		
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<FriendsVo> friendList = null;
		friendList = memberSQLMapper.selectFriends(page_num);
		
		for(FriendsVo friendVo :friendList) {
			int member_no = friendVo.getJet_member_no();
			int friend_no = friendVo.getJet_friends_member_no();
			MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
			MemberVo memberNick = memberSQLMapper.selectNickByNo(friend_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("friendVo", friendVo);
			map.put("memberVo", memberVo);
			map.put("memberNick", memberNick);
			resultList.add(map);
		}
		
		return resultList;
	}
	
	public int getPageCount() {
		return memberSQLMapper.getPageCount();
	}
	public void deleteFriend(int friendsNo) {
		
		memberSQLMapper.deleteByNo(friendsNo);
		
	}
	
	public HashMap<String, Object> getMemberInfo(int memberNo) {
		MemberVo memberVo = memberSQLMapper.selectByNo(memberNo);
		ArrayList<InterestVo> interestVo = memberSQLMapper.selectInterestByNo(memberNo);
		
		int member_no = memberVo.getJet_member_no();
		System.out.println("[test member_no of stat]"+member_no);
		MemberStatusVo memberStatusVo = memberSQLMapper.selectStatByNo(memberVo.getJet_member_no());
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberVo", memberVo);
		map.put("interestVo", interestVo);
		map.put("memberStatusVo", memberStatusVo);
		
		return map;
	}
	//오별 마이페이지 닉네임만 업데이트
	public void updateOnlyNick(MemberVo vo) {
		memberSQLMapper.updateOnlyNick(vo);
	}
	//오별 프로필 사진 인서트
	public void insertProfileImage(int member_no,ArrayList<MemberImageVo> imageVoList) {
		
		for(MemberImageVo imageVo : imageVoList) {
			imageVo.setJet_member_no(member_no);
			memberImageSQLMapper.insert(imageVo);
		}
	}
		
	//회원관리---------------------------------관리자
	public ArrayList<HashMap<String, Object>> getadminMemberManagement(String search_word ,String search_type, int page_num){
		
		ArrayList<HashMap<String, Object>> memberAllList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<MemberVo> memberList = null;
		
		if(search_word == null || search_type == null) {
			memberList = memberSQLMapper.selectAll(page_num);
		}else {
			if(search_type.equals("id")) {	
				memberList = memberSQLMapper.selectByMemberId(search_word);
			}
			else if(search_type.equals("name")) {
				memberList = memberSQLMapper.selectByName(search_word);
			}else if (search_type.equals("nick")) {
				memberList = memberSQLMapper.selectByNick(search_word);
			}else {
				memberList = memberSQLMapper.selectAll(page_num);
			}
		}

		for(MemberVo memberVo:memberList) {
			
			MemberStatusVo memberStatusVo = memberSQLMapper.selectStatByNo(memberVo.getJet_member_no());
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("memberStatusVo",memberStatusVo);
			
			memberAllList.add(map);
		}
		
		return memberAllList;
	}
	public int getPageCountForAdmin() {
		return memberSQLMapper.pageCount();
	}
	public ArrayList<HashMap<String, Object>> getStopedMemberList(int page_num){
		
		ArrayList<HashMap<String, Object>> stopedMemberList = new ArrayList<HashMap<String,Object>>();
		ArrayList<MemberVo> memberList = memberSQLMapper.selectAll(page_num);
		
		for(MemberVo memberVo : memberList) {
			
			MemberStatusVo memberStatusVo =  memberSQLMapper.selectStopMember(memberVo.getJet_member_no());
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("memberStatusVo",memberStatusVo);
			
			stopedMemberList.add(map);
		}
		
		return stopedMemberList;
	}
	
	public void updateMemberStatusToN(int jet_stopstate_period_no,int jet_stopstate_reason_no,int jet_member_no) {
		System.out.println("[testservice MemberStatusVo]"+jet_stopstate_period_no + jet_stopstate_reason_no + jet_member_no);
		memberSQLMapper.updateMemberStatusToN(jet_stopstate_period_no, jet_stopstate_reason_no, jet_member_no);
	}
	
	public void updateMemberStatusToY(int jet_member_no) {
	
		memberSQLMapper.updateMemberStatusToY(jet_member_no);
		
	}
	
	//등업신청받자
	public ArrayList<HashMap<String, Object>> getMemberUpgrade(String search_word ,String search_type, int page_num){
	
		ArrayList<HashMap<String, Object>> memberAllList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<MemberVo> memberList = null;
		if(search_word == null || search_type == null) {
			memberList = memberSQLMapper.selectAll(page_num);
		}else {
			if(search_type.equals("id")) {	
				memberList = memberSQLMapper.selectByMemberId(search_word);
			}
			else if(search_type.equals("name")) {
				memberList = memberSQLMapper.selectByName(search_word);
			}else if (search_type.equals("nick")) {
				memberList = memberSQLMapper.selectByNick(search_word);
			}else {
				memberList = memberSQLMapper.selectAll(page_num);
			}
		}
		
		ArrayList<MemberUpgradeVo> memberUpgradeVo = myPageSQLMapper.memberUpgradeAply();
		for(MemberUpgradeVo memberUpgrade : memberUpgradeVo) {
			
			MemberVo memberVo = memberSQLMapper.selectByNo(memberUpgrade.getJet_member_no());
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("memberVo", memberVo);
			map.put("memberUpgradeVo",memberUpgrade);
			memberAllList.add(map);
			
		}

		return memberAllList;
	}
	
	public void memberUpgradeAply(int jet_member_no) {
		memberSQLMapper.memberUpgradeAply(jet_member_no);
	}
	public void memberUpgradeAplyCheck(int jet_member_no) {
		memberSQLMapper.memberUpgradeAplyCheck(jet_member_no);
	}
	
}
