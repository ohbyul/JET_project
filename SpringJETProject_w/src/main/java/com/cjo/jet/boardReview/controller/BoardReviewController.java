package com.cjo.jet.boardReview.controller;

import java.awt.PageAttributes.OriginType;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cjo.jet.boardReview.service.BoardReviewServiceImpl;
import com.cjo.jet.vo.BoardReviewVo;
import com.cjo.jet.vo.MemberVo;
import com.cjo.jet.vo.ReviewImageVo;
import com.cjo.jet.vo.ReviewLikeVo;

@Controller
@RequestMapping("/board_Review/*")
public class BoardReviewController {
	@Autowired
	private BoardReviewServiceImpl boardReviewService;
	
	@RequestMapping("board_Review.do")
	public String boardReview(Model model, String search_word, String search_type,  @RequestParam(value="page_num",defaultValue = "1") int page_num, Integer category_no) {
		
		System.out.println(category_no);
		ArrayList<HashMap<String, Object>> resultList = boardReviewService.getBoardReviewList(search_word, search_type, page_num, category_no);
		
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
		
		return "board_Review/board_Review";
	}
	
	@RequestMapping("board_Review_Write.do")
	public String boardReviewWrite() {

		return "board_Review/board_Review_Write";
	}
	
	@RequestMapping("board_Review_Write_Process.do")
	public String boardReviewWriteProcess(HttpSession session, BoardReviewVo param, MultipartFile [] upload_image) {
		
			ArrayList<ReviewImageVo> imageVoList = new ArrayList<ReviewImageVo>();
			
		
			//�뾽濡쒕뱶
			for(MultipartFile file : upload_image) {
				if(file.getSize() <= 0) {
					continue;
				}
				String uploadReviewImage = "/upload_files/";
				
				Date today = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				String todayFolder = sdf.format(today);
				
				String uploadFolderName = uploadReviewImage + todayFolder;
				
				File uploadFolder = new File(uploadFolderName);
				
				if(!uploadFolder.exists()) {
					uploadFolder.mkdirs();
				}
				
				
				
				String originalFileName = file.getOriginalFilename();
				
				String randomName = UUID.randomUUID().toString();
				long currentTime = System.currentTimeMillis();
				
				randomName = randomName + "_" + currentTime;
				
				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
				
				randomName += ext;
				
				try {
					file.transferTo(new File(uploadFolderName + "/" +randomName));
				}catch (Exception e) {
					e.printStackTrace();
				}
				//ImageVo 媛앹껜 �깮�꽦...
				ReviewImageVo imageVo = new ReviewImageVo();
				
				String link = "/upload/" + todayFolder + "/" + randomName;
				imageVo.setJet_board_review_image_link(link);
				
				imageVoList.add(imageVo);
				
				
			}
			
			MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
			
			int jet_member_no = sessionUser.getJet_member_no();
			
			param.setJet_member_no(jet_member_no);
			System.out.println(upload_image);
			
			boardReviewService.writeReview(param, imageVoList);
			
			

			
		return "redirect:./board_Review.do";
	}
	
	//집에서 복습
	@RequestMapping("board_Review_View.do")
	public String boardReviewView(Model model, int board_Review_no, HttpSession session) {
		
		HashMap<String, Object> map = boardReviewService.getReview(board_Review_no);
		
		int repleCount = boardReviewService.repleCount(board_Review_no);
		//int likeCount = boardReviewService.likeCount(board_Review_no);
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		
		ReviewLikeVo reviewLikeVo = null;
		
		//if(memberVo != null) {
		//	reviewLikeVo = boardReviewService.getReviewLikeVo(board_Review_no, memberVo);
		//}
		
		model.addAttribute("result", map);
		model.addAttribute("repleCount", repleCount);
		//model.addAttribute("likeCount", likeCount);
		model.addAttribute("reviewLikeVo", reviewLikeVo);
				
		return "board_Review/board_Review_View";
	}
	
	@RequestMapping("board_Review_Delete_process.do")
	public String deletBoardReviewProcess(int jet_board_review_no) {
		
		boardReviewService.deleteBoardReview(jet_board_review_no);
		
		return "redirect:./board_Review.do";
	}
	
	@RequestMapping("board_Review_Update.do")
	public String  updateBoardReview(int jet_board_review_no, Model model) {
		
		HashMap<String, Object> map = boardReviewService.getReview(jet_board_review_no);
		
		model.addAttribute("result", map);
		
		return "board_Review/board_Review_Update";
	}
	
/*
	@RequestMapping("board_Review_Update_prcoess.do")
	public String updateBoardReviewProcess(BoardReviewVo param, int jet_board_review_no) {
		
		boardReviewService.updateBoardReview(param);
		System.out.println(jet_board_review_no);
		return "redirect:./board_Review.do?jet_board_review_no=" + jet_board_review_no;
	}
*/
//----------------------------------異붿쿇
	/*
	@RequestMapping("board_Review_Like_process.do")
	public String reviewLikeProcess(HttpSession session, ReviewLikeVo param, int jet_board_review_no) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		int jet_member_no = sessionUser.getJet_member_no();
		int jet_review_no = jet_board_review_no;
	
		param.setJet_member_no(jet_member_no);
		param.setJet_board_review_no(jet_review_no);
		
		boardReviewService.reviewLike(param);
		
		
		return "redirect:./board_Review_View.do?board_Review_no=" + jet_board_review_no;
	}
	*/
	/*
	@RequestMapping("board_Reivew_Delete_Like_process.do")
	public String deleteLikeProcess(int jet_board_review_no, HttpSession session) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		int jet_member_no = sessionUser.getJet_member_no();
		
		
		boardReviewService.deleteLike( jet_board_review_no, jet_member_no);
		
		
		return "redirect:./board_Review_View.do?board_Review_no="+jet_board_review_no;
	}
	*/
	
	@RequestMapping("test.do")
	public String test() {
		return "board_Review/test";
	}
	
	
	
	
}
