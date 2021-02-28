package com.cjo.jet.freeboard.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjo.jet.freeboard.mapper.FreeboardImageSQLMapper;
import com.cjo.jet.freeboard.mapper.FreeboardSQLMapper;
import com.cjo.jet.member.mapper.MemberSQLMapper;
import com.cjo.jet.vo.*;

@Service
public class FreeboardServiceImpl {
	@Autowired
	private FreeboardSQLMapper freeboardSQLMapper;
	
	@Autowired
	private FreeboardImageSQLMapper freeboardImageSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	public void writeFreeboard(FreeboardVo vo, ArrayList<FreeboardImageVo> freeboardImageVo) {
		
		int freeboardPK = freeboardSQLMapper.createKey();
		vo.setJet_board_free_no(freeboardPK);	//글 넘버를 PK에 넣어줌
		freeboardSQLMapper.insert(vo);
		
		//이미지 업로드..
		for(FreeboardImageVo imageVo : freeboardImageVo) {
			imageVo.setJet_board_free_no(freeboardPK); 	
			freeboardImageSQLMapper.insertImage(imageVo);
		}
	}	
	
	public ArrayList<HashMap<String, Object>> getFreeboardList(String search_word , String search_type, int page_num, Integer jet_board_free_category_no){
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>(); 
		
		ArrayList<FreeboardVo> freeboardList = null;
		
		//검색 기능
		if(jet_board_free_category_no == null && (search_word == null || search_type == null)) {
			freeboardList = freeboardSQLMapper.selectAll(page_num);
		}else if(jet_board_free_category_no != null){
			
			switch (Integer.valueOf(jet_board_free_category_no)) {
			case 1:
			case 2:
			case 3:		
				freeboardList = freeboardSQLMapper.selectByCategoryNo(jet_board_free_category_no);
				
				break;
			}
		}else {
			if(search_type.equals("title")) {
				freeboardList = freeboardSQLMapper.selectByTitle(search_word);
			}else if(search_type.equals("content")) {
				freeboardList = freeboardSQLMapper.selectByContent(search_word);
			}else if(search_type.equals("writer")) {
				freeboardList = freeboardSQLMapper.selectByWriter(search_word);
			}else {
				freeboardList = freeboardSQLMapper.selectAll(page_num);
			}
		}
		
		//ArrayList<FreeboardVo> freeboardList = null;
		//리스트 출력할 때 MemberVo의 닉네임을 뽑아오기 위해...
		for(FreeboardVo freeboardVo : freeboardList) {
			int member_no = freeboardVo.getJet_member_no();
			MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
			
			//카테고리 넘버
			int category_no = freeboardVo.getJet_board_free_category_no();
			FreeboardCategoryVo freeboardCategoryVo = freeboardSQLMapper.selectByCNo(category_no);
			
			//리플 개수도 같이 뽑기
			int repleCount = freeboardSQLMapper.getRepleCount(freeboardVo.getJet_board_free_no());
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("memberVo", memberVo);  
			map.put("freeboardVo", freeboardVo);
			map.put("freeboardCategoryVo", freeboardCategoryVo);
			map.put("repleCount", repleCount);
			
			resultList.add(map);
		}
		return resultList;
	}

