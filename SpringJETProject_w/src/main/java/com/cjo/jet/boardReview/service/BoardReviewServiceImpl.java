package com.cjo.jet.boardReview.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjo.jet.boardReview.mapper.BoardReviewSQLMapper;
import com.cjo.jet.boardReview.mapper.ReviewCommentSQLMapper;
import com.cjo.jet.boardReview.mapper.ReviewImageSQLMapper;
import com.cjo.jet.boardReview.mapper.ReviewLikeSQLMapper;
import com.cjo.jet.boardReview.mapper.ReviewRepleSQLMapper;
import com.cjo.jet.member.mapper.MemberSQLMapper;
import com.cjo.jet.vo.BoardReviewVo;
import com.cjo.jet.vo.MemberVo;
import com.cjo.jet.vo.ReviewCategoryVo;
import com.cjo.jet.vo.ReviewCommentVo;
import com.cjo.jet.vo.ReviewImageVo;
import com.cjo.jet.vo.ReviewLikeVo;
import com.cjo.jet.vo.ReviewRepleVo;

@Service
public class BoardReviewServiceImpl {
	@Autowired
	private BoardReviewSQLMapper boardReviewSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	@Autowired
	private ReviewRepleSQLMapper reviewRepleSQLMapper;
	
	@Autowired
	private ReviewImageSQLMapper reviewImageSQLMapper;
	
	@Autowired
	private ReviewLikeSQLMapper reviewLikeSQLMapper;
	
	@Autowired
	private ReviewCommentSQLMapper reviewCommentSQLMapper; 
	
	
	public void writeReview(BoardReviewVo vo, ArrayList<ReviewImageVo> imageListVo) {
		
		int boardReviewPK = boardReviewSQLMapper.createKey();
		vo.setJet_board_review_no(boardReviewPK);
				
		boardReviewSQLMapper.insertBoardReview(vo);
		
		
		for(ReviewImageVo imageVo : imageListVo) {
			imageVo.setJet_board_review_no(boardReviewPK);
			reviewImageSQLMapper.insert(imageVo);
		}
		

		
	}

	
	
	public ArrayList<HashMap<String, Object>> getBoardReviewList(String search_word, String search_type, int page_num, Integer category_no){
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<BoardReviewVo> boardReviewList = null;
		
		
		
		if((category_no==null || category_no == 0)&&(search_word == null || search_type == null)) {
			boardReviewList = boardReviewSQLMapper.selectAll(page_num);
		}else if(category_no != null){
			switch(Integer.valueOf(category_no)) {
			case 1:
			case 2:
			case 3:
			case 4:
			case 5:
				boardReviewList = boardReviewSQLMapper.selectCategory(category_no);		
				System.out.println(category_no);

				break;
			}
			
		}else{
			if(search_type.equals("title")) {
				
				boardReviewList = boardReviewSQLMapper.selectByTitle(search_word);
			}else if(search_type.equals("content")) {
				boardReviewList = boardReviewSQLMapper.selectByContent(search_word);
			}else if(search_type.equals("writer")) {
				boardReviewList = boardReviewSQLMapper.selectByWriter(search_word);
			}else {
				boardReviewList = boardReviewSQLMapper.selectAll(page_num);
			}
		}
		
		
		
		
		for(BoardReviewVo boardReviewVo : boardReviewList) {
			
			int member_no = boardReviewVo.getJet_member_no();
			
			int repleCount = reviewRepleSQLMapper.repleCount(boardReviewVo.getJet_board_review_no());
			
			int likeCount = reviewLikeSQLMapper.likeCount(boardReviewVo.getJet_board_review_no());
			
			int category = boardReviewVo.getJet_board_review_category_no();
			ReviewCategoryVo categoryVo = boardReviewSQLMapper.selectCategoryNo(category);
			
			MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("boardReviewVo", boardReviewVo);
			map.put("repleCount", repleCount);
			map.put("likeCount", likeCount);
			map.put("categoryVo", categoryVo);
			
			resultList.add(map);
			
		}
		return resultList;
	}

	
	
	public int repleCount(int review_no) {
		return reviewRepleSQLMapper.repleCount(review_no);
	}
	
