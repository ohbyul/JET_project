package com.cjo.jet.shareplan.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cjo.jet.shareplan.service.SharePlanServiceImpl;
import com.cjo.jet.travelplan.service.TravelPlanServiceImpl;
import com.cjo.jet.vo.MemberVo;
import com.cjo.jet.vo.SharePlanBoardVo;
import com.cjo.jet.vo.SharePlanImageVo;
import com.cjo.jet.vo.SharePlanLikeVo;
import com.cjo.jet.vo.TravelPlanVo;

@Controller
@RequestMapping("/shareplan_board/*")
public class SharePlanController {
	
	@Autowired
	private SharePlanServiceImpl sharePlanService;
	@Autowired
	private TravelPlanServiceImpl travelPlanService;
	
	@RequestMapping("shareplan_board_page.do")
	public String sharePlanPage(Model model, String search_word, String search_type) {
		
		ArrayList<HashMap<String, Object>> resultList = sharePlanService.getSharePlanList(search_word, search_type);
		
		ArrayList<Object> hot = sharePlanService.hotBoard();

		 System.out.println("에이취오티"+hot);
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("hot",hot);

		return "shareplan_board/shareplan_board_page";
	}
	//그냥 쓸 때
	@RequestMapping("write_shareplan_board_page.do")
	public String writeSharePlanPage(HttpSession session, Model model) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();
		
		
		ArrayList<HashMap<String, Object>> planList = travelPlanService.getContentListByB();
		//ArrayList<HashMap<String, Object>> pickList = myPageService.get_pick_board(jet_member_no);
		ArrayList<HashMap<String, Object>> pickList = sharePlanService.selectPickBoard(jet_member_no);
		
		
		model.addAttribute("sessionUserVo",sessionUser);
		model.addAttribute("planList",planList);
		//model.addAttribute("pickList",pickList);
		model.addAttribute("pickList",pickList);
		
		return "shareplan_board/write_shareplan_board_page";
	}
	
	//공유 비스무리하게 해서 쓸 때
	@RequestMapping("write_shareplan_planshared_page.do")
	public String writeSharedPlanPage(Model model, int jet_board_travelplan_no) {
		System.out.println("[no 테스트]"+ jet_board_travelplan_no);
		HashMap<String, Object> map = travelPlanService.getPlanContent(jet_board_travelplan_no);
		ArrayList<HashMap<String, Object>> detailList = travelPlanService.getDetailList(jet_board_travelplan_no);
		System.out.println("[vo 테스트]"+map);
		
		model.addAttribute("map",map);
		model.addAttribute("detailList",detailList);
		
		return "shareplan_board/write_shareplan_planshared_page";
	}
	
	@RequestMapping("write_shareplan_board_process.do")
	public String wrtieSharePlanProcess(SharePlanBoardVo param, HttpSession session, MultipartFile [] upload_image/*, Integer jet_board_travelplan_no*/) {
		
		ArrayList<SharePlanImageVo> imageVoList = new ArrayList<SharePlanImageVo>();
		//System.out.println("[test travelplan no]" + jet_board_travelplan_no);
		
		for(MultipartFile file : upload_image) {
			
			if(file.getSize() <=0) {
				continue;
				
			}
			System.out.println("[쉐어 플랜 글쓰기 진행 중] : 1");
			String uploadRootFolderName = "/upload_files/";
			
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String todayFolder = sdf.format(today);
			
			String uploadFolderName = uploadRootFolderName + todayFolder;
			
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
				file.transferTo(new File(uploadFolderName + "/" + randomName));

			} catch (Exception e) {
				e.printStackTrace();
			}
			
			SharePlanImageVo imageVo = new SharePlanImageVo();
			
			String link = "/upload/" + todayFolder + "/" + randomName; 
			
			imageVo.setJet_board_shareplan_image_link(link);
			
			imageVoList.add(imageVo);
		}
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		int jet_member_no = sessionUser.getJet_member_no();
		
		param.setJet_member_no(jet_member_no);
		System.out.println("[쉐어 플랜 글쓰기 진행 중] : 2");
		//if(jet_board_travelplan_no == null) {
			sharePlanService.writeSharePlan(param, imageVoList);
		//}else {
			//sharePlanService.writeSharePlanByW(param, imageVoList, jet_board_travelplan_no);
		//}
				
		System.out.println("[쉐어 플랜 글쓰기 진행 중] : 3");
		return "redirect:./shareplan_board_page.do";
	}
	
	//글 읽기
	@RequestMapping("read_shareplan_board_page.do")
	public String readSharePlan(Model model, int jet_board_shareplan_no, HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		HashMap<String, Object> map = sharePlanService.getShareplan(jet_board_shareplan_no);
		
		ArrayList<HashMap<String, Object>> detailList = sharePlanService.getDetailList(jet_board_shareplan_no);
		System.out.println("[map controller test]" + map);
		
		sharePlanService.increaseReadCount(jet_board_shareplan_no, request, response);
		
		int repleCount = sharePlanService.repleCount(jet_board_shareplan_no);
		//리플 갯수 출력 하기 
		
		int likeCount = sharePlanService.likeCount(jet_board_shareplan_no);
		
		MemberVo memberLikeVo = (MemberVo) session.getAttribute("sessionUser");

		SharePlanLikeVo sharePlanLikeVo = null;
		
		if(memberLikeVo != null) {
			
			sharePlanLikeVo = sharePlanService.getShareplanLikeVo(jet_board_shareplan_no, memberLikeVo);
		
		}

		model.addAttribute("result",map);
		model.addAttribute("detailList",detailList);
		model.addAttribute("repleCount", repleCount);
		model.addAttribute("likeCount", likeCount);
		model.addAttribute("sharePlanLikeVo", sharePlanLikeVo);

		
		return "shareplan_board/read_shareplan_board_page";
	}
	
	@RequestMapping("delete_shareplan_process.do")
	public String deleteSharePlan(int jet_board_shareplan_no) {
		
		sharePlanService.deleteShareplan(jet_board_shareplan_no);
		
		return "redirect:./shareplan_board_page.do";
	}
	@RequestMapping("update_shareplan_board_page.do")
	public String updateSharePlan(Model model, int jet_board_shareplan_no, HttpSession session) {
		System.out.println(jet_board_shareplan_no);
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();
		
		ArrayList<HashMap<String, Object>> planList = travelPlanService.getContentListByB();
		ArrayList<HashMap<String, Object>> pickList = sharePlanService.selectPickBoard(jet_member_no);
		HashMap<String, Object> map = sharePlanService.getShareplan(jet_board_shareplan_no);
		
		model.addAttribute("planList", planList);
		model.addAttribute("sessionUserVo", sessionUser);
		model.addAttribute("result",map);
		model.addAttribute("pickList",pickList);
		return "shareplan_board/update_shareplan_board_page";
	}
	
	@RequestMapping("update_shareplan_board_process.do")
	public String updateSharePlanProcess(SharePlanBoardVo param, int jet_board_shareplan_no) {
		System.out.println("수정테스트"+jet_board_shareplan_no);
		sharePlanService.updateShareplan(param);
		return "redirect:./read_shareplan_board_page.do?jet_board_shareplan_no=" + jet_board_shareplan_no;
	}
	
	@RequestMapping("class_shareplan_board_page.do")
	public String classShareplanBoard(Model model, int jet_board_shareplan_no) {
		
		HashMap<String, Object> map = sharePlanService.getShareplan(jet_board_shareplan_no);
		
		model.addAttribute("result",map);
		
		return "shareplan_board/class_shareplan_board_page";
	}
	
	
}