	//글보기
	public HashMap<String, Object> getFreeboardContent(int jet_board_free_no){
		
		// 조회수 증가 쿼리 추가
		freeboardSQLMapper.increaseReadCount(jet_board_free_no);
		
		//게시글
		FreeboardVo freeboardVo = freeboardSQLMapper.selectByNo(jet_board_free_no);
		FreeboardCategoryVo freeboardCategoryVo = freeboardSQLMapper.selectByCNo(freeboardVo.getJet_board_free_category_no());

		String str = freeboardVo.getJet_board_free_content();
		str = StringEscapeUtils.escapeHtml4(str);
		str = str.replaceAll("\n", "<br>");		//Enter를 br로 바꾸기.
		freeboardVo.setJet_board_free_content(str);
		
		int member_no = freeboardVo.getJet_member_no();
		MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
		
		int repleCount = freeboardSQLMapper.getRepleCount(freeboardVo.getJet_board_free_no());
		
		//이미지 업로드 출력
		ArrayList<FreeboardImageVo> freeboardImageVo = freeboardImageSQLMapper.selectByFreeboardNo(jet_board_free_no);
		
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("memberVo", memberVo);
		map.put("freeboardVo", freeboardVo);
		map.put("repleCount", repleCount);
		map.put("freeboardCategoryVo", freeboardCategoryVo);
		map.put("freeboardImageVo", freeboardImageVo);
		
		return map;
	}
	
//	public ArrayList<HashMap<String, Object>> checkLike(int jet_board_free_no, int jet_member_no) {
//		ArrayList<HashMap<String, Object>> checkList = new ArrayList<HashMap<String,Object>>();
//		ArrayList<FreeboardLikeVo> checkVo = freeboardSQLMapper.checkLike(jet_board_free_no, jet_member_no);
//		
//		for(FreeboardLikeVo freeboardLikeVo : checkVo) {
//			int member_no = freeboardLikeVo.getJet_member_no();
//			int board_no = freeboardLikeVo.getJet_board_free_no();
//			
//			ArrayList<FreeboardLikeVo> memberLikeVo = freeboardSQLMapper.checkLike(member_no, board_no);
//			HashMap<String, Object> map = new HashMap<String, Object>();
//			map.put("memberLikeVo", memberLikeVo);
//			
//			checkList.add(map);
//		}
//		return checkList;
//	}	이거 대신 밑에 코드.
	
	//좋아요 관련.
	public FreeboardLikeVo getLikeVo(int jet_board_free_no, MemberVo session) {
		FreeboardLikeVo freeboardLikeVo = freeboardSQLMapper.checkLike(jet_board_free_no, session.getJet_member_no());
		return freeboardLikeVo;
	}
	
	public void likeFreeboard(FreeboardLikeVo vo) {
		freeboardSQLMapper.insertLike(vo);
	}
	
	public void dislikeFreeboard(FreeboardLikeVo vo) {
		freeboardSQLMapper.deleteLike(vo);
	}
	
	//좋아요 갯수
	public int getLikeCount(int jet_board_free_no) {
		return freeboardSQLMapper.getLikeCount(jet_board_free_no);
	}
	
	
	//삭제
	public void deleteFreeboard(int freeboard_no) {
		freeboardSQLMapper.deleteByNo(freeboard_no);
	}
	
	//수정
	public void updateFreeboard(FreeboardVo vo) {
		freeboardSQLMapper.update(vo);
	}

	
	//Pagination
	public int getPageCount() {
		return freeboardSQLMapper.getPageCount();
	}	
	
	//리플 쓰기 프로세스
	public void writeRepleProcess(FreeboardRepleVo vo) {
		freeboardSQLMapper.insertReple(vo);
		
	}
	
	//리플 출력..
	public ArrayList<HashMap<String, Object>> readFreeboardReple(int jet_board_free_no) {
		
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<FreeboardRepleVo> repleVoList = freeboardSQLMapper.selectReple(jet_board_free_no);
		
		for(FreeboardRepleVo freeboardRepleVo : repleVoList) {
			int member_no = freeboardRepleVo.getJet_member_no();
			
			MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("memberVo", memberVo);
			map.put("freeboardRepleVo", freeboardRepleVo);
			
			resultList.add(map);
		}
		return resultList;
	}

	
	//댓글 삭제
	public void deleteReple(int jet_board_free_reple_no) {
		freeboardSQLMapper.deleteReple(jet_board_free_reple_no);
	}
	//댓글 수정
	public void updateReple(FreeboardRepleVo vo) {
		freeboardSQLMapper.updateReple(vo);
	}
	
	//신고
	public void insertReport(FreeboardReportVo vo) {
		freeboardSQLMapper.insertReport(vo);
		
	}

	public FreeboardReportVo checkReport(int jet_board_free_no, MemberVo vo) {
		FreeboardReportVo reportVo = freeboardSQLMapper.selectReportByNo(jet_board_free_no, vo.getJet_member_no());
		return reportVo;
	}
	
	
	
	
}
