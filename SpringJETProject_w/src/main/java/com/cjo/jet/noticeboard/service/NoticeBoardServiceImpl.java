package com.cjo.jet.noticeboard.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjo.jet.member.mapper.MemberSQLMapper;
import com.cjo.jet.noticeboard.mapper.NoticeBoardSQLMapper;
import com.cjo.jet.noticeboard.mapper.NoticeImageSQLMapper;
import com.cjo.jet.noticeboard.mapper.NoticeLikeSQLMapper;
import com.cjo.jet.noticeboard.mapper.NoticeRepleSQLMapper;
import com.cjo.jet.vo.CsBoardImageVo;
import com.cjo.jet.vo.MemberVo;
import com.cjo.jet.vo.NoticeBoardVo;
import com.cjo.jet.vo.NoticeImageVo;
import com.cjo.jet.vo.NoticeLikeVo;
import com.cjo.jet.vo.NoticeRepleVo;
import com.cjo.jet.vo.NoticeSingoVo;

@Service
public class NoticeBoardServiceImpl {

	@Autowired
	private NoticeBoardSQLMapper noticeBoardSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper; 
	
	@Autowired
	private NoticeRepleSQLMapper noticeRepleSQLMapper;
	
	@Autowired
	private NoticeLikeSQLMapper noticeLikeSQLMapper;
	
	@Autowired
	private NoticeImageSQLMapper noticeImageSQLMapper;
	
	//공지사항 글쓰기 ArrayList<NoticeImageVo> imageVoList
	public void writeNoticeBoard(NoticeBoardVo vo,ArrayList<NoticeImageVo> imageVoList) {
		
		int noticePK = noticeBoardSQLMapper.creatKey();
		//공지사항 프라이머리 키 생성
		
		System.out.println("[noticePK] : " + noticePK);
		System.out.println("jet_member_no..?관리자 넘버? : " +vo.getJet_member_no());
		vo.setJet_board_notice_no(noticePK);
		
		noticeBoardSQLMapper.insert(vo);
		
		//이미지
		for(NoticeImageVo imageVo : imageVoList) {
			imageVo.setJet_board_notice_no(noticePK);
			//이미지 출력시 여기서 실수 난 image_no 에 넣어버림 시발
			noticeImageSQLMapper.insert(imageVo);
		}
	}
	
	//공지사항 리스트 출력
	public ArrayList<HashMap<String, Object>> getNoticeBoardList(int page_num) {
		
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<NoticeBoardVo> noticeBoardList = null;
		
		noticeBoardList = noticeBoardSQLMapper.selectAll(page_num);
		
		for(NoticeBoardVo noticeBoardVo : noticeBoardList) {
			
			int member_no = noticeBoardVo.getJet_member_no();
			MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
			
			int repleCount = noticeRepleSQLMapper.repleCount(noticeBoardVo.getJet_board_notice_no());
			//리플 갯수 출력
			
			int likeCount = noticeLikeSQLMapper.likeCount(noticeBoardVo.getJet_board_notice_no());
			//좋아요 갯수 출력
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("noticeBoardVo", noticeBoardVo);
			map.put("memberVo", memberVo);
			map.put("repleCount", repleCount);
			map.put("likeCount", likeCount);
			
			
			resultList.add(map);
		}
		return resultList;
	}
	
	//페이지 갯수
	public int getPageCount() {	
		return noticeBoardSQLMapper.getPageCount();
	}
	

	//글읽기
	public HashMap<String, Object> getNoticeBoard(int jet_board_notice_no){
		
		noticeBoardSQLMapper.increaseReadcount(jet_board_notice_no);
		//조회수 연동 완료
		
		NoticeBoardVo noticeBoardVo = noticeBoardSQLMapper.selectByNo(jet_board_notice_no);
		
		//read 할때 엔터가 안되는거 고치기.
		String str = noticeBoardVo.getJet_board_notice_content();
		str = StringEscapeUtils.escapeHtml4(str);
		str = str.replaceAll("\n", "<br>");
		noticeBoardVo.setJet_board_notice_content(str);
		
		int jet_member_no = noticeBoardVo.getJet_member_no();
		MemberVo memberVo = memberSQLMapper.selectByNo(jet_member_no);
		//이건 글쓴 사람의 memberVo
		
		ArrayList<NoticeImageVo> imageVoList = noticeImageSQLMapper.selectByContentNo(jet_board_notice_no);
		//이미지 리스트 출력
		
		//csBoardVo + memberVo  뽑아오기 이제 hashMap으로 엮자
		HashMap<String, Object> map = new HashMap<String, Object>();
	
		map.put("noticeBoardVo", noticeBoardVo);
		map.put("memberVo", memberVo);
		map.put("imageVoList", imageVoList);
		
		
		return map;	
	}
	
