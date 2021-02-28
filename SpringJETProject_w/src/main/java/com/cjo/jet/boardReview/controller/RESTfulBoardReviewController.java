package com.cjo.jet.boardReview.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjo.jet.boardReview.service.BoardReviewServiceImpl;
import com.cjo.jet.vo.BoardReviewVo;
import com.cjo.jet.vo.MemberVo;
import com.cjo.jet.vo.ReviewCommentVo;
import com.cjo.jet.vo.ReviewLikeVo;
import com.cjo.jet.vo.ReviewRepleVo;


@Controller
@RequestMapping("/board_Review/*")
@ResponseBody
public class RESTfulBoardReviewController {

	@Autowired
	BoardReviewServiceImpl boardReviewService;
	
	/*
	@RequestMapping("board_review_list.do")
	public void reviewList(Model model, String search_word, String search_type, @RequestParam(value="page_num",defaultValue = "1") int page_num){
		ArrayList<HashMap<String, Object>> resultList = boardReviewService.getBoardReviewList(search_word, search_type, page_num);
		
		int pageCount =  boardReviewService.getPageCount();
		
		int currentPage = page_num;
		int beginPage = ((currentPage-1)/5)*5 + 1;
		int endPage = ((currentPage-1)/5 + 1)*(5);
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
			
		model.addAttribute("resultList", resultList);
		model.addAttribute("currentPage" , currentPage);	
		model.addAttribute("beginPage" , beginPage);
		model.addAttribute("endPage" , endPage);
		model.addAttribute("pageCount", pageCount);
	}
	*/
	
	@RequestMapping("get_reple_list.do")
	public ArrayList<HashMap<String, Object>> getRepleList(int jet_board_review_no){
		//System.out.println(jet_board_review_no);
		ArrayList<HashMap<String, Object>> result = boardReviewService.getRepleList(jet_board_review_no);
		
		
		return result;
	}
	
	@RequestMapping("get_reple_list_desc.do")
	public ArrayList<HashMap<String, Object>> getRepleListDESC(int jet_board_review_no){
	
		ArrayList<HashMap<String, Object>> resultDESC = boardReviewService.getRepleListDESC(jet_board_review_no);
		System.out.println("test : "+jet_board_review_no);
		
		return resultDESC;
	}
	
	@RequestMapping("write_reple_process.do")
	public void writeRepleProcess(ReviewRepleVo param, HttpSession session) {
		
		int member_no = ((MemberVo)session.getAttribute("sessionUser")).getJet_member_no();
		
		param.setJet_member_no(member_no);
		
		boardReviewService.writeReple(param);
	}
	//댓글 삭제
	@RequestMapping("delete_reple_process.do")
	public void deleteReplePricess(int jet_board_review_reple_no) {
		//System.out.println(jet_board_review_reple_no);
		boardReviewService.deleteReple(jet_board_review_reple_no);
	}
	//대댓글 입력
	@RequestMapping("write_comment_process.do")
	public void writeCommentProcess(ReviewCommentVo param, HttpSession session) {
		
		int member_no = ((MemberVo)session.getAttribute("sessionUser")).getJet_member_no();
		//System.out.println(member_no);
		
		param.setJet_member_no(member_no);
		
		boardReviewService.writeComment(param);
	}
	
	
	@RequestMapping("get_comment_list.do")
	public ArrayList<HashMap<String, Object>> getCommentList(int jet_board_review_reple_no){
		System.out.println(jet_board_review_reple_no);
		ArrayList<HashMap<String, Object>> commentList = boardReviewService.getCommentList(jet_board_review_reple_no);
		
		return commentList;
	}
	//좋아요 인서트
	@RequestMapping("review_like_process.do")
	public void reviewLikeProcess(ReviewLikeVo param, HttpSession session, int jet_board_review_no) {
		int member_no = ((MemberVo)session.getAttribute("sessionUser")).getJet_member_no();		
		
		param.setJet_member_no(member_no);
		param.setJet_board_review_no(jet_board_review_no);
		
		boardReviewService.reviewLike(param);
		
		
	}
	
	@RequestMapping("review_delete_like_process.do")
	public void reviewLikeDeleteProcess(int jet_board_review_no, HttpSession session) {
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		int jet_member_no = sessionUser.getJet_member_no();
		System.out.println(jet_member_no);

		boardReviewService.deleteLike(jet_board_review_no, jet_member_no);
		
	}
	
	@RequestMapping("review_like_map.do")
	public HashMap<String, Object> reviewLikeMap(int jet_board_review_no, HttpSession session)	{
		HashMap<String, Object> likeMap = new HashMap<String, Object>();
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		ReviewLikeVo reviewLikeVo = null;
		
		boolean likeChk = false;

		if(memberVo != null) {
			reviewLikeVo = boardReviewService.getReviewLikeVo(jet_board_review_no, memberVo);
			
			if(reviewLikeVo != null) {
				likeChk = true;
			}else {
				likeChk = false;
			}
		}
		

		
		int likeCnt = boardReviewService.likeCount(jet_board_review_no);
		
		likeMap.put("likeChk", likeChk);
		likeMap.put("likeCnt", likeCnt);
		
		
		
		return likeMap;
	}
	
	@RequestMapping("board_Review_Update_prcoess.do")
	public void updateProcess(BoardReviewVo param) {
		boardReviewService.updateBoardReview(param);
	}
	
	
}
 