	public HashMap<String, Object> getReview(int boardReviewNo){
		
		boardReviewSQLMapper.increaseReadCount(boardReviewNo);
		
		BoardReviewVo boardReviewVo = boardReviewSQLMapper.selectByNo(boardReviewNo);
		
	    String str = boardReviewVo.getJet_board_review_content();
	    str = StringEscapeUtils.escapeHtml4(str);
	    str = str.replaceAll("\n", "<br>");
	    boardReviewVo.setJet_board_review_content(str);
		
		int member_no = boardReviewVo.getJet_member_no();
		MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
		
		ArrayList<ReviewImageVo> imageVoList =  reviewImageSQLMapper.selectByReviewNo(boardReviewNo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberVo", memberVo);
		map.put("boardReviewVo", boardReviewVo);
		map.put("imageVoList", imageVoList);
		
		return map;
	}
	public void deleteBoardReview(int boardReviewNo) {
		boardReviewSQLMapper.deleteByNo(boardReviewNo);
	}
	
	public void updateBoardReview(BoardReviewVo vo) {
		boardReviewSQLMapper.updateByNo(vo);
	}
	
	public int getPageCount() {
		return boardReviewSQLMapper.getPageCount();
	}
	//댓글
	public void writeReple(ReviewRepleVo vo) {
		reviewRepleSQLMapper.insert(vo);
	}
	
	public void deleteReple(int reviewRepleNo) {
		reviewRepleSQLMapper.deleteReple(reviewRepleNo);
	}
	//댓글 등록순
	public ArrayList<HashMap<String, Object>> getRepleList(int boardReviewNo){
		
		ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<ReviewRepleVo> repleVoList = reviewRepleSQLMapper.selectByReViewNo(boardReviewNo);
		
		for(ReviewRepleVo reviewRepleVo : repleVoList) {
			
			MemberVo memberVo = memberSQLMapper.selectByNo(reviewRepleVo.getJet_member_no());
			
			
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("reviewRepleVo", reviewRepleVo);
			
			result.add(map);
			
		}
		
		return result;
	}
	//댓글   최신순
	public ArrayList<HashMap<String, Object>> getRepleListDESC(int boardReviewNo){
		
		ArrayList<HashMap<String, Object>> resultDESC = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<ReviewRepleVo> repleVoList = reviewRepleSQLMapper.selectByReViewNoDESC(boardReviewNo);
		//System.out.println("내림차순확인");
		for(ReviewRepleVo reviewRepleVo : repleVoList) {
			
			MemberVo memberVo = memberSQLMapper.selectByNo(reviewRepleVo.getJet_member_no());
			
			
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("reviewRepleVo", reviewRepleVo);
			
			resultDESC.add(map);
			
		}
		
		return resultDESC;
	}
	
	//대댓글 
	public void writeComment(ReviewCommentVo vo) {
		//System.out.println("testwqrf[qwmrfmwq");
		reviewCommentSQLMapper.insertComment(vo);
	}
	//대댓글 출력
	public ArrayList<HashMap<String, Object>> getCommentList(int repleNo){
		//System.out.println(repleNo);
		ArrayList<HashMap<String, Object>> commentList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<ReviewCommentVo> commentVoList = reviewCommentSQLMapper.selectByRepleNo(repleNo);
		
		for(ReviewCommentVo reviewCommentVo : commentVoList) {
			MemberVo memberVo = memberSQLMapper.selectByNo(reviewCommentVo.getJet_member_no());
			ReviewRepleVo reviewRepleVo = reviewRepleSQLMapper.selectByNo(reviewCommentVo.getJet_board_review_reple_no());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("reviewRpleVo", reviewRepleVo);
			map.put("reviewCommentVo", reviewCommentVo);
			
			
			commentList.add(map);
		}
		return commentList;
	}
	
	
	
	//----------------------------------------------------------------
	//추천입력
	public void reviewLike(ReviewLikeVo vo) {
		reviewLikeSQLMapper.insertLike(vo);
	}
	
	//추천수
	public int likeCount(int review_no) {
		return reviewLikeSQLMapper.likeCount(review_no);
	}
	//추천취소
	
	public void deleteLike(int jet_board_review_no, int jet_member_no) {
		reviewLikeSQLMapper.deleteLike(jet_board_review_no, jet_member_no);
	}
	
	
	public ReviewLikeVo getReviewLikeVo(int review_no, MemberVo sessionMemberVo) {
		ReviewLikeVo reviewLikeVo = reviewLikeSQLMapper.selectByno(review_no, sessionMemberVo.getJet_member_no());
		
		return reviewLikeVo;
	}
	
}