	//글삭제
	public void deleteNoticeBoard(int contentNo) {
		noticeBoardSQLMapper.deleteByNo(contentNo);
	}
	
	//글 수정
	public void updateNoticeBoard(NoticeBoardVo vo) {
		
		
		noticeBoardSQLMapper.update(vo);
	}	

//--------------------------------------------------------
	//리플 쓰기
	public void writeNoticeReple(NoticeRepleVo vo) {
		
		noticeRepleSQLMapper.insert(vo);
	}
	//리플 출력
	public ArrayList<HashMap<String, Object>> getNoticeRepleList(int contentNo) {

		ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<NoticeRepleVo> repleVoList = noticeRepleSQLMapper.selectByContentNo(contentNo);
		
		for(NoticeRepleVo noticeRepleVo : repleVoList) {
		
			MemberVo memberVo = memberSQLMapper.selectByNo(noticeRepleVo.getJet_member_no());
	
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("memberVo", memberVo);
			map.put("noticeRepleVo", noticeRepleVo);
			
			result.add(map);	
		}
		return result;
	}
	
	//리플 갯수 출력
	public int getNoticeRepleCount(int contentNo) {
		return noticeRepleSQLMapper.repleCount(contentNo);
	}
	
	//리플 삭제
	public void deleteReple(int repleNo) {
		noticeRepleSQLMapper.deleteReple(repleNo);
	}

//------------------------------------------------------------------
	//좋아요 기능 
	public void noticeLikeInsert(NoticeLikeVo vo) {
		noticeLikeSQLMapper.insertLike(vo);
	}
	
	//좋아요 취소
	public void deleteLikeNotice(int jet_board_notice_no,int jet_member_no) {
		noticeLikeSQLMapper.deleteLike(jet_board_notice_no,jet_member_no);
	}
	
	//좋아요 갯수
	public int getNoticeLikeCount(int contentNo) {
		return noticeLikeSQLMapper.likeCount(contentNo);
	}
	
	//한개의 글 당 좋아요 의 VO
	public NoticeLikeVo getNoticeLikeVo(int contentNo,MemberVo memberLikeVo) {
	
		NoticeLikeVo noticeLikeVo = noticeLikeSQLMapper.selectByNo(contentNo,memberLikeVo.getJet_member_no());
		
		return noticeLikeVo;
		
	}	

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	//신고 인서트
	public void singoInsert(NoticeSingoVo vo) {
		noticeBoardSQLMapper.insertSingo(vo);
	}
	
	//신고자 체크
	public NoticeSingoVo checksingo(int notice_no,MemberVo singoMemberVo)  {
		
		NoticeSingoVo noticesingoVo = noticeBoardSQLMapper.selectSingoByNo(notice_no,singoMemberVo.getJet_member_no());
		
		return noticesingoVo;
	}
	
	//노티스 글의 모든 신고 출력 [관리자 페이지에서]
	public ArrayList<HashMap<String, Object>> getNoticeSingoList() {
		
		ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<NoticeSingoVo> noticesingoList = noticeBoardSQLMapper.selectAllSingoNoPage();
		
		for(NoticeSingoVo noticeSingoVo : noticesingoList) {
			int singoMember_no = noticeSingoVo.getJet_member_no();
			MemberVo singoMemberVo = memberSQLMapper.selectByNo(singoMember_no);
			
			int noticeNo = noticeSingoVo.getJet_board_notice_no();
			NoticeBoardVo noticeBoardVo= noticeBoardSQLMapper.selectByNo(noticeNo);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("noticeSingoVo", noticeSingoVo);
			map.put("singoMemberVo", singoMemberVo);
			map.put("noticeBoardVo", noticeBoardVo);
			
			
			result.add(map);
		}
		
		return result;
	}




}
